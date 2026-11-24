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

export default function cartRemoveTest() {
  describe('OrangeShoppingCartRemove', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart remove suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0010
     * @tc.name      remove_existing_line_returns_true_001
     * @tc.desc      Verify remove existing line returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_existing_line_returns_true_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_existing_line_returns_true_001');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0020
     * @tc.name      remove_existing_line_reduces_distinct_count_002
     * @tc.desc      Verify remove existing line reduces distinct count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_existing_line_reduces_distinct_count_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_existing_line_reduces_distinct_count_002');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let before: number = cart.distinctCount();
      cart.remove(1);
      expect(before).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0030
     * @tc.name      remove_existing_line_makes_contains_false_003
     * @tc.desc      Verify remove existing line makes contains false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_existing_line_makes_contains_false_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_existing_line_makes_contains_false_003');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      expect(cart.contains(1)).assertTrue();
      cart.remove(1);
      expect(cart.contains(1)).assertFalse();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0040
     * @tc.name      remove_existing_line_makes_index_of_minus_one_004
     * @tc.desc      Verify remove existing line makes index of minus one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_existing_line_makes_index_of_minus_one_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_existing_line_makes_index_of_minus_one_004');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      expect(cart.indexOf(1)).assertEqual(0);
      // The removal closes the gap, so goods 2 slides from index 1 down to index 0.
      cart.remove(1);
      expect(cart.indexOf(1)).assertEqual(-1);
      expect(cart.indexOf(2)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0050
     * @tc.name      remove_existing_line_makes_quantity_of_zero_005
     * @tc.desc      Verify remove existing line makes quantity of zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_existing_line_makes_quantity_of_zero_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_existing_line_makes_quantity_of_zero_005');
      let cart: Cart = cartWith([cartLine(1, 399900, 5)]);
      expect(cart.quantityOf(1)).assertEqual(5);
      cart.remove(1);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0060
     * @tc.name      remove_unknown_line_returns_false_006
     * @tc.desc      Verify remove unknown line returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_line_returns_false_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_line_returns_false_006');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let removed: boolean = cart.remove(99);
      expect(removed).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(1)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0070
     * @tc.name      remove_unknown_line_leaves_cart_unchanged_007
     * @tc.desc      Verify remove unknown line leaves cart unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_line_leaves_cart_unchanged_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_line_leaves_cart_unchanged_007');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let totalBefore: number = cart.totalQuantity();
      let removed: boolean = cart.remove(99);
      expect(removed).assertFalse();
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(totalBefore);
      expect(cart.quantityOf(1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0080
     * @tc.name      remove_unknown_line_on_empty_cart_returns_false_008
     * @tc.desc      Verify remove unknown line on empty cart returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_line_on_empty_cart_returns_false_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_line_on_empty_cart_returns_false_008');
      let cart: Cart = new Cart();
      let removed: boolean = cart.remove(1);
      expect(removed).assertFalse();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0090
     * @tc.name      remove_negative_goods_id_returns_false_009
     * @tc.desc      Verify remove negative goods id returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_negative_goods_id_returns_false_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_negative_goods_id_returns_false_009');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let removed: boolean = cart.remove(-1);
      expect(removed).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0100
     * @tc.name      remove_twice_returns_false_the_second_time_010
     * @tc.desc      Verify remove twice returns false the second time.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_twice_returns_false_the_second_time_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_twice_returns_false_the_second_time_010');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let first: boolean = cart.remove(1);
      let second: boolean = cart.remove(1);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0110
     * @tc.name      remove_twice_keeps_other_line_011
     * @tc.desc      Verify remove twice keeps other line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_twice_keeps_other_line_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_twice_keeps_other_line_011');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let first: boolean = cart.remove(1);
      let second: boolean = cart.remove(1);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.contains(2)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0120
     * @tc.name      remove_first_line_shifts_the_rest_012
     * @tc.desc      Verify remove first line shifts the rest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_first_line_shifts_the_rest_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_first_line_shifts_the_rest_012');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(2)).assertEqual(0);
      expect(cart.indexOf(3)).assertEqual(1);
      let first: CartLine | undefined = cart.lineAt(0);
      expect(first !== null && first !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.goodsId).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0130
     * @tc.name      remove_middle_line_keeps_remaining_order_013
     * @tc.desc      Verify remove middle line keeps remaining order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_middle_line_keeps_remaining_order_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_middle_line_keeps_remaining_order_013');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let removed: boolean = cart.remove(2);
      expect(removed).assertTrue();
      expect(cart.indexOf(1)).assertEqual(0);
      expect(cart.indexOf(3)).assertEqual(1);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(second !== null && second !== undefined).assertTrue();
      if (second !== undefined) {
        expect(second.goodsId).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0140
     * @tc.name      remove_last_line_keeps_remaining_order_014
     * @tc.desc      Verify remove last line keeps remaining order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_last_line_keeps_remaining_order_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_last_line_keeps_remaining_order_014');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let removed: boolean = cart.remove(3);
      expect(removed).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(1)).assertEqual(0);
      expect(cart.indexOf(2)).assertEqual(1);
      expect(cart.contains(3)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0150
     * @tc.name      remove_keeps_other_line_quantity_015
     * @tc.desc      Verify remove keeps other line quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_keeps_other_line_quantity_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_keeps_other_line_quantity_015');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 6)]);
      cart.remove(1);
      expect(cart.quantityOf(2)).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0160
     * @tc.name      remove_keeps_other_line_unit_price_016
     * @tc.desc      Verify remove keeps other line unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_keeps_other_line_unit_price_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_keeps_other_line_unit_price_016');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(2, 2000, 3)]);
      cart.remove(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.goodsId).assertEqual(2);
        expect(line.unitPriceCents).assertEqual(2000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0170
     * @tc.name      remove_keeps_other_line_selection_flag_017
     * @tc.desc      Verify remove keeps other line selection flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_keeps_other_line_selection_flag_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_keeps_other_line_selection_flag_017');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.remove(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
      expect(cart.quantityOf(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0180
     * @tc.name      remove_line_reduces_total_quantity_018
     * @tc.desc      Verify remove line reduces total quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_line_reduces_total_quantity_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_line_reduces_total_quantity_018');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      expect(cart.totalQuantity()).assertEqual(5);
      cart.remove(1);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.quantityOf(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0190
     * @tc.name      remove_selected_line_reduces_selected_quantity_019
     * @tc.desc      Verify remove selected line reduces selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_selected_line_reduces_selected_quantity_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_selected_line_reduces_selected_quantity_019');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      expect(cart.selectedQuantity()).assertEqual(2);
      cart.remove(1);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0200
     * @tc.name      remove_unselected_line_keeps_selected_quantity_020
     * @tc.desc      Verify remove unselected line keeps selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unselected_line_keeps_selected_quantity_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unselected_line_keeps_selected_quantity_020');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      cart.remove(2);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0210
     * @tc.name      remove_unselected_line_still_reduces_total_021
     * @tc.desc      Verify remove unselected line still reduces total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unselected_line_still_reduces_total_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unselected_line_still_reduces_total_021');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      let selectedBefore: number = cart.selectedQuantity();
      cart.remove(2);
      expect(cart.selectedQuantity()).assertEqual(selectedBefore);
      expect(cart.totalQuantity() < 5).assertTrue();
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0220
     * @tc.name      remove_single_line_cart_empties_it_022
     * @tc.desc      Verify remove single line cart empties it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_single_line_cart_empties_it_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_single_line_cart_empties_it_022');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0230
     * @tc.name      remove_all_lines_one_by_one_empties_cart_023
     * @tc.desc      Verify remove all lines one by one empties cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_all_lines_one_by_one_empties_cart_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_all_lines_one_by_one_empties_cart_023');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let ids: number[] = [1, 2, 3];
      for (let index: number = 0; index < ids.length; index++) {
        let removed: boolean = cart.remove(ids[index]);
        expect(removed).assertTrue();
      }
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0240
     * @tc.name      remove_zero_goods_id_returns_true_024
     * @tc.desc      Verify remove zero goods id returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_zero_goods_id_returns_true_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_zero_goods_id_returns_true_024');
      // Goods id 0 is a real key here, so remove(0) succeeds instead of being treated as missing.
      let cart: Cart = cartWith([cartLine(0, 499900, 2)]);
      let removed: boolean = cart.remove(0);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0250
     * @tc.name      remove_negative_goods_id_line_returns_true_025
     * @tc.desc      Verify remove negative goods id line returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_negative_goods_id_line_returns_true_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_negative_goods_id_line_returns_true_025');
      let cart: Cart = cartWith([cartLine(-1, 1000, 3)]);
      let removed: boolean = cart.remove(-1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(-1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0260
     * @tc.name      remove_duplicate_id_removes_first_occurrence_only_026
     * @tc.desc      Verify remove duplicate id removes first occurrence only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_duplicate_id_removes_first_occurrence_only_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_duplicate_id_removes_first_occurrence_only_026');
      // Two lines share goods id 1, and remove takes the first one at 1000 cents, leaving the 5000-cent line.
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(1, 5000, 5)]);
      expect(cart.distinctCount()).assertEqual(2);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(5);
      let remaining: CartLine | undefined = cart.lineAt(0);
      expect(remaining !== null && remaining !== undefined).assertTrue();
      if (remaining !== undefined) {
        expect(remaining.unitPriceCents).assertEqual(5000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0270
     * @tc.name      remove_then_add_creates_a_new_selected_line_027
     * @tc.desc      Verify remove then add creates a new selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_add_creates_a_new_selected_line_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_add_creates_a_new_selected_line_027');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, false)]);
      cart.remove(1);
      let returned: number = cart.add(1, 399900, 3);
      expect(returned).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
        expect(line.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0280
     * @tc.name      remove_then_remove_other_line_works_028
     * @tc.desc      Verify remove then remove other line works.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_remove_other_line_works_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_remove_other_line_works_028');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let first: boolean = cart.remove(1);
      expect(first).assertTrue();
      expect(cart.isEmpty()).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(1)).assertFalse();
      expect(cart.contains(2)).assertTrue();
      let second: boolean = cart.remove(2);
      expect(second).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0290
     * @tc.name      remove_then_clear_is_safe_029
     * @tc.desc      Verify remove then clear is safe.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_clear_is_safe_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_clear_is_safe_029');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.remove(1);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0300
     * @tc.name      clear_empties_the_cart_030
     * @tc.desc      Verify clear empties the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_empties_the_cart_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_empties_the_cart_030');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.contains(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0310
     * @tc.name      clear_zeroes_quantity_for_every_previous_line_031
     * @tc.desc      Verify clear zeroes quantity for every previous line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_zeroes_quantity_for_every_previous_line_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_zeroes_quantity_for_every_previous_line_031');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      cart.clear();
      // After clear, quantityOf still answers 0 for the three former ids instead of throwing.
      let previousIds: number[] = [1, 2, 3];
      for (let index: number = 0; index < previousIds.length; index++) {
        expect(cart.quantityOf(previousIds[index])).assertEqual(0);
      }
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0320
     * @tc.name      clear_after_partial_remove_empties_032
     * @tc.desc      Verify clear after partial remove empties.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_after_partial_remove_empties_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_after_partial_remove_empties_032');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      cart.remove(2);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.contains(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0330
     * @tc.name      clear_on_empty_cart_is_safe_033
     * @tc.desc      Verify clear on empty cart is safe.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_on_empty_cart_is_safe_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_on_empty_cart_is_safe_033');
      let cart: Cart = new Cart();
      expect(cart.isEmpty()).assertTrue();
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0340
     * @tc.name      clear_makes_total_quantity_zero_034
     * @tc.desc      Verify clear makes total quantity zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_makes_total_quantity_zero_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_makes_total_quantity_zero_034');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      expect(cart.totalQuantity()).assertEqual(5);
      cart.clear();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0350
     * @tc.name      clear_makes_selected_quantity_zero_035
     * @tc.desc      Verify clear makes selected quantity zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_makes_selected_quantity_zero_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_makes_selected_quantity_zero_035');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, true)]);
      expect(cart.selectedQuantity()).assertEqual(5);
      cart.clear();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0360
     * @tc.name      clear_makes_line_at_zero_undefined_036
     * @tc.desc      Verify clear makes line at zero undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_makes_line_at_zero_undefined_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_makes_line_at_zero_undefined_036');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.clear();
      // Both an out-of-range positive index and a negative one return undefined.
      let atZero: CartLine | undefined = cart.lineAt(0);
      let atNegative: CartLine | undefined = cart.lineAt(-1);
      expect(atZero === undefined).assertTrue();
      expect(atNegative === undefined).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0370
     * @tc.name      clear_makes_contains_false_037
     * @tc.desc      Verify clear makes contains false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_makes_contains_false_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_makes_contains_false_037');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      expect(cart.contains(1)).assertTrue();
      cart.clear();
      expect(cart.contains(1)).assertFalse();
      expect(cart.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0380
     * @tc.name      repeated_clear_is_idempotent_038
     * @tc.desc      Verify repeated clear is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_clear_is_idempotent_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_clear_is_idempotent_038');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.clear();
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0390
     * @tc.name      clear_then_add_starts_a_fresh_cart_039
     * @tc.desc      Verify clear then add starts a fresh cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_starts_a_fresh_cart_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_starts_a_fresh_cart_039');
      let cart: Cart = cartWith([cartLine(1, 1000, 2, false)]);
      cart.clear();
      // add() always appends a selected line, so the earlier false flag does not survive the clear.
      let returned: number = cart.add(2, 2000, 4);
      expect(returned).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(2000);
        expect(line.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0400
     * @tc.name      clear_then_remove_returns_false_040
     * @tc.desc      Verify clear then remove returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_remove_returns_false_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_remove_returns_false_040');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.clear();
      let removed: boolean = cart.remove(1);
      expect(removed).assertFalse();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0410
     * @tc.name      remove_boolean_reflects_each_present_line_041
     * @tc.desc      Verify remove boolean reflects each present line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_boolean_reflects_each_present_line_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_boolean_reflects_each_present_line_041');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 1),
        cartLine(3, 59900, 1)]);
      let ids: number[] = [1, 2, 3];
      for (let index: number = 0; index < ids.length; index++) {
        let removed: boolean = cart.remove(ids[index]);
        expect(removed).assertTrue();
        expect(cart.contains(ids[index])).assertFalse();
      }
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0420
     * @tc.name      remove_all_but_one_keeps_last_quantity_042
     * @tc.desc      Verify remove all but one keeps last quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_all_but_one_keeps_last_quantity_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_all_but_one_keeps_last_quantity_042');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      cart.remove(1);
      cart.remove(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(3)).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.contains(3)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0430
     * @tc.name      remove_selected_line_keeps_other_selected_quantity_043
     * @tc.desc      Verify remove selected line keeps other selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_selected_line_keeps_other_selected_quantity_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_selected_line_keeps_other_selected_quantity_043');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, true)]);
      expect(cart.selectedQuantity()).assertEqual(5);
      cart.remove(1);
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0440
     * @tc.name      remove_one_of_three_keeps_other_two_044
     * @tc.desc      Verify remove one of three keeps other two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_one_of_three_keeps_other_two_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_one_of_three_keeps_other_two_044');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2),
        cartLine(3, 59900, 3)]);
      cart.remove(2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(1);
      expect(cart.quantityOf(3)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0450
     * @tc.name      remove_interleaved_existing_and_unknown_045
     * @tc.desc      Verify remove interleaved existing and unknown.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_interleaved_existing_and_unknown_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_interleaved_existing_and_unknown_045');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let first: boolean = cart.remove(1);
      let unknownRemoval: boolean = cart.remove(9);
      let second: boolean = cart.remove(2);
      expect(first).assertTrue();
      expect(unknownRemoval).assertFalse();
      expect(second).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0460
     * @tc.name      remove_each_position_preserves_remaining_order_046
     * @tc.desc      Verify remove each position preserves remaining order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_each_position_preserves_remaining_order_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_each_position_preserves_remaining_order_046');
      // The loop removes goods 1, 2 and 3 in turn, and each row lists the three surviving ids in order.
      let positions: number[] = [0, 1, 2];
      let expected: number[][] = [[2, 3, 4], [1, 3, 4], [1, 2, 4]];
      for (let index: number = 0; index < positions.length; index++) {
        let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 1),
          cartLine(3, 59900, 1), cartLine(4, 8900, 1)]);
        cart.remove(positions[index] + 1);
        let observed: number[] = [];
        for (let lineIndex: number = 0; lineIndex < cart.distinctCount(); lineIndex++) {
          let line: CartLine | undefined = cart.lineAt(lineIndex);
          if (line !== undefined) {
            observed.push(line.goodsId);
          }
        }

        expect(observed.length).assertEqual(3);
        expect(observed[0]).assertEqual(expected[index][0]);
        expect(observed[1]).assertEqual(expected[index][1]);
        expect(observed[2]).assertEqual(expected[index][2]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0470
     * @tc.name      remove_last_line_updates_total_047
     * @tc.desc      Verify remove last line updates total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_last_line_updates_total_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_last_line_updates_total_047');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      expect(cart.totalQuantity()).assertEqual(9);
      cart.remove(3);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0480
     * @tc.name      remove_first_and_last_keeps_middle_line_048
     * @tc.desc      Verify remove first and last keeps middle line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_first_and_last_keeps_middle_line_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_first_and_last_keeps_middle_line_048');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      cart.remove(1);
      cart.remove(3);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.indexOf(2)).assertEqual(0);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0490
     * @tc.name      remove_then_add_then_remove_new_line_049
     * @tc.desc      Verify remove then add then remove new line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_add_then_remove_new_line_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_add_then_remove_new_line_049');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.remove(1);
      cart.add(1, 399900, 3);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0500
     * @tc.name      clear_after_removing_all_lines_keeps_empty_050
     * @tc.desc      Verify clear after removing all lines keeps empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_after_removing_all_lines_keeps_empty_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_after_removing_all_lines_keeps_empty_050');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.remove(1);
      cart.remove(2);
      expect(cart.isEmpty()).assertTrue();
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0510
     * @tc.name      remove_all_selected_lines_zeroes_selected_quantity_051
     * @tc.desc      Verify remove all selected lines zeroes selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_all_selected_lines_zeroes_selected_quantity_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_all_selected_lines_zeroes_selected_quantity_051');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, true)]);
      cart.remove(1);
      cart.remove(2);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0520
     * @tc.name      remove_one_line_keeps_cart_not_empty_052
     * @tc.desc      Verify remove one line keeps cart not empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_one_line_keeps_cart_not_empty_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_one_line_keeps_cart_not_empty_052');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.remove(1);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.contains(2)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0530
     * @tc.name      remove_unknown_after_removal_does_not_disturb_053
     * @tc.desc      Verify remove unknown after removal does not disturb.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_after_removal_does_not_disturb_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_after_removal_does_not_disturb_053');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.remove(1);
      let removed: boolean = cart.remove(9);
      expect(removed).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0540
     * @tc.name      remove_unknown_then_known_in_sequence_054
     * @tc.desc      Verify remove unknown then known in sequence.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_then_known_in_sequence_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_then_known_in_sequence_054');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let unknownRemoval: boolean = cart.remove(9);
      let known: boolean = cart.remove(1);
      expect(unknownRemoval).assertFalse();
      expect(known).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(2)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0550
     * @tc.name      remove_keeps_remaining_selected_flags_055
     * @tc.desc      Verify remove keeps remaining selected flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_keeps_remaining_selected_flags_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_keeps_remaining_selected_flags_055');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false), cartLine(3, 59900, 4, true)]);
      // Only the unselected line is dropped, so the selected total stays 2 + 4 = 6.
      cart.remove(2);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0560
     * @tc.name      clear_after_adding_removes_all_lines_056
     * @tc.desc      Verify clear after adding removes all lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_after_adding_removes_all_lines_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_after_adding_removes_all_lines_056');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      cart.add(3, 59900, 4);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0570
     * @tc.name      clear_then_add_two_lines_both_present_057
     * @tc.desc      Verify clear then add two lines both present.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_two_lines_both_present_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_two_lines_both_present_057');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.clear();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.contains(1)).assertTrue();
      expect(cart.contains(2)).assertTrue();
      expect(cart.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0580
     * @tc.name      clear_then_add_two_lines_total_is_sum_058
     * @tc.desc      Verify clear then add two lines total is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_two_lines_total_is_sum_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_two_lines_total_is_sum_058');
      let cart: Cart = cartWith([cartLine(1, 399900, 5)]);
      cart.clear();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0590
     * @tc.name      clear_then_add_then_remove_new_line_059
     * @tc.desc      Verify clear then add then remove new line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_then_remove_new_line_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_then_remove_new_line_059');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      cart.clear();
      cart.add(1, 399900, 4);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0600
     * @tc.name      remove_zero_quantity_line_returns_true_060
     * @tc.desc      Verify remove zero quantity line returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_zero_quantity_line_returns_true_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_zero_quantity_line_returns_true_060');
      let cart: Cart = cartWith([cartLine(1, 399900, 0)]);
      expect(cart.quantityOf(1)).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
      // A line at quantity 0 still occupies a slot, so remove succeeds and empties the cart.
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0610
     * @tc.name      remove_large_cart_lines_in_reverse_order_061
     * @tc.desc      Verify remove large cart lines in reverse order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_large_cart_lines_in_reverse_order_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_large_cart_lines_in_reverse_order_061');
      let cart: Cart = cartWith([cartLine(0, 1000, 1), cartLine(1, 2000, 1),
        cartLine(2, 3000, 1), cartLine(3, 4000, 1), cartLine(4, 5000, 1),
        cartLine(5, 6000, 1)]);
      // Removing from the tail backwards never shifts the ids still waiting to be removed.
      let ids: number[] = [5, 4, 3, 2, 1, 0];
      for (let index: number = 0; index < ids.length; index++) {
        let removed: boolean = cart.remove(ids[index]);
        expect(removed).assertTrue();
      }
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0620
     * @tc.name      remove_duplicate_id_twice_clears_both_062
     * @tc.desc      Verify remove duplicate id twice clears both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_duplicate_id_twice_clears_both_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_duplicate_id_twice_clears_both_062');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(1, 5000, 3)]);
      let first: boolean = cart.remove(1);
      expect(first).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(1)).assertEqual(3);
      expect(cart.allLines()[0].unitPriceCents).assertEqual(5000);
      let second: boolean = cart.remove(1);
      expect(second).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0630
     * @tc.name      clear_then_add_three_lines_and_remove_first_063
     * @tc.desc      Verify clear then add three lines and remove first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_three_lines_and_remove_first_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_three_lines_and_remove_first_063');
      let cart: Cart = cartWith([cartLine(9, 1000, 1)]);
      cart.clear();
      cart.add(1, 399900, 1);
      cart.add(2, 129900, 2);
      cart.add(3, 59900, 3);
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(2)).assertEqual(0);
      expect(cart.indexOf(3)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0640
     * @tc.name      remove_unselected_present_line_returns_true_064
     * @tc.desc      Verify remove unselected present line returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unselected_present_line_returns_true_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unselected_present_line_returns_true_064');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, false)]);
      expect(cart.contains(1)).assertTrue();
      let removed: boolean = cart.remove(1);
      expect(removed).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0650
     * @tc.name      clear_on_cart_with_duplicate_ids_065
     * @tc.desc      Verify clear on cart with duplicate ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_on_cart_with_duplicate_ids_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_on_cart_with_duplicate_ids_065');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(1, 5000, 3)]);
      expect(cart.distinctCount()).assertEqual(2);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.quantityOf(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0660
     * @tc.name      clear_after_duplicate_removal_066
     * @tc.desc      Verify clear after duplicate removal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_after_duplicate_removal_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_after_duplicate_removal_066');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(1, 5000, 3)]);
      cart.remove(1);
      expect(cart.distinctCount()).assertEqual(1);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0670
     * @tc.name      remove_two_lines_sequentially_total_updates_067
     * @tc.desc      Verify remove two lines sequentially total updates.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_two_lines_sequentially_total_updates_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_two_lines_sequentially_total_updates_067');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 2),
        cartLine(3, 59900, 4)]);
      // The total is recomputed from survivors: 7 → 6 after goods 1 leaves, then 4 after goods 2.
      cart.remove(1);
      expect(cart.totalQuantity()).assertEqual(6);
      cart.remove(2);
      expect(cart.totalQuantity()).assertEqual(4);
      expect(cart.quantityOf(3)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0680
     * @tc.name      clear_then_add_then_clear_again_068
     * @tc.desc      Verify clear then add then clear again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_then_clear_again_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_then_clear_again_068');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.clear();
      cart.add(1, 399900, 3);
      expect(cart.distinctCount()).assertEqual(1);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0690
     * @tc.name      remove_every_other_line_keeps_half_069
     * @tc.desc      Verify remove every other line keeps half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_every_other_line_keeps_half_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_every_other_line_keeps_half_069');
      let cart: Cart = cartWith([cartLine(0, 1000, 1), cartLine(1, 2000, 1),
        cartLine(2, 3000, 1), cartLine(3, 4000, 1), cartLine(4, 5000, 1),
        cartLine(5, 6000, 1)]);
      // Removing ids 1, 3 and 5 leaves the even ids 0, 2 and 4 with one unit each.
      let removedIds: number[] = [1, 3, 5];
      for (let index: number = 0; index < removedIds.length; index++) {
        let removed: boolean = cart.remove(removedIds[index]);
        expect(removed).assertTrue();
      }
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.contains(0)).assertTrue();
      expect(cart.contains(2)).assertTrue();
      expect(cart.contains(4)).assertTrue();
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0700
     * @tc.name      clear_then_readd_same_id_has_no_old_quantity_070
     * @tc.desc      Verify clear then readd same id has no old quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_readd_same_id_has_no_old_quantity_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_readd_same_id_has_no_old_quantity_070');
      let cart: Cart = cartWith([cartLine(1, 399900, 7)]);
      // The 7 units from before the clear are gone, so the re-add starts the line at 2.
      cart.clear();
      let returned: number = cart.add(1, 399900, 2);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0710
     * @tc.name      clear_then_readd_updates_selected_quantity_071
     * @tc.desc      Verify clear then readd updates selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_readd_updates_selected_quantity_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_readd_updates_selected_quantity_071');
      let cart: Cart = cartWith([cartLine(1, 399900, 7, false)]);
      cart.clear();
      cart.add(1, 399900, 3);
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0720
     * @tc.name      remove_three_duplicate_layers_one_by_one_072
     * @tc.desc      Verify remove three duplicate layers one by one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_three_duplicate_layers_one_by_one_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_three_duplicate_layers_one_by_one_072');
      let cart: Cart = cartWith([cartLine(1, 1000, 1), cartLine(1, 2000, 2),
        cartLine(1, 3000, 3)]);
      // The three goods-1 lines are identical keys, so each call peels off the next layer.
      expect(cart.distinctCount()).assertEqual(3);
      let first: boolean = cart.remove(1);
      let second: boolean = cart.remove(1);
      let third: boolean = cart.remove(1);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(third).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0730
     * @tc.name      remove_then_add_two_products_counts_073
     * @tc.desc      Verify remove then add two products counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_add_two_products_counts_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_add_two_products_counts_073');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      cart.remove(1);
      cart.add(2, 129900, 3);
      cart.add(3, 59900, 4);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.quantityOf(3)).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0740
     * @tc.name      clear_after_adding_and_removing_074
     * @tc.desc      Verify clear after adding and removing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_after_adding_and_removing_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_after_adding_and_removing_074');
      let cart: Cart = new Cart();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      cart.remove(1);
      expect(cart.distinctCount()).assertEqual(1);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0750
     * @tc.name      remove_middle_line_does_not_alter_other_prices_075
     * @tc.desc      Verify remove middle line does not alter other prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_middle_line_does_not_alter_other_prices_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_middle_line_does_not_alter_other_prices_075');
      let cart: Cart = cartWith([cartLine(1, 1000, 2), cartLine(2, 2000, 3),
        cartLine(3, 3000, 4)]);
      // Only goods 2 disappears; the 1000-cent first line and the 3000-cent last line keep their prices.
      cart.remove(2);
      expect(cart.distinctCount()).assertEqual(2);
      let first: CartLine | undefined = cart.lineAt(0);
      let last: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(last !== null && last !== undefined).assertTrue();
      if (first !== undefined && last !== undefined) {
        expect(first.unitPriceCents).assertEqual(1000);
        expect(last.unitPriceCents).assertEqual(3000);
        expect(last.goodsId).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_REMOVE_0760
     * @tc.name      clear_then_remove_all_new_lines_076
     * @tc.desc      Verify clear then remove all new lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_remove_all_new_lines_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_remove_all_new_lines_076');
      let cart: Cart = cartWith([cartLine(9, 1000, 1)]);
      cart.clear();
      cart.add(1, 399900, 2);
      cart.add(2, 129900, 3);
      let first: boolean = cart.remove(1);
      let second: boolean = cart.remove(2);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });
  });
}
