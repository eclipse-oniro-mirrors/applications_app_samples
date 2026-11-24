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

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Cart.fromLines copies lines, so fixtures keep their quantity and selection. */
function cartOf(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

/** Independent arithmetic path, so totals are not compared with themselves. */
function sumLines(lines: CartLine[], selectedOnly: boolean): number {
  let total: number = 0;
  for (let index: number = 0; index < lines.length; index++) {
    let line: CartLine = lines[index];
    if (!selectedOnly || line.selected) {
      total += line.lineTotal().cents();
    }
  }
  return total;
}

export default function cartTotalTest() {
  describe('OrangeShoppingCartTotal', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart total suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0010
     * @tc.name      cart_total_empty_cart_selected_subtotal_is_zero_001
     * @tc.desc      Verify cart total empty cart selected subtotal is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_empty_cart_selected_subtotal_is_zero_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_empty_cart_selected_subtotal_is_zero_001');
      let cart: Cart = new Cart();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.subtotal().isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0020
     * @tc.name      cart_total_empty_cart_all_lines_subtotal_is_zero_002
     * @tc.desc      Verify cart total empty cart all lines subtotal is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_empty_cart_all_lines_subtotal_is_zero_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_empty_cart_all_lines_subtotal_is_zero_002');
      let cart: Cart = new Cart();
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.allLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0030
     * @tc.name      cart_total_single_line_multiplies_price_by_quantity_003
     * @tc.desc      Verify cart total single line multiplies price by quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_single_line_multiplies_price_by_quantity_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_single_line_multiplies_price_by_quantity_003');
      let cart: Cart = cartOf([new CartLine(1, 1250, 3)]);
      expect(cart.subtotal().cents()).assertEqual(3750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0040
     * @tc.name      cart_total_single_line_both_subtotals_agree_004
     * @tc.desc      Verify cart total single line both subtotals agree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_single_line_both_subtotals_agree_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_single_line_both_subtotals_agree_004');
      let cart: Cart = cartOf([new CartLine(2, 1250, 3)]);
      expect(cart.allLinesSubtotal().cents()).assertEqual(cart.subtotal().cents());
      expect(cart.allLinesSubtotal().cents()).assertEqual(3750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0050
     * @tc.name      cart_total_mixed_selection_uses_only_selected_lines_005
     * @tc.desc      Verify cart total mixed selection uses only selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_mixed_selection_uses_only_selected_lines_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_mixed_selection_uses_only_selected_lines_005');
      let cart: Cart = cartOf([
        new CartLine(3, 1000, 2, true),
        new CartLine(4, 5000, 1, false),
        new CartLine(5, 300, 4, true)
      ]);
      // Selected lines contribute 2 x 1000 + 4 x 300 = 3200; the unselected 5000 line is skipped.
      expect(cart.subtotal().cents()).assertEqual(3200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0060
     * @tc.name      cart_total_mixed_selection_all_lines_includes_every_line_006
     * @tc.desc      Verify cart total mixed selection all lines includes every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_mixed_selection_all_lines_includes_every_line_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_mixed_selection_all_lines_includes_every_line_006');
      let cart: Cart = cartOf([
        new CartLine(6, 1000, 2, true),
        new CartLine(7, 5000, 1, false),
        new CartLine(8, 300, 4, true)
      ]);
      // Every line counts here: 2000 + 5000 + 1200 = 8200, including the unselected 5000 line.
      expect(cart.allLinesSubtotal().cents()).assertEqual(8200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0070
     * @tc.name      cart_total_gap_between_subtotals_is_the_unselected_sum_007
     * @tc.desc      Verify cart total gap between subtotals is the unselected sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_gap_between_subtotals_is_the_unselected_sum_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_gap_between_subtotals_is_the_unselected_sum_007');
      let cart: Cart = cartOf([
        new CartLine(9, 1000, 2, true),
        new CartLine(10, 5000, 1, false),
        new CartLine(11, 300, 4, true)
      ]);
      let selected: number = cart.subtotal().cents();
      let all: number = cart.allLinesSubtotal().cents();
      // The 5000 gap is exactly the one unselected line; nothing else differs between the totals.
      expect(all - selected).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0080
     * @tc.name      cart_total_all_selected_makes_both_subtotals_equal_008
     * @tc.desc      Verify cart total all selected makes both subtotals equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_all_selected_makes_both_subtotals_equal_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_all_selected_makes_both_subtotals_equal_008');
      let cart: Cart = cartOf([
        new CartLine(12, 1000, 2, true),
        new CartLine(13, 5000, 1, true),
        new CartLine(14, 300, 4, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(8200);
      expect(cart.allLinesSubtotal().cents()).assertEqual(8200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0090
     * @tc.name      cart_total_zero_price_lines_contribute_nothing_009
     * @tc.desc      Verify cart total zero price lines contribute nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_zero_price_lines_contribute_nothing_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_zero_price_lines_contribute_nothing_009');
      // Two quantities are swept: a price of 0 must still keep the line and its 7 or 5 units,
      // while both money totals stay at zero.
      let quantities: number[] = [7, 5];
      expect(quantities.length).assertEqual(2);
      for (let index: number = 0; index < quantities.length; index++) {
        let cart: Cart = cartOf([new CartLine(15 + index, 0, quantities[index], true)]);
        expect(cart.subtotal().cents()).assertEqual(0);
        expect(cart.allLinesSubtotal().cents()).assertEqual(0);
        expect(cart.totalQuantity()).assertEqual(quantities[index]);
        expect(cart.selectedLines().length).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0100
     * @tc.name      cart_total_zero_price_line_does_not_hide_the_rest_010
     * @tc.desc      Verify cart total zero price line does not hide the rest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_zero_price_line_does_not_hide_the_rest_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_zero_price_line_does_not_hide_the_rest_010');
      let cart: Cart = cartOf([
        new CartLine(16, 0, 3, true),
        new CartLine(17, 800, 2, true)
      ]);
      let selected: CartLine[] = cart.selectedLines();
      let rebuilt: number = 0;
      for (let index: number = 0; index < selected.length; index++) {
        rebuilt += selected[index].lineTotal().cents();
      }
      expect(selected.length).assertEqual(2);
      expect(selected[0].lineTotal().cents()).assertEqual(0);
      expect(rebuilt).assertEqual(800 * 2);
      expect(rebuilt).assertEqual(cart.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0110
     * @tc.name      cart_total_large_lines_multiply_exactly_011
     * @tc.desc      Verify cart total large lines multiply exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_large_lines_multiply_exactly_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_large_lines_multiply_exactly_011');
      let prices: number[] = [1999, 99999];
      let quantities: number[] = [99, 99];
      // 99 is MAX_CART_QUANTITY: 1999 x 99 = 197901 and 99999 x 99 = 9899901
      // must both survive without clamping or rounding.
      let expected: number[] = [197901, 9899901];
      expect(prices.length).assertEqual(expected.length);
      expect(quantities.length).assertEqual(expected.length);
      for (let index: number = 0; index < prices.length; index++) {
        let cart: Cart = cartOf([new CartLine(18 + index, prices[index], quantities[index], true)]);
        expect(cart.subtotal().cents()).assertEqual(expected[index]);
        expect(cart.subtotal().cents()).assertEqual(prices[index] * quantities[index]);
        expect(cart.selectedQuantity()).assertEqual(quantities[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0120
     * @tc.name      cart_total_multi_line_subtotal_matches_manual_addition_012
     * @tc.desc      Verify cart total multi line subtotal matches manual addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_multi_line_subtotal_matches_manual_addition_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_multi_line_subtotal_matches_manual_addition_012');
      let cart: Cart = cartOf([
        new CartLine(20, 100, 1, true),
        new CartLine(21, 200, 2, false),
        new CartLine(22, 300, 3, true),
        new CartLine(23, 400, 4, true)
      ]);
      let expected: number = sumLines(cart.allLines(), true);
      expect(cart.subtotal().cents()).assertEqual(expected);
      // Selected rows only: 1 x 100 + 3 x 300 + 4 x 400 = 2600; the unselected 2 x 200 row is ignored.
      expect(expected).assertEqual(2600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0130
     * @tc.name      cart_total_multi_line_all_subtotal_matches_manual_addition_013
     * @tc.desc      Verify cart total multi line all subtotal matches manual addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_multi_line_all_subtotal_matches_manual_addition_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_multi_line_all_subtotal_matches_manual_addition_013');
      let cart: Cart = cartOf([
        new CartLine(24, 100, 1, true),
        new CartLine(25, 200, 2, false),
        new CartLine(26, 300, 3, true),
        new CartLine(27, 400, 4, true)
      ]);
      let expected: number = sumLines(cart.allLines(), false);
      expect(cart.allLinesSubtotal().cents()).assertEqual(expected);
      expect(expected).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0140
     * @tc.name      cart_total_repeated_selected_calls_are_stable_014
     * @tc.desc      Verify cart total repeated selected calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_repeated_selected_calls_are_stable_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_repeated_selected_calls_are_stable_014');
      let cart: Cart = cartOf([
        new CartLine(28, 1200, 2, true),
        new CartLine(29, 300, 3, true)
      ]);
      let first: number = cart.subtotal().cents();
      let second: number = cart.subtotal().cents();
      let third: number = cart.subtotal().cents();
      expect(first).assertEqual(3300);
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0150
     * @tc.name      cart_total_repeated_all_lines_calls_are_stable_015
     * @tc.desc      Verify cart total repeated all lines calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_repeated_all_lines_calls_are_stable_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_repeated_all_lines_calls_are_stable_015');
      let cart: Cart = cartOf([
        new CartLine(30, 1200, 2, false),
        new CartLine(31, 300, 3, true)
      ]);
      let first: number = cart.allLinesSubtotal().cents();
      let second: number = cart.allLinesSubtotal().cents();
      expect(first).assertEqual(3300);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0160
     * @tc.name      cart_total_quantity_increase_raises_the_subtotal_016
     * @tc.desc      Verify cart total quantity increase raises the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_quantity_increase_raises_the_subtotal_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_quantity_increase_raises_the_subtotal_016');
      let cart: Cart = cartOf([new CartLine(32, 1000, 2, true)]);
      let before: number = cart.subtotal().cents();
      cart.setQuantity(32, 5, 99);
      let after: number = cart.subtotal().cents();
      expect(before).assertEqual(2000);
      expect(after).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0170
     * @tc.name      cart_total_quantity_decrease_lowers_the_subtotal_017
     * @tc.desc      Verify cart total quantity decrease lowers the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_quantity_decrease_lowers_the_subtotal_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_quantity_decrease_lowers_the_subtotal_017');
      let cart: Cart = cartOf([new CartLine(33, 1000, 5, true)]);
      cart.setQuantity(33, 2, 99);
      expect(cart.subtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0180
     * @tc.name      cart_total_unselected_quantity_change_keeps_selected_subtotal_018
     * @tc.desc      Verify cart total unselected quantity change keeps selected subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_unselected_quantity_change_keeps_selected_subtotal_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_unselected_quantity_change_keeps_selected_subtotal_018');
      let cart: Cart = cartOf([
        new CartLine(34, 1000, 2, true),
        new CartLine(35, 5000, 1, false)
      ]);
      let before: number = cart.subtotal().cents();
      cart.setQuantity(35, 4, 99);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(before).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0190
     * @tc.name      cart_total_unselected_quantity_change_raises_all_subtotal_019
     * @tc.desc      Verify cart total unselected quantity change raises all subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_unselected_quantity_change_raises_all_subtotal_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_unselected_quantity_change_raises_all_subtotal_019');
      let cart: Cart = cartOf([
        new CartLine(36, 1000, 2, true),
        new CartLine(37, 5000, 1, false)
      ]);
      cart.setQuantity(37, 4, 99);
      expect(cart.allLinesSubtotal().cents()).assertEqual(22000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0200
     * @tc.name      cart_total_removing_a_selected_line_lowers_subtotal_020
     * @tc.desc      Verify cart total removing a selected line lowers subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_a_selected_line_lowers_subtotal_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_a_selected_line_lowers_subtotal_020');
      let cart: Cart = cartOf([
        new CartLine(38, 1000, 2, true),
        new CartLine(39, 700, 3, true)
      ]);
      cart.remove(38);
      expect(cart.subtotal().cents()).assertEqual(2100);
      expect(cart.allLinesSubtotal().cents()).assertEqual(2100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0210
     * @tc.name      cart_total_removing_an_unselected_line_keeps_subtotal_021
     * @tc.desc      Verify cart total removing an unselected line keeps subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_an_unselected_line_keeps_subtotal_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_an_unselected_line_keeps_subtotal_021');
      let cart: Cart = cartOf([
        new CartLine(40, 1000, 2, true),
        new CartLine(41, 5000, 1, false)
      ]);
      let before: number = cart.subtotal().cents();
      cart.remove(41);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(before).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0220
     * @tc.name      cart_total_removing_an_unselected_line_lowers_all_subtotal_022
     * @tc.desc      Verify cart total removing an unselected line lowers all subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_an_unselected_line_lowers_all_subtotal_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_an_unselected_line_lowers_all_subtotal_022');
      let cart: Cart = cartOf([
        new CartLine(42, 1000, 2, true),
        new CartLine(43, 5000, 1, false)
      ]);
      cart.remove(43);
      expect(cart.allLinesSubtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0230
     * @tc.name      cart_total_removing_the_last_line_empties_both_totals_023
     * @tc.desc      Verify cart total removing the last line empties both totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_the_last_line_empties_both_totals_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_the_last_line_empties_both_totals_023');
      let cart: Cart = cartOf([new CartLine(44, 1000, 2, true)]);
      cart.remove(44);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0240
     * @tc.name      cart_total_selected_line_count_matches_subtotal_parts_024
     * @tc.desc      Verify cart total selected line count matches subtotal parts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_line_count_matches_subtotal_parts_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_line_count_matches_subtotal_parts_024');
      let cart: Cart = cartOf([
        new CartLine(45, 1000, 2, true),
        new CartLine(46, 5000, 1, false),
        new CartLine(47, 250, 4, true)
      ]);
      let lines: CartLine[] = cart.selectedLines();
      expect(lines.length).assertEqual(2);
      let sum: number = 0;
      for (let index: number = 0; index < lines.length; index++) {
        sum += lines[index].lineTotal().cents();
      }
      expect(sum).assertEqual(cart.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0250
     * @tc.name      cart_total_selected_line_amounts_reconstruct_subtotal_025
     * @tc.desc      Verify cart total selected line amounts reconstruct subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_line_amounts_reconstruct_subtotal_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_line_amounts_reconstruct_subtotal_025');
      let cart: Cart = cartOf([
        new CartLine(48, 111, 3, true),
        new CartLine(49, 222, 2, false),
        new CartLine(50, 333, 1, true)
      ]);
      let rebuilt: number = 0;
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        if (lines[index].selected) {
          rebuilt += lines[index].unitPriceCents * lines[index].quantity;
        }
      }
      expect(rebuilt).assertEqual(cart.subtotal().cents());
      expect(rebuilt).assertEqual(666);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0260
     * @tc.name      cart_total_selected_line_quantities_multiply_to_subtotal_026
     * @tc.desc      Verify cart total selected line quantities multiply to subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_line_quantities_multiply_to_subtotal_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_line_quantities_multiply_to_subtotal_026');
      let cart: Cart = cartOf([
        new CartLine(51, 400, 2, true),
        new CartLine(52, 600, 3, true)
      ]);
      let expected: number = 400 * 2 + 600 * 3;
      expect(cart.subtotal().cents()).assertEqual(expected);
      expect(cart.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0270
     * @tc.name      cart_total_odd_cent_prices_stay_integer_exact_027
     * @tc.desc      Verify cart total odd cent prices stay integer exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_odd_cent_prices_stay_integer_exact_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_odd_cent_prices_stay_integer_exact_027');
      let cart: Cart = cartOf([new CartLine(53, 333, 3, true)]);
      expect(cart.subtotal().cents()).assertEqual(999);
      expect(cart.allLinesSubtotal().cents()).assertEqual(999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0280
     * @tc.name      cart_total_single_unselected_line_has_zero_subtotal_028
     * @tc.desc      Verify cart total single unselected line has zero subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_single_unselected_line_has_zero_subtotal_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_single_unselected_line_has_zero_subtotal_028');
      let cart: Cart = cartOf([new CartLine(57, 5000, 2, false)]);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0290
     * @tc.name      cart_total_single_unselected_line_still_has_an_all_lines_total_029
     * @tc.desc      Verify cart total single unselected line still has an all lines total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_single_unselected_line_still_has_an_all_lines_total_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_single_unselected_line_still_has_an_all_lines_total_029');
      let cart: Cart = cartOf([new CartLine(58, 5000, 2, false)]);
      expect(cart.allLinesSubtotal().cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0300
     * @tc.name      cart_total_clear_resets_both_totals_030
     * @tc.desc      Verify cart total clear resets both totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_clear_resets_both_totals_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_clear_resets_both_totals_030');
      let cart: Cart = cartOf([
        new CartLine(59, 1000, 2, true),
        new CartLine(60, 500, 1, true)
      ]);
      cart.clear();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0310
     * @tc.name      cart_total_unit_quantity_line_is_priced_once_031
     * @tc.desc      Verify cart total unit quantity line is priced once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_unit_quantity_line_is_priced_once_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_unit_quantity_line_is_priced_once_031');
      let cart: Cart = cartOf([new CartLine(70, 450, 1, true)]);
      expect(cart.subtotal().cents()).assertEqual(450);
      expect(cart.totalQuantity()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0320
     * @tc.name      cart_total_line_order_does_not_change_totals_032
     * @tc.desc      Verify cart total line order does not change totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_line_order_does_not_change_totals_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_line_order_does_not_change_totals_032');
      // Eight lines with price and quantity both index + 1; the first of every triplet is
      // unselected, giving 13800 selected against 20400 for all lines.
      let forward: CartLine[] = [];
      for (let index: number = 0; index < 8; index++) {
        let price: number = (index + 1) * 100;
        let quantity: number = index + 1;
        let selected: boolean = index % 3 !== 0;
        forward.push(new CartLine(200 + index, price, quantity, selected));
      }
      let reversed: CartLine[] = [];
      for (let index: number = forward.length - 1; index >= 0; index--) {
        reversed.push(forward[index].copy());
      }
      let first: Cart = cartOf(forward);
      let second: Cart = cartOf(reversed);

      expect(first.subtotal().cents()).assertEqual(13800);
      expect(first.allLinesSubtotal().cents()).assertEqual(20400);
      expect(second.subtotal().cents()).assertEqual(first.subtotal().cents());
      expect(second.allLinesSubtotal().cents()).assertEqual(first.allLinesSubtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0330
     * @tc.name      cart_total_increase_then_decrease_restores_the_amount_033
     * @tc.desc      Verify cart total increase then decrease restores the amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_increase_then_decrease_restores_the_amount_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_increase_then_decrease_restores_the_amount_033');
      let cart: Cart = cartOf([new CartLine(71, 1000, 2, true)]);
      let before: number = cart.subtotal().cents();
      cart.setQuantity(71, 5, 99);
      cart.setQuantity(71, 2, 99);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(before).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0340
     * @tc.name      cart_total_removal_drop_equals_the_removed_line_total_034
     * @tc.desc      Verify cart total removal drop equals the removed line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removal_drop_equals_the_removed_line_total_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removal_drop_equals_the_removed_line_total_034');
      let cart: Cart = cartOf([
        new CartLine(72, 800, 2, true),
        new CartLine(73, 125, 4, true)
      ]);
      let before: number = cart.subtotal().cents();
      let removedLine: CartLine | undefined = cart.lineAt(1);

      expect(removedLine !== null && removedLine !== undefined).assertTrue();
      let removedTotal: number = 0;
      if (removedLine !== undefined) {
        removedTotal = removedLine.lineTotal().cents();
      }
      cart.remove(73);
      let after: number = cart.subtotal().cents();
      expect(before - after).assertEqual(removedTotal);
      // The removed line is 4 units at 125 cents, so the subtotal drop must be exactly 500.
      expect(removedTotal).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0350
     * @tc.name      cart_total_all_lines_total_ignores_selection_changes_035
     * @tc.desc      Verify cart total all lines total ignores selection changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_all_lines_total_ignores_selection_changes_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_all_lines_total_ignores_selection_changes_035');
      let cart: Cart = cartOf([
        new CartLine(74, 1000, 2, true),
        new CartLine(75, 400, 3, true)
      ]);
      let before: number = cart.allLinesSubtotal().cents();
      cart.setAllSelected(false);
      let after: number = cart.allLinesSubtotal().cents();
      expect(before).assertEqual(3200);
      expect(after).assertEqual(before);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0360
     * @tc.name      cart_total_toggle_off_drops_the_exact_line_total_036
     * @tc.desc      Verify cart total toggle off drops the exact line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_toggle_off_drops_the_exact_line_total_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_toggle_off_drops_the_exact_line_total_036');
      let cart: Cart = cartOf([
        new CartLine(76, 1000, 2, true),
        new CartLine(77, 150, 6, true)
      ]);
      let before: number = cart.subtotal().cents();
      cart.toggleSelected(77);
      let after: number = cart.subtotal().cents();
      expect(before - after).assertEqual(900);
      expect(after).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0370
     * @tc.name      cart_total_selected_count_after_toggle_matches_amount_037
     * @tc.desc      Verify cart total selected count after toggle matches amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_count_after_toggle_matches_amount_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_count_after_toggle_matches_amount_037');
      let cart: Cart = cartOf([
        new CartLine(78, 1000, 2, true),
        new CartLine(79, 150, 6, true)
      ]);
      cart.toggleSelected(79);
      expect(cart.selectedLines().length).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0380
     * @tc.name      cart_total_zero_quantity_line_contributes_zero_038
     * @tc.desc      Verify cart total zero quantity line contributes zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_zero_quantity_line_contributes_zero_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_zero_quantity_line_contributes_zero_038');
      let cart: Cart = cartOf([new CartLine(80, 500, 0, true)]);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0390
     * @tc.name      cart_total_selected_quantity_change_updates_all_lines_total_039
     * @tc.desc      Verify cart total selected quantity change updates all lines total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_quantity_change_updates_all_lines_total_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_quantity_change_updates_all_lines_total_039');
      let cart: Cart = cartOf([new CartLine(81, 250, 2, true)]);
      cart.setQuantity(81, 6, 99);
      expect(cart.subtotal().cents()).assertEqual(1500);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0400
     * @tc.name      cart_total_deselect_all_zeroes_only_the_selected_total_040
     * @tc.desc      Verify cart total deselect all zeroes only the selected total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_deselect_all_zeroes_only_the_selected_total_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_deselect_all_zeroes_only_the_selected_total_040');
      let cart: Cart = cartOf([
        new CartLine(82, 1000, 2, true),
        new CartLine(83, 500, 4, true)
      ]);
      cart.setAllSelected(false);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(4000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0410
     * @tc.name      cart_total_reselect_all_restores_the_selected_total_041
     * @tc.desc      Verify cart total reselect all restores the selected total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_reselect_all_restores_the_selected_total_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_reselect_all_restores_the_selected_total_041');
      let cart: Cart = cartOf([
        new CartLine(84, 1000, 2, true),
        new CartLine(85, 500, 4, true)
      ]);
      let full: number = cart.subtotal().cents();
      cart.setAllSelected(false);
      cart.setAllSelected(true);
      expect(cart.subtotal().cents()).assertEqual(full);
      expect(full).assertEqual(4000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0420
     * @tc.name      cart_total_calls_stay_stable_after_a_mutation_042
     * @tc.desc      Verify cart total calls stay stable after a mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_calls_stay_stable_after_a_mutation_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_calls_stay_stable_after_a_mutation_042');
      let cart: Cart = cartOf([new CartLine(86, 300, 2, true)]);
      cart.setQuantity(86, 7, 99);
      let first: number = cart.subtotal().cents();
      let second: number = cart.subtotal().cents();
      expect(first).assertEqual(2100);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0430
     * @tc.name      cart_total_selected_and_unselected_parts_sum_to_all_lines_043
     * @tc.desc      Verify cart total selected and unselected parts sum to all lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selected_and_unselected_parts_sum_to_all_lines_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selected_and_unselected_parts_sum_to_all_lines_043');
      let cart: Cart = cartOf([
        new CartLine(92, 600, 2, true),
        new CartLine(93, 250, 3, false),
        new CartLine(94, 90, 5, true),
        new CartLine(95, 1000, 1, false)
      ]);
      let selected: number = cart.subtotal().cents();
      let all: number = cart.allLinesSubtotal().cents();
      let unselected: number = sumLines(cart.allLines(), false) - sumLines(cart.allLines(), true);
      expect(selected + unselected).assertEqual(all);
      // Unselected rows are 3 x 250 + 1 x 1000 = 1750, the exact part of the all-lines total
      // that subtotal leaves out.
      expect(unselected).assertEqual(1750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0440
     * @tc.name      cart_total_money_result_is_never_negative_044
     * @tc.desc      Verify cart total money result is never negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_money_result_is_never_negative_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_money_result_is_never_negative_044');
      let cart: Cart = cartOf([
        new CartLine(96, 1000, 2, true),
        new CartLine(97, 500, 1, true)
      ]);
      expect(cart.subtotal().isNegative()).assertFalse();
      expect(cart.allLinesSubtotal().isNegative()).assertFalse();
      expect(cart.subtotal().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0450
     * @tc.name      cart_total_amounts_ignore_goods_identity_045
     * @tc.desc      Verify cart total amounts ignore goods identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_amounts_ignore_goods_identity_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_amounts_ignore_goods_identity_045');
      let first: Cart = cartOf([
        new CartLine(301, 900, 1, true),
        new CartLine(302, 900, 1, true)
      ]);
      let second: Cart = cartOf([
        new CartLine(302, 900, 1, true),
        new CartLine(301, 900, 1, true)
      ]);
      expect(first.subtotal().cents()).assertEqual(1800);
      expect(second.subtotal().cents()).assertEqual(first.subtotal().cents());
      expect(first.subtotal().cents()).assertEqual(first.allLinesSubtotal().cents());
      expect(first.selectedLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0460
     * @tc.name      cart_total_zero_price_line_keeps_all_total_046
     * @tc.desc      Verify cart total zero price line keeps all total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_zero_price_line_keeps_all_total_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_zero_price_line_keeps_all_total_046');
      let cart: Cart = cartOf([
        new CartLine(303, 1000, 2, true),
        new CartLine(304, 0, 5, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(2000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0470
     * @tc.name      cart_total_toggle_on_adds_the_exact_line_total_047
     * @tc.desc      Verify cart total toggle on adds the exact line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_toggle_on_adds_the_exact_line_total_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_toggle_on_adds_the_exact_line_total_047');
      let cart: Cart = cartOf([
        new CartLine(305, 1000, 2, true),
        new CartLine(306, 150, 6, false)
      ]);
      let before: number = cart.subtotal().cents();
      cart.toggleSelected(306);
      let after: number = cart.subtotal().cents();
      expect(after - before).assertEqual(900);
      expect(after).assertEqual(2900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0480
     * @tc.name      cart_total_toggle_two_lines_matches_full_selection_048
     * @tc.desc      Verify cart total toggle two lines matches full selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_toggle_two_lines_matches_full_selection_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_toggle_two_lines_matches_full_selection_048');
      let cart: Cart = cartOf([
        new CartLine(307, 100, 1, true),
        new CartLine(308, 200, 2, false),
        new CartLine(309, 300, 3, true)
      ]);
      cart.toggleSelected(308);
      expect(cart.selectedLines().length).assertEqual(3);
      expect(cart.subtotal().cents()).assertEqual(1400);
      expect(cart.subtotal().cents()).assertEqual(cart.allLinesSubtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0490
     * @tc.name      cart_total_remove_middle_line_keeps_remaining_sum_049
     * @tc.desc      Verify cart total remove middle line keeps remaining sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_remove_middle_line_keeps_remaining_sum_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_remove_middle_line_keeps_remaining_sum_049');
      let cart: Cart = cartOf([
        new CartLine(310, 100, 1, true),
        new CartLine(311, 200, 2, true),
        new CartLine(312, 300, 3, true)
      ]);
      let removed: boolean = cart.remove(311);
      expect(removed).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(1000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0500
     * @tc.name      cart_total_removing_the_selected_line_leaves_unselected_zero_050
     * @tc.desc      Verify cart total removing the selected line leaves unselected zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_the_selected_line_leaves_unselected_zero_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_the_selected_line_leaves_unselected_zero_050');
      let cart: Cart = cartOf([
        new CartLine(313, 1000, 2, true),
        new CartLine(314, 500, 1, false)
      ]);
      cart.remove(313);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0510
     * @tc.name      cart_total_unselected_max_quantity_excluded_from_selected_only_051
     * @tc.desc      Verify cart total unselected max quantity excluded from selected only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_unselected_max_quantity_excluded_from_selected_only_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_unselected_max_quantity_excluded_from_selected_only_051');
      let cart: Cart = cartOf([
        new CartLine(333, 1000, 99, false),
        new CartLine(334, 500, 1, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(500);
      // 99 is the cart quantity cap: 99 x 1000 plus 1 x 500 = 99500, while the selected
      // subtotal sees only the 500-cent line.
      expect(cart.allLinesSubtotal().cents()).assertEqual(99500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0520
     * @tc.name      cart_total_removing_three_lines_ends_at_zero_052
     * @tc.desc      Verify cart total removing three lines ends at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_three_lines_ends_at_zero_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_three_lines_ends_at_zero_052');
      let cart: Cart = cartOf([
        new CartLine(335, 100, 1, true),
        new CartLine(336, 200, 1, true),
        new CartLine(337, 300, 1, true)
      ]);
      // The chain 600 -> 500 -> 300 -> 0 means each removal drops exactly the line just taken out.
      cart.remove(335);
      expect(cart.subtotal().cents()).assertEqual(500);
      cart.remove(336);
      expect(cart.subtotal().cents()).assertEqual(300);
      cart.remove(337);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0530
     * @tc.name      cart_total_select_all_after_partial_equals_all_total_053
     * @tc.desc      Verify cart total select all after partial equals all total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_select_all_after_partial_equals_all_total_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_select_all_after_partial_equals_all_total_053');
      let cart: Cart = cartOf([
        new CartLine(338, 100, 1, true),
        new CartLine(339, 200, 1, false),
        new CartLine(340, 300, 1, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(400);
      cart.setAllSelected(true);
      expect(cart.subtotal().cents()).assertEqual(600);
      expect(cart.subtotal().cents()).assertEqual(cart.allLinesSubtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0540
     * @tc.name      cart_total_reading_lines_has_no_side_effect_054
     * @tc.desc      Verify cart total reading lines has no side effect.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_reading_lines_has_no_side_effect_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_reading_lines_has_no_side_effect_054');
      let cart: Cart = cartOf([
        new CartLine(341, 1200, 2, true),
        new CartLine(342, 300, 1, false)
      ]);
      let before: number = cart.subtotal().cents();
      let lines: CartLine[] = cart.allLines();
      let all: number = cart.allLinesSubtotal().cents();
      expect(lines.length).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(all).assertEqual(2700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0550
     * @tc.name      cart_total_two_equal_carts_agree_on_amounts_055
     * @tc.desc      Verify cart total two equal carts agree on amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_two_equal_carts_agree_on_amounts_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_two_equal_carts_agree_on_amounts_055');
      let first: Cart = cartOf([
        new CartLine(343, 700, 2, true),
        new CartLine(344, 900, 1, false)
      ]);
      let second: Cart = cartOf([
        new CartLine(343, 700, 2, true),
        new CartLine(344, 900, 1, false)
      ]);
      expect(first.subtotal().cents()).assertEqual(second.subtotal().cents());
      expect(first.allLinesSubtotal().cents()).assertEqual(second.allLinesSubtotal().cents());
      expect(first.subtotal().cents()).assertEqual(1400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0560
     * @tc.name      cart_total_uniform_quantity_scaling_doubles_totals_056
     * @tc.desc      Verify cart total uniform quantity scaling doubles totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_uniform_quantity_scaling_doubles_totals_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_uniform_quantity_scaling_doubles_totals_056');
      // Six lines priced (index + 1) x 10 with only even indices selected, so the unit
      // cart reads 10 + 30 + 50 = 90 before doubling.
      let singleLines: CartLine[] = [];
      let doubleLines: CartLine[] = [];
      for (let index: number = 0; index < 6; index++) {
        let price: number = (index + 1) * 10;
        let selected: boolean = index % 2 === 0;
        singleLines.push(new CartLine(210 + index, price, 1, selected));
        doubleLines.push(new CartLine(210 + index, price, 2, selected));
      }
      let single: Cart = cartOf(singleLines);
      let doubled: Cart = cartOf(doubleLines);
      expect(single.subtotal().cents()).assertEqual(90);
      expect(doubled.subtotal().cents()).assertEqual(single.subtotal().cents() * 2);
      expect(doubled.allLinesSubtotal().cents()).assertEqual(single.allLinesSubtotal().cents() * 2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0570
     * @tc.name      cart_total_all_total_is_unchanged_by_selection_toggles_057
     * @tc.desc      Verify cart total all total is unchanged by selection toggles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_all_total_is_unchanged_by_selection_toggles_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_all_total_is_unchanged_by_selection_toggles_057');
      let cart: Cart = cartOf([
        new CartLine(358, 600, 3, true),
        new CartLine(359, 250, 2, true)
      ]);
      let before: number = cart.allLinesSubtotal().cents();
      cart.toggleSelected(358);
      cart.setAllSelected(false);
      cart.setAllSelected(true);
      let after: number = cart.allLinesSubtotal().cents();
      expect(before).assertEqual(2300);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0580
     * @tc.name      cart_total_shifting_selection_moves_the_amount_058
     * @tc.desc      Verify cart total shifting selection moves the amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_shifting_selection_moves_the_amount_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_shifting_selection_moves_the_amount_058');
      let cart: Cart = cartOf([
        new CartLine(360, 1000, 2, true),
        new CartLine(361, 700, 3, false)
      ]);
      cart.setSelected(360, false);
      cart.setSelected(361, true);
      expect(cart.subtotal().cents()).assertEqual(2100);
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0590
     * @tc.name      cart_total_remove_then_increase_remaining_selected_line_059
     * @tc.desc      Verify cart total remove then increase remaining selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_remove_then_increase_remaining_selected_line_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_remove_then_increase_remaining_selected_line_059');
      let cart: Cart = cartOf([
        new CartLine(362, 1000, 2, true),
        new CartLine(363, 500, 1, true)
      ]);
      cart.remove(362);
      cart.setQuantity(363, 4, 99);
      expect(cart.subtotal().cents()).assertEqual(2000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0600
     * @tc.name      cart_total_removing_zero_price_line_keeps_all_total_060
     * @tc.desc      Verify cart total removing zero price line keeps all total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_zero_price_line_keeps_all_total_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_zero_price_line_keeps_all_total_060');
      let cart: Cart = cartOf([
        new CartLine(364, 1000, 2, true),
        new CartLine(365, 0, 4, false)
      ]);
      let before: number = cart.allLinesSubtotal().cents();
      cart.remove(365);
      expect(cart.allLinesSubtotal().cents()).assertEqual(before);
      expect(before).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0610
     * @tc.name      cart_total_quantity_change_on_one_selected_line_is_exact_061
     * @tc.desc      Verify cart total quantity change on one selected line is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_quantity_change_on_one_selected_line_is_exact_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_quantity_change_on_one_selected_line_is_exact_061');
      let cart: Cart = cartOf([
        new CartLine(366, 100, 2, true),
        new CartLine(367, 200, 3, true)
      ]);
      cart.setQuantity(366, 5, 99);
      expect(cart.subtotal().cents()).assertEqual(1100);
      // 5 x 100 + 3 x 200 = 1100 and 5 + 3 = 8 units: both must follow the new quantity on 366.
      expect(cart.selectedQuantity()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0620
     * @tc.name      cart_total_all_zero_price_lines_sum_to_zero_062
     * @tc.desc      Verify cart total all zero price lines sum to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_all_zero_price_lines_sum_to_zero_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_all_zero_price_lines_sum_to_zero_062');
      let cart: Cart = cartOf([
        new CartLine(368, 0, 2, true),
        new CartLine(369, 0, 3, true),
        new CartLine(370, 0, 4, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      // All three prices are 0 yet quantities 2 + 3 + 4 still count, so selectedQuantity is 9.
      expect(cart.selectedQuantity()).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0630
     * @tc.name      cart_total_setting_the_same_quantity_keeps_the_amount_063
     * @tc.desc      Verify cart total setting the same quantity keeps the amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_setting_the_same_quantity_keeps_the_amount_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_setting_the_same_quantity_keeps_the_amount_063');
      let cart: Cart = cartOf([new CartLine(371, 750, 3, true)]);
      let before: number = cart.subtotal().cents();
      cart.setQuantity(371, 3, 99);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(before).assertEqual(2250);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0640
     * @tc.name      cart_total_removing_both_selected_lines_empties_the_cart_064
     * @tc.desc      Verify cart total removing both selected lines empties the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_removing_both_selected_lines_empties_the_cart_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_removing_both_selected_lines_empties_the_cart_064');
      let cart: Cart = cartOf([
        new CartLine(372, 100, 2, true),
        new CartLine(373, 200, 3, true)
      ]);
      cart.remove(372);
      cart.remove(373);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0650
     * @tc.name      cart_total_selecting_a_zero_price_line_changes_only_the_count_065
     * @tc.desc      Verify cart total selecting a zero price line changes only the count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_selecting_a_zero_price_line_changes_only_the_count_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_selecting_a_zero_price_line_changes_only_the_count_065');
      let cart: Cart = cartOf([
        new CartLine(378, 100, 1, true),
        new CartLine(379, 0, 1, false)
      ]);
      let before: number = cart.subtotal().cents();
      cart.setSelected(379, true);
      expect(cart.subtotal().cents()).assertEqual(before);
      expect(cart.selectedLines().length).assertEqual(2);
      expect(before).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0660
     * @tc.name      cart_total_reset_all_quantities_to_one_066
     * @tc.desc      Verify cart total reset all quantities to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_reset_all_quantities_to_one_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_reset_all_quantities_to_one_066');
      let cart: Cart = cartOf([
        new CartLine(390, 100, 3, true),
        new CartLine(391, 200, 4, true),
        new CartLine(392, 300, 5, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(2600);
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        cart.setQuantity(lines[index].goodsId, 1, 99);
      }
      expect(cart.subtotal().cents()).assertEqual(600);
      expect(cart.allLinesSubtotal().cents()).assertEqual(600);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0670
     * @tc.name      cart_total_quantity_change_before_selecting_a_line_067
     * @tc.desc      Verify cart total quantity change before selecting a line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_quantity_change_before_selecting_a_line_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_quantity_change_before_selecting_a_line_067');
      let cart: Cart = cartOf([
        new CartLine(393, 100, 2, true),
        new CartLine(394, 500, 1, false)
      ]);
      cart.setQuantity(394, 4, 99);
      expect(cart.subtotal().cents()).assertEqual(200);
      cart.setSelected(394, true);
      // Once 394 is selected, 2 x 100 + 4 x 500 = 2200 and 2 + 4 units count.
      expect(cart.subtotal().cents()).assertEqual(2200);
      expect(cart.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0680
     * @tc.name      cart_total_remove_all_selected_leaves_unselected_total_068
     * @tc.desc      Verify cart total remove all selected leaves unselected total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_remove_all_selected_leaves_unselected_total_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_remove_all_selected_leaves_unselected_total_068');
      let cart: Cart = cartOf([
        new CartLine(395, 100, 1, true),
        new CartLine(396, 200, 2, true),
        new CartLine(397, 500, 3, false)
      ]);
      cart.remove(395);
      cart.remove(396);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1500);
      expect(cart.selectedLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0690
     * @tc.name      cart_total_each_line_selected_alone_contributes_its_total_069
     * @tc.desc      Verify cart total each line selected alone contributes its total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_each_line_selected_alone_contributes_its_total_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_each_line_selected_alone_contributes_its_total_069');
      let cart: Cart = cartOf([
        new CartLine(398, 100, 2, false),
        new CartLine(399, 200, 1, false),
        new CartLine(400, 300, 3, false)
      ]);
      let lines: CartLine[] = cart.allLines();
      // Each pass selects exactly one line, so the subtotal must equal that line's own
      // lineTotal before the line is deselected again.
      for (let index: number = 0; index < lines.length; index++) {
        cart.setSelected(lines[index].goodsId, true);
        expect(cart.subtotal().cents()).assertEqual(lines[index].lineTotal().cents());
        cart.setSelected(lines[index].goodsId, false);
      }
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0700
     * @tc.name      cart_total_repeated_quantity_changes_settle_on_last_value_070
     * @tc.desc      Verify cart total repeated quantity changes settle on last value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_repeated_quantity_changes_settle_on_last_value_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_repeated_quantity_changes_settle_on_last_value_070');
      let cart: Cart = cartOf([new CartLine(401, 400, 1, true)]);
      cart.setQuantity(401, 2, 99);
      cart.setQuantity(401, 5, 99);
      cart.setQuantity(401, 8, 99);
      // Only the final 3 survives: 3 x 400 = 1200, leaving no residue from the earlier 8.
      cart.setQuantity(401, 3, 99);
      expect(cart.subtotal().cents()).assertEqual(1200);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0710
     * @tc.name      cart_total_multiple_zero_quantity_lines_add_nothing_071
     * @tc.desc      Verify cart total multiple zero quantity lines add nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_multiple_zero_quantity_lines_add_nothing_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_multiple_zero_quantity_lines_add_nothing_071');
      let cart: Cart = cartOf([
        new CartLine(402, 500, 0, true),
        new CartLine(403, 700, 0, false),
        new CartLine(404, 900, 0, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_TOTAL_0720
     * @tc.name      cart_total_zero_price_and_zero_quantity_lines_compose_072
     * @tc.desc      Verify cart total zero price and zero quantity lines compose.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_zero_price_and_zero_quantity_lines_compose_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_zero_price_and_zero_quantity_lines_compose_072');
      let cart: Cart = cartOf([
        new CartLine(405, 0, 3, true),
        new CartLine(406, 700, 0, true),
        new CartLine(407, 500, 2, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(1000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1000);
      // 0 x 3 and 700 x 0 add nothing, so 1000 comes from 2 x 500 and 5 units from 3 + 0 + 2.
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.selectedQuantity()).assertEqual(5);
      expect(cart.selectedLines().length).assertEqual(3);
    });
  });
}
