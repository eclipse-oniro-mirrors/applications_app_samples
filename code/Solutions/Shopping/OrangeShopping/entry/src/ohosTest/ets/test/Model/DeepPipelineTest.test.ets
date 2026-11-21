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
import { Address, AddressBook, BreakpointUtil, Cart, CartLine, CartSnapshot, Catalog, CityIndex, Coupon, CouponBook, DetailModel, EmitterEvent, Goods, LiveCenter, LiveRoom, Money, Order, OrderCenter, OrderCounts, OrderState, PagedResult, ProductFilter, SearchEngine, ShopUrl, TaskQueue, UserAccount, Valuation } from '../Shared/ShopModel';
import { ADDRESSES, COUPONS, INVALID_PHONES, LIVE_ROOMS, PHONE_SAMPLES, cartLine, cartWith, createAddress, defaultCatalog, defaultCityIndex, defaultCouponBook, detailFor, orderLines } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Builds one selected unit per catalogue row for pipeline arithmetic. */
function cartFromGoods(goods: Goods[]): Cart {
  let cart: Cart = new Cart();
  for (let index: number = 0; index < goods.length; index++) {
    cart.add(goods[index].id, goods[index].price.cents(), 1);
  }
  return cart;
}

export default function deepPipelineTest() {
  describe('OrangeShoppingDeepPipeline', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'deep pipeline suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0010
     * @tc.name      shoe_search_price_window_builds_one_line_order_001
     * @tc.desc      Verify shoe search price window builds a one line order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('shoe_search_price_window_builds_one_line_order_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: shoe_search_price_window_builds_one_line_order_001');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('shoe');
      let filter: ProductFilter = new ProductFilter('sport', 50000, 70000);
      let filtered: Goods[] = filter.apply(matches);
      let page: Goods[] = new Catalog(filtered).page(0, 1);
      let cart: Cart = cartWith([cartLine(3, 59900, 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7001, cart.allLines(), OrderState.OBLIGATION, 11);
      let center: OrderCenter = new OrderCenter([order]);
      expect(matches.length).assertEqual(2);
      expect(filtered.length).assertEqual(2);
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(3);
      expect(cart.subtotal().cents()).assertEqual(119800);
      // The 119800-cent subtotal clears the C50 threshold, so 5000 cents is taken once.
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(5000);
      expect(cart.payable(book).cents()).assertEqual(114800);
      expect(order.total().cents()).assertEqual(119800);
      expect(center.spent().cents()).assertEqual(119800);
      expect(center.counts().obligation).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0020
     * @tc.name      shirt_duplicate_price_sort_keeps_smaller_id_first_002
     * @tc.desc      Verify shirt duplicate price sort keeps the smaller id first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('shirt_duplicate_price_sort_keeps_smaller_id_first_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: shirt_duplicate_price_sort_keeps_smaller_id_first_002');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('shirt');
      let sorted: Goods[] = new Catalog(matches).sortedByPrice(false);
      // Equal prices tie-break on the smaller identifier even in descending order.
      expect(sorted[0].id).assertEqual(7);
      expect(sorted[1].id).assertEqual(15);
      let cart: Cart = cartWith([cartLine(7, 15900, 3), cartLine(15, 15900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7002, cart.allLines(), OrderState.OBLIGATION, 12);
      expect(cart.subtotal().cents()).assertEqual(63600);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(2000);
      expect(cart.payable(book).cents()).assertEqual(61600);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(order.canRefund()).assertTrue();
      expect(order.quantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0030
     * @tc.name      blender_stock_clamp_drives_coupon_tier_003
     * @tc.desc      Verify blender stock clamp drives the coupon tier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('blender_stock_clamp_drives_coupon_tier_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: blender_stock_clamp_drives_coupon_tier_003');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('blender');
      let filter: ProductFilter = new ProductFilter('appliances', 0, Number.MAX_SAFE_INTEGER);
      let filtered: Goods[] = filter.apply(matches);
      let catalog: Catalog = new Catalog(filtered);
      let first: Goods | undefined = catalog.byId(5);
      expect(first !== undefined).assertTrue();
      let stock: number = first !== undefined ? first.stock : 0;
      let cart: Cart = new Cart();
      let clamped: number = cart.add(5, 29900, 40, stock);
      let secondQuantity: number = cart.add(13, 29900, 5, stock);
      let book: CouponBook = defaultCouponBook();
      let page: PagedResult<Goods> = new PagedResult<Goods>(filtered, 0, 2, filtered.length);
      expect(stock).assertEqual(25);
      expect(clamped).assertEqual(25);
      expect(secondQuantity).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(30);
      expect(cart.allLinesSubtotal().cents()).assertEqual(897000);
      expect(cart.payable(book).cents()).assertEqual(892000);
      expect(page.hasNext()).assertFalse();
      expect(page.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0040
     * @tc.name      lite_phone_tokens_page_to_the_second_match_004
     * @tc.desc      Verify lite phone tokens page to the second match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('lite_phone_tokens_page_to_the_second_match_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: lite_phone_tokens_page_to_the_second_match_004');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('phone lite');
      let filter: ProductFilter = new ProductFilter('phone', 0, Number.MAX_SAFE_INTEGER);
      let filtered: Goods[] = filter.apply(matches);
      let catalog: Catalog = new Catalog(filtered);
      let secondPage: Goods[] = catalog.page(1, 1);
      let cart: Cart = cartWith([cartLine(9, 399900, 1), cartLine(1, 399900, 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7004, cart.allLines(), OrderState.OBLIGATION, 14);
      let center: OrderCenter = new OrderCenter([order]);
      expect(matches.length).assertEqual(2);
      expect(filtered.length).assertEqual(2);
      expect(catalog.pageCount(1)).assertEqual(2);
      expect(secondPage.length).assertEqual(1);
      expect(secondPage[0].id).assertEqual(9);
      expect(cart.subtotal().cents()).assertEqual(1199700);
      expect(cart.payable(book).cents()).assertEqual(1194700);
      expect(order.total().cents()).assertEqual(1199700);
      expect(order.quantity()).assertEqual(3);
      expect(center.spent().cents()).assertEqual(1199700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0050
     * @tc.name      green_tea_suggestion_feeds_a_quantity_order_005
     * @tc.desc      Verify green tea suggestion feeds a quantity order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('green_tea_suggestion_feeds_a_quantity_order_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: green_tea_suggestion_feeds_a_quantity_order_005');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let suggestions: string[] = engine.suggest('gr');
      let matches: Goods[] = engine.search('green tea');
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(4);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let stock: number = goods !== undefined ? goods.stock : 0;
      let cart: Cart = new Cart();
      let added: number = cart.add(4, price, 22, stock);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7005, cart.allLines(), OrderState.OBLIGATION, 15);
      let center: OrderCenter = new OrderCenter([order]);
      expect(suggestions.length).assertEqual(1);
      expect(suggestions[0]).assertEqual('Green Tea Pack');
      expect(matches.length).assertEqual(2);
      expect(added).assertEqual(22);
      expect(cart.subtotal().cents()).assertEqual(195800);
      expect(cart.payable(book).cents()).assertEqual(190800);
      expect(order.advance()).assertTrue();
      let counts: OrderCounts = center.counts();
      expect(counts.waitDelivery).assertEqual(1);
      expect(counts.obligation).assertEqual(0);
      expect(counts.total).assertEqual(1);
      expect(center.spent().cents()).assertEqual(195800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0060
     * @tc.name      watch_rating_and_valuation_share_one_subtotal_006
     * @tc.desc      Verify watch rating and valuation share one subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('watch_rating_and_valuation_share_one_subtotal_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: watch_rating_and_valuation_share_one_subtotal_006');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('watch');
      let rated: Catalog = new Catalog(matches);
      let top: Goods[] = rated.topRated(5);
      let cheapest: Goods | undefined = rated.cheapest();
      expect(cheapest !== undefined).assertTrue();
      let unit: number = cheapest !== undefined ? cheapest.price.cents() : 0;
      let valuation: Valuation = new Valuation(new Money(unit), 12);
      let cart: Cart = cartWith([cartLine(2, valuation.finalPrice().cents(), 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7006, cart.allLines(), OrderState.OBLIGATION, 16);
      let detail: DetailModel = detailFor(2);
      let chosen: boolean = detail.selectChoice(2);
      expect(matches.length).assertEqual(2);
      expect(top.length).assertEqual(2);
      expect(unit).assertEqual(129900);
      expect(valuation.finalPrice().cents()).assertEqual(114312);
      expect(valuation.saved().cents()).assertEqual(15588);
      expect(cart.subtotal().cents()).assertEqual(228624);
      expect(cart.payable(book).cents()).assertEqual(223624);
      expect(order.total().cents()).assertEqual(228624);
      expect(detail.goods.rating).assertEqual(5);
      expect(chosen).assertTrue();
      expect(detail.choiceName()).assertEqual('blue');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0070
     * @tc.name      earbud_stock_filter_leaves_zero_value_order_007
     * @tc.desc      Verify earbud stock filter leaves a zero value order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('earbud_stock_filter_leaves_zero_value_order_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: earbud_stock_filter_leaves_zero_value_order_007');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('earbud');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', true);
      let filtered: Goods[] = filter.apply(matches);
      let catalog: Catalog = new Catalog(filtered);
      let cheapest: Goods | undefined = catalog.cheapest();
      let cart: Cart = new Cart();
      let order: Order = new Order(7007, cart.allLines(), OrderState.OBLIGATION, 17);
      let center: OrderCenter = new OrderCenter([order]);
      let page: PagedResult<Goods> = new PagedResult<Goods>(filtered, 0, 5, filtered.length);
      expect(matches.length).assertEqual(2);
      expect(filtered.length).assertEqual(0);
      expect(catalog.isEmpty()).assertTrue();
      expect(cheapest === undefined).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(0);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.spent().cents()).assertEqual(0);
      expect(page.hasNext()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0080
     * @tc.name      harmony_suggestions_split_into_two_completed_orders_008
     * @tc.desc      Verify harmony suggestions split into two completed orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('harmony_suggestions_split_into_two_completed_orders_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: harmony_suggestions_split_into_two_completed_orders_008');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let suggestions: string[] = engine.suggest('harmony', 2);
      let one: Goods[] = engine.search('harmony phone one');
      let two: Goods[] = engine.search('harmony phone two');
      let cart: Cart = cartWith([cartLine(0, 499900, 1), cartLine(1, 399900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7008, cart.allLines(), OrderState.OBLIGATION, 18);
      let center: OrderCenter = new OrderCenter([order]);
      expect(suggestions.length).assertEqual(2);
      expect(suggestions[0]).assertEqual('Harmony Phone One');
      expect(suggestions[1]).assertEqual('Harmony Phone Two');
      expect(one.length).assertEqual(4);
      expect(two.length).assertEqual(2);
      expect(cart.payable(book).cents()).assertEqual(894800);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertFalse();
      expect(order.stateLabel()).assertEqual('completed');
      expect(order.isFinal()).assertTrue();
      expect(order.canCancel()).assertFalse();
      expect(center.counts().completed).assertEqual(1);
      expect(center.spent().cents()).assertEqual(899800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0090
     * @tc.name      snapshot_before_quantity_edit_restores_payable_009
     * @tc.desc      Verify snapshot before quantity edit restores payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_before_quantity_edit_restores_payable_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_before_quantity_edit_restores_payable_009');
      let cart: Cart = cartWith([cartLine(5, 29900, 2, true), cartLine(7, 15900, 1, false)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let edited: number = cart.setQuantity(5, 5);
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7009, restored.allLines(), OrderState.OBLIGATION, 19);
      expect(edited).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.allLinesSubtotal().cents()).assertEqual(165400);
      // Only the tea line was selected in the snapshot, so the payable base is 59800.
      expect(restored.totalQuantity()).assertEqual(3);
      expect(restored.subtotal().cents()).assertEqual(59800);
      expect(restored.payable(book).cents()).assertEqual(57800);
      expect(order.total().cents()).assertEqual(75700);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0100
     * @tc.name      merge_overlapping_lines_keeps_target_selection_010
     * @tc.desc      Verify merge overlapping lines keeps target selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_overlapping_lines_keeps_target_selection_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_overlapping_lines_keeps_target_selection_010');
      let target: Cart = cartWith([cartLine(3, 59900, 2, true), cartLine(7, 15900, 1, true)]);
      let source: Cart = cartWith([cartLine(7, 15900, 3, false), cartLine(4, 8900, 4, false)]);
      target.merge(source);
      let book: CouponBook = defaultCouponBook();
      let snapshot: CartSnapshot = target.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      // The shared shirt line keeps the target flag, so its four units stay payable.
      expect(target.distinctCount()).assertEqual(3);
      expect(target.totalQuantity()).assertEqual(10);
      expect(target.selectedQuantity()).assertEqual(6);
      expect(target.subtotal().cents()).assertEqual(183400);
      expect(target.payable(book).cents()).assertEqual(178400);
      expect(restored.allLinesSubtotal().cents()).assertEqual(219000);
      expect(restored.contains(4)).assertTrue();
      expect(restored.indexOf(4)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0110
     * @tc.name      cleared_cart_snapshot_still_restores_old_total_011
     * @tc.desc      Verify cleared cart snapshot still restores the old total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cleared_cart_snapshot_still_restores_old_total_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cleared_cart_snapshot_still_restores_old_total_011');
      let cart: Cart = cartWith([cartLine(2, 129900, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.clear();
      let refillOne: number = cart.add(2, 129900, 3);
      let refillTwo: number = cart.add(5, 29900, 1);
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7011, restored.allLines(), OrderState.OBLIGATION, 21);
      let center: OrderCenter = new OrderCenter([order]);
      expect(cart.isEmpty()).assertFalse();
      expect(refillOne).assertEqual(3);
      expect(refillTwo).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.subtotal().cents()).assertEqual(419600);
      expect(cart.payable(book).cents()).assertEqual(414600);
      expect(restored.totalQuantity()).assertEqual(1);
      expect(order.total().cents()).assertEqual(129900);
      expect(center.spent().cents()).assertEqual(129900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0120
     * @tc.name      double_snapshot_round_trip_preserves_line_order_012
     * @tc.desc      Verify double snapshot round trip preserves line order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('double_snapshot_round_trip_preserves_line_order_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: double_snapshot_round_trip_preserves_line_order_012');
      let cart: Cart = cartWith([cartLine(7, 15900, 2), cartLine(3, 59900, 1), cartLine(4, 8900, 5)]);
      let first: CartSnapshot = cart.snapshot();
      let once: Cart = Cart.restore(first);
      let second: CartSnapshot = once.snapshot();
      let twice: Cart = Cart.restore(second);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7012, twice.allLines(), OrderState.OBLIGATION, 22);
      // Two round trips must keep insertion order, which differs from identifier order.
      expect(twice.allLines().length).assertEqual(3);
      expect(twice.allLines()[0].goodsId).assertEqual(7);
      expect(twice.allLines()[1].goodsId).assertEqual(3);
      expect(twice.allLines()[2].goodsId).assertEqual(4);
      expect(twice.subtotal().cents()).assertEqual(136200);
      expect(twice.payable(book).cents()).assertEqual(131200);
      expect(order.total().cents()).assertEqual(136200);
      expect(order.quantity()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0130
     * @tc.name      catalog_priced_merge_then_snapshot_total_013
     * @tc.desc      Verify catalog priced merge then snapshot total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_priced_merge_then_snapshot_total_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_priced_merge_then_snapshot_total_013');
      let catalog: Catalog = defaultCatalog();
      let tea: Goods | undefined = catalog.byId(4);
      let blender: Goods | undefined = catalog.byId(5);
      expect(tea !== undefined).assertTrue();
      expect(blender !== undefined).assertTrue();
      let teaPrice: number = tea !== undefined ? tea.price.cents() : 0;
      let blenderPrice: number = blender !== undefined ? blender.price.cents() : 0;
      let source: Cart = cartWith([cartLine(4, teaPrice, 3), cartLine(5, blenderPrice, 2)]);
      let target: Cart = cartWith([cartLine(7, 15900, 1)]);
      target.merge(source);
      let snapshot: CartSnapshot = target.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7013, restored.allLines(), OrderState.OBLIGATION, 23);
      expect(target.distinctCount()).assertEqual(3);
      expect(target.totalQuantity()).assertEqual(6);
      expect(target.allLinesSubtotal().cents()).assertEqual(102400);
      expect(target.payable(book).cents()).assertEqual(97400);
      expect(restored.allLinesSubtotal().cents()).assertEqual(102400);
      expect(order.total().cents()).assertEqual(102400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0140
     * @tc.name      restore_quantity_edit_then_merge_doubles_line_014
     * @tc.desc      Verify restore quantity edit then merge doubles the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restore_quantity_edit_then_merge_doubles_line_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restore_quantity_edit_then_merge_doubles_line_014');
      let cart: Cart = cartWith([cartLine(3, 59900, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      let edited: number = restored.setQuantity(3, 4);
      restored.merge(cart);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7014, restored.allLines(), OrderState.OBLIGATION, 24);
      expect(edited).assertEqual(4);
      expect(restored.distinctCount()).assertEqual(1);
      expect(restored.totalQuantity()).assertEqual(6);
      expect(restored.allLinesSubtotal().cents()).assertEqual(359400);
      expect(restored.payable(book).cents()).assertEqual(354400);
      expect(order.total().cents()).assertEqual(359400);
      expect(order.quantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0150
     * @tc.name      snapshot_selection_survives_merge_of_new_lines_015
     * @tc.desc      Verify snapshot selection survives a merge of new lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_selection_survives_merge_of_new_lines_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_selection_survives_merge_of_new_lines_015');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, false), cartLine(4, 8900, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let other: Cart = cartWith([cartLine(0, 499900, 2, true), cartLine(2, 129900, 1, true)]);
      cart.merge(other);
      let book: CouponBook = defaultCouponBook();
      let restored: Cart = Cart.restore(snapshot);
      // The merged phone line stays unselected because merge never rewrites the target flag.
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(138800);
      expect(cart.payable(book).cents()).assertEqual(133800);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1638500);
      expect(restored.totalQuantity()).assertEqual(2);
      expect(restored.allLinesSubtotal().cents()).assertEqual(508800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0160
     * @tc.name      catalog_page_lines_restore_to_page_total_016
     * @tc.desc      Verify catalog page lines restore to the page total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_lines_restore_to_page_total_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_lines_restore_to_page_total_016');
      let catalog: Catalog = defaultCatalog();
      let page: Goods[] = catalog.page(1, 3);
      let lines: CartLine[] = [];
      for (let index: number = 0; index < page.length; index++) {
        lines.push(cartLine(page[index].id, page[index].price.cents(), 2));
      }
      let cart: Cart = cartWith(lines);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7016, restored.allLines(), OrderState.OBLIGATION, 26);
      let center: OrderCenter = new OrderCenter([order]);
      expect(page.length).assertEqual(3);
      expect(page[0].id).assertEqual(3);
      expect(page[2].id).assertEqual(5);
      expect(restored.totalQuantity()).assertEqual(6);
      expect(restored.subtotal().cents()).assertEqual(197400);
      expect(restored.payable(book).cents()).assertEqual(192400);
      expect(order.total().cents()).assertEqual(197400);
      expect(center.spent().cents()).assertEqual(197400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0170
     * @tc.name      frozen_order_survives_source_cart_growth_017
     * @tc.desc      Verify a frozen order survives growth of its source cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('frozen_order_survives_source_cart_growth_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: frozen_order_survives_source_cart_growth_017');
      let cart: Cart = cartWith([cartLine(5, 29900, 2, true)]);
      let first: Order = new Order(7017, cart.allLines(), OrderState.OBLIGATION, 27);
      expect(first.advance()).assertTrue();
      let grown: number = cart.setQuantity(5, 4);
      let added: number = cart.add(4, 8900, 1);
      let second: Order = new Order(7028, cart.allLines(), OrderState.OBLIGATION, 28);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(grown).assertEqual(4);
      expect(added).assertEqual(1);
      expect(first.total().cents()).assertEqual(59800);
      expect(first.quantity()).assertEqual(2);
      expect(first.stateLabel()).assertEqual('wait_delivery');
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.allLinesSubtotal().cents()).assertEqual(128500);
      expect(second.total().cents()).assertEqual(128500);
      expect(second.quantity()).assertEqual(5);
      expect(center.spent().cents()).assertEqual(188300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0180
     * @tc.name      address_default_independent_of_order_lifecycle_018
     * @tc.desc      Verify the address default is independent of the order lifecycle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_default_independent_of_order_lifecycle_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_default_independent_of_order_lifecycle_018');
      let index: CityIndex = defaultCityIndex();
      let book: AddressBook = new AddressBook();
      let first: Address = createAddress(0, 'Olga', PHONE_SAMPLES[2], 'Anhui', 'Anqing',
        'Downtown', '5 Hill Road');
      let second: Address = createAddress(0, 'Omar', PHONE_SAMPLES[3], 'Zhejiang', 'Hangzhou',
        'Xihu', '9 Lake Road');
      let firstId: number = book.add(first);
      let secondId: number = book.add(second);
      expect(book.setDefault(secondId)).assertTrue();
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let order: Order = new Order(7018, cart.allLines(), OrderState.OBLIGATION, 28);
      let center: OrderCenter = new OrderCenter([order]);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== undefined && current.id === secondId).assertTrue();
      expect(firstId).assertEqual(1);
      expect(index.findLetterOf('Zhejiang')).assertEqual('Z');
      expect(book.validate(second)).assertEqual('');
      expect(center.spent().cents()).assertEqual(17800);
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0190
     * @tc.name      refunded_total_reconstructs_gross_spending_019
     * @tc.desc      Verify the refunded total reconstructs the gross spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_total_reconstructs_gross_spending_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_total_reconstructs_gross_spending_019');
      let active: Order = new Order(7019, orderLines(2, 129900, 1), OrderState.WAIT_RECEIVE, 5);
      let refunded: Order = new Order(7020, orderLines(4, 8900, 4), OrderState.WAIT_EVALUATE, 7);
      let center: OrderCenter = new OrderCenter([active, refunded]);
      let gross: number = active.total().cents() + refunded.total().cents();
      expect(center.spent().cents()).assertEqual(gross);
      expect(refunded.refund()).assertTrue();
      let spent: number = center.spent().cents();
      let refundedTotal: number = refunded.total().cents();
      expect(spent).assertEqual(129900);
      expect(refundedTotal).assertEqual(35600);
      // The refunded order leaves only the billable sum, so adding its total back yields the gross.
      expect(spent + refundedTotal).assertEqual(gross);
      expect(gross).assertEqual(165500);
      expect(center.counts().total).assertEqual(2);
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0200
     * @tc.name      later_smaller_order_is_still_latest_020
     * @tc.desc      Verify a later smaller order is still the latest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('later_smaller_order_is_still_latest_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: later_smaller_order_is_still_latest_020');
      let cart: Cart = cartWith([cartLine(4, 8900, 3)]);
      let before: CartSnapshot = cart.snapshot();
      cart.setQuantity(4, 1);
      let after: CartSnapshot = cart.snapshot();
      let earlier: Order = new Order(7021, Cart.restore(before).allLines(), OrderState.OBLIGATION, 5);
      let later: Order = new Order(7022, Cart.restore(after).allLines(), OrderState.OBLIGATION, 9);
      let center: OrderCenter = new OrderCenter([earlier, later]);
      let latest: Order | undefined = center.latest();
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(earlier.total().cents()).assertEqual(26700);
      expect(later.total().cents()).assertEqual(8900);
      expect(latest !== undefined && latest.id === 7022).assertTrue();
      expect(sorted[0].id).assertEqual(7021);
      expect(sorted[1].id).assertEqual(7022);
      expect(center.spent().cents()).assertEqual(35600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0210
     * @tc.name      merge_upgrades_coupon_but_not_frozen_order_021
     * @tc.desc      Verify a merge upgrades the coupon but not the frozen order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_upgrades_coupon_but_not_frozen_order_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_upgrades_coupon_but_not_frozen_order_021');
      let cart: Cart = cartWith([cartLine(4, 8900, 2, true)]);
      let book: CouponBook = defaultCouponBook();
      let before: Coupon | undefined = book.best(cart.subtotal());
      let first: Order = new Order(7023, cart.allLines(), OrderState.OBLIGATION, 21);
      let extra: Cart = cartWith([cartLine(2, 129900, 1, true)]);
      cart.merge(extra);
      let after: Coupon | undefined = book.best(cart.subtotal());
      let second: Order = new Order(7024, cart.allLines(), OrderState.OBLIGATION, 22);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(before !== undefined && before.id === 'C10').assertTrue();
      expect(after !== undefined && after.id === 'C50').assertTrue();
      expect(cart.subtotal().cents()).assertEqual(147700);
      expect(cart.payable(book).cents()).assertEqual(142700);
      expect(first.total().cents()).assertEqual(17800);
      expect(second.total().cents()).assertEqual(147700);
      expect(center.spent().cents()).assertEqual(165500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0220
     * @tc.name      clearing_source_cart_keeps_center_spending_022
     * @tc.desc      Verify clearing the source cart keeps the center spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clearing_source_cart_keeps_center_spending_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clearing_source_cart_keeps_center_spending_022');
      let cart: Cart = cartWith([cartLine(7, 15900, 2, true)]);
      let first: Order = new Order(7025, cart.allLines(), OrderState.OBLIGATION, 22);
      expect(first.total().cents()).assertEqual(31800);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      let refill: number = cart.add(7, 15900, 1);
      let second: Order = new Order(7026, cart.allLines(), OrderState.OBLIGATION, 23);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(refill).assertEqual(1);
      expect(first.total().cents()).assertEqual(31800);
      expect(second.total().cents()).assertEqual(15900);
      expect(center.spent().cents()).assertEqual(47700);
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0230
     * @tc.name      catalog_page_orders_accumulate_spending_023
     * @tc.desc      Verify catalog page orders accumulate the spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_page_orders_accumulate_spending_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_page_orders_accumulate_spending_023');
      let catalog: Catalog = defaultCatalog();
      let firstPage: Goods[] = catalog.page(0, 8);
      let secondPage: Goods[] = catalog.page(1, 8);
      let firstCart: Cart = new Cart();
      let secondCart: Cart = new Cart();
      for (let index: number = 0; index < firstPage.length; index++) {
        firstCart.add(firstPage[index].id, firstPage[index].price.cents(), 1);
      }
      for (let index: number = 0; index < secondPage.length; index++) {
        secondCart.add(secondPage[index].id, secondPage[index].price.cents(), 1);
      }
      let first: Order = new Order(7027, firstCart.allLines(), OrderState.OBLIGATION, 1);
      let second: Order = new Order(7028, secondCart.allLines(), OrderState.OBLIGATION, 2);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(firstPage.length).assertEqual(8);
      expect(secondPage.length).assertEqual(8);
      expect(firstPage[7].id).assertEqual(7);
      expect(secondPage[7].id).assertEqual(15);
      expect(first.total().cents()).assertEqual(1164200);
      expect(second.total().cents()).assertEqual(1164200);
      expect(center.spent().cents()).assertEqual(2328400);
      expect(center.counts().obligation).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0240
     * @tc.name      city_x_letter_and_live_completed_order_024
     * @tc.desc      Verify the X city letter and a live completed order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_x_letter_and_live_completed_order_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_x_letter_and_live_completed_order_024');
      let index: CityIndex = defaultCityIndex();
      let cities: string[] = index.citiesOf('X');
      let address: Address = createAddress(0, 'Pia', PHONE_SAMPLES[4], 'Xinjiang', 'Xinjiang',
        'Tianshan', '4 Silk Road');
      let book: AddressBook = new AddressBook();
      let id: number = book.add(address);
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let room: LiveRoom | undefined = live.byGoods(3);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(3);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(3, price, 1)]);
      let order: Order = new Order(7029, cart.allLines(), OrderState.OBLIGATION, 24);
      let center: OrderCenter = new OrderCenter([order]);
      expect(cities.length).assertEqual(2);
      expect(cities[0]).assertEqual('Xizang');
      expect(index.findLetterOf('Xinjiang')).assertEqual('X');
      expect(book.validate(address)).assertEqual('');
      expect(id).assertEqual(1);
      expect(room !== undefined && room.viewers === 75).assertTrue();
      expect(order.total().cents()).assertEqual(59900);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('completed');
      expect(center.spent().cents()).assertEqual(59900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0250
     * @tc.name      empty_checkout_keeps_address_default_025
     * @tc.desc      Verify an empty checkout keeps the address default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_checkout_keeps_address_default_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_checkout_keeps_address_default_025');
      let index: CityIndex = defaultCityIndex();
      let book: AddressBook = new AddressBook();
      let first: Address = createAddress(0, 'Quinn', PHONE_SAMPLES[5], 'Sichuan', 'Sichuan',
        'Jinjiang', '2 Bamboo Road');
      let second: Address = createAddress(0, 'Rita', PHONE_SAMPLES[6], 'Hubei', 'Hubei',
        'Wuchang', '21 East Road');
      let firstId: number = book.add(first);
      let secondId: number = book.add(second);
      let cart: Cart = new Cart();
      let order: Order = new Order(7031, cart.allLines(), OrderState.OBLIGATION, 25);
      let center: OrderCenter = new OrderCenter([order]);
      let current: Address | undefined = book.defaultAddress();
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(2);
      expect(index.findLetterOf('Hubei')).assertEqual('H');
      expect(order.total().cents()).assertEqual(0);
      expect(center.spent().cents()).assertEqual(0);
      expect(current !== undefined && current.id === firstId).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(order.stateLabel()).assertEqual('obligation');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0260
     * @tc.name      twin_carts_from_one_page_double_spending_026
     * @tc.desc      Verify twin carts from one page double the spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('twin_carts_from_one_page_double_spending_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: twin_carts_from_one_page_double_spending_026');
      let catalog: Catalog = defaultCatalog();
      let page: Goods[] = catalog.page(0, 1);
      let firstCart: Cart = new Cart();
      let secondCart: Cart = new Cart();
      let addedFirst: number = firstCart.add(0, page[0].price.cents(), 1);
      let addedSecond: number = secondCart.add(0, page[0].price.cents(), 1);
      let first: Order = new Order(7032, firstCart.allLines(), OrderState.OBLIGATION, 1);
      let second: Order = new Order(7033, secondCart.allLines(), OrderState.OBLIGATION, 2);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(page.length).assertEqual(1);
      expect(addedFirst).assertEqual(1);
      expect(addedSecond).assertEqual(1);
      expect(first.total().cents()).assertEqual(499900);
      expect(second.total().cents()).assertEqual(499900);
      expect(center.spent().cents()).assertEqual(999800);
      expect(center.counts().total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0270
     * @tc.name      four_pages_partition_catalog_spending_027
     * @tc.desc      Verify four catalog pages partition the spending total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('four_pages_partition_catalog_spending_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: four_pages_partition_catalog_spending_027');
      let catalog: Catalog = defaultCatalog();
      let firstCart: Cart = cartFromGoods(catalog.page(0, 4));
      let secondCart: Cart = cartFromGoods(catalog.page(1, 4));
      let thirdCart: Cart = cartFromGoods(catalog.page(2, 4));
      let fourthCart: Cart = cartFromGoods(catalog.page(3, 4));
      let first: Order = new Order(7034, firstCart.allLines(), OrderState.OBLIGATION, 1);
      let second: Order = new Order(7035, secondCart.allLines(), OrderState.OBLIGATION, 2);
      let third: Order = new Order(7036, thirdCart.allLines(), OrderState.OBLIGATION, 3);
      let fourth: Order = new Order(7037, fourthCart.allLines(), OrderState.OBLIGATION, 4);
      let center: OrderCenter = new OrderCenter([first, second, third, fourth]);
      // Two mirrored page sizes make the outer pages expensive and the inner pages cheap.
      expect(first.total().cents()).assertEqual(1089600);
      expect(second.total().cents()).assertEqual(74600);
      expect(third.total().cents()).assertEqual(1089600);
      expect(fourth.total().cents()).assertEqual(74600);
      expect(center.spent().cents()).assertEqual(2328400);
      expect(center.counts().total).assertEqual(4);
      expect(center.counts().obligation).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0280
     * @tc.name      comment_stats_independent_of_price_pipeline_028
     * @tc.desc      Verify the comment statistics are independent of the price pipeline.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('comment_stats_independent_of_price_pipeline_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: comment_stats_independent_of_price_pipeline_028');
      let detail: DetailModel = detailFor(5);
      let valuation: Valuation = new Valuation(detail.goods.price, 10);
      let cart: Cart = cartWith([cartLine(5, valuation.finalPrice().cents(), 4)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7038, cart.allLines(), OrderState.OBLIGATION, 28);
      expect(detail.commentCount()).assertEqual(10);
      expect(detail.positiveCount()).assertEqual(6);
      expect(detail.positiveRate()).assertEqual(60);
      expect(detail.averageStars()).assertEqual(3.7);
      expect(detail.goods.category).assertEqual('appliances');
      expect(detail.goods.price.cents()).assertEqual(29900);
      expect(valuation.finalPrice().cents()).assertEqual(26910);
      expect(valuation.saved().cents()).assertEqual(2990);
      expect(order.total().cents()).assertEqual(107640);
      expect(cart.payable(book).cents()).assertEqual(102640);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0290
     * @tc.name      breakpoint_page_sizes_change_last_page_029
     * @tc.desc      Verify breakpoint page sizes change the last page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('breakpoint_page_sizes_change_last_page_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: breakpoint_page_sizes_change_last_page_029');
      let small: string = BreakpointUtil.resolve(400);
      let medium: string = BreakpointUtil.resolve(600);
      let large: string = BreakpointUtil.resolve(900);
      let smallSize: number = BreakpointUtil.columns(small);
      let mediumSize: number = BreakpointUtil.columns(medium);
      let largeSize: number = BreakpointUtil.columns(large);
      let catalog: Catalog = defaultCatalog();
      let lastSmall: Goods[] = catalog.page(catalog.pageCount(smallSize) - 1, smallSize);
      let lastMedium: Goods[] = catalog.page(catalog.pageCount(mediumSize) - 1, mediumSize);
      let lastLarge: Goods[] = catalog.page(catalog.pageCount(largeSize) - 1, largeSize);
      let cart: Cart = cartFromGoods(lastMedium);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7039, cart.allLines(), OrderState.OBLIGATION, 29);
      expect(smallSize).assertEqual(1);
      expect(mediumSize).assertEqual(2);
      expect(largeSize).assertEqual(3);
      expect(catalog.pageCount(smallSize)).assertEqual(16);
      expect(catalog.pageCount(mediumSize)).assertEqual(8);
      expect(catalog.pageCount(largeSize)).assertEqual(6);
      expect(lastSmall.length).assertEqual(1);
      expect(lastMedium.length).assertEqual(2);
      expect(lastLarge.length).assertEqual(1);
      expect(lastMedium[0].id).assertEqual(14);
      expect(lastMedium[1].id).assertEqual(15);
      expect(cart.subtotal().cents()).assertEqual(35800);
      expect(cart.payable(book).cents()).assertEqual(33800);
      expect(order.total().cents()).assertEqual(35800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0300
     * @tc.name      merged_restored_cart_feeds_order_and_center_030
     * @tc.desc      Verify a merged restored cart feeds the order and center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merged_restored_cart_feeds_order_and_center_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merged_restored_cart_feeds_order_and_center_030');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let extra: Cart = cartWith([cartLine(3, 59900, 1)]);
      cart.merge(extra);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7030, restored.allLines(), OrderState.OBLIGATION, 30);
      let center: OrderCenter = new OrderCenter([order]);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(77700);
      expect(cart.payable(book).cents()).assertEqual(75700);
      expect(restored.allLinesSubtotal().cents()).assertEqual(77700);
      expect(order.total().cents()).assertEqual(77700);
      expect(order.quantity()).assertEqual(3);
      expect(center.spent().cents()).assertEqual(77700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0310
     * @tc.name      letter_g_maps_guangdong_to_a_default_address_031
     * @tc.desc      Verify letter G maps Guangdong to a default address.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('letter_g_maps_guangdong_to_a_default_address_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: letter_g_maps_guangdong_to_a_default_address_031');
      let index: CityIndex = defaultCityIndex();
      let cities: string[] = index.citiesOf('G');
      let address: Address = createAddress(0, 'Grace', '18800001765', 'Guangdong', 'Guangzhou',
        'Tianhe', '88 Pearl Road');
      let book: AddressBook = new AddressBook();
      let firstId: number = book.add(address);
      let second: Address = createAddress(0, 'Henry', '13900001234', 'Zhejiang', 'Hangzhou',
        'Xihu', '9 Lake Road');
      let secondId: number = book.add(second);
      let defaultBefore: Address | undefined = book.defaultAddress();
      let moved: boolean = book.setDefault(secondId);
      let defaultAfter: Address | undefined = book.defaultAddress();
      expect(cities.length).assertEqual(3);
      expect(cities[1]).assertEqual('Guangdong');
      expect(index.findLetterOf('Guangdong')).assertEqual('G');
      expect(index.cityCount()).assertEqual(30);
      expect(book.validate(address)).assertEqual('');
      expect(address.fullAddress()).assertEqual('GuangdongGuangzhouTianhe88 Pearl Road');
      expect(firstId).assertEqual(1);
      expect(defaultBefore !== undefined && defaultBefore.id === 1).assertTrue();
      expect(moved).assertTrue();
      expect(defaultAfter !== undefined && defaultAfter.id === 2).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0320
     * @tc.name      jiangsu_update_keeps_default_flag_and_position_032
     * @tc.desc      Verify a Jiangsu update keeps the default flag and position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('jiangsu_update_keeps_default_flag_and_position_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: jiangsu_update_keeps_default_flag_and_position_032');
      let index: CityIndex = defaultCityIndex();
      let cities: string[] = index.citiesOf('J');
      let book: AddressBook = new AddressBook();
      let nanjing: Address = createAddress(0, 'Ivy', '15800005678', 'Jiangsu', 'Jiangsu',
        'Gulou', '12 River Road');
      let firstId: number = book.add(nanjing);
      let changchun: Address = createAddress(0, 'Ivan', '17700009012', 'Jilin', 'Jilin',
        'Nanguan', '77 North Road');
      let secondId: number = book.add(changchun);
      let replacement: Address = createAddress(0, 'Ivy', '15800005678', 'Jiangsu', 'Jiangsu',
        'Xuanwu', '14 Lake Road');
      let updated: boolean = book.update(firstId, replacement);
      let defaultAddress: Address | undefined = book.defaultAddress();
      expect(cities.length).assertEqual(3);
      expect(index.findLetterOf('Jiangsu')).assertEqual('J');
      expect(book.validate(replacement)).assertEqual('');
      expect(updated).assertTrue();
      expect(secondId).assertEqual(2);
      expect(book.indexOf(firstId)).assertEqual(0);
      expect(defaultAddress !== undefined && defaultAddress.id === firstId).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].district).assertEqual('Xuanwu');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0330
     * @tc.name      shanghai_hot_city_feeds_valid_address_and_order_033
     * @tc.desc      Verify the Shanghai hot city feeds a valid address and order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('shanghai_hot_city_feeds_valid_address_and_order_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: shanghai_hot_city_feeds_valid_address_and_order_033');
      let index: CityIndex = defaultCityIndex();
      let cities: string[] = index.citiesOf('S');
      let address: Address = createAddress(0, 'Jade', PHONE_SAMPLES[0], 'Shanghai', 'Shanghai',
        'Pudong', '1 Bund Road');
      let book: AddressBook = new AddressBook();
      let id: number = book.add(address);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(3);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(3, price, 1)]);
      let couponBook: CouponBook = defaultCouponBook();
      let order: Order = new Order(7033, cart.allLines(), OrderState.OBLIGATION, 33);
      let center: OrderCenter = new OrderCenter([order]);
      let defaultAfter: Address | undefined = book.defaultAddress();
      expect(cities.length).assertEqual(3);
      expect(index.isHot('Shanghai')).assertTrue();
      expect(index.isHot('Sichuan')).assertFalse();
      expect(index.findLetterOf('Sichuan')).assertEqual('S');
      expect(address.fullAddress()).assertEqual('ShanghaiShanghaiPudong1 Bund Road');
      expect(book.validate(address)).assertEqual('');
      expect(id).assertEqual(1);
      expect(defaultAfter !== undefined && defaultAfter.id === 1).assertTrue();
      expect(center.spent().cents()).assertEqual(59900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0340
     * @tc.name      two_address_books_hold_independent_defaults_034
     * @tc.desc      Verify two address books hold independent defaults.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_address_books_hold_independent_defaults_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_address_books_hold_independent_defaults_034');
      let index: CityIndex = defaultCityIndex();
      let input: Address = createAddress(0, 'Uma', PHONE_SAMPLES[7], 'Fujian', 'Fujian',
        'Gulou', '3 Tea Road');
      let bookA: AddressBook = new AddressBook();
      let bookB: AddressBook = new AddressBook();
      let idA: number = bookA.add(input);
      let idB: number = bookB.add(input);
      let defaultB: Address | undefined = bookB.defaultAddress();
      expect(bookA.remove(idA)).assertTrue();
      expect(bookA.size()).assertEqual(0);
      expect(bookA.defaultAddress() === undefined).assertTrue();
      expect(bookB.size()).assertEqual(1);
      expect(defaultB !== undefined && defaultB.id === idB).assertTrue();
      expect(idA).assertEqual(1);
      expect(idB).assertEqual(1);
      expect(index.findLetterOf('Fujian')).assertEqual('F');
      expect(bookB.validate(input)).assertEqual('');
      expect(AddressBook.isValidPhone(PHONE_SAMPLES[7])).assertTrue();
      expect(AddressBook.isValidPhone(INVALID_PHONES[0])).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0350
     * @tc.name      fixture_provinces_resolve_to_root_letters_035
     * @tc.desc      Verify the address fixture provinces resolve to root letters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('fixture_provinces_resolve_to_root_letters_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fixture_provinces_resolve_to_root_letters_035');
      let index: CityIndex = defaultCityIndex();
      let book: AddressBook = new AddressBook();
      let validationErrors: number = 0;
      for (let addressIndex: number = 0; addressIndex < ADDRESSES.length; addressIndex++) {
        if (book.validate(ADDRESSES[addressIndex]).length > 0) {
          validationErrors++;
        }
        book.add(ADDRESSES[addressIndex]);
      }
      let defaultAddress: Address | undefined = book.defaultAddress();
      let moved: boolean = book.setDefault(3);
      let promoted: Address | undefined = book.defaultAddress();
      expect(index.findLetterOf('Anhui')).assertEqual('A');
      expect(index.findLetterOf('Beijing')).assertEqual('B');
      expect(index.findLetterOf('Guangdong')).assertEqual('G');
      expect(index.findLetterOf('Zhejiang')).assertEqual('Z');
      expect(validationErrors).assertEqual(0);
      expect(book.size()).assertEqual(4);
      expect(defaultAddress !== undefined && defaultAddress.id === 1).assertTrue();
      expect(moved).assertTrue();
      expect(promoted !== undefined && promoted.id === 3).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0360
     * @tc.name      jilin_letter_builds_address_then_lifecycle_order_036
     * @tc.desc      Verify the Jilin letter builds an address then a lifecycle order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('jilin_letter_builds_address_then_lifecycle_order_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: jilin_letter_builds_address_then_lifecycle_order_036');
      let index: CityIndex = defaultCityIndex();
      let jCities: string[] = index.citiesOf('J');
      let missingRoot: boolean = index.rootOf('J') === undefined;
      let address: Address = createAddress(0, 'Kai', '18800001765', 'Jilin', 'Jilin',
        'Nanguan', '77 North Road');
      let book: AddressBook = new AddressBook();
      let id: number = book.add(address);
      let order: Order = new Order(7036, orderLines(4, 8900, 3), OrderState.OBLIGATION, 36);
      let center: OrderCenter = new OrderCenter([order]);
      expect(jCities.length).assertEqual(3);
      expect(jCities[0]).assertEqual('Jilin');
      expect(missingRoot).assertFalse();
      expect(index.findLetterOf('Jilin')).assertEqual('J');
      expect(book.validate(address)).assertEqual('');
      expect(id).assertEqual(1);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(order.total().cents()).assertEqual(26700);
      expect(center.spent().cents()).assertEqual(26700);
      let defaultAddress: Address | undefined = book.defaultAddress();
      expect(defaultAddress !== undefined && defaultAddress.city === 'Jilin').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0370
     * @tc.name      address_default_orthogonal_to_cart_snapshot_037
     * @tc.desc      Verify the address default is orthogonal to a cart snapshot.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_default_orthogonal_to_cart_snapshot_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_default_orthogonal_to_cart_snapshot_037');
      let index: CityIndex = defaultCityIndex();
      let book: AddressBook = new AddressBook();
      let first: Address = createAddress(0, 'Sara', PHONE_SAMPLES[0], 'Anhui', 'Anqing',
        'Downtown', '5 Hill Road');
      let second: Address = createAddress(0, 'Saul', PHONE_SAMPLES[1], 'Guangdong', 'Guangzhou',
        'Tianhe', '88 Pearl Road');
      let third: Address = createAddress(0, 'Seth', PHONE_SAMPLES[2], 'Sichuan', 'Sichuan',
        'Jinjiang', '2 Bamboo Road');
      book.add(first);
      book.add(second);
      book.add(third);
      let cart: Cart = cartWith([cartLine(4, 8900, 2, true), cartLine(7, 15900, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(book.setDefault(3)).assertTrue();
      expect(book.setDefault(2)).assertTrue();
      cart.increase(4, 2);
      let bookCoupons: CouponBook = defaultCouponBook();
      let restored: Cart = Cart.restore(snapshot);
      let current: Address | undefined = book.defaultAddress();
      expect(current !== undefined && current.id === 2).assertTrue();
      expect(index.isHot('Guangzhou')).assertTrue();
      expect(index.isHot('Anqing')).assertFalse();
      expect(index.findLetterOf('Sichuan')).assertEqual('S');
      expect(cart.subtotal().cents()).assertEqual(51500);
      expect(cart.payable(bookCoupons).cents()).assertEqual(49500);
      expect(restored.subtotal().cents()).assertEqual(33700);
      expect(restored.payable(bookCoupons).cents()).assertEqual(31700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0380
     * @tc.name      single_city_root_letter_sits_between_x_and_z_038
     * @tc.desc      Verify the single city root letter sits between X and Z.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('single_city_root_letter_sits_between_x_and_z_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: single_city_root_letter_sits_between_x_and_z_038');
      let index: CityIndex = defaultCityIndex();
      let letters: string[] = index.letters();
      let yCities: string[] = index.citiesOf('Y');
      let address: Address = createAddress(0, 'Liam', '13900001234', 'Yunnan', 'Yunnan',
        'Wuhua', '8 Green Lake Road');
      let book: AddressBook = new AddressBook();
      let firstId: number = book.add(address);
      let second: Address = createAddress(0, 'Lily', '15800005678', 'Hubei', 'Hubei',
        'Wuchang', '21 East Road');
      let secondId: number = book.add(second);
      expect(letters.length).assertEqual(15);
      expect(letters[7]).assertEqual('L');
      expect(letters[13]).assertEqual('Y');
      expect(letters[14]).assertEqual('Z');
      expect(yCities.length).assertEqual(1);
      expect(yCities[0]).assertEqual('Yunnan');
      expect(index.isHot('Yunnan')).assertFalse();
      expect(index.findLetterOf('Yunnan')).assertEqual('Y');
      expect(book.validate(address)).assertEqual('');
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(2);
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0390
     * @tc.name      hot_city_absent_from_tree_still_has_letter_039
     * @tc.desc      Verify a hot city absent from the tree still has a letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('hot_city_absent_from_tree_still_has_letter_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: hot_city_absent_from_tree_still_has_letter_039');
      let index: CityIndex = defaultCityIndex();
      let hot: string[] = index.hotCities();
      let fCities: string[] = index.citiesOf('F');
      let address: Address = createAddress(0, 'Mia', '17700009012', 'Guangdong', 'Foshan',
        'Nanhai', '6 Nanhai Road');
      let book: AddressBook = new AddressBook();
      let id: number = book.add(address);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(7);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(7, price, 2)]);
      let couponBook: CouponBook = defaultCouponBook();
      let order: Order = new Order(7039, cart.allLines(), OrderState.OBLIGATION, 39);
      expect(hot.length).assertEqual(12);
      expect(index.isHot('Beijing')).assertTrue();
      expect(index.isHot('Foshan')).assertFalse();
      expect(fCities.length).assertEqual(2);
      expect(index.findLetterOf('Foshan')).assertEqual('F');
      expect(book.validate(address)).assertEqual('');
      expect(id).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(31800);
      expect(cart.payable(couponBook).cents()).assertEqual(29800);
      expect(order.total().cents()).assertEqual(31800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0400
     * @tc.name      zhengzhou_update_keeps_default_address_position_040
     * @tc.desc      Verify a Zhengzhou update keeps the default address position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zhengzhou_update_keeps_default_address_position_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zhengzhou_update_keeps_default_address_position_040');
      let index: CityIndex = defaultCityIndex();
      let book: AddressBook = new AddressBook();
      let first: Address = createAddress(0, 'Nina', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '5 Hill Road');
      let firstId: number = book.add(first);
      let second: Address = createAddress(0, 'Noah', '13900001234', 'Zhejiang', 'Hangzhou',
        'Xihu', '9 Lake Road');
      let secondId: number = book.add(second);
      let replacement: Address = createAddress(0, 'Noah', '13900001234', 'Zhejiang', 'Zhengzhou',
        'Erqi', '30 Port Road');
      let updated: boolean = book.update(secondId, replacement);
      let defaultAddress: Address | undefined = book.defaultAddress();
      expect(index.citiesOf('Z').length).assertEqual(2);
      expect(index.findLetterOf('Zhengzhou')).assertEqual('Z');
      expect(updated).assertTrue();
      expect(book.indexOf(secondId)).assertEqual(1);
      expect(defaultAddress !== undefined && defaultAddress.id === firstId).assertTrue();
      expect(book.all()[1].city).assertEqual('Zhengzhou');
      expect(replacement.fullAddress()).assertEqual('ZhejiangZhengzhouErqi30 Port Road');
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0410
     * @tc.name      live_room_goods_valuation_and_comment_rate_041
     * @tc.desc      Verify a live room goods valuation and comment rate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_room_goods_valuation_and_comment_rate_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_room_goods_valuation_and_comment_rate_041');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let rooms: LiveRoom[] = live.liveRooms();
      let room: LiveRoom | undefined = live.byGoods(3);
      let watched: LiveRoom | undefined = live.mostWatched();
      let detail: DetailModel = detailFor(3);
      let valuation: Valuation = new Valuation(detail.goods.price, 20);
      let cart: Cart = cartWith([cartLine(3, valuation.finalPrice().cents(), 2)]);
      let book: CouponBook = defaultCouponBook();
      expect(rooms.length).assertEqual(4);
      expect(room !== undefined && room.live === true).assertTrue();
      expect(room !== undefined && room.viewers === 75).assertTrue();
      expect(watched !== undefined && watched.viewers === 15300).assertTrue();
      expect(live.totalViewers()).assertEqual(26895);
      expect(detail.commentCount()).assertEqual(10);
      expect(detail.averageStars()).assertEqual(3.7);
      expect(valuation.finalPrice().cents()).assertEqual(47920);
      expect(valuation.saved().cents()).assertEqual(11980);
      expect(cart.subtotal().cents()).assertEqual(95840);
      expect(cart.payable(book).cents()).assertEqual(93840);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0420
     * @tc.name      offline_room_total_differs_from_live_subtotal_042
     * @tc.desc      Verify the offline room total differs from the live subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('offline_room_total_differs_from_live_subtotal_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: offline_room_total_differs_from_live_subtotal_042');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let rooms: LiveRoom[] = live.liveRooms();
      let room: LiveRoom | undefined = live.byGoods(5);
      let liveViewers: number = 0;
      for (let roomIndex: number = 0; roomIndex < rooms.length; roomIndex++) {
        liveViewers += rooms[roomIndex].viewers;
      }
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(5);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(5, price, 3)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7042, cart.allLines(), OrderState.OBLIGATION, 42);
      expect(rooms.length).assertEqual(4);
      expect(room !== undefined && room.live === false).assertTrue();
      expect(room !== undefined && room.viewers === 15300).assertTrue();
      expect(liveViewers).assertEqual(11595);
      expect(live.totalViewers()).assertEqual(26895);
      expect(live.totalViewers() - liveViewers).assertEqual(15300);
      expect(cart.subtotal().cents()).assertEqual(89700);
      expect(cart.payable(book).cents()).assertEqual(87700);
      expect(order.total().cents()).assertEqual(89700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0430
     * @tc.name      detail_choice_valuation_rounds_to_exact_cents_043
     * @tc.desc      Verify the detail choice valuation rounds to exact cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_choice_valuation_rounds_to_exact_cents_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_choice_valuation_rounds_to_exact_cents_043');
      let detail: DetailModel = detailFor(0);
      let firstChoice: boolean = detail.selectChoice(1);
      let secondChoice: boolean = detail.selectChoice(2);
      let valuation: Valuation = new Valuation(detail.goods.price, 15);
      let cart: Cart = cartWith([cartLine(0, valuation.finalPrice().cents(), 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7043, cart.allLines(), OrderState.OBLIGATION, 43);
      let center: OrderCenter = new OrderCenter([order]);
      // Fifteen percent off 499900 is 424915 cents, with no rounding remainder.
      expect(detail.imageCount()).assertEqual(4);
      expect(detail.goods.isInStock()).assertTrue();
      expect(firstChoice).assertTrue();
      expect(secondChoice).assertTrue();
      expect(detail.choiceName()).assertEqual('blue');
      expect(valuation.finalPrice().cents()).assertEqual(424915);
      expect(valuation.saved().cents()).assertEqual(74985);
      expect(cart.subtotal().cents()).assertEqual(424915);
      expect(cart.payable(book).cents()).assertEqual(419915);
      expect(order.total().cents()).assertEqual(424915);
      expect(center.spent().cents()).assertEqual(424915);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0440
     * @tc.name      sparse_wallet_removes_the_default_coupon_tier_044
     * @tc.desc      Verify a sparse wallet removes the default coupon tier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sparse_wallet_removes_the_default_coupon_tier_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sparse_wallet_removes_the_default_coupon_tier_044');
      let wallet: Coupon[] = [COUPONS[2]];
      let account: UserAccount = new UserAccount('sparse-wallet', 0, 2, wallet);
      let walletBook: CouponBook = new CouponBook(account.coupons);
      let defaultBook: CouponBook = defaultCouponBook();
      let cart: Cart = cartWith([cartLine(5, 29900, 1)]);
      let walletBest: Coupon | undefined = walletBook.best(cart.subtotal());
      let defaultBest: Coupon | undefined = defaultBook.best(cart.subtotal());
      let order: Order = new Order(7044, cart.allLines(), OrderState.OBLIGATION, 44);
      expect(account.couponCount()).assertEqual(1);
      expect(walletBest === undefined).assertTrue();
      expect(defaultBest !== undefined && defaultBest.id === 'C10').assertTrue();
      // The wallet holds only the 100000-cent tier, so the 29900-cent cart pays full price.
      expect(walletBook.payable(cart.subtotal()).cents()).assertEqual(29900);
      expect(cart.payable(defaultBook).cents()).assertEqual(28900);
      expect(order.total().cents()).assertEqual(29900);
      expect(account.levelName()).assertEqual('silver');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0450
     * @tc.name      launch_room_goods_becomes_obligation_order_045
     * @tc.desc      Verify a launch room goods becomes an obligation order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('launch_room_goods_becomes_obligation_order_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: launch_room_goods_becomes_obligation_order_045');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let room: LiveRoom | undefined = live.byGoods(0);
      let missing: LiveRoom | undefined = live.byGoods(99);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(0);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(0, price, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7045, cart.allLines(), OrderState.OBLIGATION, 45);
      let center: OrderCenter = new OrderCenter([order]);
      expect(room !== undefined && room.title === 'phone launch live').assertTrue();
      expect(room !== undefined && room.live === true).assertTrue();
      expect(room !== undefined && room.viewers === 520).assertTrue();
      expect(missing === undefined).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(499900);
      expect(cart.payable(book).cents()).assertEqual(494900);
      expect(order.advance()).assertTrue();
      expect(center.counts().waitDelivery).assertEqual(1);
      expect(center.spent().cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0460
     * @tc.name      most_watched_offline_room_drives_cart_quantity_046
     * @tc.desc      Verify the most watched offline room drives a cart quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('most_watched_offline_room_drives_cart_quantity_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: most_watched_offline_room_drives_cart_quantity_046');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let watched: LiveRoom | undefined = live.mostWatched();
      expect(watched !== undefined).assertTrue();
      let goodsId: number = watched !== undefined ? watched.goodsId : -1;
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(goodsId);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(goodsId, price, 4)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7046, cart.allLines(), OrderState.OBLIGATION, 46);
      expect(watched !== undefined && watched.viewers === 15300).assertTrue();
      expect(watched !== undefined && watched.live === false).assertTrue();
      expect(goodsId).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(119600);
      expect(cart.payable(book).cents()).assertEqual(114600);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(live.totalViewers()).assertEqual(26895);
      expect(order.total().cents()).assertEqual(119600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0470
     * @tc.name      valuation_third_off_watch_keeps_exact_saving_047
     * @tc.desc      Verify a third off the watch keeps the exact saving.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_third_off_watch_keeps_exact_saving_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_third_off_watch_keeps_exact_saving_047');
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(2);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let valuation: Valuation = new Valuation(new Money(price), 33);
      let cart: Cart = cartWith([cartLine(2, valuation.finalPrice().cents(), 3)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7047, cart.allLines(), OrderState.OBLIGATION, 47);
      let center: OrderCenter = new OrderCenter([order]);
      // A 33 percent cut leaves 67 percent payable, which lands exactly on 87033 cents.
      expect(price).assertEqual(129900);
      expect(valuation.isDiscounted()).assertTrue();
      expect(valuation.finalPrice().cents()).assertEqual(87033);
      expect(valuation.saved().cents()).assertEqual(42867);
      expect(cart.subtotal().cents()).assertEqual(261099);
      expect(cart.payable(book).cents()).assertEqual(256099);
      expect(order.total().cents()).assertEqual(261099);
      expect(center.spent().cents()).assertEqual(261099);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0480
     * @tc.name      live_rooms_feed_catalogue_priced_cart_048
     * @tc.desc      Verify live rooms feed a catalogue priced cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_rooms_feed_catalogue_priced_cart_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_rooms_feed_catalogue_priced_cart_048');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let rooms: LiveRoom[] = live.liveRooms();
      let catalog: Catalog = defaultCatalog();
      let cart: Cart = new Cart();
      for (let index: number = 0; index < rooms.length; index++) {
        let goods: Goods | undefined = catalog.byId(rooms[index].goodsId);
        if (goods !== undefined) {
          cart.add(goods.id, goods.price.cents(), 1);
        }
      }
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7048, cart.allLines(), OrderState.OBLIGATION, 48);
      let center: OrderCenter = new OrderCenter([order]);
      expect(rooms.length).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(4);
      // The four live rooms map to the phone, watch and shoe rows, not the offline blender.
      expect(cart.subtotal().cents()).assertEqual(1089600);
      expect(cart.payable(book).cents()).assertEqual(1084600);
      expect(order.total().cents()).assertEqual(1089600);
      expect(center.spent().cents()).assertEqual(1089600);
      expect(catalog.byId(5) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0490
     * @tc.name      watch_room_order_refund_clears_spending_049
     * @tc.desc      Verify a watch room order refund clears spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('watch_room_order_refund_clears_spending_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: watch_room_order_refund_clears_spending_049');
      let live: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let room: LiveRoom | undefined = live.byGoods(2);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(2);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(2, price, 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7049, cart.allLines(), OrderState.OBLIGATION, 49);
      let center: OrderCenter = new OrderCenter([order]);
      expect(room !== undefined && room.title === 'watch training live').assertTrue();
      expect(room !== undefined && room.viewers === 9800).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(259800);
      expect(cart.payable(book).cents()).assertEqual(254800);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('wait_evaluate');
      expect(order.refund()).assertTrue();
      expect(order.stateLabel()).assertEqual('refund');
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(live.totalViewers()).assertEqual(26895);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0500
     * @tc.name      hot_label_search_pages_duplicate_earbuds_050
     * @tc.desc      Verify the hot label search pages duplicate earbuds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('hot_label_search_pages_duplicate_earbuds_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: hot_label_search_pages_duplicate_earbuds_050');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('hot');
      let filter: ProductFilter = new ProductFilter('', 10000, 50000);
      let filtered: Goods[] = filter.apply(matches);
      // Only the two sold-out earbud rows fall inside the 10000-50000 cent band.
      expect(matches.length).assertEqual(6);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].id).assertEqual(6);
      expect(filtered[1].id).assertEqual(14);
      let firstItems: Goods[] = [filtered[0]];
      let secondItems: Goods[] = [filtered[1]];
      let firstPage: PagedResult<Goods> = new PagedResult<Goods>(firstItems, 0, 1, filtered.length);
      let secondPage: PagedResult<Goods> = new PagedResult<Goods>(secondItems, 1, 1, filtered.length);
      expect(firstPage.hasNext()).assertTrue();
      expect(firstPage.hasPrevious()).assertFalse();
      expect(firstPage.count()).assertEqual(1);
      expect(secondPage.hasNext()).assertFalse();
      expect(secondPage.hasPrevious()).assertTrue();
      let cart: Cart = cartWith([cartLine(6, filtered[0].price.cents(), 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7050, cart.allLines(), OrderState.OBLIGATION, 50);
      expect(cart.subtotal().cents()).assertEqual(39800);
      expect(cart.payable(book).cents()).assertEqual(37800);
      expect(order.total().cents()).assertEqual(39800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0510
     * @tc.name      in_stock_phone_filter_drops_sold_out_pair_051
     * @tc.desc      Verify the in stock phone filter drops the sold out pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('in_stock_phone_filter_drops_sold_out_pair_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: in_stock_phone_filter_drops_sold_out_pair_051');
      let filter: ProductFilter = new ProductFilter('', 10000, Number.MAX_SAFE_INTEGER, 'phone', true);
      let filtered: Goods[] = filter.apply(defaultCatalog().all());
      let catalog: Catalog = new Catalog(filtered);
      let secondPage: Goods[] = catalog.page(1, 2);
      let cart: Cart = cartWith([cartLine(8, 499900, 1), cartLine(9, 399900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7051, cart.allLines(), OrderState.OBLIGATION, 51);
      expect(filtered.length).assertEqual(4);
      expect(filtered[0].isInStock()).assertTrue();
      expect(catalog.pageCount(2)).assertEqual(2);
      expect(secondPage.length).assertEqual(2);
      expect(secondPage[0].id).assertEqual(8);
      expect(secondPage[1].id).assertEqual(9);
      expect(cart.subtotal().cents()).assertEqual(899800);
      expect(cart.payable(book).cents()).assertEqual(894800);
      expect(order.total().cents()).assertEqual(899800);
      expect(order.quantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0520
     * @tc.name      sport_price_window_keeps_watch_pair_052
     * @tc.desc      Verify the sport price window keeps the watch pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sport_price_window_keeps_watch_pair_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sport_price_window_keeps_watch_pair_052');
      let filter: ProductFilter = new ProductFilter('sport', 100000, 200000, 'watch');
      let filtered: Goods[] = filter.apply(defaultCatalog().all());
      let catalog: Catalog = new Catalog(filtered);
      let page: Goods[] = catalog.page(0, 1);
      let cart: Cart = cartWith([cartLine(2, 129900, 4)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7052, cart.allLines(), OrderState.OBLIGATION, 52);
      let center: OrderCenter = new OrderCenter([order]);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].category).assertEqual('sport');
      expect(page.length).assertEqual(1);
      expect(page[0].id).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(519600);
      expect(cart.payable(book).cents()).assertEqual(514600);
      expect(order.total().cents()).assertEqual(519600);
      expect(center.spent().cents()).assertEqual(519600);
      expect(center.counts().obligation).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0530
     * @tc.name      food_price_floor_leaves_empty_catalog_order_053
     * @tc.desc      Verify the food price floor leaves an empty catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('food_price_floor_leaves_empty_catalog_order_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: food_price_floor_leaves_empty_catalog_order_053');
      let filter: ProductFilter = new ProductFilter('food', 10000, Number.MAX_SAFE_INTEGER);
      let filtered: Goods[] = filter.apply(defaultCatalog().all());
      let catalog: Catalog = new Catalog(filtered);
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let tea: Goods[] = engine.search('tea');
      let cart: Cart = new Cart();
      let order: Order = new Order(7053, cart.allLines(), OrderState.OBLIGATION, 53);
      let center: OrderCenter = new OrderCenter([order]);
      let page: PagedResult<Goods> = new PagedResult<Goods>(filtered, 0, 3, filtered.length);
      expect(filtered.length).assertEqual(0);
      expect(catalog.isEmpty()).assertTrue();
      expect(tea.length).assertEqual(2);
      expect(tea[0].price.cents()).assertEqual(8900);
      expect(cart.isEmpty()).assertTrue();
      expect(order.total().cents()).assertEqual(0);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.spent().cents()).assertEqual(0);
      expect(page.hasNext()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0540
     * @tc.name      task_queue_results_sum_to_order_total_054
     * @tc.desc      Verify the task queue results sum to the order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_results_sum_to_order_total_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_results_sum_to_order_total_054');
      let queue: TaskQueue = new TaskQueue();
      let firstReturn: number = queue.enqueue(async (): Promise<number> => {
        return 8900;
      });
      let secondReturn: number = queue.enqueue(async (): Promise<number> => {
        return 29900;
      });
      let thirdReturn: number = queue.enqueue(async (): Promise<number> => {
        return 15900;
      });
      let pendingBefore: number = queue.pending();
      let drained: number[] = await queue.drain();
      let pendingAfter: number = queue.pending();
      let values: Money[] = [new Money(drained[0]), new Money(drained[1]), new Money(drained[2])];
      let summed: Money = Money.sum(values);
      let cart: Cart = cartWith([cartLine(4, 8900, 1), cartLine(5, 29900, 1), cartLine(7, 15900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7054, cart.allLines(), OrderState.OBLIGATION, 54);
      let center: OrderCenter = new OrderCenter([order]);
      // Drain order follows enqueue order, so the prefix sums stay monotonic.
      expect(firstReturn).assertEqual(1);
      expect(secondReturn).assertEqual(2);
      expect(thirdReturn).assertEqual(3);
      expect(pendingBefore).assertEqual(3);
      expect(drained.length).assertEqual(3);
      expect(drained[2]).assertEqual(15900);
      expect(pendingAfter).assertEqual(0);
      expect(summed.cents()).assertEqual(54700);
      expect(cart.allLinesSubtotal().cents()).assertEqual(54700);
      expect(cart.payable(book).cents()).assertEqual(52700);
      expect(order.total().cents()).assertEqual(54700);
      expect(center.spent().cents()).assertEqual(54700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0550
     * @tc.name      detail_url_identifier_builds_a_cart_line_055
     * @tc.desc      Verify the detail url identifier builds a cart line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_url_identifier_builds_a_cart_line_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_url_identifier_builds_a_cart_line_055');
      let payload: string = EmitterEvent.cartPayload(7);
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=7');
      let rebuilt: string = url.withGoods(7);
      let reparsed: ShopUrl = ShopUrl.parse(rebuilt);
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(reparsed.goodsId);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(reparsed.goodsId, price, 3)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7055, cart.allLines(), OrderState.OBLIGATION, 55);
      let center: OrderCenter = new OrderCenter([order]);
      expect(payload).assertEqual('{"id":7}');
      expect(EmitterEvent.isCartEvent(2)).assertTrue();
      expect(EmitterEvent.isDialogEvent(1)).assertTrue();
      expect(EmitterEvent.isCartEvent(1)).assertFalse();
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(7);
      expect(url.valid).assertTrue();
      expect(reparsed.goodsId).assertEqual(7);
      expect(cart.subtotal().cents()).assertEqual(47700);
      expect(cart.payable(book).cents()).assertEqual(45700);
      expect(order.total().cents()).assertEqual(47700);
      expect(center.spent().cents()).assertEqual(47700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0560
     * @tc.name      breakpoint_columns_and_last_page_agree_056
     * @tc.desc      Verify the breakpoint columns and the last page agree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('breakpoint_columns_and_last_page_agree_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: breakpoint_columns_and_last_page_agree_056');
      let small: string = BreakpointUtil.resolve(519);
      let mediumLow: string = BreakpointUtil.resolve(520);
      let mediumHigh: string = BreakpointUtil.resolve(839);
      let large: string = BreakpointUtil.resolve(840);
      let catalog: Catalog = defaultCatalog();
      let lastPage: Goods[] = catalog.page(5, 3);
      let page: PagedResult<Goods> = new PagedResult<Goods>(lastPage, 5, 3, catalog.count());
      let cart: Cart = cartWith([cartLine(15, 15900, 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7056, cart.allLines(), OrderState.OBLIGATION, 56);
      expect(small).assertEqual(BreakpointUtil.SMALL);
      expect(mediumLow).assertEqual(BreakpointUtil.MEDIUM);
      expect(mediumHigh).assertEqual(BreakpointUtil.MEDIUM);
      expect(large).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.columns(small)).assertEqual(1);
      expect(BreakpointUtil.columns(mediumLow)).assertEqual(2);
      expect(BreakpointUtil.columns(large)).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(large)).assertEqual(3);
      expect(lastPage.length).assertEqual(1);
      expect(lastPage[0].id).assertEqual(15);
      expect(page.hasNext()).assertFalse();
      expect(page.hasPrevious()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(31800);
      expect(cart.payable(book).cents()).assertEqual(29800);
      expect(order.total().cents()).assertEqual(31800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0570
     * @tc.name      loyalty_points_floor_to_whole_yuan_057
     * @tc.desc      Verify loyalty points floor to whole yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('loyalty_points_floor_to_whole_yuan_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: loyalty_points_floor_to_whole_yuan_057');
      let noCoupons: Coupon[] = [];
      let account: UserAccount = new UserAccount('pipeline-user', 2350, 3, noCoupons);
      let startingValue: Money = account.pointsValue();
      let added: number = account.addPoints(150);
      let afterAdd: Money = account.pointsValue();
      let redeemed: boolean = account.redeem(500);
      let afterRedeem: Money = account.pointsValue();
      let overdraw: boolean = account.redeem(2001);
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7057, cart.allLines(), OrderState.OBLIGATION, 57);
      let center: OrderCenter = new OrderCenter([order]);
      // pointsValue first floors to whole yuan, so 2350 points become 23 yuan, then 2300 cents.
      expect(startingValue.cents()).assertEqual(2300);
      expect(account.levelName()).assertEqual('gold');
      expect(added).assertEqual(2500);
      expect(afterAdd.cents()).assertEqual(2500);
      expect(redeemed).assertTrue();
      expect(afterRedeem.cents()).assertEqual(2000);
      expect(overdraw).assertFalse();
      expect(account.points).assertEqual(2000);
      expect(cart.subtotal().cents()).assertEqual(17800);
      expect(cart.payable(book).cents()).assertEqual(16800);
      expect(order.total().cents()).assertEqual(17800);
      expect(center.spent().cents()).assertEqual(17800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0580
     * @tc.name      user_wallet_coupons_limit_cart_payable_058
     * @tc.desc      Verify the user wallet coupons limit the cart payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('user_wallet_coupons_limit_cart_payable_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: user_wallet_coupons_limit_cart_payable_058');
      let wallet: Coupon[] = [COUPONS[1], COUPONS[2]];
      let account: UserAccount = new UserAccount('wallet-user', 0, 2, wallet);
      let book: CouponBook = new CouponBook(account.coupons);
      let cart: Cart = cartWith([cartLine(5, 29900, 2), cartLine(7, 15900, 1)]);
      let best: Coupon | undefined = book.best(cart.subtotal());
      let order: Order = new Order(7058, cart.allLines(), OrderState.OBLIGATION, 58);
      let center: OrderCenter = new OrderCenter([order]);
      expect(account.couponCount()).assertEqual(2);
      expect(account.levelName()).assertEqual('silver');
      expect(book.size()).assertEqual(2);
      expect(best !== undefined && best.id === 'C20').assertTrue();
      expect(best !== undefined ? best.discountCents : 0).assertEqual(2000);
      expect(cart.subtotal().cents()).assertEqual(75700);
      expect(cart.payable(book).cents()).assertEqual(73700);
      expect(order.total().cents()).assertEqual(75700);
      expect(center.spent().cents()).assertEqual(75700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0590
     * @tc.name      account_level_names_cover_five_tiers_059
     * @tc.desc      Verify the account level names cover five tiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('account_level_names_cover_five_tiers_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: account_level_names_cover_five_tiers_059');
      let bronze: UserAccount = new UserAccount('bronze-user', 999, 1);
      let silver: UserAccount = new UserAccount('silver-user', 100, 2);
      let gold: UserAccount = new UserAccount('gold-user', 0, 3);
      let upperGold: UserAccount = new UserAccount('upper-gold-user', 0, 4);
      let diamond: UserAccount = new UserAccount('diamond-user', 0, 5);
      let cart: Cart = cartWith([cartLine(7, 15900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(7059, cart.allLines(), OrderState.OBLIGATION, 59);
      expect(bronze.levelName()).assertEqual('bronze');
      expect(silver.levelName()).assertEqual('silver');
      expect(gold.levelName()).assertEqual('gold');
      expect(upperGold.levelName()).assertEqual('gold');
      expect(diamond.levelName()).assertEqual('diamond');
      expect(bronze.pointsValue().cents()).assertEqual(900);
      expect(silver.pointsValue().cents()).assertEqual(100);
      expect(gold.pointsValue().cents()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(15900);
      expect(cart.payable(book).cents()).assertEqual(14900);
      expect(order.total().cents()).assertEqual(15900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_PIPELINE_0600
     * @tc.name      zhengzhou_default_address_and_order_spending_060
     * @tc.desc      Verify the Zhengzhou default address and order spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zhengzhou_default_address_and_order_spending_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zhengzhou_default_address_and_order_spending_060');
      let index: CityIndex = defaultCityIndex();
      let zCities: string[] = index.citiesOf('Z');
      let hangzhou: Address = createAddress(0, 'Mia', PHONE_SAMPLES[0], 'Zhejiang', 'Hangzhou',
        'Xihu', '60 West Lake Road');
      let book: AddressBook = new AddressBook();
      let firstId: number = book.add(hangzhou);
      let zhengzhou: Address = createAddress(0, 'Max', PHONE_SAMPLES[1], 'Zhejiang', 'Zhengzhou',
        'Erqi', '30 Port Road');
      let secondId: number = book.add(zhengzhou);
      let moved: boolean = book.setDefault(secondId);
      let defaultAddress: Address | undefined = book.defaultAddress();
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(7);
      expect(goods !== undefined).assertTrue();
      let price: number = goods !== undefined ? goods.price.cents() : 0;
      let cart: Cart = cartWith([cartLine(7, price, 5)]);
      let couponBook: CouponBook = defaultCouponBook();
      let order: Order = new Order(7060, cart.allLines(), OrderState.OBLIGATION, 60);
      let center: OrderCenter = new OrderCenter([order]);
      expect(zCities.length).assertEqual(2);
      expect(index.findLetterOf('Zhengzhou')).assertEqual('Z');
      expect(book.validate(zhengzhou)).assertEqual('');
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(2);
      expect(moved).assertTrue();
      expect(defaultAddress !== undefined && defaultAddress.city === 'Zhengzhou').assertTrue();
      expect(cart.subtotal().cents()).assertEqual(79500);
      expect(cart.payable(couponBook).cents()).assertEqual(77500);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(center.spent().cents()).assertEqual(79500);
    });
  });
}
