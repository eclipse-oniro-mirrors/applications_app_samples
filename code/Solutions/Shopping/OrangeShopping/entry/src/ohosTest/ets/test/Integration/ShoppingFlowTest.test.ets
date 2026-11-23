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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartLine, Catalog, Goods, Money } from '../Shared/ShopModel';
import { CATEGORY_FOOD, CATEGORY_PHONE, PRODUCTS, cartLine, cartWith, createGoods, defaultCatalog, firstHalf } from '../Shared/TestData';
import { yieldToEventLoop } from '../Shared/TestDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function shoppingFlowTest() {
  describe('OrangeShoppingShoppingFlow', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'shopping flow suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0010
     * @tc.name      two_goods_flow_total_matches_the_price_sum_001
     * @tc.desc      Verify two goods flow total matches the price sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_goods_flow_total_matches_the_price_sum_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_goods_flow_total_matches_the_price_sum_001');
      let catalog: Catalog = defaultCatalog();
      let first: Goods | undefined = catalog.byId(0);
      let second: Goods | undefined = catalog.byId(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      let cart: Cart = new Cart();
      if (first !== undefined && second !== undefined) {
        cart.add(first.id, first.price.cents(), 1, first.stock);
        cart.add(second.id, second.price.cents(), 1, second.stock);
        let expected: number = first.price.cents() + second.price.cents();
        expect(cart.subtotal().cents()).assertEqual(expected);
        expect(cart.distinctCount()).assertEqual(2);
        expect(cart.totalQuantity()).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0020
     * @tc.name      duplicate_add_flow_keeps_one_line_and_doubles_the_quantity_002
     * @tc.desc      Verify duplicate add flow keeps one line and doubles the quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('duplicate_add_flow_keeps_one_line_and_doubles_the_quantity_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: duplicate_add_flow_keeps_one_line_and_doubles_the_quantity_002');
      let goods: Goods = PRODUCTS[2];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(goods.id)).assertEqual(2);
      let expected: number = goods.price.cents() * 2;
      expect(cart.subtotal().cents()).assertEqual(expected);
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0030
     * @tc.name      browse_then_add_freezes_the_catalogue_price_003
     * @tc.desc      Verify browse then add freezes the catalogue price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('browse_then_add_freezes_the_catalogue_price_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: browse_then_add_freezes_the_catalogue_price_003');
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(2);

      expect(goods !== null && goods !== undefined).assertTrue();
      let cart: Cart = new Cart();
      if (goods !== undefined) {
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
        let line: CartLine | undefined = cart.lineAt(0);
        expect(line !== null && line !== undefined).assertTrue();
        if (line !== undefined) {
          expect(line.goodsId).assertEqual(2);
          expect(line.unitPriceCents).assertEqual(goods.price.cents());
          expect(line.lineTotal().cents()).assertEqual(goods.price.cents());
        }
        expect(cart.subtotal().cents()).assertEqual(goods.price.cents());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0040
     * @tc.name      browse_two_categories_then_add_uses_each_price_004
     * @tc.desc      Verify browse two categories then add uses each price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('browse_two_categories_then_add_uses_each_price_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: browse_two_categories_then_add_uses_each_price_004');
      let catalog: Catalog = defaultCatalog();
      let phones: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let food: Goods[] = catalog.byCategory(CATEGORY_FOOD);

      expect(phones.length).assertEqual(6);
      expect(food.length).assertEqual(2);
      let phone: Goods = phones[0];
      let tea: Goods = food[0];
      let cart: Cart = new Cart();
      cart.add(phone.id, phone.price.cents(), 2, phone.stock);
      cart.add(tea.id, tea.price.cents(), 3, tea.stock);
      let expected: number = phone.price.cents() * 2 + tea.price.cents() * 3;
      expect(cart.subtotal().cents()).assertEqual(expected);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
      expect(catalog.categories()[0]).assertEqual(CATEGORY_PHONE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0050
     * @tc.name      selected_goods_only_are_counted_in_the_flow_total_005
     * @tc.desc      Verify selected goods only are counted in the flow total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_goods_only_are_counted_in_the_flow_total_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_goods_only_are_counted_in_the_flow_total_005');
      let phone: Goods = PRODUCTS[0];
      let tea: Goods = PRODUCTS[4];
      let cart: Cart = cartWith([
        cartLine(phone.id, phone.price.cents(), 1, true),
        cartLine(tea.id, tea.price.cents(), 2, false)
      ]);
      expect(cart.subtotal().cents()).assertEqual(phone.price.cents());
      // The unchecked tea line still counts in allLinesSubtotal, while subtotal only sums selected rows.
      let allCents: number = phone.price.cents() + tea.price.cents() * 2;
      expect(cart.allLinesSubtotal().cents()).assertEqual(allCents);
      expect(cart.selectedQuantity()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0060
     * @tc.name      deselect_all_then_reselect_restores_the_total_006
     * @tc.desc      Verify deselect all then reselect restores the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deselect_all_then_reselect_restores_the_total_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deselect_all_then_reselect_restores_the_total_006');
      let first: Goods = PRODUCTS[1];
      let second: Goods = PRODUCTS[3];
      let full: number = first.price.cents() + second.price.cents() * 2;
      let cart: Cart = cartWith([
        cartLine(first.id, first.price.cents(), 1, true),
        cartLine(second.id, second.price.cents(), 2, true)
      ]);

      expect(cart.subtotal().cents()).assertEqual(full);
      cart.setAllSelected(false);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.isAllSelected()).assertFalse();
      cart.setAllSelected(true);
      expect(cart.subtotal().cents()).assertEqual(full);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0070
     * @tc.name      quantity_increase_and_decrease_update_the_total_007
     * @tc.desc      Verify quantity increase and decrease update the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_increase_and_decrease_update_the_total_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_increase_and_decrease_update_the_total_007');
      let goods: Goods = PRODUCTS[2];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      let increased: number = cart.increase(goods.id, 4);
      expect(increased).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents() * 5);
      let decreased: number = cart.decrease(goods.id, 2);
      expect(decreased).assertEqual(3);
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents() * 3);
      expect(cart.quantityOf(goods.id)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0080
     * @tc.name      clearing_the_cart_empties_the_shopping_flow_008
     * @tc.desc      Verify clearing the cart empties the shopping flow.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clearing_the_cart_empties_the_shopping_flow_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clearing_the_cart_empties_the_shopping_flow_008');
      let first: Goods = PRODUCTS[0];
      let second: Goods = PRODUCTS[4];
      let cart: Cart = new Cart();
      cart.add(first.id, first.price.cents(), 1, first.stock);
      cart.add(second.id, second.price.cents(), 2, second.stock);
      expect(cart.distinctCount()).assertEqual(2);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0090
     * @tc.name      cart_can_be_refilled_after_clearing_009
     * @tc.desc      Verify cart can be refilled after clearing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_can_be_refilled_after_clearing_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_can_be_refilled_after_clearing_009');
      let goods: Goods = PRODUCTS[5];
      let cart: Cart = cartWith([
        cartLine(0, PRODUCTS[0].price.cents(), 1, true)
      ]);
      cart.clear();
      let added: number = cart.add(goods.id, goods.price.cents(), 2, goods.stock);
      expect(added).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(goods.id)).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents() * 2);
      expect(cart.contains(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0100
     * @tc.name      removing_one_visited_product_keeps_the_other_010
     * @tc.desc      Verify removing one visited product keeps the other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('removing_one_visited_product_keeps_the_other_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: removing_one_visited_product_keeps_the_other_010');
      let phone: Goods = PRODUCTS[0];
      let tea: Goods = PRODUCTS[4];
      let cart: Cart = cartWith([
        cartLine(phone.id, phone.price.cents(), 1, true),
        cartLine(tea.id, tea.price.cents(), 3, true)
      ]);
      let removed: boolean = cart.remove(phone.id);
      expect(removed).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(phone.id)).assertFalse();
      expect(cart.contains(tea.id)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(tea.price.cents() * 3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0110
     * @tc.name      merging_two_visitor_carts_combines_quantities_011
     * @tc.desc      Verify merging two visitor carts combines quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merging_two_visitor_carts_combines_quantities_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merging_two_visitor_carts_combines_quantities_011');
      let phone: Goods = PRODUCTS[0];
      let tea: Goods = PRODUCTS[4];
      let first: Cart = cartWith([
        cartLine(phone.id, phone.price.cents(), 2, true)
      ]);
      let second: Cart = cartWith([
        cartLine(phone.id, phone.price.cents(), 3, true),
        cartLine(tea.id, tea.price.cents(), 1, true)
      ]);
      // merge() keeps the destination's phone line first and appends the tea line it had never seen.
      first.merge(second);

      expect(first.distinctCount()).assertEqual(2);
      expect(first.quantityOf(phone.id)).assertEqual(5);
      expect(first.quantityOf(tea.id)).assertEqual(1);
      let expected: number = phone.price.cents() * 5 + tea.price.cents();
      expect(first.subtotal().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0120
     * @tc.name      merging_adds_a_new_product_line_012
     * @tc.desc      Verify merging adds a new product line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merging_adds_a_new_product_line_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merging_adds_a_new_product_line_012');
      let phone: Goods = PRODUCTS[0];
      let watch: Goods = PRODUCTS[2];
      let visitor: Cart = new Cart();
      visitor.add(phone.id, phone.price.cents(), 1, phone.stock);
      let incoming: Cart = new Cart();
      incoming.add(watch.id, watch.price.cents(), 2, watch.stock);
      visitor.merge(incoming);

      expect(visitor.distinctCount()).assertEqual(2);
      expect(visitor.quantityOf(phone.id)).assertEqual(1);
      expect(visitor.quantityOf(watch.id)).assertEqual(2);
      let expected: number = phone.price.cents() + watch.price.cents() * 2;
      expect(visitor.subtotal().cents()).assertEqual(expected);
      let ids: number[] = [];
      for (let index: number = 0; index < visitor.allLines().length; index++) {
        ids.push(visitor.allLines()[index].goodsId);
      }
      expect((ids).length).assertEqual(([phone.id, watch.id]).length);
      for (let __i4: number = 0; __i4 < ([phone.id, watch.id]).length; __i4++) {
        expect((ids)[__i4]).assertEqual(([phone.id, watch.id])[__i4]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0130
     * @tc.name      add_order_does_not_change_the_total_013
     * @tc.desc      Verify add order does not change the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_order_does_not_change_the_total_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_order_does_not_change_the_total_013');
      let catalog: Catalog = defaultCatalog();
      let ascending: Goods[] = catalog.sortedByPrice(true);
      let ascendingCart: Cart = new Cart();
      for (let index: number = 0; index < ascending.length; index++) {
        let item: Goods = ascending[index];
        ascendingCart.add(item.id, item.price.cents(), 1, item.stock);
      }
      let descending: Goods[] = catalog.sortedByPrice(false);
      let descendingCart: Cart = new Cart();
      for (let index: number = 0; index < descending.length; index++) {
        let item: Goods = descending[index];
        descendingCart.add(item.id, item.price.cents(), 1, item.stock);
      }

      // Ids 6 and 14 have stock 0, so add() refuses them and only fourteen of the sixteen visits land.
      expect(ascendingCart.distinctCount()).assertEqual(14);
      expect(ascendingCart.totalQuantity()).assertEqual(14);
      expect(ascendingCart.subtotal().cents()).assertEqual(descendingCart.subtotal().cents());
      expect(ascendingCart.distinctCount()).assertEqual(descendingCart.distinctCount());
      expect(ascendingCart.totalQuantity()).assertEqual(descendingCart.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0140
     * @tc.name      per_line_math_adds_up_to_the_subtotal_014
     * @tc.desc      Verify per line math adds up to the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('per_line_math_adds_up_to_the_subtotal_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: per_line_math_adds_up_to_the_subtotal_014');
      let ids: number[] = [0, 2, 4];
      let quantities: number[] = [1, 2, 3];
      let cart: Cart = new Cart();
      for (let index: number = 0; index < ids.length; index++) {
        let goods: Goods = PRODUCTS[ids[index]];
        cart.add(goods.id, goods.price.cents(), quantities[index], goods.stock);
      }
      let lineSum: number = 0;
      for (let index: number = 0; index < cart.allLines().length; index++) {
        let line: CartLine = cart.allLines()[index];
        let expectedLine: number = line.unitPriceCents * line.quantity;

        expect(line.lineTotal().cents()).assertEqual(expectedLine);
        lineSum += line.lineTotal().cents();
      }
      expect(cart.subtotal().cents()).assertEqual(lineSum);
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0150
     * @tc.name      filtered_browse_then_add_covers_every_result_015
     * @tc.desc      Verify filtered browse then add covers every result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('filtered_browse_then_add_covers_every_result_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: filtered_browse_then_add_covers_every_result_015');
      let catalog: Catalog = defaultCatalog();
      let phones: Goods[] = catalog.byCategory(CATEGORY_PHONE);
      let cart: Cart = new Cart();
      let expected: number = 0;
      let added: number = 0;
      for (let index: number = 0; index < phones.length; index++) {
        let goods: Goods = phones[index];
        if (goods.isInStock()) {
          cart.add(goods.id, goods.price.cents(), 1, goods.stock);

          expected += goods.price.cents();
          added++;
        }
      }
      // The phone filter yields six rows, but the earbud copies at ids 6 and 14 are sold out: 6 - 2 = 4 adds.
      expect(added).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.subtotal().cents()).assertEqual(expected);
      for (let index: number = 0; index < phones.length; index++) {
        if (phones[index].isInStock()) {
          expect(cart.contains(phones[index].id)).assertTrue();
        } else {
          expect(cart.contains(phones[index].id)).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0160
     * @tc.name      new_product_window_then_add_covers_the_window_016
     * @tc.desc      Verify new product window then add covers the window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('new_product_window_then_add_covers_the_window_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: new_product_window_then_add_covers_the_window_016');
      let catalog: Catalog = defaultCatalog();
      let available: Goods[] = catalog.inStockOnly();
      // firstHalf floors 16 / 2 to eight rows; the fourteen in-stock products cover that window whole.
      let half: Goods[] = firstHalf(catalog);

      expect(half.length).assertEqual(8);
      let window: Goods[] = [];
      for (let index: number = 0; index < available.length && window.length < 8; index++) {
        window.push(available[index]);
      }
      expect(window.length).assertEqual(8);
      let cart: Cart = new Cart();
      for (let index: number = 0; index < window.length; index++) {
        let goods: Goods = window[index];
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      }
      expect(cart.distinctCount()).assertEqual(window.length);
      expect(cart.totalQuantity()).assertEqual(window.length);
      let windowIds: number[] = [];
      for (let index: number = 0; index < window.length; index++) {
        windowIds.push(window[index].id);
      }
      let cartIds: number[] = [];
      for (let index: number = 0; index < cart.allLines().length; index++) {
        cartIds.push(cart.allLines()[index].goodsId);
      }
      expect((cartIds).length).assertEqual((windowIds).length);
      for (let __i5: number = 0; __i5 < (windowIds).length; __i5++) {
        expect((cartIds)[__i5]).assertEqual((windowIds)[__i5]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0170
     * @tc.name      catalogue_lookup_drives_each_added_line_017
     * @tc.desc      Verify catalogue lookup drives each added line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalogue_lookup_drives_each_added_line_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalogue_lookup_drives_each_added_line_017');
      let catalog: Catalog = defaultCatalog();
      let browsed: number[] = [1, 3, 5];
      let cart: Cart = new Cart();
      for (let index: number = 0; index < browsed.length; index++) {
        let goods: Goods | undefined = catalog.byId(browsed[index]);

        expect(goods !== null && goods !== undefined).assertTrue();
        if (goods !== undefined) {
          cart.add(goods.id, goods.price.cents(), 1, goods.stock);
        }
      }
      expect(cart.distinctCount()).assertEqual(3);
      for (let index: number = 0; index < browsed.length; index++) {
        expect(cart.contains(browsed[index])).assertTrue();
        expect(cart.quantityOf(browsed[index])).assertEqual(1);
      }
      expect(cart.indexOf(3)).assertEqual(1);
      expect(cart.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0180
     * @tc.name      line_count_and_quantity_count_diverge_for_repeats_018
     * @tc.desc      Verify line count and quantity count diverge for repeats.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_count_and_quantity_count_diverge_for_repeats_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_count_and_quantity_count_diverge_for_repeats_018');
      let ids: number[] = [0, 4, 5, 7];
      let quantities: number[] = [1, 4, 2, 3];
      let cart: Cart = new Cart();
      for (let index: number = 0; index < ids.length; index++) {
        let goods: Goods = PRODUCTS[ids[index]];
        cart.add(goods.id, goods.price.cents(), quantities[index], goods.stock);
      }

      // Quantities 1 + 4 + 2 + 3 total ten units, yet they sit in only four cart lines.
      expect(cart.distinctCount()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(10);
      expect(cart.selectedQuantity()).assertEqual(10);
      let __seen10: number[] = [];
      for (let __i10: number = 0; __i10 < (ids).length; __i10++) {
        expect(__seen10.indexOf((ids)[__i10]) < 0).assertTrue();
        __seen10.push((ids)[__i10]);
      }
      let cartIds: number[] = [];
      for (let index: number = 0; index < cart.allLines().length; index++) {
        cartIds.push(cart.allLines()[index].goodsId);
      }
      expect((cartIds).length).assertEqual((ids).length);
      for (let __i6: number = 0; __i6 < (ids).length; __i6++) {
        expect((cartIds)[__i6]).assertEqual((ids)[__i6]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0190
     * @tc.name      selected_lines_report_only_the_chosen_products_019
     * @tc.desc      Verify selected lines report only the chosen products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_lines_report_only_the_chosen_products_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_lines_report_only_the_chosen_products_019');
      let cart: Cart = cartWith([
        cartLine(0, PRODUCTS[0].price.cents(), 1, true),
        cartLine(2, PRODUCTS[2].price.cents(), 2, true),
        cartLine(4, PRODUCTS[4].price.cents(), 3, false)
      ]);
      let chosen: CartLine[] = cart.selectedLines();

      expect(chosen.length).assertEqual(2);
      expect(chosen[0].goodsId).assertEqual(0);
      expect(chosen[1].goodsId).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(6);
      let toggled: boolean = cart.toggleSelected(4);
      expect(toggled).assertTrue();
      expect(cart.selectedLines().length).assertEqual(3);
      expect(cart.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0200
     * @tc.name      cart_line_keeps_the_price_frozen_at_add_time_020
     * @tc.desc      Verify cart line keeps the price frozen at add time.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_line_keeps_the_price_frozen_at_add_time_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_line_keeps_the_price_frozen_at_add_time_020');
      let goods: Goods = createGoods(200, 'Frozen Price Item', 12345, CATEGORY_PHONE);
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      // Raising the catalogue price afterwards must not reach the line, which captured 12345 at add time.
      goods.price = new Money(99999);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(12345);
        expect(line.lineTotal().cents()).assertEqual(12345);
      }
      expect(cart.subtotal().cents()).assertEqual(12345);
      expect(goods.price.cents()).assertEqual(99999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0210
     * @tc.name      removing_the_last_product_restores_the_empty_state_021
     * @tc.desc      Verify removing the last product restores the empty state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('removing_the_last_product_restores_the_empty_state_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: removing_the_last_product_restores_the_empty_state_021');
      let goods: Goods = PRODUCTS[7];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      expect(cart.contains(goods.id)).assertTrue();
      expect(cart.isAllSelected()).assertTrue();
      let removed: boolean = cart.remove(goods.id);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.contains(goods.id)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0220
     * @tc.name      readding_a_removed_product_starts_a_fresh_line_022
     * @tc.desc      Verify readding a removed product starts a fresh line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('readding_a_removed_product_starts_a_fresh_line_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: readding_a_removed_product_starts_a_fresh_line_022');
      let goods: Goods = PRODUCTS[3];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 5, goods.stock);
      cart.remove(goods.id);
      let readded: number = cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      expect(readded).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(goods.id)).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0230
     * @tc.name      full_catalogue_visit_fills_one_line_per_product_023
     * @tc.desc      Verify full catalogue visit fills one line per product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('full_catalogue_visit_fills_one_line_per_product_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: full_catalogue_visit_fills_one_line_per_product_023');
      let catalog: Catalog = defaultCatalog();
      let available: Goods[] = catalog.inStockOnly();

      expect(available.length).assertEqual(14);
      let cart: Cart = new Cart();
      for (let index: number = 0; index < available.length; index++) {
        let goods: Goods = available[index];
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      }
      expect(cart.distinctCount()).assertEqual(14);
      expect(cart.totalQuantity()).assertEqual(14);
      let ids: number[] = [];
      for (let index: number = 0; index < cart.allLines().length; index++) {
        ids.push(cart.allLines()[index].goodsId);
      }
      expect(ids.length).assertEqual(14);
      let __seen11: number[] = [];
      for (let __i11: number = 0; __i11 < (ids).length; __i11++) {
        expect(__seen11.indexOf((ids)[__i11]) < 0).assertTrue();
        __seen11.push((ids)[__i11]);
      }
      let availableIds: number[] = [];
      for (let index: number = 0; index < available.length; index++) {
        availableIds.push(available[index].id);
      }
      expect((ids).length).assertEqual((availableIds).length);
      for (let __i7: number = 0; __i7 < (availableIds).length; __i7++) {
        expect((ids)[__i7]).assertEqual((availableIds)[__i7]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0240
     * @tc.name      cold_start_scan_skips_sold_out_products_024
     * @tc.desc      Verify cold start scan skips sold out products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cold_start_scan_skips_sold_out_products_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cold_start_scan_skips_sold_out_products_024');
      let catalog: Catalog = defaultCatalog();
      let chosen: Goods | undefined = undefined;
      for (let index: number = 0; index < catalog.count(); index++) {
        let candidate: Goods = catalog.all()[index];
        if (chosen === undefined && candidate.isInStock()) {
          chosen = candidate;
        }
      }

      expect(chosen !== null && chosen !== undefined).assertTrue();
      let cart: Cart = new Cart();
      if (chosen !== undefined) {
        cart.add(chosen.id, chosen.price.cents(), 1, chosen.stock);
        let line: CartLine | undefined = cart.lineAt(0);
        expect(line !== null && line !== undefined).assertTrue();
        if (line !== undefined) {
          expect(line.goodsId).assertEqual(chosen.id);
          expect(line.quantity).assertEqual(1);
        }
        expect(cart.contains(chosen.id)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0250
     * @tc.name      flow_total_is_recomputable_from_line_snapshots_025
     * @tc.desc      Verify flow total is recomputable from line snapshots.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('flow_total_is_recomputable_from_line_snapshots_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: flow_total_is_recomputable_from_line_snapshots_025');
      let ids: number[] = [0, 2, 4, 6];
      let cart: Cart = new Cart();
      for (let index: number = 0; index < ids.length; index++) {
        let goods: Goods = PRODUCTS[ids[index]];
        cart.add(goods.id, goods.price.cents(), index + 1, goods.stock);
      }
      let recomputed: number = 0;
      for (let index: number = 0; index < cart.allLines().length; index++) {
        let line: CartLine = cart.allLines()[index];
        recomputed += line.unitPriceCents * line.quantity;
      }

      expect(recomputed).assertEqual(cart.subtotal().cents());
      expect(recomputed).assertEqual(cart.allLinesSubtotal().cents());
      let snapshotTotal: Money = Money.zero();
      for (let index: number = 0; index < cart.allLines().length; index++) {
        snapshotTotal = snapshotTotal.add(cart.allLines()[index].lineTotal());
      }
      expect(snapshotTotal.cents()).assertEqual(recomputed);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0260
     * @tc.name      search_result_browse_then_add_keeps_each_match_026
     * @tc.desc      Verify search result browse then add keeps each match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('search_result_browse_then_add_keeps_each_match_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: search_result_browse_then_add_keeps_each_match_026');
      let catalog: Catalog = defaultCatalog();
      let matches: Goods[] = catalog.byCategory(CATEGORY_FOOD);
      expect(matches.length).assertEqual(2);
      let cart: Cart = new Cart();
      for (let index: number = 0; index < matches.length; index++) {
        let goods: Goods = matches[index];
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
        expect(goods.searchText().indexOf(CATEGORY_FOOD) >= 0).assertTrue();
      }
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(PRODUCTS[0].searchText().indexOf(CATEGORY_FOOD) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0270
     * @tc.name      detail_choice_does_not_change_the_cart_price_027
     * @tc.desc      Verify detail choice does not change the cart price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('detail_choice_does_not_change_the_cart_price_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: detail_choice_does_not_change_the_cart_price_027');
      let goods: Goods = PRODUCTS[2];
      let choices: string[] = ['black', 'silver', 'blue'];
      let selectedChoice: string = choices[2];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      expect(selectedChoice).assertEqual('blue');
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents());
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(goods.price.cents());
        expect(line.quantity).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0280
     * @tc.name      selection_and_quantity_changes_stay_consistent_028
     * @tc.desc      Verify selection and quantity changes stay consistent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selection_and_quantity_changes_stay_consistent_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selection_and_quantity_changes_stay_consistent_028');
      let goods: Goods = PRODUCTS[7];
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 2, goods.stock);
      let selected: boolean = cart.setSelected(goods.id, false);
      expect(selected).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
      let newQuantity: number = cart.setQuantity(goods.id, 4, goods.stock);
      expect(newQuantity).assertEqual(4);
      expect(cart.subtotal().cents()).assertEqual(0);
      let reselected: boolean = cart.setSelected(goods.id, true);
      expect(reselected).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(goods.price.cents() * 4);
      expect(cart.selectedQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0290
     * @tc.name      cart_badge_units_match_the_selected_quantity_029
     * @tc.desc      Verify cart badge units match the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_badge_units_match_the_selected_quantity_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_badge_units_match_the_selected_quantity_029');
      let first: Goods = PRODUCTS[0];
      let second: Goods = PRODUCTS[7];
      let cart: Cart = cartWith([
        cartLine(first.id, first.price.cents(), 1, true),
        cartLine(second.id, second.price.cents(), 4, true)
      ]);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.isAllSelected()).assertTrue();
      let expected: number = first.price.cents() + second.price.cents() * 4;
      expect(cart.subtotal().cents()).assertEqual(expected);
      expect(cart.allLinesSubtotal().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0300
     * @tc.name      price_window_browse_then_add_uses_the_window_030
     * @tc.desc      Verify price window browse then add uses the window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_window_browse_then_add_uses_the_window_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_window_browse_then_add_uses_the_window_030');
      let catalog: Catalog = defaultCatalog();
      // Four product pairs fall between 15000 and 60000 cents; losing the two sold-out earbud rows leaves six.
      let windowGoods: Goods[] = catalog.inPriceRange(15000, 60000);

      expect(windowGoods.length).assertEqual(8);
      let cart: Cart = new Cart();
      let expected: number = 0;
      let added: number = 0;
      for (let index: number = 0; index < windowGoods.length; index++) {
        let goods: Goods = windowGoods[index];
        if (goods.isInStock()) {
          cart.add(goods.id, goods.price.cents(), 1, goods.stock);
          expected += goods.price.cents();
          added++;
        }
      }
      expect(added).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(expected);
      for (let index: number = 0; index < windowGoods.length; index++) {
        if (windowGoods[index].isInStock()) {
          expect(cart.contains(windowGoods[index].id)).assertTrue();
        } else {
          expect(cart.contains(windowGoods[index].id)).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0310
     * @tc.name      top_rated_browse_then_add_keeps_the_filtered_set_031
     * @tc.desc      Verify top rated browse then add keeps the filtered set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('top_rated_browse_then_add_keeps_the_filtered_set_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: top_rated_browse_then_add_keeps_the_filtered_set_031');
      let catalog: Catalog = defaultCatalog();
      let best: Goods[] = catalog.topRated(5);

      expect(best.length).assertEqual(8);
      let cart: Cart = new Cart();
      let added: number = 0;
      for (let index: number = 0; index < best.length; index++) {
        let goods: Goods = best[index];
        expect(goods.rating).assertEqual(5);
        if (goods.isInStock()) {
          cart.add(goods.id, goods.price.cents(), 1, goods.stock);
          added++;
        }
      }
      // The eight five-star rows include the two sold-out earbuds, so only six can be added.
      expect(added).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(added);
      expect(cart.totalQuantity()).assertEqual(added);
      expect(cart.subtotal().isPositive()).assertTrue();
      let ids: number[] = [];
      for (let index: number = 0; index < best.length; index++) {
        ids.push(best[index].id);
      }
      let __seen12: number[] = [];
      for (let __i12: number = 0; __i12 < (ids).length; __i12++) {
        expect(__seen12.indexOf((ids)[__i12]) < 0).assertTrue();
        __seen12.push((ids)[__i12]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0320
     * @tc.name      catalogue_page_window_feeds_the_cart_032
     * @tc.desc      Verify catalogue page window feeds the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalogue_page_window_feeds_the_cart_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalogue_page_window_feeds_the_cart_032');
      let catalog: Catalog = defaultCatalog();
      let windowGoods: Goods[] = catalog.page(0, 5);

      expect(windowGoods.length).assertEqual(5);
      let cart: Cart = new Cart();
      for (let index: number = 0; index < windowGoods.length; index++) {
        let goods: Goods = windowGoods[index];
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      }
      expect(cart.distinctCount()).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(5);
      // Page 0 starts at offset 0, so this window holds exactly the ids inserted as 0 through 4.
      let expectedIds: number[] = [0, 1, 2, 3, 4];
      let cartIds: number[] = [];
      for (let index: number = 0; index < cart.allLines().length; index++) {
        cartIds.push(cart.allLines()[index].goodsId);
      }
      expect((cartIds).length).assertEqual((expectedIds).length);
      for (let __i8: number = 0; __i8 < (expectedIds).length; __i8++) {
        expect((cartIds)[__i8]).assertEqual((expectedIds)[__i8]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0330
     * @tc.name      cart_line_order_matches_the_add_order_033
     * @tc.desc      Verify cart line order matches the add order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_line_order_matches_the_add_order_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_line_order_matches_the_add_order_033');
      let visited: number[] = [4, 0, 7, 2];
      let cart: Cart = new Cart();
      for (let index: number = 0; index < visited.length; index++) {
        let goods: Goods = PRODUCTS[visited[index]];
        cart.add(goods.id, goods.price.cents(), 1, goods.stock);
      }
      let cartIds: number[] = [];
      for (let index: number = 0; index < cart.allLines().length; index++) {
        cartIds.push(cart.allLines()[index].goodsId);
      }

      expect((cartIds).length).assertEqual((visited).length);
      for (let __i9: number = 0; __i9 < (visited).length; __i9++) {
        expect((cartIds)[__i9]).assertEqual((visited)[__i9]);
      }
      expect(cart.distinctCount()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.indexOf(4)).assertEqual(0);
      expect(cart.indexOf(0)).assertEqual(1);
      expect(cart.indexOf(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SHOPPING_FLOW_0340
     * @tc.name      removing_an_unselected_line_keeps_the_subtotal_034
     * @tc.desc      Verify removing an unselected line keeps the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('removing_an_unselected_line_keeps_the_subtotal_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: removing_an_unselected_line_keeps_the_subtotal_034');
      let phone: Goods = PRODUCTS[0];
      let tea: Goods = PRODUCTS[4];
      let cart: Cart = cartWith([
        cartLine(phone.id, phone.price.cents(), 1, true),
        cartLine(tea.id, tea.price.cents(), 2, false)
      ]);
      let payableBefore: number = cart.subtotal().cents();
      let allBefore: number = cart.allLinesSubtotal().cents();
      let removed: boolean = cart.remove(tea.id);

      expect(removed).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(payableBefore);
      expect(cart.allLinesSubtotal().cents()).assertEqual(payableBefore);
      expect(allBefore > payableBefore).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.selectedQuantity()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
    });
  });
}
