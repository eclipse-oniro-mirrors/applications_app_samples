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

export default function cartQuantityTest() {
  describe('OrangeShoppingCartQuantity', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart quantity suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0010
     * @tc.name      set_quantity_updates_and_returns_the_value_001
     * @tc.desc      Verify set quantity updates and returns the value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_updates_and_returns_the_value_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_updates_and_returns_the_value_001');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let returned: number = cart.setQuantity(1, 5);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(1)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0020
     * @tc.name      set_quantity_zero_deletes_the_line_002
     * @tc.desc      Verify set quantity zero deletes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_zero_deletes_the_line_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_zero_deletes_the_line_002');
      let cart: Cart = cartWith([cartLine(1, 399900, 3)]);
      let returned: number = cart.setQuantity(1, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.contains(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0030
     * @tc.name      set_negative_quantities_delete_the_line_003
     * @tc.desc      Verify set negative quantities delete the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_negative_quantities_delete_the_line_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_negative_quantities_delete_the_line_003');
      let negatives: number[] = [-1, -5, -99];
      for (let index: number = 0; index < negatives.length; index++) {
        let cart: Cart = cartWith([cartLine(2, 129900, 4)]);
        let returned: number = cart.setQuantity(2, negatives[index]);
        expect(returned).assertEqual(0);
        expect(cart.isEmpty()).assertTrue();
        expect(cart.quantityOf(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0040
     * @tc.name      set_quantity_on_unknown_product_returns_zero_without_line_004
     * @tc.desc      Verify set quantity on unknown product returns zero without line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_on_unknown_product_returns_zero_without_line_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_on_unknown_product_returns_zero_without_line_004');
      let cart: Cart = new Cart();
      let returned: number = cart.setQuantity(9, 5);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(9)).assertFalse();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0050
     * @tc.name      set_quantity_above_99_caps_005
     * @tc.desc      Verify set quantity above 99 caps.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_above_99_caps_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_above_99_caps_005');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      // Stock 500 is well above 150, yet the hard 99 ceiling still decides the stored quantity.
      let returned: number = cart.setQuantity(4, 150, 500);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(4)).assertEqual(99);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(99);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0060
     * @tc.name      set_quantity_99_is_accepted_006
     * @tc.desc      Verify set quantity 99 is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_99_is_accepted_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_99_is_accepted_006');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let returned: number = cart.setQuantity(4, 99, 500);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(4)).assertEqual(99);
      expect(cart.quantityOf(4) === 99).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0070
     * @tc.name      set_quantity_preserves_unit_price_007
     * @tc.desc      Verify set quantity preserves unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_preserves_unit_price_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_preserves_unit_price_007');
      let cart: Cart = cartWith([cartLine(5, 29900, 2)]);
      cart.setQuantity(5, 7);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(29900);
        expect(line.goodsId).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0080
     * @tc.name      set_quantity_preserves_selected_flag_008
     * @tc.desc      Verify set quantity preserves selected flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_preserves_selected_flag_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_preserves_selected_flag_008');
      let cart: Cart = cartWith([cartLine(5, 29900, 2, false)]);
      cart.setQuantity(5, 6);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
      expect(cart.quantityOf(5)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0090
     * @tc.name      set_quantity_affects_only_the_target_line_009
     * @tc.desc      Verify set quantity affects only the target line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_affects_only_the_target_line_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_affects_only_the_target_line_009');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.setQuantity(1, 8);
      expect(cart.quantityOf(1)).assertEqual(8);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0100
     * @tc.name      repeated_set_to_same_value_is_idempotent_010
     * @tc.desc      Verify repeated set to same value is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_set_to_same_value_is_idempotent_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_set_to_same_value_is_idempotent_010');
      let cart: Cart = cartWith([cartLine(6, 19900, 2)]);
      let first: number = cart.setQuantity(6, 4);
      let second: number = cart.setQuantity(6, 4);
      expect(first).assertEqual(4);
      expect(second).assertEqual(4);
      expect(cart.quantityOf(6)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0110
     * @tc.name      set_quantity_can_grow_within_stock_011
     * @tc.desc      Verify set quantity can grow within stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_can_grow_within_stock_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_can_grow_within_stock_011');
      let cart: Cart = cartWith([cartLine(7, 15900, 2)]);
      let returned: number = cart.setQuantity(7, 7, 10);
      expect(returned).assertEqual(7);
      expect(cart.quantityOf(7)).assertEqual(7);
      expect(cart.quantityOf(7) > 2).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0120
     * @tc.name      set_quantity_can_shrink_within_stock_012
     * @tc.desc      Verify set quantity can shrink within stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_can_shrink_within_stock_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_can_shrink_within_stock_012');
      let cart: Cart = cartWith([cartLine(7, 15900, 8)]);
      let returned: number = cart.setQuantity(7, 3);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(7)).assertEqual(3);
      expect(cart.quantityOf(7) < 8).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0130
     * @tc.name      set_quantity_on_second_line_updates_only_it_013
     * @tc.desc      Verify set quantity on second line updates only it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_on_second_line_updates_only_it_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_on_second_line_updates_only_it_013');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2)]);
      cart.setQuantity(2, 9);
      expect(cart.quantityOf(1)).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(9);
      expect(cart.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0140
     * @tc.name      set_quantity_zero_on_second_line_keeps_first_014
     * @tc.desc      Verify set quantity zero on second line keeps first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_zero_on_second_line_keeps_first_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_zero_on_second_line_keeps_first_014');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2)]);
      let returned: number = cart.setQuantity(2, 0);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(1)).assertTrue();
      expect(cart.quantityOf(1)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0150
     * @tc.name      set_quantity_grows_again_after_a_shrink_015
     * @tc.desc      Verify set quantity grows again after a shrink.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_grows_again_after_a_shrink_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_grows_again_after_a_shrink_015');
      let cart: Cart = cartWith([cartLine(8, 15900, 5)]);
      cart.setQuantity(8, 2);
      let returned: number = cart.setQuantity(8, 8, 10);
      expect(returned).assertEqual(8);
      expect(cart.quantityOf(8)).assertEqual(8);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0160
     * @tc.name      set_quantity_keeps_the_goods_identity_016
     * @tc.desc      Verify set quantity keeps the goods identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_keeps_the_goods_identity_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_keeps_the_goods_identity_016');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      cart.setQuantity(4, 6);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.goodsId).assertEqual(4);
      }
      expect(cart.indexOf(4)).assertEqual(0);
      expect(cart.indexOf(6)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0170
     * @tc.name      set_same_value_keeps_unselected_state_017
     * @tc.desc      Verify set same value keeps unselected state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_same_value_keeps_unselected_state_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_same_value_keeps_unselected_state_017');
      let cart: Cart = cartWith([cartLine(6, 19900, 3, false)]);
      cart.setQuantity(6, 5);
      cart.setQuantity(6, 5);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
        expect(line.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0180
     * @tc.name      increase_by_default_adds_one_018
     * @tc.desc      Verify increase by default adds one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_by_default_adds_one_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_by_default_adds_one_018');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let returned: number = cart.increase(1);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0190
     * @tc.name      increase_applies_the_delta_and_caps_at_ninety_nine_019
     * @tc.desc      Verify increase applies the delta and caps at ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_applies_the_delta_and_caps_at_ninety_nine_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_applies_the_delta_and_caps_at_ninety_nine_019');
      // The second row would be 90 + 20 = 110, so the 99 ceiling supplies that expected 99.
      let starts: number[] = [2, 90];
      let deltas: number[] = [4, 20];
      let expected: number[] = [6, 99];
      expect(starts.length).assertEqual(expected.length);
      expect(deltas.length).assertEqual(expected.length);
      for (let index: number = 0; index < starts.length; index++) {
        let goodsId: number = 1 + index;
        let cart: Cart = cartWith([cartLine(goodsId, 399900, starts[index])]);
        let returned: number = cart.increase(goodsId, deltas[index]);
        expect(returned).assertEqual(expected[index]);
        expect(cart.quantityOf(goodsId)).assertEqual(expected[index]);
        expect(cart.totalQuantity()).assertEqual(expected[index]);
        expect(cart.quantityOf(goodsId) <= 99).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0200
     * @tc.name      increase_across_multiple_steps_accumulates_020
     * @tc.desc      Verify increase across multiple steps accumulates.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_across_multiple_steps_accumulates_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_across_multiple_steps_accumulates_020');
      let cart: Cart = cartWith([cartLine(2, 129900, 1)]);
      // Starting from 1, three separate +2 calls land on 3, 5 and 7.
      let expected: number[] = [3, 5, 7];
      for (let index: number = 0; index < expected.length; index++) {
        let returned: number = cart.increase(2, 2);
        expect(returned).assertEqual(expected[index]);
      }
      expect(cart.quantityOf(2)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0210
     * @tc.name      increase_on_unknown_product_returns_zero_without_line_021
     * @tc.desc      Verify increase on unknown product returns zero without line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_on_unknown_product_returns_zero_without_line_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_on_unknown_product_returns_zero_without_line_021');
      let cart: Cart = new Cart();
      let returned: number = cart.increase(9, 3);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(9)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0220
     * @tc.name      increase_with_negative_delta_lowers_quantity_022
     * @tc.desc      Verify increase with negative delta lowers quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_with_negative_delta_lowers_quantity_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_with_negative_delta_lowers_quantity_022');
      let cart: Cart = cartWith([cartLine(5, 29900, 5)]);
      let returned: number = cart.increase(5, -2);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(5)).assertEqual(3);
      expect(cart.quantityOf(5) < 5).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0230
     * @tc.name      increase_by_zero_leaves_quantity_unchanged_023
     * @tc.desc      Verify increase by zero leaves quantity unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_by_zero_leaves_quantity_unchanged_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_by_zero_leaves_quantity_unchanged_023');
      let cart: Cart = cartWith([cartLine(5, 29900, 5)]);
      let returned: number = cart.increase(5, 0);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(5)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0240
     * @tc.name      increase_preserves_unit_price_and_selection_024
     * @tc.desc      Verify increase preserves unit price and selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_preserves_unit_price_and_selection_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_preserves_unit_price_and_selection_024');
      let cart: Cart = cartWith([cartLine(6, 19900, 1, false)]);
      cart.increase(6, 2);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(19900);
        expect(line.selected).assertFalse();
        expect(line.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0250
     * @tc.name      increase_then_set_overrides_the_quantity_025
     * @tc.desc      Verify increase then set overrides the quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_then_set_overrides_the_quantity_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_then_set_overrides_the_quantity_025');
      let cart: Cart = cartWith([cartLine(7, 15900, 2)]);
      cart.increase(7, 1);
      let returned: number = cart.setQuantity(7, 7);
      expect(returned).assertEqual(7);
      expect(cart.quantityOf(7)).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0260
     * @tc.name      increase_on_one_line_leaves_the_other_line_alone_026
     * @tc.desc      Verify increase on one line leaves the other line alone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_on_one_line_leaves_the_other_line_alone_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_on_one_line_leaves_the_other_line_alone_026');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let returned: number = cart.increase(2, 4);
      expect(returned).assertEqual(7);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0270
     * @tc.name      decrease_by_default_subtracts_one_027
     * @tc.desc      Verify decrease by default subtracts one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_by_default_subtracts_one_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_by_default_subtracts_one_027');
      let cart: Cart = cartWith([cartLine(1, 399900, 3)]);
      let returned: number = cart.decrease(1);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0280
     * @tc.name      decrease_across_multiple_steps_accumulates_028
     * @tc.desc      Verify decrease across multiple steps accumulates.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_across_multiple_steps_accumulates_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_across_multiple_steps_accumulates_028');
      let cart: Cart = cartWith([cartLine(2, 129900, 5)]);
      // Two -1 calls walk the line from 5 down to 4 and then 3.
      let expected: number[] = [4, 3];
      for (let index: number = 0; index < expected.length; index++) {
        let returned: number = cart.decrease(2, 1);
        expect(returned).assertEqual(expected[index]);
      }
      expect(cart.quantityOf(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0290
     * @tc.name      decrease_to_zero_deletes_the_line_029
     * @tc.desc      Verify decrease to zero deletes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_to_zero_deletes_the_line_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_to_zero_deletes_the_line_029');
      let cart: Cart = cartWith([cartLine(3, 59900, 1)]);
      let returned: number = cart.decrease(3);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(3)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0300
     * @tc.name      decrease_past_zero_deletes_the_line_030
     * @tc.desc      Verify decrease past zero deletes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_past_zero_deletes_the_line_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_past_zero_deletes_the_line_030');
      let cart: Cart = cartWith([cartLine(3, 59900, 3)]);
      let returned: number = cart.decrease(3, 5);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(3)).assertFalse();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0310
     * @tc.name      decrease_one_below_remaining_keeps_one_031
     * @tc.desc      Verify decrease one below remaining keeps one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_one_below_remaining_keeps_one_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_one_below_remaining_keeps_one_031');
      let cart: Cart = cartWith([cartLine(4, 8900, 4)]);
      let returned: number = cart.decrease(4, 3);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(4)).assertEqual(1);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0320
     * @tc.name      decrease_on_unknown_product_returns_zero_without_line_032
     * @tc.desc      Verify decrease on unknown product returns zero without line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_on_unknown_product_returns_zero_without_line_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_on_unknown_product_returns_zero_without_line_032');
      let cart: Cart = new Cart();
      let returned: number = cart.decrease(9, 2);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(9)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0330
     * @tc.name      decrease_keeps_other_lines_intact_033
     * @tc.desc      Verify decrease keeps other lines intact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_keeps_other_lines_intact_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_keeps_other_lines_intact_033');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 3)]);
      let returned: number = cart.decrease(1, 2);
      expect(returned).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0340
     * @tc.name      decrease_by_zero_leaves_quantity_unchanged_034
     * @tc.desc      Verify decrease by zero leaves quantity unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_by_zero_leaves_quantity_unchanged_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_by_zero_leaves_quantity_unchanged_034');
      let cart: Cart = cartWith([cartLine(4, 8900, 4)]);
      let returned: number = cart.decrease(4, 0);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(4)).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0350
     * @tc.name      decrease_with_negative_delta_increases_quantity_035
     * @tc.desc      Verify decrease with negative delta increases quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_with_negative_delta_increases_quantity_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_with_negative_delta_increases_quantity_035');
      let cart: Cart = cartWith([cartLine(5, 29900, 2)]);
      let returned: number = cart.decrease(5, -2);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(5)).assertEqual(4);
      expect(cart.quantityOf(5) > 2).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0360
     * @tc.name      decrease_from_two_to_one_keeps_the_line_036
     * @tc.desc      Verify decrease from two to one keeps the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_from_two_to_one_keeps_the_line_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_from_two_to_one_keeps_the_line_036');
      let cart: Cart = cartWith([cartLine(6, 19900, 2)]);
      let returned: number = cart.decrease(6);
      expect(returned).assertEqual(1);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.contains(6)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0370
     * @tc.name      decrease_then_increase_restores_quantity_037
     * @tc.desc      Verify decrease then increase restores quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_then_increase_restores_quantity_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_then_increase_restores_quantity_037');
      let cart: Cart = cartWith([cartLine(7, 15900, 5)]);
      cart.decrease(7, 2);
      let returned: number = cart.increase(7, 2);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(7)).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0380
     * @tc.name      decrease_on_one_line_leaves_the_other_line_alone_038
     * @tc.desc      Verify decrease on one line leaves the other line alone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_on_one_line_leaves_the_other_line_alone_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_on_one_line_leaves_the_other_line_alone_038');
      let cart: Cart = cartWith([cartLine(1, 399900, 4), cartLine(2, 129900, 6)]);
      let returned: number = cart.decrease(2, 2);
      expect(returned).assertEqual(4);
      expect(cart.quantityOf(1)).assertEqual(4);
      expect(cart.quantityOf(2)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0390
     * @tc.name      decrease_with_negative_delta_caps_at_99_039
     * @tc.desc      Verify decrease with negative delta caps at 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_with_negative_delta_caps_at_99_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_with_negative_delta_caps_at_99_039');
      let cart: Cart = cartWith([cartLine(8, 15900, 90)]);
      // A negative delta grows the line: 90 + 20 = 110, which the 99 ceiling clamps.
      let returned: number = cart.decrease(8, -20);
      expect(returned).assertEqual(99);
      expect(cart.quantityOf(8)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0400
     * @tc.name      quantity_of_unknown_product_returns_zero_040
     * @tc.desc      Verify quantity of unknown product returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_unknown_product_returns_zero_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_unknown_product_returns_zero_040');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      expect(cart.quantityOf(9)).assertEqual(0);
      expect(cart.contains(9)).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0410
     * @tc.name      quantity_of_reflects_current_quantity_041
     * @tc.desc      Verify quantity of reflects current quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_reflects_current_quantity_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_reflects_current_quantity_041');
      let cart: Cart = cartWith([cartLine(2, 129900, 3)]);
      cart.setQuantity(2, 7);
      expect(cart.quantityOf(2)).assertEqual(7);
      cart.increase(2, 2);
      expect(cart.quantityOf(2)).assertEqual(9);
      cart.decrease(2, 4);
      expect(cart.quantityOf(2)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0420
     * @tc.name      quantity_of_tracks_each_product_independently_042
     * @tc.desc      Verify quantity of tracks each product independently.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_tracks_each_product_independently_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_tracks_each_product_independently_042');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let expected: number[] = [2, 3, 4];
      for (let index: number = 0; index < expected.length; index++) {
        expect(cart.quantityOf(index + 1)).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0430
     * @tc.name      quantity_of_returns_zero_on_empty_cart_043
     * @tc.desc      Verify quantity of returns zero on empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_returns_zero_on_empty_cart_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_returns_zero_on_empty_cart_043');
      let cart: Cart = new Cart();
      expect(cart.quantityOf(0)).assertEqual(0);
      expect(cart.quantityOf(-1)).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0440
     * @tc.name      quantity_of_after_set_to_zero_returns_zero_044
     * @tc.desc      Verify quantity of after set to zero returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_after_set_to_zero_returns_zero_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_after_set_to_zero_returns_zero_044');
      let cart: Cart = cartWith([cartLine(5, 29900, 3)]);
      cart.setQuantity(5, 0);
      expect(cart.quantityOf(5)).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0450
     * @tc.name      quantity_of_after_increase_and_decrease_sequence_045
     * @tc.desc      Verify quantity of after increase and decrease sequence.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_after_increase_and_decrease_sequence_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_after_increase_and_decrease_sequence_045');
      let cart: Cart = cartWith([cartLine(6, 19900, 2)]);
      cart.increase(6, 3);
      cart.decrease(6, 2);
      expect(cart.quantityOf(6)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.selectedQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0460
     * @tc.name      total_quantity_sums_all_lines_046
     * @tc.desc      Verify total quantity sums all lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_sums_all_lines_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_sums_all_lines_046');
      // 2 + 3 + 4 across the three lines is the 9 the sum must report.
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      expect(cart.totalQuantity()).assertEqual(9);
      expect(cart.distinctCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0470
     * @tc.name      total_quantity_updates_after_set_047
     * @tc.desc      Verify total quantity updates after set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_updates_after_set_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_updates_after_set_047');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.setQuantity(1, 8);
      expect(cart.totalQuantity()).assertEqual(11);
      expect(cart.quantityOf(1)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0480
     * @tc.name      total_quantity_updates_after_increase_048
     * @tc.desc      Verify total quantity updates after increase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_updates_after_increase_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_updates_after_increase_048');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      // Line 2 becomes 3 + 5 = 8, so the cart total rises to 2 + 8 = 10.
      cart.increase(2, 5);
      expect(cart.totalQuantity()).assertEqual(10);
      expect(cart.quantityOf(2)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0490
     * @tc.name      total_quantity_updates_after_decrease_049
     * @tc.desc      Verify total quantity updates after decrease.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_updates_after_decrease_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_updates_after_decrease_049');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 3)]);
      cart.decrease(1, 2);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.quantityOf(1)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0500
     * @tc.name      total_quantity_drops_when_set_zero_deletes_line_050
     * @tc.desc      Verify total quantity drops when set zero deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_drops_when_set_zero_deletes_line_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_drops_when_set_zero_deletes_line_050');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.setQuantity(1, 0);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0510
     * @tc.name      total_quantity_is_zero_for_empty_cart_051
     * @tc.desc      Verify total quantity is zero for empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_is_zero_for_empty_cart_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_is_zero_for_empty_cart_051');
      let cart: Cart = new Cart();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0520
     * @tc.name      total_quantity_counts_unselected_lines_052
     * @tc.desc      Verify total quantity counts unselected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_counts_unselected_lines_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_counts_unselected_lines_052');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.totalQuantity() > cart.selectedQuantity()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0530
     * @tc.name      total_quantity_after_multiple_operations_053
     * @tc.desc      Verify total quantity after multiple operations.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_after_multiple_operations_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_after_multiple_operations_053');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      // Three interleaved edits: line 1 ends at 5 - 2 = 3, line 2 at 3 + 2 = 5, total 8.
      cart.setQuantity(1, 5);
      cart.increase(2, 2);
      cart.decrease(1, 2);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.quantityOf(2)).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0540
     * @tc.name      selected_quantity_equals_total_after_selected_line_grows_054
     * @tc.desc      Verify selected quantity equals total after selected line grows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_equals_total_after_selected_line_grows_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_equals_total_after_selected_line_grows_054');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      // Line 1 grows to 2 + 4 = 6, so selected quantity 6 + 3 equals the total.
      cart.increase(1, 4);
      expect(cart.quantityOf(1)).assertEqual(6);
      expect(cart.selectedQuantity()).assertEqual(9);
      expect(cart.totalQuantity()).assertEqual(9);
      expect(cart.selectedQuantity() === cart.totalQuantity()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0550
     * @tc.name      selected_quantity_difference_equals_unselected_sum_055
     * @tc.desc      Verify selected quantity difference equals unselected sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_difference_equals_unselected_sum_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_difference_equals_unselected_sum_055');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false), cartLine(3, 59900, 4, false)]);
      // Only goods 1 is selected (2 units); the 3 and 4 units stay unselected, so 9 - 2 = 7.
      let selected: number = cart.selectedQuantity();
      let total: number = cart.totalQuantity();
      expect(selected).assertEqual(2);
      expect(total).assertEqual(9);
      expect(total - selected).assertEqual(7);
      expect(cart.quantityOf(2) + cart.quantityOf(3)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0560
     * @tc.name      selected_quantity_updates_after_set_on_selected_line_056
     * @tc.desc      Verify selected quantity updates after set on selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_updates_after_set_on_selected_line_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_updates_after_set_on_selected_line_056');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.setQuantity(1, 7);
      expect(cart.quantityOf(1)).assertEqual(7);
      expect(cart.selectedQuantity()).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0570
     * @tc.name      selected_quantity_unchanged_for_unselected_line_change_057
     * @tc.desc      Verify selected quantity unchanged for unselected line change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_unchanged_for_unselected_line_change_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_unchanged_for_unselected_line_change_057');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.increase(2, 4);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(9);
      expect(cart.selectedQuantity() !== cart.totalQuantity()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0580
     * @tc.name      selected_quantity_survives_unselected_line_deletion_058
     * @tc.desc      Verify selected quantity survives unselected line deletion.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_survives_unselected_line_deletion_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_survives_unselected_line_deletion_058');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      // Removing the unselected line leaves only goods 1, so every remaining line is selected.
      let removed: number = cart.setQuantity(2, 0);
      expect(removed).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.allLines()[0].goodsId).assertEqual(1);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0590
     * @tc.name      selected_quantity_drops_when_selected_line_is_deleted_059
     * @tc.desc      Verify selected quantity drops when selected line is deleted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_drops_when_selected_line_is_deleted_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_drops_when_selected_line_is_deleted_059');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      let removed: number = cart.setQuantity(1, 0);
      expect(removed).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.allLines()[0].goodsId).assertEqual(2);
      expect(cart.allLines()[0].selected).assertFalse();
      expect(cart.selectedQuantity() < cart.totalQuantity()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0600
     * @tc.name      selected_quantity_is_zero_for_empty_cart_060
     * @tc.desc      Verify selected quantity is zero for empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_is_zero_for_empty_cart_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_is_zero_for_empty_cart_060');
      let cart: Cart = new Cart();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0610
     * @tc.name      selected_quantity_stays_zero_after_unselected_growth_061
     * @tc.desc      Verify selected quantity stays zero after unselected growth.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_stays_zero_after_unselected_growth_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_stays_zero_after_unselected_growth_061');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, false),
        cartLine(2, 129900, 3, false)]);
      cart.increase(1, 4);
      expect(cart.quantityOf(1)).assertEqual(6);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(9);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0620
     * @tc.name      selected_quantity_tracks_quantity_change_sweep_062
     * @tc.desc      Verify selected quantity tracks quantity change sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_tracks_quantity_change_sweep_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_tracks_quantity_change_sweep_062');
      let cart: Cart = cartWith([cartLine(0, 499900, 1, true)]);
      // The same selected line is resized three times; total and selected must track each value.
      let quantities: number[] = [3, 6, 9];
      for (let index: number = 0; index < quantities.length; index++) {
        cart.setQuantity(0, quantities[index]);
        expect(cart.totalQuantity()).assertEqual(quantities[index]);
        expect(cart.selectedQuantity()).assertEqual(quantities[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0630
     * @tc.name      selected_quantity_tracks_decrease_on_selected_line_063
     * @tc.desc      Verify selected quantity tracks decrease on selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_tracks_decrease_on_selected_line_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_tracks_decrease_on_selected_line_063');
      let cart: Cart = cartWith([cartLine(1, 399900, 6, true),
        cartLine(2, 129900, 2, false)]);
      cart.decrease(1, 2);
      expect(cart.selectedQuantity()).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.quantityOf(1)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0640
     * @tc.name      set_last_write_wins_across_two_values_064
     * @tc.desc      Verify set last write wins across two values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_last_write_wins_across_two_values_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_last_write_wins_across_two_values_064');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.setQuantity(1, 5);
      let returned: number = cart.setQuantity(1, 8);
      expect(returned).assertEqual(8);
      expect(cart.quantityOf(1)).assertEqual(8);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0650
     * @tc.name      set_quantity_zero_after_increase_deletes_line_065
     * @tc.desc      Verify set quantity zero after increase deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_zero_after_increase_deletes_line_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_zero_after_increase_deletes_line_065');
      let cart: Cart = cartWith([cartLine(3, 59900, 2)]);
      cart.increase(3, 3);
      expect(cart.quantityOf(3)).assertEqual(5);
      let returned: number = cart.setQuantity(3, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0660
     * @tc.name      set_quantity_zero_on_unknown_with_populated_cart_066
     * @tc.desc      Verify set quantity zero on unknown with populated cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_zero_on_unknown_with_populated_cart_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_zero_on_unknown_with_populated_cart_066');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let returned: number = cart.setQuantity(9, 0);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.contains(9)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0670
     * @tc.name      set_quantity_on_three_lines_updates_each_067
     * @tc.desc      Verify set quantity on three lines updates each.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_on_three_lines_updates_each_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_on_three_lines_updates_each_067');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2),
        cartLine(3, 59900, 3)]);
      // Goods 1, 2 and 3 take 4, 5 and 6, so the resulting total is 15.
      let quantities: number[] = [4, 5, 6];
      for (let index: number = 0; index < quantities.length; index++) {
        let returned: number = cart.setQuantity(index + 1, quantities[index]);
        expect(returned).assertEqual(quantities[index]);
      }
      expect(cart.quantityOf(1)).assertEqual(4);
      expect(cart.quantityOf(2)).assertEqual(5);
      expect(cart.quantityOf(3)).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0680
     * @tc.name      increase_negative_delta_equal_to_quantity_deletes_line_068
     * @tc.desc      Verify increase negative delta equal to quantity deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_negative_delta_equal_to_quantity_deletes_line_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_negative_delta_equal_to_quantity_deletes_line_068');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let returned: number = cart.increase(4, -2);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0690
     * @tc.name      increase_negative_delta_beyond_quantity_deletes_line_069
     * @tc.desc      Verify increase negative delta beyond quantity deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_negative_delta_beyond_quantity_deletes_line_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_negative_delta_beyond_quantity_deletes_line_069');
      let cart: Cart = cartWith([cartLine(4, 8900, 2)]);
      let returned: number = cart.increase(4, -5);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0700
     * @tc.name      decrease_from_cap_subtracts_one_070
     * @tc.desc      Verify decrease from cap subtracts one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_from_cap_subtracts_one_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_from_cap_subtracts_one_070');
      let cart: Cart = cartWith([cartLine(5, 29900, 99)]);
      let returned: number = cart.decrease(5);
      expect(returned).assertEqual(98);
      expect(cart.quantityOf(5)).assertEqual(98);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(98);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0710
     * @tc.name      decrease_to_zero_on_second_line_keeps_first_071
     * @tc.desc      Verify decrease to zero on second line keeps first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_to_zero_on_second_line_keeps_first_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_to_zero_on_second_line_keeps_first_071');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let returned: number = cart.decrease(2, 3);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(1)).assertTrue();
      expect(cart.quantityOf(1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0720
     * @tc.name      decrease_beyond_quantity_on_one_of_two_keeps_other_072
     * @tc.desc      Verify decrease beyond quantity on one of two keeps other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_beyond_quantity_on_one_of_two_keeps_other_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_beyond_quantity_on_one_of_two_keeps_other_072');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let returned: number = cart.decrease(1, 10);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0730
     * @tc.name      decrease_each_of_two_lines_in_loop_073
     * @tc.desc      Verify decrease each of two lines in loop.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_each_of_two_lines_in_loop_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_each_of_two_lines_in_loop_073');
      let cart: Cart = cartWith([cartLine(1, 399900, 5), cartLine(2, 129900, 6)]);
      // Line 5 drops by 1 to 4 and line 6 by 2 to 4, leaving a total of 8.
      let deltas: number[] = [1, 2];
      for (let index: number = 0; index < deltas.length; index++) {
        let returned: number = cart.decrease(index + 1, deltas[index]);
        expect(returned).assertEqual(4);
      }
      expect(cart.quantityOf(1)).assertEqual(4);
      expect(cart.quantityOf(2)).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0740
     * @tc.name      quantity_of_zero_goods_id_returns_quantity_074
     * @tc.desc      Verify quantity of zero goods id returns quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_zero_goods_id_returns_quantity_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_zero_goods_id_returns_quantity_074');
      let cart: Cart = cartWith([cartLine(0, 499900, 4)]);
      expect(cart.quantityOf(0)).assertEqual(4);
      expect(cart.indexOf(0)).assertEqual(0);
      expect(cart.contains(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0750
     * @tc.name      quantity_of_negative_id_tracks_a_merge_075
     * @tc.desc      Verify quantity of negative id tracks a merge.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_negative_id_tracks_a_merge_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_negative_id_tracks_a_merge_075');
      let cart: Cart = cartWith([cartLine(-1, 1000, 3)]);
      let returned: number = cart.add(-1, 1000, 2);
      expect(returned).assertEqual(5);
      expect(cart.quantityOf(-1)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0760
     * @tc.name      total_quantity_sums_a_larger_cart_076
     * @tc.desc      Verify total quantity sums a larger cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_sums_a_larger_cart_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_sums_a_larger_cart_076');
      let quantities: number[] = [1, 2, 3, 4, 5];
      let lines: CartLine[] = [];
      for (let index: number = 0; index < quantities.length; index++) {
        // Quantities 1..5 sum to 15; unit prices scale as 1000 x (index + 1).
        lines.push(new CartLine(index, 1000 * (index + 1), quantities[index]));
      }
      let cart: Cart = cartWith(lines);
      expect(cart.totalQuantity()).assertEqual(15);
      expect(cart.distinctCount()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0770
     * @tc.name      total_quantity_tracks_repeated_sets_077
     * @tc.desc      Verify total quantity tracks repeated sets.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_tracks_repeated_sets_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_tracks_repeated_sets_077');
      let cart: Cart = cartWith([cartLine(6, 19900, 1)]);
      cart.setQuantity(6, 2);
      cart.setQuantity(6, 6);
      cart.setQuantity(6, 3);
      expect(cart.quantityOf(6)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0780
     * @tc.name      total_quantity_after_zeroing_one_and_growing_other_078
     * @tc.desc      Verify total quantity after zeroing one and growing other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_after_zeroing_one_and_growing_other_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_after_zeroing_one_and_growing_other_078');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.setQuantity(1, 0);
      cart.increase(2, 4);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0790
     * @tc.name      selected_quantity_with_two_of_three_after_increase_079
     * @tc.desc      Verify selected quantity with two of three after increase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_with_two_of_three_after_increase_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_with_two_of_three_after_increase_079');
      let cart: Cart = cartWith([cartLine(1, 399900, 1, true),
        cartLine(2, 129900, 2, false), cartLine(3, 59900, 4, true)]);
      // Goods 1 and 3 are selected: after 1 grows to 2, selected = 2 + 4 = 6 while total = 2 + 2 + 4 = 8.
      cart.increase(1, 1);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(8);
      expect(cart.quantityOf(2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0800
     * @tc.name      selected_quantity_after_lowering_selected_line_080
     * @tc.desc      Verify selected quantity after lowering selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_after_lowering_selected_line_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_after_lowering_selected_line_080');
      let cart: Cart = cartWith([cartLine(1, 399900, 6, true),
        cartLine(2, 129900, 3, false)]);
      let returned: number = cart.setQuantity(1, 2);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0810
     * @tc.name      isolated_changes_on_three_lines_081
     * @tc.desc      Verify isolated changes on three lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('isolated_changes_on_three_lines_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: isolated_changes_on_three_lines_081');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      // Each line is edited once: 2 becomes 5, 3 becomes 5, 4 becomes 3, so the total is 13.
      cart.setQuantity(1, 5);
      cart.increase(2, 2);
      cart.decrease(3, 1);
      expect(cart.quantityOf(1)).assertEqual(5);
      expect(cart.quantityOf(2)).assertEqual(5);
      expect(cart.quantityOf(3)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(13);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0820
     * @tc.name      set_deletion_preserves_order_of_remaining_lines_082
     * @tc.desc      Verify set deletion preserves order of remaining lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_deletion_preserves_order_of_remaining_lines_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_deletion_preserves_order_of_remaining_lines_082');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2),
        cartLine(3, 59900, 3)]);
      let returned: number = cart.setQuantity(2, 0);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(1)).assertEqual(0);
      expect(cart.indexOf(3)).assertEqual(1);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(second !== null && second !== undefined).assertTrue();
      if (second !== undefined) {
        expect(second.goodsId).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0830
     * @tc.name      selected_quantity_after_decrease_unselected_stays_083
     * @tc.desc      Verify selected quantity after decrease unselected stays.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_after_decrease_unselected_stays_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_after_decrease_unselected_stays_083');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.decrease(2, 2);
      expect(cart.quantityOf(2)).assertEqual(1);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0840
     * @tc.name      set_quantity_to_one_from_99_084
     * @tc.desc      Verify set quantity to one from 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_to_one_from_99_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_to_one_from_99_084');
      let cart: Cart = cartWith([cartLine(7, 15900, 99)]);
      let returned: number = cart.setQuantity(7, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(7)).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0850
     * @tc.name      decrease_multiple_steps_to_one_keeps_line_085
     * @tc.desc      Verify decrease multiple steps to one keeps line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_multiple_steps_to_one_keeps_line_085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_multiple_steps_to_one_keeps_line_085');
      let cart: Cart = cartWith([cartLine(8, 15900, 4)]);
      let expected: number[] = [3, 2, 1];
      for (let index: number = 0; index < expected.length; index++) {
        let returned: number = cart.decrease(8);
        expect(returned).assertEqual(expected[index]);
      }
      expect(cart.isEmpty()).assertFalse();
      expect(cart.contains(8)).assertTrue();
      expect(cart.quantityOf(8)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0860
     * @tc.name      quantity_changes_do_not_alter_other_line_prices_086
     * @tc.desc      Verify quantity changes do not alter other line prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_changes_do_not_alter_other_line_prices_086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_changes_do_not_alter_other_line_prices_086');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(2, 2000, 3)]);
      // Line 1 ends at 5 - 2 = 3 and line 2 at 3 + 3 = 6, yet both unit prices must stay as set.
      cart.setQuantity(1, 5);
      cart.increase(2, 3);
      cart.decrease(1, 2);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.unitPriceCents).assertEqual(1000);
        expect(second.unitPriceCents).assertEqual(2000);
        expect(first.quantity).assertEqual(3);
        expect(second.quantity).assertEqual(6);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0870
     * @tc.name      selected_quantity_after_increasing_two_selected_lines_087
     * @tc.desc      Verify selected quantity after increasing two selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selected_quantity_after_increasing_two_selected_lines_087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selected_quantity_after_increasing_two_selected_lines_087');
      let cart: Cart = cartWith([cartLine(1, 399900, 1, true),
        cartLine(2, 129900, 2, false), cartLine(3, 59900, 3, true)]);
      cart.increase(1, 1);
      // Two selected lines each grow by one: 2 + 4 = 6 selected out of 2 + 2 + 4 = 8 total.
      cart.increase(3, 1);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(8);
      expect(cart.quantityOf(2)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0880
     * @tc.name      decrease_to_zero_after_increase_deletes_line_088
     * @tc.desc      Verify decrease to zero after increase deletes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_to_zero_after_increase_deletes_line_088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_to_zero_after_increase_deletes_line_088');
      let cart: Cart = cartWith([cartLine(9, 499900, 1)]);
      cart.increase(9, 2);
      expect(cart.quantityOf(9)).assertEqual(3);
      let returned: number = cart.decrease(9, 3);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(9)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0890
     * @tc.name      increase_after_set_deletion_returns_zero_089
     * @tc.desc      Verify increase after set deletion returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_after_set_deletion_returns_zero_089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_after_set_deletion_returns_zero_089');
      let cart: Cart = cartWith([cartLine(10, 129900, 2)]);
      cart.setQuantity(10, 0);
      expect(cart.isEmpty()).assertTrue();
      let returned: number = cart.increase(10, 3);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(10)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0900
     * @tc.name      set_quantity_preserves_other_line_selection_state_090
     * @tc.desc      Verify set quantity preserves other line selection state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_preserves_other_line_selection_state_090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_preserves_other_line_selection_state_090');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.setQuantity(1, 5);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertTrue();
        expect(second.selected).assertFalse();
      }
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_QUANTITY_0910
     * @tc.name      failed_increase_on_unknown_leaves_totals_unchanged_091
     * @tc.desc      Verify failed increase on unknown leaves totals unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('failed_increase_on_unknown_leaves_totals_unchanged_091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: failed_increase_on_unknown_leaves_totals_unchanged_091');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      let returned: number = cart.increase(9, 5);
      expect(returned).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.contains(9)).assertFalse();
    });
  });
}
