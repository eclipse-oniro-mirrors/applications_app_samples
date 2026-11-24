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
import { Cart, CartLine } from '../Shared/ShopModel';
import { cartLine, cartWith } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function cartAddTest() {
  describe('OrangeShoppingCartAdd', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart add suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0010
     * @tc.name      add_to_empty_cart_creates_one_line_001
     * @tc.desc      Verify add to empty cart creates one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_empty_cart_creates_one_line_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_empty_cart_creates_one_line_001');
      let cart: Cart = new Cart();
      let returned: number = cart.add(7, 15900, 2);
      expect(returned).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.goodsId).assertEqual(7);
        expect(line.quantity).assertEqual(2);
        expect(line.unitPriceCents).assertEqual(15900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0020
     * @tc.name      add_to_empty_cart_marks_the_line_selected_002
     * @tc.desc      Verify add to empty cart marks the line selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_empty_cart_marks_the_line_selected_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_empty_cart_marks_the_line_selected_002');
      let cart: Cart = new Cart();
      cart.add(2, 129900, 4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
      }
      expect(cart.quantityOf(2) === 4).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0030
     * @tc.name      add_to_empty_cart_makes_the_cart_non_empty_003
     * @tc.desc      Verify add to empty cart makes the cart non empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_empty_cart_makes_the_cart_non_empty_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_empty_cart_makes_the_cart_non_empty_003');
      let cart: Cart = new Cart();
      expect(cart.isEmpty()).assertTrue();
      cart.add(3, 59900);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.contains(3)).assertTrue();
      expect(cart.indexOf(3)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0040
     * @tc.name      add_without_quantity_defaults_to_one_004
     * @tc.desc      Verify add without quantity defaults to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_without_quantity_defaults_to_one_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_without_quantity_defaults_to_one_004');
      let cart: Cart = new Cart();
      let returned: number = cart.add(4, 8900);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(4)).assertEqual(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0050
     * @tc.name      add_zero_quantity_leaves_empty_cart_empty_005
     * @tc.desc      Verify add zero quantity leaves empty cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_quantity_leaves_empty_cart_empty_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_quantity_leaves_empty_cart_empty_005');
      let cart: Cart = new Cart();
      // A zero request is the model's no-op path: no line is created, so the
      // return value falls back to the 0 quantity of a missing product.
      let returned: number = cart.add(5, 29900, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.contains(5)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0060
     * @tc.name      add_negative_quantities_leave_empty_cart_empty_006
     * @tc.desc      Verify add negative quantities leave empty cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_negative_quantities_leave_empty_cart_empty_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_negative_quantities_leave_empty_cart_empty_006');
      let cart: Cart = new Cart();
      let rejected: number[] = [-1, -5, -99];
      for (let index: number = 0; index < rejected.length; index++) {
        let returned: number = cart.add(6, 19900, rejected[index]);
        expect(returned).assertEqual(0);
      }
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(6)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0070
     * @tc.name      add_zero_quantity_preserves_existing_line_007
     * @tc.desc      Verify add zero quantity preserves existing line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_quantity_preserves_existing_line_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_quantity_preserves_existing_line_007');
      let cart: Cart = cartWith([cartLine(4, 8900, 3)]);
      let before: number = cart.quantityOf(4);
      let returned: number = cart.add(4, 9999, 0);
      expect(returned).assertEqual(before);
      expect(cart.quantityOf(4)).assertEqual(3);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(8900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0080
     * @tc.name      add_negative_quantity_preserves_existing_quantity_008
     * @tc.desc      Verify add negative quantity preserves existing quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_negative_quantity_preserves_existing_quantity_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_negative_quantity_preserves_existing_quantity_008');
      let cart: Cart = cartWith([cartLine(7, 15900, 6)]);
      let deltas: number[] = [-1, -3, -20];
      for (let index: number = 0; index < deltas.length; index++) {
        let returned: number = cart.add(7, 15900, deltas[index]);
        expect(returned).assertEqual(6);
        expect(cart.quantityOf(7)).assertEqual(6);
      }
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0090
     * @tc.name      add_with_zero_stock_creates_no_line_009
     * @tc.desc      Verify add with zero stock creates no line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_with_zero_stock_creates_no_line_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_with_zero_stock_creates_no_line_009');
      let cart: Cart = new Cart();
      let returned: number = cart.add(6, 19900, 5, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(6)).assertFalse();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0100
     * @tc.name      add_large_request_is_capped_at_99_010
     * @tc.desc      Verify add large request is capped at 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_large_request_is_capped_at_99_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_large_request_is_capped_at_99_010');
      let cart: Cart = new Cart();
      // 150 is above the 99-unit line cap, so the line is created but its
      // quantity is clamped to 99 rather than rejected.
      let returned: number = cart.add(12, 8900, 150);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(12)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0110
     * @tc.name      add_request_99_is_accepted_011
     * @tc.desc      Verify add request 99 is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_request_99_is_accepted_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_request_99_is_accepted_011');
      let cart: Cart = new Cart();
      let returned: number = cart.add(14, 19900, 99);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(14)).assertEqual(99);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(99);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0120
     * @tc.name      add_fifty_then_forty_stays_below_cap_012
     * @tc.desc      Verify add fifty then forty stays below cap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_fifty_then_forty_stays_below_cap_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_fifty_then_forty_stays_below_cap_012');
      let cart: Cart = new Cart();
      cart.add(2, 129900, 50);
      // 50 + 40 = 90, still under the 99 cap, so the second add is stored verbatim.
      let second: number = cart.add(2, 129900, 40);
      expect(second).assertEqual(90);
      expect(cart.quantityOf(2)).assertEqual(90);
      expect(cart.quantityOf(2) < 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0130
     * @tc.name      repeated_add_accumulates_quantity_013
     * @tc.desc      Verify repeated add accumulates quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_accumulates_quantity_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_accumulates_quantity_013');
      let cart: Cart = new Cart();
      cart.add(4, 8900, 2);
      // The repeat merges into the same line instead of opening a second one:
      // 2 + 3 accumulates to 5 while distinctCount stays at one.
      let second: number = cart.add(4, 8900, 3);
      expect(second).assertEqual(5);
      expect(cart.quantityOf(4)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0140
     * @tc.name      third_add_accumulates_on_top_014
     * @tc.desc      Verify third add accumulates on top.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('third_add_accumulates_on_top_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: third_add_accumulates_on_top_014');
      let cart: Cart = new Cart();
      cart.add(5, 29900, 4);
      cart.add(5, 29900, 5);
      let third: number = cart.add(5, 29900, 6);
      expect(third).assertEqual(15);
      expect(cart.quantityOf(5)).assertEqual(15);
      expect(cart.totalQuantity()).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0150
     * @tc.name      repeated_add_keeps_single_line_015
     * @tc.desc      Verify repeated add keeps single line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_keeps_single_line_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_keeps_single_line_015');
      let cart: Cart = new Cart();
      cart.add(7, 15900, 2);
      cart.add(7, 15900, 3);
      cart.add(7, 15900, 4);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.indexOf(7)).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0160
     * @tc.name      repeated_add_keeps_first_unit_price_016
     * @tc.desc      Verify repeated add keeps first unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_keeps_first_unit_price_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_keeps_first_unit_price_016');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(1, 111100, 3);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(399900);
        expect(line.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0170
     * @tc.name      repeated_add_keeps_line_position_017
     * @tc.desc      Verify repeated add keeps line position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_keeps_line_position_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_keeps_line_position_017');
      let cart: Cart = new Cart();
      cart.add(0, 499900);
      cart.add(2, 129900);
      cart.add(0, 499900);
      expect(cart.indexOf(0)).assertEqual(0);
      expect(cart.indexOf(2)).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0180
     * @tc.name      repeated_add_returns_new_total_018
     * @tc.desc      Verify repeated add returns new total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_returns_new_total_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_returns_new_total_018');
      let cart: Cart = new Cart();
      let first: number = cart.add(3, 59900, 2);
      let second: number = cart.add(3, 59900, 5);
      let third: number = cart.add(3, 59900, 1);
      expect(first).assertEqual(2);
      expect(second).assertEqual(7);
      expect(third).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0190
     * @tc.name      second_product_keeps_its_own_unit_price_019
     * @tc.desc      Verify second product keeps its own unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('second_product_keeps_its_own_unit_price_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: second_product_keeps_its_own_unit_price_019');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 1);
      cart.add(1, 399900, 1);
      let firstLine: CartLine | undefined = cart.lineAt(0);
      let secondLine: CartLine | undefined = cart.lineAt(1);
      expect(firstLine !== null && firstLine !== undefined).assertTrue();
      expect(secondLine !== null && secondLine !== undefined).assertTrue();
      if (firstLine !== undefined && secondLine !== undefined) {
        expect(firstLine.unitPriceCents).assertEqual(499900);
        expect(secondLine.unitPriceCents).assertEqual(399900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0200
     * @tc.name      different_products_are_independent_020
     * @tc.desc      Verify different products are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('different_products_are_independent_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: different_products_are_independent_020');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0210
     * @tc.name      repeated_add_on_one_product_leaves_the_other_alone_021
     * @tc.desc      Verify repeated add on one product leaves the other alone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_add_on_one_product_leaves_the_other_alone_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_add_on_one_product_leaves_the_other_alone_021');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      cart.add(1, 399900, 4);
      expect(cart.quantityOf(1)).assertEqual(6);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0220
     * @tc.name      distinct_count_equals_added_products_022
     * @tc.desc      Verify distinct count equals added products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('distinct_count_equals_added_products_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: distinct_count_equals_added_products_022');
      let cart: Cart = new Cart();
      let products: number[] = [4, 5, 6, 7];
      for (let index: number = 0; index < products.length; index++) {
        cart.add(products[index], 1000 + index * 100, 1);
      }
      expect(cart.distinctCount()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0230
     * @tc.name      quantity_of_each_product_matches_its_own_adds_023
     * @tc.desc      Verify quantity of each product matches its own adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_each_product_matches_its_own_adds_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_each_product_matches_its_own_adds_023');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 1);
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      let expected: number[] = [1, 2, 3];
      for (let index: number = 0; index < expected.length; index++) {
        expect(cart.quantityOf(index)).assertEqual(expected[index]);
      }
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0240
     * @tc.name      three_products_keep_insertion_order_024
     * @tc.desc      Verify three products keep insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('three_products_keep_insertion_order_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: three_products_keep_insertion_order_024');
      let cart: Cart = new Cart();
      let ids: number[] = [7, 3, 5];
      for (let index: number = 0; index < ids.length; index++) {
        cart.add(ids[index], 1000 * (index + 1), 1);
      }
      let observed: number[] = [];
      for (let index: number = 0; index < cart.distinctCount(); index++) {
        let line: CartLine | undefined = cart.lineAt(index);
        if (line !== undefined) {
          observed.push(line.goodsId);
        }
      }

      expect(observed.length).assertEqual(3);
      expect(observed[0]).assertEqual(7);
      expect(observed[1]).assertEqual(3);
      expect(observed[2]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0250
     * @tc.name      index_of_follows_insertion_order_025
     * @tc.desc      Verify index of follows insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('index_of_follows_insertion_order_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: index_of_follows_insertion_order_025');
      let cart: Cart = new Cart();
      cart.add(15, 15900);
      cart.add(12, 8900);
      cart.add(13, 29900);
      expect(cart.indexOf(15)).assertEqual(0);
      expect(cart.indexOf(12)).assertEqual(1);
      expect(cart.indexOf(13)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0260
     * @tc.name      new_product_appends_after_repeated_adds_on_the_first_026
     * @tc.desc      Verify new product appends after repeated adds on the first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('new_product_appends_after_repeated_adds_on_the_first_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: new_product_appends_after_repeated_adds_on_the_first_026');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 1);
      cart.add(1, 399900, 1);
      cart.add(4, 8900, 2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(1)).assertEqual(0);
      expect(cart.indexOf(4)).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0270
     * @tc.name      add_to_prepopulated_cart_merges_existing_line_027
     * @tc.desc      Verify add to prepopulated cart merges existing line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_prepopulated_cart_merges_existing_line_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_prepopulated_cart_merges_existing_line_027');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let returned: number = cart.add(4, 8900, 3);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(4)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0280
     * @tc.name      add_to_prepopulated_cart_appends_new_product_028
     * @tc.desc      Verify add to prepopulated cart appends new product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_prepopulated_cart_appends_new_product_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_prepopulated_cart_appends_new_product_028');
      let cart: Cart = cartWith([cartLine(4, 8900, 2), cartLine(7, 15900, 1)]);
      let returned: number = cart.add(2, 129900, 3);
      expect(returned).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.indexOf(2)).assertEqual(2);
      expect(cart.quantityOf(4)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0290
     * @tc.name      add_after_remove_creates_line_again_029
     * @tc.desc      Verify add after remove creates line again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_after_remove_creates_line_again_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_after_remove_creates_line_again_029');
      let cart: Cart = new Cart();
      cart.add(5, 29900, 2);
      let removed: boolean = cart.remove(5);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      let returned: number = cart.add(5, 29900, 4);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(5)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0300
     * @tc.name      add_after_remove_returns_requested_quantity_030
     * @tc.desc      Verify add after remove returns requested quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_after_remove_returns_requested_quantity_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_after_remove_returns_requested_quantity_030');
      let cart: Cart = cartWith([cartLine(0, 499900, 1)]);
      cart.remove(0);
      let requested: number[] = [1, 5, 12];
      // Each round removes the line again, so all three sizes start from an
      // empty cart and must come back exactly as requested.
      for (let index: number = 0; index < requested.length; index++) {
        let returned: number = cart.add(0, 499900, requested[index]);
        expect(returned).assertEqual(requested[index]);
        cart.remove(0);
      }
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0310
     * @tc.name      add_after_remove_uses_the_new_unit_price_031
     * @tc.desc      Verify add after remove uses the new unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_after_remove_uses_the_new_unit_price_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_after_remove_uses_the_new_unit_price_031');
      let cart: Cart = new Cart();
      cart.add(6, 19900, 2);
      cart.remove(6);
      cart.add(6, 25000, 3);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(25000);
        expect(line.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0320
     * @tc.name      add_after_remove_puts_line_at_the_end_032
     * @tc.desc      Verify add after remove puts line at the end.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_after_remove_puts_line_at_the_end_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_after_remove_puts_line_at_the_end_032');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 1)]);
      // Removing id 1 slides id 2 down to index 0, and the re-added id 1 is
      // appended behind it instead of returning to its original slot.
      cart.remove(1);
      cart.add(1, 399900, 2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(2)).assertEqual(0);
      expect(cart.indexOf(1)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0330
     * @tc.name      zero_price_add_creates_a_distinct_line_033
     * @tc.desc      Verify zero price add creates a distinct line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_add_creates_a_distinct_line_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_add_creates_a_distinct_line_033');
      let cart: Cart = new Cart();
      let returned: number = cart.add(9, 0, 4);
      expect(returned).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(0);
        expect(line.quantity).assertEqual(4);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0340
     * @tc.name      default_add_twice_grows_quantity_to_two_034
     * @tc.desc      Verify default add twice grows quantity to two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('default_add_twice_grows_quantity_to_two_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: default_add_twice_grows_quantity_to_two_034');
      let cart: Cart = new Cart();
      let first: number = cart.add(3, 59900);
      let second: number = cart.add(3, 59900);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(cart.quantityOf(3)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0350
     * @tc.name      sequence_of_default_adds_grows_linearly_035
     * @tc.desc      Verify sequence of default adds grows linearly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sequence_of_default_adds_grows_linearly_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sequence_of_default_adds_grows_linearly_035');
      let cart: Cart = new Cart();
      let expected: number = 0;
      // Five default one-unit adds must return 1 through 5, matching the loop
      // counter, to prove each call reports the running line quantity.
      for (let step: number = 1; step <= 5; step++) {
        expected = step;
        let returned: number = cart.add(8, 15900);
        expect(returned).assertEqual(expected);
      }
      expect(cart.quantityOf(8)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0360
     * @tc.name      add_over_cap_new_line_does_not_disturb_existing_036
     * @tc.desc      Verify add over cap new line does not disturb existing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_over_cap_new_line_does_not_disturb_existing_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_over_cap_new_line_does_not_disturb_existing_036');
      let cart: Cart = cartWith([cartLine(11, 15900, 2)]);
      // The 99 clamped onto id 12 plus the untouched 2 on id 11 gives 101 for
      // the whole cart, showing the cap is not a cart-wide ceiling.
      let returned: number = cart.add(12, 8900, 150);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(12)).assertEqual(99);
      expect(cart.quantityOf(11)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(101);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0370
     * @tc.name      full_cap_on_first_product_does_not_block_new_product_037
     * @tc.desc      Verify full cap on first product does not block new product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('full_cap_on_first_product_does_not_block_new_product_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: full_cap_on_first_product_does_not_block_new_product_037');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 99);
      let returned: number = cart.add(1, 399900, 5);
      expect(returned).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(0)).assertEqual(99);
      expect(cart.quantityOf(1)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0380
     * @tc.name      same_product_two_prices_does_not_add_second_line_038
     * @tc.desc      Verify same product two prices does not add second line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('same_product_two_prices_does_not_add_second_line_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: same_product_two_prices_does_not_add_second_line_038');
      let cart: Cart = new Cart();
      cart.add(15, 15900, 1);
      cart.add(15, 99000, 1);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(15)).assertEqual(2);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(15900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0390
     * @tc.name      add_creates_line_for_each_distinct_product_in_a_batch_039
     * @tc.desc      Verify add creates line for each distinct product in a batch.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_creates_line_for_each_distinct_product_in_a_batch_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_creates_line_for_each_distinct_product_in_a_batch_039');
      let cart: Cart = new Cart();
      let batch: number[] = [9, 10, 11, 12, 13];
      for (let index: number = 0; index < batch.length; index++) {
        cart.add(batch[index], 5000 + index * 500, index + 1);
      }
      expect(cart.distinctCount()).assertEqual(5);
      for (let index: number = 0; index < batch.length; index++) {
        expect(cart.quantityOf(batch[index])).assertEqual(index + 1);
      }
      expect(cart.totalQuantity()).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0400
     * @tc.name      add_to_cart_with_unselected_line_keeps_selection_state_040
     * @tc.desc      Verify add to cart with unselected line keeps selection state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_to_cart_with_unselected_line_keeps_selection_state_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_to_cart_with_unselected_line_keeps_selection_state_040');
      let cart: Cart = cartWith([cartLine(2, 129900, 2, false)]);
      cart.add(2, 129900, 3);
      expect(cart.quantityOf(2)).assertEqual(5);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0410
     * @tc.name      add_product_with_zero_id_creates_line_041
     * @tc.desc      Verify add product with zero id creates line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_product_with_zero_id_creates_line_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_product_with_zero_id_creates_line_041');
      let cart: Cart = new Cart();
      let returned: number = cart.add(0, 499900, 2);
      expect(returned).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.indexOf(0)).assertEqual(0);
      expect(cart.quantityOf(0)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0420
     * @tc.name      add_negative_id_product_merges_on_repeat_042
     * @tc.desc      Verify add negative id product merges on repeat.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_negative_id_product_merges_on_repeat_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_negative_id_product_merges_on_repeat_042');
      let cart: Cart = new Cart();
      cart.add(-1, 1000, 3);
      // indexOf compares raw ids, so -1 is an ordinary key and the repeat merges
      // to 3 + 4 = 7 instead of opening a second line.
      let returned: number = cart.add(-1, 1000, 4);
      expect(returned).assertEqual(7);
      expect(cart.quantityOf(-1)).assertEqual(7);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0430
     * @tc.name      add_zero_and_negative_ids_coexist_as_separate_lines_043
     * @tc.desc      Verify add zero and negative ids coexist as separate lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_and_negative_ids_coexist_as_separate_lines_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_and_negative_ids_coexist_as_separate_lines_043');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 1);
      cart.add(-1, 1000, 2);
      cart.add(1, 399900, 3);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.indexOf(0)).assertEqual(0);
      expect(cart.indexOf(-1)).assertEqual(1);
      expect(cart.indexOf(1)).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0440
     * @tc.name      add_per_line_cap_allows_two_full_lines_044
     * @tc.desc      Verify add per line cap allows two full lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_per_line_cap_allows_two_full_lines_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_per_line_cap_allows_two_full_lines_044');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 99);
      cart.add(1, 399900, 99);
      // The 99 limit is enforced per line, so two saturated lines give 198.
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(0)).assertEqual(99);
      expect(cart.quantityOf(1)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(198);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0450
     * @tc.name      add_ninety_eight_then_one_reaches_cap_045
     * @tc.desc      Verify add ninety eight then one reaches cap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_ninety_eight_then_one_reaches_cap_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_ninety_eight_then_one_reaches_cap_045');
      let cart: Cart = new Cart();
      let first: number = cart.add(7, 15900, 98);
      // 98 + 1 lands exactly on the cap; the following unit cannot lift it to 100.
      let second: number = cart.add(7, 15900, 1);
      let third: number = cart.add(7, 15900, 1);
      expect(first).assertEqual(98);
      expect(second).assertEqual(99);
      expect(third).assertEqual(99);
      expect(cart.quantityOf(7)).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0460
     * @tc.name      add_same_price_products_merge_by_identity_046
     * @tc.desc      Verify add same price products merge by identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_same_price_products_merge_by_identity_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_same_price_products_merge_by_identity_046');
      let cart: Cart = new Cart();
      cart.add(3, 59900, 2);
      cart.add(4, 59900, 5);
      // Lines are keyed by goods id, not by price: ids 3 and 4 at the same 59900
      // remain two separate lines.
      let returned: number = cart.add(3, 59900, 1);

      expect(returned).assertEqual(3);
      expect(cart.quantityOf(3)).assertEqual(3);
      expect(cart.quantityOf(4)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(8);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.goodsId).assertEqual(3);
        expect(second.goodsId).assertEqual(4);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0470
     * @tc.name      add_large_unit_price_is_stored_exactly_047
     * @tc.desc      Verify add large unit price is stored exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_large_unit_price_is_stored_exactly_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_large_unit_price_is_stored_exactly_047');
      let cart: Cart = new Cart();
      // Cents are whole numbers, so 900000000 must round-trip without any
      // floating point drift in the stored unit price.
      let hugePrice: number = 900000000;
      cart.add(1, hugePrice, 2);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(hugePrice);
        expect(line.quantity).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0480
     * @tc.name      add_zero_price_then_merge_keeps_frozen_price_048
     * @tc.desc      Verify add zero price then merge keeps frozen price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_price_then_merge_keeps_frozen_price_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_price_then_merge_keeps_frozen_price_048');
      let cart: Cart = new Cart();
      cart.add(9, 0, 1);
      // The merge only raises the quantity; the zero unit price frozen by the
      // first add survives the later 5000 request.
      cart.add(9, 5000, 2);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(0);
        expect(line.quantity).assertEqual(3);
      }
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0490
     * @tc.name      add_interleaved_rejected_request_does_not_disturb_valid_add_049
     * @tc.desc      Verify add interleaved rejected request does not disturb valid add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_interleaved_rejected_request_does_not_disturb_valid_add_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_interleaved_rejected_request_does_not_disturb_valid_add_049');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 0);
      let returned: number = cart.add(1, 399900, 3);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(1)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(2)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0500
     * @tc.name      add_order_after_interleaved_merge_and_append_050
     * @tc.desc      Verify add order after interleaved merge and append.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_order_after_interleaved_merge_and_append_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_order_after_interleaved_merge_and_append_050');
      let cart: Cart = new Cart();
      cart.add(5, 29900, 1);
      cart.add(6, 19900, 1);
      cart.add(5, 29900, 2);
      cart.add(7, 15900, 1);
      cart.add(6, 19900, 2);
      let observed: number[] = [];
      for (let index: number = 0; index < cart.distinctCount(); index++) {
        let line: CartLine | undefined = cart.lineAt(index);
        if (line !== undefined) {
          observed.push(line.goodsId);
        }
      }

      expect(observed.length).assertEqual(3);
      expect(observed[0]).assertEqual(5);
      expect(observed[1]).assertEqual(6);
      expect(observed[2]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0510
     * @tc.name      add_unknown_product_is_not_present_051
     * @tc.desc      Verify add unknown product is not present.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_unknown_product_is_not_present_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_unknown_product_is_not_present_051');
      let cart: Cart = new Cart();
      cart.add(4, 8900, 2);
      // -1 is indexOf's not-found sentinel, and quantityOf turns the same miss
      // into 0 rather than throwing.
      expect(cart.indexOf(99)).assertEqual(-1);
      expect(cart.contains(99)).assertFalse();
      expect(cart.quantityOf(99)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0520
     * @tc.name      add_merge_on_one_line_leaves_other_lines_untouched_052
     * @tc.desc      Verify add merge on one line leaves other lines untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_merge_on_one_line_leaves_other_lines_untouched_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_merge_on_one_line_leaves_other_lines_untouched_052');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let returned: number = cart.add(1, 399900, 4);
      expect(returned).assertEqual(6);
      expect(cart.quantityOf(1)).assertEqual(6);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0530
     * @tc.name      add_zero_quantity_then_positive_quantity_succeeds_053
     * @tc.desc      Verify add zero quantity then positive quantity succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_quantity_then_positive_quantity_succeeds_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_quantity_then_positive_quantity_succeeds_053');
      let cart: Cart = new Cart();
      let rejected: number = cart.add(13, 29900, 0);
      expect(rejected).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      let accepted: number = cart.add(13, 29900, 2);
      expect(accepted).assertEqual(2);
      expect(cart.quantityOf(13)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0540
     * @tc.name      add_unknown_zero_request_returns_zero_without_line_054
     * @tc.desc      Verify add unknown zero request returns zero without line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_unknown_zero_request_returns_zero_without_line_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_unknown_zero_request_returns_zero_without_line_054');
      let cart: Cart = cartWith([cartLine(0, 499900, 1)]);
      let returned: number = cart.add(99, 5000, 0);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(99)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0550
     * @tc.name      add_negative_quantity_after_full_cap_keeps_99_055
     * @tc.desc      Verify add negative quantity after full cap keeps 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_negative_quantity_after_full_cap_keeps_99_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_negative_quantity_after_full_cap_keeps_99_055');
      let cart: Cart = new Cart();
      cart.add(15, 15900, 99);
      // The negative request is ignored outright, so the line stays at 99
      // instead of being pulled down to 91.
      let returned: number = cart.add(15, 15900, -8);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(15)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0560
     * @tc.name      add_explicit_and_default_quantities_accumulate_056
     * @tc.desc      Verify add explicit and default quantities accumulate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_explicit_and_default_quantities_accumulate_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_explicit_and_default_quantities_accumulate_056');
      let cart: Cart = new Cart();
      let first: number = cart.add(12, 8900, 4);
      let second: number = cart.add(12, 8900);
      expect(first).assertEqual(4);
      expect(second).assertEqual(5);
      expect(cart.quantityOf(12)).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_ADD_0570
     * @tc.name      add_two_lines_merged_independently_update_total_057
     * @tc.desc      Verify add two lines merged independently update total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_two_lines_merged_independently_update_total_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_two_lines_merged_independently_update_total_057');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 1);
      cart.add(2, 129900, 1);
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(7);
    });
  });
}
