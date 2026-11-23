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

export default function cartStockTest() {
  describe('OrangeShoppingCartStock', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart stock suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0010
     * @tc.name      stock_zero_add_creates_no_line_001
     * @tc.desc      Verify stock zero add creates no line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_add_creates_no_line_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_add_creates_no_line_001');
      let cart: Cart = new Cart();
      // Zero stock short-circuits add before a line can be created, so the requested 5 units vanish.
      let returned: number = cart.add(1, 399900, 5, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0020
     * @tc.name      stock_one_add_clamps_large_request_002
     * @tc.desc      Verify stock one add clamps large request.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_add_clamps_large_request_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_add_clamps_large_request_002');
      let cart: Cart = new Cart();
      // With a single unit on hand the 50-unit request is trimmed to 1 rather than rejected outright.
      let returned: number = cart.add(1, 399900, 50, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0030
     * @tc.name      stock_add_returns_the_clamped_quantity_003
     * @tc.desc      Verify stock add returns the clamped quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_add_returns_the_clamped_quantity_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_add_returns_the_clamped_quantity_003');
      // Row 2 isolates the 99-unit line ceiling: stock 100 still yields 99, while stock 30 keeps 30.
      let requests: number[] = [1, 99, 100, 30];
      let stocks: number[] = [1, 99, 100, 30];
      let expected: number[] = [1, 99, 99, 30];
      expect(requests.length).assertEqual(expected.length);
      expect(stocks.length).assertEqual(expected.length);
      for (let index: number = 0; index < requests.length; index++) {
        let cart: Cart = new Cart();
        let returned: number = cart.add(index + 1, 1000 * (index + 1), requests[index], stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index + 1)).assertEqual(expected[index]);
        expect(cart.totalQuantity()).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0040
     * @tc.name      stock_99_add_caps_004
     * @tc.desc      Verify stock 99 add caps 150.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_99_add_caps_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_99_add_caps_004');
      let cart: Cart = new Cart();
      let returned: number = cart.add(2, 129900, 150, 99);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(2)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0050
     * @tc.name      stock_100_merge_below_cap_stays_below_99_005
     * @tc.desc      Verify stock 100 merge below cap stays below 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_100_merge_below_cap_stays_below_99_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_100_merge_below_cap_stays_below_99_005');
      let cart: Cart = cartWith([cartLine(3, 59900, 90)]);
      // 90 + 5 clears both the 100 stock and the 99 line ceiling, so nothing is clamped to 99.
      let returned: number = cart.add(3, 59900, 5, 100);
      expect(returned).assertEqual(95);
      expect(cart.quantityOf(3)).assertEqual(95);
      expect(cart.totalQuantity()).assertEqual(95);
      expect(cart.quantityOf(3) < 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0060
     * @tc.name      stock_values_matrix_controls_add_006
     * @tc.desc      Verify stock values matrix controls add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_values_matrix_controls_add_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_values_matrix_controls_add_006');
      let stocks: number[] = [1, 2, 99, 100];
      let expected: number[] = [1, 2, 50, 50];
      for (let index: number = 0; index < stocks.length; index++) {
        let cart: Cart = new Cart();
        let returned: number = cart.add(index, 1000 * (index + 1), 50, stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index)).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0070
     * @tc.name      stock_values_matrix_controls_set_007
     * @tc.desc      Verify stock values matrix controls set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_values_matrix_controls_set_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_values_matrix_controls_set_007');
      let stocks: number[] = [1, 2, 99, 100];
      let expected: number[] = [1, 2, 50, 50];
      for (let index: number = 0; index < stocks.length; index++) {
        let cart: Cart = cartWith([cartLine(index, 1000 * (index + 1), 5)]);
        let returned: number = cart.setQuantity(index, 50, stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index)).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0080
     * @tc.name      stock_zero_set_drives_quantity_to_zero_and_keeps_line_008
     * @tc.desc      Verify stock zero set drives quantity to zero and keeps line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_drives_quantity_to_zero_and_keeps_line_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_drives_quantity_to_zero_and_keeps_line_008');
      let cart: Cart = cartWith([cartLine(4, 8900, 5)]);
      // Zero stock writes quantity 0 but does not delete, so the line and its 8900 price still exist.
      let returned: number = cart.setQuantity(4, 8, 0);
      expect(returned).assertEqual(0);
      expect(cart.quantityOf(4)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.isEmpty()).assertFalse();
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(8900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0090
     * @tc.name      stock_set_clamps_the_requested_quantity_009
     * @tc.desc      Verify stock set clamps the requested quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_set_clamps_the_requested_quantity_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_set_clamps_the_requested_quantity_009');
      let requests: number[] = [10, 150, 30, 99, 100];
      let stocks: number[] = [1, 100, 30, 99, 100];
      let expected: number[] = [1, 99, 30, 99, 99];
      expect(requests.length).assertEqual(expected.length);
      expect(stocks.length).assertEqual(expected.length);
      for (let index: number = 0; index < requests.length; index++) {
        let cart: Cart = cartWith([cartLine(index + 1, 19900, 5)]);
        let returned: number = cart.setQuantity(index + 1, requests[index], stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index + 1)).assertEqual(expected[index]);
        expect(cart.totalQuantity()).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0100
     * @tc.name      stock_shrink_set_clamps_existing_quantity_010
     * @tc.desc      Verify stock shrink set clamps existing quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_set_clamps_existing_quantity_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_set_clamps_existing_quantity_010');
      let cart: Cart = cartWith([cartLine(7, 15900, 10)]);
      // Stock drops to 4, so both the requested 15 and the 10 already in the line give way to 4.
      let returned: number = cart.setQuantity(7, 15, 4);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(7)).assertEqual(4);
      expect(cart.quantityOf(7) < 10).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0110
     * @tc.name      stock_shrink_increase_clamps_existing_quantity_011
     * @tc.desc      Verify stock shrink increase clamps existing quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_increase_clamps_existing_quantity_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_increase_clamps_existing_quantity_011');
      let cart: Cart = cartWith([cartLine(8, 15900, 10)]);
      let returned: number = cart.increase(8, 1, 4);
      expect(returned === 4).assertTrue();
      expect(cart.quantityOf(8)).assertEqual(4);
      expect(cart.quantityOf(8) < 10).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0120
     * @tc.name      stock_shrink_decrease_snaps_down_to_stock_012
     * @tc.desc      Verify stock shrink decrease snaps down to stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_decrease_snaps_down_to_stock_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_decrease_snaps_down_to_stock_012');
      let cart: Cart = cartWith([cartLine(9, 499900, 10)]);
      // 10 - 1 is still above the stock of 4, so the result snaps down to the stock floor.
      let returned: number = cart.decrease(9, 1, 4);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(9)).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0130
     * @tc.name      stock_shrink_boundary_exact_stock_013
     * @tc.desc      Verify stock shrink boundary exact stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_boundary_exact_stock_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_boundary_exact_stock_013');
      let cart: Cart = cartWith([cartLine(10, 129900, 10)]);
      let returned: number = cart.setQuantity(10, 4, 4);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(10)).assertEqual(4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(4);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0140
     * @tc.name      stock_restore_does_not_auto_increase_quantity_014
     * @tc.desc      Verify stock restore does not auto increase quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_does_not_auto_increase_quantity_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_does_not_auto_increase_quantity_014');
      let cart: Cart = cartWith([cartLine(11, 59900, 10)]);
      cart.setQuantity(11, 15, 4);
      expect(cart.quantityOf(11)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0150
     * @tc.name      stock_zero_quantity_add_never_raises_the_quantity_015
     * @tc.desc      Verify stock zero quantity add never raises the quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_quantity_add_never_raises_the_quantity_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_quantity_add_never_raises_the_quantity_015');
      // Row 0 adds zero units; row 1 adds into zero stock, so neither request can lift the clamped count.
      let shrinkStocks: number[] = [4, 0];
      let addQuantities: number[] = [0, 2];
      let addStocks: number[] = [100, 0];
      let expected: number[] = [4, 0];
      expect(addQuantities.length).assertEqual(expected.length);
      expect(addStocks.length).assertEqual(expected.length);
      for (let index: number = 0; index < addQuantities.length; index++) {
        let cart: Cart = cartWith([cartLine(11 + index, 59900, 10)]);
        cart.setQuantity(11 + index, 15, shrinkStocks[index]);
        let returned: number = cart.add(11 + index, 59900, addQuantities[index], addStocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(11 + index)).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0160
     * @tc.name      stock_restore_explicit_set_can_increase_016
     * @tc.desc      Verify stock restore explicit set can increase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_explicit_set_can_increase_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_explicit_set_can_increase_016');
      let cart: Cart = cartWith([cartLine(12, 8900, 10)]);
      cart.setQuantity(12, 15, 4);
      // Once the shelf is back at 100, an explicit set to 10 beats the earlier clamp to 4.
      let returned: number = cart.setQuantity(12, 10, 100);
      expect(returned).assertEqual(10);
      expect(cart.quantityOf(12)).assertEqual(10);
      expect(cart.quantityOf(12) > 4).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0170
     * @tc.name      stock_restore_increase_can_grow_again_017
     * @tc.desc      Verify stock restore increase can grow again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_increase_can_grow_again_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_increase_can_grow_again_017');
      let shrinkStocks: number[] = [4, 0];
      let deltas: number[] = [2, 1];
      // Row 0 lifts 4 to 6 with stock 100; row 1 can only reach the single unit now in stock.
      let growStocks: number[] = [100, 1];
      let expected: number[] = [6, 1];

      expect(deltas.length).assertEqual(expected.length);
      expect(growStocks.length).assertEqual(expected.length);
      for (let index: number = 0; index < deltas.length; index++) {
        let cart: Cart = cartWith([cartLine(12 + index, 8900, 10)]);
        cart.setQuantity(12 + index, 15, shrinkStocks[index]);
        let returned: number = cart.increase(12 + index, deltas[index], growStocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(12 + index)).assertEqual(expected[index]);
        expect(cart.totalQuantity()).assertEqual(expected[index]);
        expect(cart.quantityOf(12 + index) > shrinkStocks[index]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0180
     * @tc.name      stock_restore_other_line_change_does_not_affect_018
     * @tc.desc      Verify stock restore other line change does not affect.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_other_line_change_does_not_affect_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_other_line_change_does_not_affect_018');
      let cart: Cart = cartWith([cartLine(1, 399900, 10), cartLine(2, 129900, 2)]);
      cart.setQuantity(1, 15, 4);
      cart.increase(2, 5, 100);
      expect(cart.quantityOf(1)).assertEqual(4);
      expect(cart.quantityOf(2)).assertEqual(7);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0190
     * @tc.name      default_stock_caps_add_from_product_stock_019
     * @tc.desc      Verify default stock caps add from product stock 100.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('default_stock_caps_add_from_product_stock_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: default_stock_caps_add_from_product_stock_019');
      let cart: Cart = new Cart();
      // With no stock argument add falls back to the 99 default, so a 100-unit request settles at 99.
      let returned: number = cart.add(13, 29900, 100);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(13)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0200
     * @tc.name      default_stock_caps_set_at_99_020
     * @tc.desc      Verify default stock caps set at 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('default_stock_caps_set_at_99_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: default_stock_caps_set_at_99_020');
      let cart: Cart = cartWith([cartLine(14, 19900, 5)]);
      let returned: number = cart.setQuantity(14, 150);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(14)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0210
     * @tc.name      default_stock_add_98_is_accepted_021
     * @tc.desc      Verify default stock add 98 is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('default_stock_add_98_is_accepted_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: default_stock_add_98_is_accepted_021');
      let cart: Cart = new Cart();
      let returned: number = cart.add(15, 15900, 98);
      expect(returned).assertEqual(98);
      expect(cart.quantityOf(15)).assertEqual(98);
      expect(cart.quantityOf(15) < 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0220
     * @tc.name      add_request_equal_to_stock_is_accepted_022
     * @tc.desc      Verify add request equal to stock is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_request_equal_to_stock_is_accepted_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_request_equal_to_stock_is_accepted_022');
      let cart: Cart = new Cart();
      let returned: number = cart.add(0, 499900, 30, 30);
      expect(returned).assertEqual(30);
      expect(cart.quantityOf(0)).assertEqual(30);
      expect(cart.totalQuantity()).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0230
     * @tc.name      increase_reaches_exactly_stock_023
     * @tc.desc      Verify increase reaches exactly stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_reaches_exactly_stock_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_reaches_exactly_stock_023');
      let cart: Cart = cartWith([cartLine(1, 399900, 25)]);
      let returned: number = cart.increase(1, 5, 30);
      expect(returned).assertEqual(30);
      expect(cart.quantityOf(1)).assertEqual(30);
      expect(cart.totalQuantity()).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0240
     * @tc.name      add_on_an_existing_line_respects_the_stock_ceiling_024
     * @tc.desc      Verify add on an existing line respects the stock ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_on_an_existing_line_respects_the_stock_ceiling_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_on_an_existing_line_respects_the_stock_ceiling_024');
      // Rows 0-1 meet stock 30, row 2 meets the 99 ceiling, and row 3 lands exactly on stock 99.
      let initial: number[] = [20, 20, 99, 98];
      let requests: number[] = [10, 11, 1, 1];
      let stocks: number[] = [30, 30, 100, 99];
      let expected: number[] = [30, 30, 99, 99];
      expect(initial.length).assertEqual(expected.length);
      expect(requests.length).assertEqual(expected.length);
      for (let index: number = 0; index < initial.length; index++) {
        let cart: Cart = cartWith([cartLine(index + 1, 129900, initial[index])]);
        let returned: number = cart.add(index + 1, 129900, requests[index], stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index + 1)).assertEqual(expected[index]);
        expect(cart.totalQuantity()).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0250
     * @tc.name      increase_zero_stock_to_existing_zeroes_quantity_025
     * @tc.desc      Verify increase zero stock to existing zeroes quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_zero_stock_to_existing_zeroes_quantity_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_zero_stock_to_existing_zeroes_quantity_025');
      let cart: Cart = cartWith([cartLine(3, 59900, 5)]);
      // A one-unit increase into zero stock rewrites the line to 0 without deleting it.
      let returned: number = cart.increase(3, 1, 0);
      expect(returned).assertEqual(0);
      expect(cart.quantityOf(3)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0260
     * @tc.name      remove_then_set_with_stock_returns_zero_026
     * @tc.desc      Verify remove then set with stock returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_set_with_stock_returns_zero_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_set_with_stock_returns_zero_026');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let removed: boolean = cart.remove(4);
      expect(removed).assertTrue();
      // After remove(4) the id has no line, so setQuantity reports 0 instead of recreating the goods.
      let returned: number = cart.setQuantity(4, 5, 10);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0270
     * @tc.name      remove_then_increase_with_stock_returns_zero_027
     * @tc.desc      Verify remove then increase with stock returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_increase_with_stock_returns_zero_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_increase_with_stock_returns_zero_027');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      cart.remove(4);
      let returned: number = cart.increase(4, 3, 50);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(4)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0280
     * @tc.name      remove_then_decrease_with_stock_returns_zero_028
     * @tc.desc      Verify remove then decrease with stock returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_decrease_with_stock_returns_zero_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_decrease_with_stock_returns_zero_028');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      cart.remove(4);
      let returned: number = cart.decrease(4, 1, 50);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0290
     * @tc.name      after_clear_add_zero_stock_creates_nothing_029
     * @tc.desc      Verify after clear add zero stock creates nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('after_clear_add_zero_stock_creates_nothing_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: after_clear_add_zero_stock_creates_nothing_029');
      let cart: Cart = cartWith([cartLine(5, 29900, 3)]);
      cart.clear();
      let returned: number = cart.add(5, 29900, 4, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0300
     * @tc.name      after_clear_set_with_stock_returns_zero_030
     * @tc.desc      Verify after clear set with stock returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('after_clear_set_with_stock_returns_zero_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: after_clear_set_with_stock_returns_zero_030');
      let cart: Cart = cartWith([cartLine(5, 29900, 3)]);
      cart.clear();
      let returned: number = cart.setQuantity(5, 9, 20);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(5)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0310
     * @tc.name      multi_line_add_stock_limits_are_independent_031
     * @tc.desc      Verify multi line add stock limits are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_add_stock_limits_are_independent_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_add_stock_limits_are_independent_031');
      let cart: Cart = new Cart();
      let first: number = cart.add(1, 399900, 10, 3);
      let second: number = cart.add(2, 129900, 10, 7);
      expect(first).assertEqual(3);
      expect(second).assertEqual(7);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0320
     * @tc.name      multi_line_set_stock_affects_only_target_032
     * @tc.desc      Verify multi line set stock affects only target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_set_stock_affects_only_target_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_set_stock_affects_only_target_032');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 5)]);
      let returned: number = cart.setQuantity(1, 20, 2);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0330
     * @tc.name      multi_line_increase_stock_affects_only_target_033
     * @tc.desc      Verify multi line increase stock affects only target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_increase_stock_affects_only_target_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_increase_stock_affects_only_target_033');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 5)]);
      let returned: number = cart.increase(1, 10, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0340
     * @tc.name      multi_line_stock_values_matrix_set_034
     * @tc.desc      Verify multi line stock values matrix set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_stock_values_matrix_set_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_stock_values_matrix_set_034');
      let stocks: number[] = [1, 2, 99, 100];
      let lines: CartLine[] = [];
      for (let index: number = 0; index < stocks.length; index++) {
        lines.push(new CartLine(index, 1000 * (index + 1), 5));
      }
      let cart: Cart = cartWith(lines);
      // Each line takes min(50, its stock): 1 and 2 are capped by stock, the last two stay at 50.
      let expected: number[] = [1, 2, 50, 50];
      for (let index: number = 0; index < stocks.length; index++) {
        let returned: number = cart.setQuantity(index, 50, stocks[index]);

        expect(returned).assertEqual(expected[index]);
      }
      expect(cart.quantityOf(0)).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(50);
      expect(cart.quantityOf(3)).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0350
     * @tc.name      multi_line_removal_leaves_other_stock_quantity_unchanged_035
     * @tc.desc      Verify multi line removal leaves other stock quantity unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_removal_leaves_other_stock_quantity_unchanged_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_removal_leaves_other_stock_quantity_unchanged_035');
      let cart: Cart = cartWith([cartLine(1, 399900, 3), cartLine(2, 129900, 8)]);
      cart.remove(1);
      let returned: number = cart.setQuantity(2, 20, 6);
      expect(returned).assertEqual(6);
      expect(cart.quantityOf(2)).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0360
     * @tc.name      independent_clamps_keep_total_correct_036
     * @tc.desc      Verify independent clamps keep total correct.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('independent_clamps_keep_total_correct_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: independent_clamps_keep_total_correct_036');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 10, 3);
      cart.add(2, 129900, 10, 7);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(10);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0370
     * @tc.name      repeated_clamp_is_idempotent_037
     * @tc.desc      Verify repeated clamp is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_clamp_is_idempotent_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_clamp_is_idempotent_037');
      let cart: Cart = cartWith([cartLine(6, 19900, 10)]);
      let first: number = cart.setQuantity(6, 15, 4);
      let second: number = cart.setQuantity(6, 15, 4);
      expect(first).assertEqual(4);
      expect(second).assertEqual(4);
      expect(cart.quantityOf(6)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0380
     * @tc.name      stock_restore_then_add_can_regrow_038
     * @tc.desc      Verify stock restore then add can regrow.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_then_add_can_regrow_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_then_add_can_regrow_038');
      let cart: Cart = cartWith([cartLine(7, 15900, 10)]);
      cart.setQuantity(7, 15, 4);
      let returned: number = cart.add(7, 15900, 2);
      expect(returned).assertEqual(6);
      expect(cart.quantityOf(7)).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0390
     * @tc.name      stock_clamp_preserves_unit_price_039
     * @tc.desc      Verify stock clamp preserves unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_clamp_preserves_unit_price_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_clamp_preserves_unit_price_039');
      let cart: Cart = cartWith([cartLine(8, 15900, 10)]);
      cart.setQuantity(8, 15, 4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(15900);
        expect(line.goodsId).assertEqual(8);
      }
      expect(cart.quantityOf(8)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0400
     * @tc.name      stock_clamp_preserves_selection_state_040
     * @tc.desc      Verify stock clamp preserves selection state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_clamp_preserves_selection_state_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_clamp_preserves_selection_state_040');
      let cart: Cart = cartWith([cartLine(9, 499900, 10, false)]);
      cart.setQuantity(9, 15, 4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
      expect(cart.quantityOf(9)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0410
     * @tc.name      stock_zero_created_line_recovers_with_add_041
     * @tc.desc      Verify stock zero created line recovers with add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_created_line_recovers_with_add_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_created_line_recovers_with_add_041');
      let cart: Cart = cartWith([cartLine(10, 129900, 5)]);
      cart.setQuantity(10, 8, 0);
      expect(cart.quantityOf(10)).assertEqual(0);
      let returned: number = cart.add(10, 129900, 3, 5);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(10)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0420
     * @tc.name      stock_zero_set_on_multiple_lines_zeroes_all_042
     * @tc.desc      Verify stock zero set on multiple lines zeroes all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_on_multiple_lines_zeroes_all_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_on_multiple_lines_zeroes_all_042');
      let cart: Cart = cartWith([cartLine(1, 399900, 3), cartLine(2, 129900, 4)]);
      // Two zero-stock writes keep both lines present at 0, so the cart reports a zero total but not empty.
      cart.setQuantity(1, 8, 0);
      cart.setQuantity(2, 9, 0);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0430
     * @tc.name      stock_zero_increase_on_multiple_lines_zeroes_all_043
     * @tc.desc      Verify stock zero increase on multiple lines zeroes all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_increase_on_multiple_lines_zeroes_all_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_increase_on_multiple_lines_zeroes_all_043');
      let cart: Cart = cartWith([cartLine(1, 399900, 3), cartLine(2, 129900, 4)]);
      cart.increase(1, 1, 0);
      cart.increase(2, 1, 0);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0440
     * @tc.name      stock_zero_set_then_set_positive_recovers_044
     * @tc.desc      Verify stock zero set then set positive recovers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_then_set_positive_recovers_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_then_set_positive_recovers_044');
      let cart: Cart = cartWith([cartLine(12, 8900, 5)]);
      cart.setQuantity(12, 8, 0);
      let returned: number = cart.setQuantity(12, 3, 5);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(12)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0450
     * @tc.name      stock_zero_set_then_increase_positive_recovers_045
     * @tc.desc      Verify stock zero set then increase positive recovers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_then_increase_positive_recovers_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_then_increase_positive_recovers_045');
      let cart: Cart = cartWith([cartLine(13, 29900, 5)]);
      cart.setQuantity(13, 8, 0);
      let returned: number = cart.increase(13, 1, 5);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(13)).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0460
     * @tc.name      stock_one_set_then_add_with_default_grows_046
     * @tc.desc      Verify stock one set then add with default grows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_set_then_add_with_default_grows_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_set_then_add_with_default_grows_046');
      let cart: Cart = cartWith([cartLine(14, 19900, 5)]);
      cart.setQuantity(14, 10, 1);
      expect(cart.quantityOf(14)).assertEqual(1);
      let returned: number = cart.add(14, 19900, 2);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(14)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0470
     * @tc.name      stock_decrease_to_zero_deletes_before_clamp_047
     * @tc.desc      Verify stock decrease to zero deletes before clamp.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_decrease_to_zero_deletes_before_clamp_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_decrease_to_zero_deletes_before_clamp_047');
      let cart: Cart = cartWith([cartLine(15, 15900, 1)]);
      // The delta reaches 0, and the delete branch runs before the stock of 5 can pull the value back up.
      let returned: number = cart.decrease(15, 1, 5);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0480
     * @tc.name      stock_set_zero_overrides_a_positive_stock_048
     * @tc.desc      Verify stock set zero overrides a positive stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_set_zero_overrides_a_positive_stock_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_set_zero_overrides_a_positive_stock_048');
      let cart: Cart = cartWith([cartLine(15, 15900, 5)]);
      let returned: number = cart.setQuantity(15, 0, 99);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(15)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0490
     * @tc.name      stock_matrix_increase_controls_049
     * @tc.desc      Verify stock matrix increase controls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_matrix_increase_controls_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_matrix_increase_controls_049');
      let stocks: number[] = [1, 2, 99, 100];
      let expected: number[] = [1, 2, 55, 55];
      for (let index: number = 0; index < stocks.length; index++) {
        let cart: Cart = cartWith([cartLine(index, 1000 * (index + 1), 5)]);
        let returned: number = cart.increase(index, 50, stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index)).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0500
     * @tc.name      stock_matrix_decrease_controls_050
     * @tc.desc      Verify stock matrix decrease controls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_matrix_decrease_controls_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_matrix_decrease_controls_050');
      let stocks: number[] = [1, 2, 99, 100];
      let expected: number[] = [1, 2, 55, 55];
      for (let index: number = 0; index < stocks.length; index++) {
        // Rows 0-1 clamp 60 down to the scarce stock, while rows 2-3 simply settle at 60 - 5 = 55.
        let cart: Cart = cartWith([cartLine(index, 1000 * (index + 1), 60)]);
        let returned: number = cart.decrease(index, 5, stocks[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(index)).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0510
     * @tc.name      stock_one_add_then_increase_stays_one_051
     * @tc.desc      Verify stock one add then increase stays one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_add_then_increase_stays_one_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_add_then_increase_stays_one_051');
      let cart: Cart = new Cart();
      cart.add(0, 499900, 1, 1);
      let deltas: number[] = [1, 2, 5];

      expect(deltas.length).assertEqual(3);
      for (let index: number = 0; index < deltas.length; index++) {
        let returned: number = cart.increase(0, deltas[index], 1);
        expect(returned).assertEqual(1);
        expect(cart.quantityOf(0)).assertEqual(1);
        expect(cart.totalQuantity()).assertEqual(1);
      }
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(1);
        expect(line.unitPriceCents).assertEqual(499900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0520
     * @tc.name      stock_100_set_after_add_90_grows_to_99_052
     * @tc.desc      Verify stock 100 set after add 90 grows to 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_100_set_after_add_90_grows_to_99_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_100_set_after_add_90_grows_to_99_052');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 90, 100);
      // The 100-unit request is capped by the 99 line maximum, not by the 100 units of stock.
      let returned: number = cart.setQuantity(1, 100, 100);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(1)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.quantityOf(1) > 90).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0530
     * @tc.name      stock_zero_set_after_add_keeps_line_zero_053
     * @tc.desc      Verify stock zero set after add keeps line zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_after_add_keeps_line_zero_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_after_add_keeps_line_zero_053');
      let cart: Cart = new Cart();
      cart.add(2, 129900, 5, 10);
      let returned: number = cart.setQuantity(2, 8, 0);
      expect(returned).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0540
     * @tc.name      stock_zero_increase_after_add_keeps_line_zero_054
     * @tc.desc      Verify stock zero increase after add keeps line zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_increase_after_add_keeps_line_zero_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_increase_after_add_keeps_line_zero_054');
      let cart: Cart = new Cart();
      cart.add(2, 129900, 5, 10);
      // The line survives at quantity 0, so its 129900 unit price and goods id still count as present.
      let returned: number = cart.increase(2, 1, 0);
      expect(returned).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(0);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.allLines().length).assertEqual(1);
      expect(cart.allLines()[0].goodsId).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.lineAt(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0550
     * @tc.name      stock_zero_decrease_after_add_deletes_line_055
     * @tc.desc      Verify stock zero decrease after add deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_decrease_after_add_deletes_line_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_decrease_after_add_deletes_line_055');
      let cart: Cart = new Cart();
      cart.add(3, 59900, 1, 10);
      let returned: number = cart.decrease(3, 1, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0560
     * @tc.name      stock_100_add_then_set_stock_one_shrinks_056
     * @tc.desc      Verify stock 100 add then set stock one shrinks.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_100_add_then_set_stock_one_shrinks_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_100_add_then_set_stock_one_shrinks_056');
      let cart: Cart = new Cart();
      cart.add(4, 8900, 99, 100);
      let returned: number = cart.setQuantity(4, 10, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(4)).assertEqual(1);
      expect(cart.quantityOf(4) < 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0570
     * @tc.name      stock_one_add_then_set_99_grows_057
     * @tc.desc      Verify stock one add then set 99 grows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_add_then_set_99_grows_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_add_then_set_99_grows_057');
      let cart: Cart = new Cart();
      cart.add(5, 29900, 1, 1);
      let returned: number = cart.setQuantity(5, 50, 99);
      expect(returned).assertEqual(50);
      expect(cart.quantityOf(5)).assertEqual(50);
      expect(cart.totalQuantity()).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0580
     * @tc.name      stock_restore_does_not_change_selected_quantity_058
     * @tc.desc      Verify stock restore does not change selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_does_not_change_selected_quantity_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_does_not_change_selected_quantity_058');
      let cart: Cart = cartWith([cartLine(6, 19900, 10, true)]);
      cart.setQuantity(6, 15, 4);
      expect(cart.selectedQuantity()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0590
     * @tc.name      stock_restore_does_not_change_total_059
     * @tc.desc      Verify stock restore does not change total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_restore_does_not_change_total_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_restore_does_not_change_total_059');
      let cart: Cart = cartWith([cartLine(6, 19900, 10)]);
      cart.setQuantity(6, 15, 4);
      let totalAfterClamp: number = cart.totalQuantity();
      cart.increase(6, 0, 100);
      expect(cart.totalQuantity()).assertEqual(totalAfterClamp);
      expect(totalAfterClamp).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0600
     * @tc.name      multi_line_one_zero_stock_set_others_unaffected_060
     * @tc.desc      Verify multi line one zero stock set others unaffected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_one_zero_stock_set_others_unaffected_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_one_zero_stock_set_others_unaffected_060');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 6)]);
      cart.setQuantity(1, 9, 0);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0610
     * @tc.name      multi_line_stock_values_matrix_increase_061
     * @tc.desc      Verify multi line stock values matrix increase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_stock_values_matrix_increase_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_stock_values_matrix_increase_061');
      let stocks: number[] = [1, 2, 99, 100];
      let lines: CartLine[] = [];
      for (let index: number = 0; index < stocks.length; index++) {
        lines.push(new CartLine(index, 1000 * (index + 1), 5));
      }
      let cart: Cart = cartWith(lines);
      let expected: number[] = [1, 2, 55, 55];
      for (let index: number = 0; index < stocks.length; index++) {
        let returned: number = cart.increase(index, 50, stocks[index]);

        expect(returned === expected[index]).assertTrue();
      }
      expect(cart.quantityOf(0)).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(55);
      expect(cart.quantityOf(3)).assertEqual(55);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0620
     * @tc.name      multi_line_stock_values_matrix_decrease_062
     * @tc.desc      Verify multi line stock values matrix decrease.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_stock_values_matrix_decrease_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_stock_values_matrix_decrease_062');
      let stocks: number[] = [1, 2, 99, 100];
      let lines: CartLine[] = [];
      for (let index: number = 0; index < stocks.length; index++) {
        lines.push(new CartLine(index, 1000 * (index + 1), 60));
      }
      let cart: Cart = cartWith(lines);
      let expected: number[] = [1, 2, 55, 55];
      for (let index: number = 0; index < stocks.length; index++) {
        let returned: number = cart.decrease(index, 5, stocks[index]);

        expect(returned === expected[index]).assertTrue();
      }
      expect(cart.quantityOf(0)).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(55);
      expect(cart.quantityOf(3)).assertEqual(55);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0630
     * @tc.name      multi_line_clamp_preserves_order_063
     * @tc.desc      Verify multi line clamp preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_clamp_preserves_order_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_clamp_preserves_order_063');
      let cart: Cart = cartWith([cartLine(1, 399900, 3), cartLine(2, 129900, 4),
        cartLine(3, 59900, 5)]);
      let returned: number = cart.setQuantity(2, 20, 2);
      expect(returned).assertEqual(2);
      expect(cart.indexOf(1)).assertEqual(0);
      expect(cart.indexOf(2)).assertEqual(1);
      expect(cart.indexOf(3)).assertEqual(2);
      let middle: CartLine | undefined = cart.lineAt(1);
      expect(middle !== null && middle !== undefined).assertTrue();
      if (middle !== undefined) {
        expect(middle.goodsId).assertEqual(2);
        expect(middle.quantity).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0640
     * @tc.name      stock_one_add_existing_99_shrinks_to_one_064
     * @tc.desc      Verify stock one add existing 99 shrinks to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_add_existing_99_shrinks_to_one_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_add_existing_99_shrinks_to_one_064');
      let cart: Cart = cartWith([cartLine(7, 15900, 99)]);
      let returned: number = cart.add(7, 15900, 1, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(7)).assertEqual(1);
      expect(cart.quantityOf(7) < 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0650
     * @tc.name      stock_100_set_one_is_accepted_065
     * @tc.desc      Verify stock 100 set one is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_100_set_one_is_accepted_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_100_set_one_is_accepted_065');
      let cart: Cart = cartWith([cartLine(9, 499900, 50)]);
      let returned: number = cart.setQuantity(9, 1, 100);
      expect(returned === 1).assertTrue();
      expect(cart.quantityOf(9)).assertEqual(1);
      expect(cart.quantityOf(9) < 100).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0660
     * @tc.name      stock_zero_set_on_unknown_returns_zero_without_line_066
     * @tc.desc      Verify stock zero set on unknown returns zero without line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_set_on_unknown_returns_zero_without_line_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_set_on_unknown_returns_zero_without_line_066');
      let cart: Cart = new Cart();
      let returned: number = cart.setQuantity(9, 5, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(9)).assertFalse();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0670
     * @tc.name      stock_shrink_set_preserves_other_line_total_067
     * @tc.desc      Verify stock shrink set preserves other line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_set_preserves_other_line_total_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_set_preserves_other_line_total_067');
      let cart: Cart = cartWith([cartLine(1, 399900, 10), cartLine(2, 129900, 4)]);
      let returned: number = cart.setQuantity(1, 15, 3);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(7);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0680
     * @tc.name      stock_shrink_add_new_product_uses_new_stock_068
     * @tc.desc      Verify stock shrink add new product uses new stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_shrink_add_new_product_uses_new_stock_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_shrink_add_new_product_uses_new_stock_068');
      let cart: Cart = cartWith([cartLine(1, 399900, 5)]);
      let returned: number = cart.add(2, 129900, 10, 2);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(5);
      expect(cart.quantityOf(2)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0690
     * @tc.name      stock_zero_quantity_line_can_be_removed_069
     * @tc.desc      Verify stock zero quantity line can be removed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_quantity_line_can_be_removed_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_quantity_line_can_be_removed_069');
      let cart: Cart = cartWith([cartLine(3, 59900, 5)]);
      cart.setQuantity(3, 8, 0);
      expect(cart.quantityOf(3)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      let removed: boolean = cart.remove(3);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0700
     * @tc.name      stock_100_set_from_zero_created_line_caps_99_070
     * @tc.desc      Verify stock 100 set from zero created line caps 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_100_set_from_zero_created_line_caps_99_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_100_set_from_zero_created_line_caps_99_070');
      let cart: Cart = cartWith([cartLine(5, 29900, 5)]);
      cart.setQuantity(5, 8, 0);
      let returned: number = cart.setQuantity(5, 100, 100);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(5)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_STOCK_0710
     * @tc.name      stock_99_increase_from_98_reaches_99_071
     * @tc.desc      Verify stock 99 increase from 98 reaches 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_99_increase_from_98_reaches_99_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_99_increase_from_98_reaches_99_071');
      let cart: Cart = cartWith([cartLine(7, 15900, 98)]);
      let returned: number = cart.increase(7, 1, 99);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(7)).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
    });
  });
}
