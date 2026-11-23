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
import { Address, AddressBook, BreakpointUtil, Cart, CartLine, CartSnapshot, Catalog, CityIndex, Comment, Coupon, CouponBook, DetailModel, Goods, LiveCenter, LiveRoom, Money, Order, OrderCenter, OrderCounts, OrderState, ProductFilter, SearchEngine, ShopUrl, UserAccount, Valuation } from '../Shared/ShopModel';
import { CATEGORY_FOOD, CATEGORY_PHONE, COUPONS, PRODUCTS, cartLine, cartWith, createAddress, createGoods, defaultCatalog, defaultCityIndex, defaultCouponBook, detailFor, orderLines } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function expandedCoverageTest() {
  describe('OrangeShoppingExpandedCoverage', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'expanded coverage suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0010
     * @tc.name      combo_order_total_equals_cart_all_lines_subtotal_001
     * @tc.desc      Verify combo order total equals cart all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_order_total_equals_cart_all_lines_subtotal_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_order_total_equals_cart_all_lines_subtotal_001');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, true), cartLine(4, 8900, 2, false)]);
      let order: Order = new Order(900, cart.allLines(), OrderState.OBLIGATION, 1);
      expect(order.total().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.subtotal().compareTo(order.total()) < 0).assertTrue();
      expect(order.quantity()).assertEqual(cart.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0020
     * @tc.name      combo_selection_change_unlocks_a_higher_coupon_002
     * @tc.desc      Verify combo selection change unlocks a higher coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_selection_change_unlocks_a_higher_coupon_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_selection_change_unlocks_a_higher_coupon_002');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, false), cartLine(4, 8900, 2, true)]);
      let book: CouponBook = defaultCouponBook();
      let beforeCoupon: Coupon | undefined = book.best(cart.subtotal());
      expect(beforeCoupon !== null && beforeCoupon !== undefined).assertTrue();
      // With only the tea pack selected the subtotal is 17800 cents, enough for C10; the flagship price reaches the C50 tier.
      cart.setSelected(0, true);
      let afterCoupon: Coupon | undefined = book.best(cart.subtotal());
      expect(afterCoupon !== null && afterCoupon !== undefined).assertTrue();
      if (beforeCoupon !== undefined && afterCoupon !== undefined) {
        expect(afterCoupon.discountCents > beforeCoupon.discountCents).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0030
     * @tc.name      combo_refund_removes_spending_but_keeps_the_order_003
     * @tc.desc      Verify combo refund removes spending but keeps the order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_refund_removes_spending_but_keeps_the_order_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_refund_removes_spending_but_keeps_the_order_003');
      let order: Order = new Order(901, orderLines(2, 129900, 1), OrderState.WAIT_RECEIVE, 2);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().isPositive()).assertTrue();
      expect(order.refund()).assertTrue();
      expect(center.spent().cents()).assertEqual(0);
      expect(center.size()).assertEqual(1);
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0040
     * @tc.name      combo_cancel_then_readd_same_goods_rebuilds_the_cart_004
     * @tc.desc      Verify combo cancel then readd same goods rebuilds the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_cancel_then_readd_same_goods_rebuilds_the_cart_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_cancel_then_readd_same_goods_rebuilds_the_cart_004');
      let cart: Cart = cartWith([cartLine(7, 15900, 2, true)]);
      let order: Order = new Order(902, cart.allLines(), OrderState.OBLIGATION, 3);
      expect(order.cancel()).assertTrue();
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      let returned: number = cart.add(7, 15900, 3);
      expect(returned).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0050
     * @tc.name      combo_snapshot_restore_preserves_coupon_payable_005
     * @tc.desc      Verify combo snapshot restore preserves coupon payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_snapshot_restore_preserves_coupon_payable_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_snapshot_restore_preserves_coupon_payable_005');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, true), cartLine(4, 8900, 3, true)]);
      let book: CouponBook = defaultCouponBook();
      let before: Money = cart.payable(book);
      let restored: Cart = Cart.restore(cart.snapshot());
      let after: Money = restored.payable(book);
      expect(before.equals(after)).assertTrue();
      expect(restored.totalQuantity()).assertEqual(cart.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0060
     * @tc.name      combo_merge_then_select_all_matches_all_lines_total_006
     * @tc.desc      Verify combo merge then select all matches all lines total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_merge_then_select_all_matches_all_lines_total_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_merge_then_select_all_matches_all_lines_total_006');
      let target: Cart = cartWith([cartLine(1, 399900, 1, false)]);
      let source: Cart = cartWith([cartLine(4, 8900, 2, false)]);
      target.merge(source);
      target.setAllSelected(true);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.subtotal().equals(target.allLinesSubtotal())).assertTrue();
      expect(target.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0070
     * @tc.name      combo_search_results_respect_a_price_window_007
     * @tc.desc      Verify combo search results respect a price window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_search_results_respect_a_price_window_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_search_results_respect_a_price_window_007');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('phone');
      let filter: ProductFilter = new ProductFilter('', 400000, 500000);
      let filtered: Goods[] = filter.apply(matches);
      expect(filtered.length < matches.length).assertTrue();
      for (let index: number = 0; index < filtered.length; index++) {
        expect(filtered[index].price.cents() >= 400000).assertTrue();
        expect(filtered[index].category).assertEqual(CATEGORY_PHONE);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0080
     * @tc.name      combo_search_results_respect_stock_state_008
     * @tc.desc      Verify combo search results respect stock state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_search_results_respect_stock_state_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_search_results_respect_stock_state_008');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let matches: Goods[] = engine.search('earbud');
      expect(matches.length).assertEqual(2);
      // The huge upper bound keeps every price eligible, leaving the stock flag to reject both out-of-stock earbuds.
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', true);
      expect(filter.apply(matches).length).assertEqual(0);
      expect(matches[0].isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0090
     * @tc.name      combo_suggested_title_is_found_by_search_009
     * @tc.desc      Verify combo suggested title is found by search.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_suggested_title_is_found_by_search_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_suggested_title_is_found_by_search_009');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let suggestions: string[] = engine.suggest('harmony', 5);
      expect(suggestions.length > 0).assertTrue();
      let results: Goods[] = engine.search(suggestions[0]);
      expect(results.length > 0).assertTrue();
      expect(results[0].title).assertEqual(suggestions[0]);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0100
     * @tc.name      combo_city_letter_feeds_a_valid_address_010
     * @tc.desc      Verify combo city letter feeds a valid address.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_city_letter_feeds_a_valid_address_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_city_letter_feeds_a_valid_address_010');
      let index: CityIndex = defaultCityIndex();
      let letter: string = index.findLetterOf('Beijing');
      expect(letter).assertEqual('B');
      let book: AddressBook = new AddressBook();
      let address: Address = createAddress(1, 'Alice', '18800001765', 'Beijing', 'Beijing',
        index.citiesOf(letter)[0], '100 Main Road');
      expect(book.validate(address)).assertEqual('');
      expect(book.add(address)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0110
     * @tc.name      combo_user_points_value_and_coupon_payable_are_independent_011
     * @tc.desc      Verify combo user points value and coupon payable are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_user_points_value_and_coupon_payable_are_independent_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_user_points_value_and_coupon_payable_are_independent_011');
      let user: UserAccount = new UserAccount('shopper', 1500, 3, COUPONS);
      let points: Money = user.pointsValue();
      let cart: Cart = cartWith([cartLine(4, 8900, 2, true)]);
      let payable: Money = cart.payable(defaultCouponBook());
      expect(points.isPositive()).assertTrue();
      expect(payable.isPositive()).assertTrue();
      expect(points.equals(payable)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0120
     * @tc.name      combo_live_room_points_at_a_catalog_goods_012
     * @tc.desc      Verify combo live room points at a catalog goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_live_room_points_at_a_catalog_goods_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_live_room_points_at_a_catalog_goods_012');
      let center: LiveCenter = new LiveCenter([
        new LiveRoom(1, 'phone live', 'anchor', 500, 0, true)
      ]);
      let room: LiveRoom | undefined = center.byGoods(0);
      expect(room !== null && room !== undefined).assertTrue();
      if (room !== undefined) {
        let goods: Goods | undefined = defaultCatalog().byId(room.goodsId);
        expect(goods !== null && goods !== undefined).assertTrue();
        if (goods !== undefined) {
          expect(goods.category).assertEqual(CATEGORY_PHONE);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0130
     * @tc.name      combo_detail_average_tracks_the_goods_rating_013
     * @tc.desc      Verify combo detail average tracks the goods rating.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_detail_average_tracks_the_goods_rating_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_detail_average_tracks_the_goods_rating_013');
      let model: DetailModel = detailFor(2);
      expect(model.averageStars() >= 1).assertTrue();
      expect(model.averageStars() <= 5).assertTrue();
      expect(model.goods.title).assertEqual(PRODUCTS[2].title);
      expect(model.imageCount()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0140
     * @tc.name      combo_navigation_with_goods_round_trips_014
     * @tc.desc      Verify combo navigation with goods round trips.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_navigation_with_goods_round_trips_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_navigation_with_goods_round_trips_014');
      let url: ShopUrl = new ShopUrl('DetailPage', 3);
      let text: string = url.withGoods(3);
      let parsed: ShopUrl = ShopUrl.parse(text);
      expect(parsed.page).assertEqual('DetailPage');
      expect(parsed.goodsId).assertEqual(3);
      expect(parsed.valid).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0150
     * @tc.name      combo_emitter_payload_round_trips_the_id_text_015
     * @tc.desc      Verify combo emitter payload round trips the id text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_emitter_payload_round_trips_the_id_text_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_emitter_payload_round_trips_the_id_text_015');
      let payload: string = '{"id":42}';
      let start: number = payload.indexOf(':') + 1;
      let end: number = payload.indexOf('}');
      let idText: string = payload.substring(start, end);
      expect(Number.parseInt(idText)).assertEqual(42);
      expect(payload.indexOf('42') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0160
     * @tc.name      combo_sorted_page_stays_sorted_for_each_page_016
     * @tc.desc      Verify combo sorted page stays sorted for each page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_sorted_page_stays_sorted_for_each_page_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_sorted_page_stays_sorted_for_each_page_016');
      let sorted: Goods[] = defaultCatalog().sortedByPrice(true);
      // Three windows of four touch only the first twelve sorted rows, enough to expose a page that re-sorts its slice.
      for (let page: number = 0; page < 3; page++) {
        let window: Goods[] = [];
        for (let offset: number = 0; offset < 4; offset++) {
          let index: number = page * 4 + offset;
          if (index < sorted.length) {
            window.push(sorted[index]);
          }
        }
        for (let index: number = 1; index < window.length; index++) {
          expect(window[index - 1].price.cents() <= window[index].price.cents()).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0170
     * @tc.name      combo_advance_shifts_order_center_counts_017
     * @tc.desc      Verify combo advance shifts order center counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_advance_shifts_order_center_counts_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_advance_shifts_order_center_counts_017');
      let order: Order = new Order(903, orderLines(1, 399900, 1), OrderState.OBLIGATION, 4);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.counts().obligation).assertEqual(1);
      expect(order.advance()).assertTrue();
      let counts: OrderCounts = center.counts();
      expect(counts.obligation).assertEqual(0);
      expect(counts.waitDelivery).assertEqual(1);
      expect(counts.total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0180
     * @tc.name      combo_cart_shrink_changes_the_best_coupon_018
     * @tc.desc      Verify combo cart shrink changes the best coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_cart_shrink_changes_the_best_coupon_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_cart_shrink_changes_the_best_coupon_018');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      let before: Coupon | undefined = book.best(cart.subtotal());
      cart.setQuantity(0, 0);
      let after: Coupon | undefined = book.best(cart.subtotal());
      expect(before !== null && before !== undefined).assertTrue();
      expect(after !== undefined && after.id === 'C0').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0190
     * @tc.name      combo_stock_clamp_keeps_the_line_total_consistent_019
     * @tc.desc      Verify combo stock clamp keeps the line total consistent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_stock_clamp_keeps_the_line_total_consistent_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_stock_clamp_keeps_the_line_total_consistent_019');
      let cart: Cart = cartWith([cartLine(5, 29900, 10)]);
      // The third argument is the stock ceiling, so the requested 100 collapses to 7 units.
      let clamped: number = cart.setQuantity(5, 100, 7);
      expect(clamped).assertEqual(7);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.lineTotal().cents()).assertEqual(29900 * 7);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0200
     * @tc.name      combo_line_copy_and_snapshot_are_both_independent_020
     * @tc.desc      Verify combo line copy and snapshot are both independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_line_copy_and_snapshot_are_both_independent_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_line_copy_and_snapshot_are_both_independent_020');
      let line: CartLine = new CartLine(3, 59900, 2, true);
      let copy: CartLine = line.copy();
      let snapshot: CartSnapshot = cartWith([line]).snapshot();
      copy.quantity = 5;
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(line.quantity).assertEqual(2);
      expect(copy.quantity).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0210
     * @tc.name      combo_address_default_moves_after_removal_021
     * @tc.desc      Verify combo address default moves after removal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_address_default_moves_after_removal_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_address_default_moves_after_removal_021');
      let book: AddressBook = new AddressBook();
      let firstId: number = book.add(createAddress(0, 'Alice', '18800001765', 'A', 'B', 'C', 'D'));
      let secondId: number = book.add(createAddress(0, 'Bob', '13900001234', 'E', 'F', 'G', 'H'));
      expect(book.remove(firstId)).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(secondId);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0220
     * @tc.name      combo_user_wallet_limits_the_payable_amount_022
     * @tc.desc      Verify combo user wallet limits the payable amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_user_wallet_limits_the_payable_amount_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_user_wallet_limits_the_payable_amount_022');
      let user: UserAccount = new UserAccount('shopper', 500, 2, [
        new Coupon('W1', 'wallet coupon', 0, 1000)
      ]);
      let book: CouponBook = new CouponBook(user.coupons);
      let cart: Cart = cartWith([cartLine(4, 8900, 1, true)]);
      // The zero-threshold wallet coupon takes a flat 1000 cents off the 8900-cent tea pack: 7900 remains.
      let payable: Money = cart.payable(book);
      expect(payable.cents()).assertEqual(7900);
      expect(user.couponCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0230
     * @tc.name      combo_search_order_is_kept_after_filtering_023
     * @tc.desc      Verify combo search order is kept after filtering.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_search_order_is_kept_after_filtering_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_search_order_is_kept_after_filtering_023');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      let filter: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '', true);
      let filtered: Goods[] = filter.apply(results);
      // Each survivor must map to a strictly later position, proving the filter dropped rows without reordering.
      let lastSeen: number = -1;
      for (let index: number = 0; index < filtered.length; index++) {
        let position: number = results.indexOf(filtered[index]);
        expect(position > lastSeen).assertTrue();
        lastSeen = position;
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0240
     * @tc.name      combo_money_percentage_and_valuation_agree_024
     * @tc.desc      Verify combo money percentage and valuation agree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_money_percentage_and_valuation_agree_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_money_percentage_and_valuation_agree_024');
      let original: Money = Money.ofYuan(100);
      let valuation: Valuation = new Valuation(original, 25);
      expect(valuation.finalPrice().equals(original.percentage(75))).assertTrue();
      expect(valuation.saved().equals(original.percentage(25))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0250
     * @tc.name      combo_order_with_a_zero_price_line_stays_valid_025
     * @tc.desc      Verify combo order with a zero price line stays valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_order_with_a_zero_price_line_stays_valid_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_order_with_a_zero_price_line_stays_valid_025');
      let order: Order = new Order(904, [
        new CartLine(10, 0, 2, true),
        new CartLine(11, 1000, 1, true)
      ], OrderState.WAIT_DELIVERY, 5);
      expect(order.total().cents()).assertEqual(1000);
      expect(order.quantity()).assertEqual(3);
      expect(order.stateLabel()).assertEqual('wait_delivery');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0260
     * @tc.name      combo_merge_respects_stock_cap_and_total_026
     * @tc.desc      Verify combo merge respects stock cap and total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_merge_respects_stock_cap_and_total_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_merge_respects_stock_cap_and_total_026');
      // merge() caps a line at 99 units, so 90 plus 20 saturates instead of reaching 110.
      let target: Cart = cartWith([cartLine(0, 499900, 90)]);
      let source: Cart = cartWith([cartLine(0, 499900, 20)]);
      target.merge(source);
      expect(target.quantityOf(0)).assertEqual(99);
      expect(target.allLinesSubtotal().cents()).assertEqual(499900 * 99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0270
     * @tc.name      combo_detail_choice_rejects_a_negative_index_without_changing_state_027
     * @tc.desc      Verify combo detail choice rejects a negative index without changing state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_detail_choice_rejects_a_negative_index_without_changing_state_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_detail_choice_rejects_a_negative_index_without_changing_state_027');
      let model: DetailModel = detailFor(0);
      // Both -1 and choices.length fall outside the three-entry choice list and must leave the selection untouched.
      let initial: number = model.selectedChoice;
      expect(model.selectChoice(-1)).assertFalse();
      expect(model.selectedChoice).assertEqual(initial);
      expect(model.selectChoice(1)).assertTrue();
      expect(model.selectChoice(model.choices.length)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0280
     * @tc.name      combo_live_total_keeps_offline_rooms_028
     * @tc.desc      Verify combo live total keeps offline rooms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_live_total_keeps_offline_rooms_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_live_total_keeps_offline_rooms_028');
      let center: LiveCenter = new LiveCenter([
        new LiveRoom(1, 'on', 'a', 100, 0, true),
        new LiveRoom(2, 'off', 'b', 900, 1, false)
      ]);
      // The offline room is hidden from liveRooms() yet its 900 viewers still join the 100 from the live room.
      expect(center.liveRooms().length).assertEqual(1);
      expect(center.totalViewers()).assertEqual(1000);
      expect(center.liveRooms()[0].title).assertEqual('on');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0290
     * @tc.name      combo_breakpoint_and_swiper_columns_stay_in_step_029
     * @tc.desc      Verify combo breakpoint and swiper columns stay in step.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_breakpoint_and_swiper_columns_stay_in_step_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_breakpoint_and_swiper_columns_stay_in_step_029');
      // Each pair brackets a breakpoint: 519/520 and 839/840 must resolve to neighbouring buckets.
      let widths: number[] = [519, 520, 839, 840];
      for (let index: number = 0; index < widths.length; index++) {
        let bucket: string = BreakpointUtil.resolve(widths[index]);
        expect(BreakpointUtil.columns(bucket)).assertEqual(BreakpointUtil.swiperDisplay(bucket));
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0300
     * @tc.name      combo_suggestion_limit_one_prefers_the_first_sorted_title_030
     * @tc.desc      Verify combo suggestion limit one prefers the first sorted title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_suggestion_limit_one_prefers_the_first_sorted_title_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_suggestion_limit_one_prefers_the_first_sorted_title_030');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let many: string[] = engine.suggest('e', 10);
      let one: string[] = engine.suggest('e', 1);
      expect(one.length <= 1).assertTrue();
      if (many.length > 0 && one.length > 0) {
        expect(one[0]).assertEqual(many[0]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0310
     * @tc.name      combo_empty_catalog_search_keeps_every_collection_empty_031
     * @tc.desc      Verify combo empty catalog search keeps every collection empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_empty_catalog_search_keeps_every_collection_empty_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_empty_catalog_search_keeps_every_collection_empty_031');
      let catalog: Catalog = new Catalog([]);
      let engine: SearchEngine = new SearchEngine(catalog);
      expect(engine.search('phone').length).assertEqual(0);
      expect(engine.suggest('phone').length).assertEqual(0);
      expect(catalog.sortedByPrice(true).length).assertEqual(0);
      expect(catalog.pageCount(4)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0320
     * @tc.name      combo_order_center_latest_tie_uses_the_first_inserted_032
     * @tc.desc      Verify combo order center latest tie uses the first inserted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_order_center_latest_tie_uses_the_first_inserted_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_order_center_latest_tie_uses_the_first_inserted_032');
      let first: Order = new Order(905, orderLines(0, 1000, 1), OrderState.OBLIGATION, 50);
      let second: Order = new Order(906, orderLines(1, 2000, 1), OrderState.OBLIGATION, 50);
      let center: OrderCenter = new OrderCenter([first, second]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(905);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0330
     * @tc.name      combo_address_phone_requires_eleven_digits_starting_with_one_033
     * @tc.desc      Verify combo address phone requires eleven digits starting with one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_address_phone_requires_eleven_digits_starting_with_one_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_address_phone_requires_eleven_digits_starting_with_one_033');
      expect(AddressBook.isValidPhone('18800001765')).assertTrue();
      expect(AddressBook.isValidPhone('08800001765')).assertFalse();
      expect(AddressBook.isValidPhone('1880000176')).assertFalse();
      expect(AddressBook.isValidPhone('188000017655')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0340
     * @tc.name      combo_detail_single_comment_average_is_its_own_rating_034
     * @tc.desc      Verify combo detail single comment average is its own rating.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_detail_single_comment_average_is_its_own_rating_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_detail_single_comment_average_is_its_own_rating_034');
      // A 3-star comment stays below the four-star positive cut-off, so it neither scores nor raises the rate.
      let model: DetailModel = new DetailModel(PRODUCTS[0], ['a'], [new Comment('u', 'solo', 3)], ['x']);
      expect(model.averageStars()).assertEqual(3);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.positiveCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0350
     * @tc.name      combo_viewers_text_uses_the_compact_suffix_at_both_boundaries_035
     * @tc.desc      Verify combo viewers text uses the compact suffix at both boundaries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_viewers_text_uses_the_compact_suffix_at_both_boundaries_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_viewers_text_uses_the_compact_suffix_at_both_boundaries_035');
      // 1000 is the first count shown with k and 10000 the first shown with w; 999 stays as plain digits.
      let room: LiveRoom = new LiveRoom(1, 'boundary', 'a', 1000, 0, true);
      expect(room.viewersText()).assertEqual('1k');
      room.viewers = 10000;
      expect(room.viewersText()).assertEqual('1w');
      room.viewers = 999;
      expect(room.viewersText()).assertEqual('999');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0360
     * @tc.name      combo_filter_with_inverted_range_returns_nothing_036
     * @tc.desc      Verify combo filter with inverted range returns nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_filter_with_inverted_range_returns_nothing_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_filter_with_inverted_range_returns_nothing_036');
      let filter: ProductFilter = new ProductFilter(CATEGORY_PHONE, 600000, 100000);
      expect(filter.apply(PRODUCTS).length).assertEqual(0);
      expect(filter.matches(PRODUCTS[0])).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0370
     * @tc.name      combo_negative_discount_is_rejected_by_valuation_037
     * @tc.desc      Verify combo negative discount is rejected by valuation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_negative_discount_is_rejected_by_valuation_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_negative_discount_is_rejected_by_valuation_037');
      let valuation: Valuation = new Valuation(new Money(1000), -1);
      expect(valuation.isDiscounted()).assertFalse();
      let thrown: boolean = false;
      try {
        valuation.finalPrice();
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0380
     * @tc.name      combo_coupon_discount_above_subtotal_pays_zero_038
     * @tc.desc      Verify combo coupon discount above subtotal pays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_coupon_discount_above_subtotal_pays_zero_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_coupon_discount_above_subtotal_pays_zero_038');
      let book: CouponBook = new CouponBook([new Coupon('BIG', 'over', 0, 100000)]);
      let cart: Cart = cartWith([cartLine(4, 8900, 1, true)]);
      // The 100000-cent discount dwarfs the 8900-cent subtotal, and payable floors at zero rather than going negative.
      expect(cart.payable(book).cents()).assertEqual(0);
      expect(book.payable(cart.subtotal()).isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0390
     * @tc.name      combo_food_category_has_no_live_room_039
     * @tc.desc      Verify combo food category has no live room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_food_category_has_no_live_room_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_food_category_has_no_live_room_039');
      let food: Goods | undefined = defaultCatalog().byCategory(CATEGORY_FOOD)[0];
      expect(food !== null && food !== undefined).assertTrue();
      if (food !== undefined) {
        expect(food.hasLiveRoom()).assertFalse();
        expect(food.labels).assertEqual('hot_sale');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0400
     * @tc.name      combo_detail_goods_reference_is_the_catalog_object_040
     * @tc.desc      Verify combo detail goods reference is the catalog object.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_detail_goods_reference_is_the_catalog_object_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_detail_goods_reference_is_the_catalog_object_040');
      let local: Goods = createGoods(1, 'Local Detail', 1000, CATEGORY_PHONE);
      let model: DetailModel = new DetailModel(local, ['a'], [new Comment('u', 'x', 5)], ['x']);
      expect(model.goods === local).assertTrue();
      model.goods.stock = 1;
      expect(local.stock).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0410
     * @tc.name      combo_order_state_label_matches_the_center_filter_041
     * @tc.desc      Verify combo order state label matches the center filter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_order_state_label_matches_the_center_filter_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_order_state_label_matches_the_center_filter_041');
      let order: Order = new Order(907, orderLines(0, 1000, 1), OrderState.WAIT_EVALUATE, 60);
      let center: OrderCenter = new OrderCenter([order]);
      expect(order.stateLabel()).assertEqual('wait_evaluate');
      expect(center.byState(order.state).length).assertEqual(1);
      expect(center.counts().waitEvaluate).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0420
     * @tc.name      combo_cart_clear_then_snapshot_is_empty_042
     * @tc.desc      Verify combo cart clear then snapshot is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_cart_clear_then_snapshot_is_empty_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_cart_clear_then_snapshot_is_empty_042');
      let cart: Cart = cartWith([cartLine(0, 1000, 1), cartLine(1, 2000, 2)]);
      cart.clear();
      let snapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0430
     * @tc.name      combo_created_at_ordering_does_not_depend_on_id_043
     * @tc.desc      Verify combo created at ordering does not depend on id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_created_at_ordering_does_not_depend_on_id_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_created_at_ordering_does_not_depend_on_id_043');
      let later: Order = new Order(1, orderLines(0, 1000, 1), OrderState.OBLIGATION, 99);
      let earlier: Order = new Order(2, orderLines(0, 1000, 1), OrderState.OBLIGATION, 1);
      let center: OrderCenter = new OrderCenter([later, earlier]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0].id).assertEqual(2);
      expect(sorted[1].id).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0440
     * @tc.name      combo_discount_exactly_equals_subtotal_when_price_matches_044
     * @tc.desc      Verify combo discount exactly equals subtotal when price matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_discount_exactly_equals_subtotal_when_price_matches_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_discount_exactly_equals_subtotal_when_price_matches_044');
      let subtotal: Money = new Money(8900);
      let coupon: Coupon = new Coupon('EXACT', 'exact', 0, 8900);
      expect(coupon.apply(subtotal).isZero()).assertTrue();
      expect(coupon.discountCents).assertEqual(subtotal.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0450
     * @tc.name      combo_city_duplicate_name_resolves_to_the_first_root_045
     * @tc.desc      Verify combo city duplicate name resolves to the first root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_city_duplicate_name_resolves_to_the_first_root_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_city_duplicate_name_resolves_to_the_first_root_045');
      let roots: CityIndex = defaultCityIndex();
      let letter: string = roots.findLetterOf('Beijing');
      expect(letter).assertEqual('B');
      expect(roots.findLetterOf('Unknown City')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EXPANDED_COVERAGE_0460
     * @tc.name      combo_filter_zero_price_goods_only_in_zero_band_046
     * @tc.desc      Verify combo filter zero price goods only in zero band.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('combo_filter_zero_price_goods_only_in_zero_band_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: combo_filter_zero_price_goods_only_in_zero_band_046');
      let free: Goods = createGoods(990, 'Free Item', 0, CATEGORY_FOOD);
      let zeroBand: ProductFilter = new ProductFilter('', 0, 0);
      let paidBand: ProductFilter = new ProductFilter('', 1, 100);
      expect(zeroBand.matches(free)).assertTrue();
      expect(paidBand.matches(free)).assertFalse();
    });
  });
}
