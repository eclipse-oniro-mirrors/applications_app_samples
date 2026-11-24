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

function cartOf(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

function selectedIds(cart: Cart): number[] {
  let ids: number[] = [];
  let lines: CartLine[] = cart.selectedLines();
  for (let index: number = 0; index < lines.length; index++) {
    ids.push(lines[index].goodsId);
  }
  return ids;
}

export default function cartSelectionTest() {
  describe('OrangeShoppingCartSelection', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart selection suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0010
     * @tc.name      cart_selection_new_lines_start_selected_001
     * @tc.desc      Verify cart selection new lines start selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_new_lines_start_selected_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_new_lines_start_selected_001');
      // New lines arrive selected, so the 2 + 1 quantities sum to 3 without any explicit selection call.
      let cart: Cart = cartOf([new CartLine(10, 1000, 2), new CartLine(11, 2500, 1)]);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertTrue();
        expect(second.selected).assertTrue();
      }
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0020
     * @tc.name      cart_selection_default_flags_cover_every_line_002
     * @tc.desc      Verify cart selection default flags cover every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_default_flags_cover_every_line_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_default_flags_cover_every_line_002');
      let cart: Cart = cartOf([
        new CartLine(12, 100, 1),
        new CartLine(13, 200, 2),
        new CartLine(14, 300, 3)
      ]);
      let lines: CartLine[] = cart.allLines();
      expect(lines.length).assertEqual(3);
      for (let index: number = 0; index < lines.length; index++) {
        expect(lines[index].selected).assertTrue();
      }
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0030
     * @tc.name      cart_selection_toggle_twice_restores_the_flag_003
     * @tc.desc      Verify cart selection toggle twice restores the flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_twice_restores_the_flag_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_twice_restores_the_flag_003');
      let cart: Cart = cartOf([new CartLine(20, 1000, 1, true)]);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        let before: boolean = line.selected;
        let firstToggle: boolean = cart.toggleSelected(20);
        expect(firstToggle).assertTrue();
        expect(before !== line.selected).assertTrue();
        let secondToggle: boolean = cart.toggleSelected(20);
        expect(secondToggle).assertTrue();
        expect(line.selected).assertEqual(before);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0040
     * @tc.name      cart_selection_toggle_returns_true_for_known_goods_004
     * @tc.desc      Verify cart selection toggle returns true for known goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_returns_true_for_known_goods_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_returns_true_for_known_goods_004');
      let cart: Cart = cartOf([new CartLine(21, 800, 1, false)]);
      let toggled: boolean = cart.toggleSelected(21);
      expect(toggled).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0050
     * @tc.name      cart_selection_toggle_unknown_goods_returns_false_005
     * @tc.desc      Verify cart selection toggle unknown goods returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_unknown_goods_returns_false_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_unknown_goods_returns_false_005');
      let cart: Cart = cartOf([new CartLine(22, 800, 1, true)]);
      let toggled: boolean = cart.toggleSelected(999);
      expect(toggled).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0060
     * @tc.name      cart_selection_toggle_unknown_goods_keeps_counts_006
     * @tc.desc      Verify cart selection toggle unknown goods keeps counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_unknown_goods_keeps_counts_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_unknown_goods_keeps_counts_006');
      let cart: Cart = cartOf([
        new CartLine(23, 500, 2, true),
        new CartLine(24, 700, 1, false)
      ]);
      let beforeSelected: number = cart.selectedQuantity();
      let beforeTotal: number = cart.totalQuantity();
      let toggled: boolean = cart.toggleSelected(500);
      expect(toggled).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(beforeSelected);
      expect(cart.totalQuantity()).assertEqual(beforeTotal);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0070
     * @tc.name      cart_selection_toggle_only_affects_the_target_line_007
     * @tc.desc      Verify cart selection toggle only affects the target line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_only_affects_the_target_line_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_only_affects_the_target_line_007');
      let cart: Cart = cartOf([
        new CartLine(25, 100, 1, true),
        new CartLine(26, 200, 1, true),
        new CartLine(27, 300, 1, true)
      ]);
      cart.toggleSelected(26);
      let first: CartLine | undefined = cart.lineAt(0);
      let middle: CartLine | undefined = cart.lineAt(1);
      let last: CartLine | undefined = cart.lineAt(2);

      expect(middle !== null && middle !== undefined).assertTrue();
      if (first !== undefined && middle !== undefined && last !== undefined) {
        expect(first.selected).assertTrue();
        expect(middle.selected).assertFalse();
        expect(last.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0080
     * @tc.name      cart_selection_toggle_selects_a_previously_clear_line_008
     * @tc.desc      Verify cart selection toggle selects a previously clear line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_selects_a_previously_clear_line_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_selects_a_previously_clear_line_008');
      // A clear line contributes nothing, so selecting it lifts the quantity from 0 straight to its 4 units.
      let cart: Cart = cartOf([new CartLine(28, 450, 4, false)]);
      let before: number = cart.selectedQuantity();
      cart.toggleSelected(28);
      expect(before).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(4);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0090
     * @tc.name      cart_selection_set_selected_returns_true_for_known_goods_009
     * @tc.desc      Verify cart selection set selected returns true for known goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_selected_returns_true_for_known_goods_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_selected_returns_true_for_known_goods_009');
      let cart: Cart = cartOf([new CartLine(30, 900, 1, true)]);
      let changed: boolean = cart.setSelected(30, false);
      expect(changed).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0100
     * @tc.name      cart_selection_set_selected_clears_the_flag_010
     * @tc.desc      Verify cart selection set selected clears the flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_selected_clears_the_flag_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_selected_clears_the_flag_010');
      let cart: Cart = cartOf([new CartLine(31, 900, 3, true)]);
      cart.setSelected(31, false);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0110
     * @tc.name      cart_selection_set_selected_same_value_is_idempotent_011
     * @tc.desc      Verify cart selection set selected same value is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_selected_same_value_is_idempotent_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_selected_same_value_is_idempotent_011');
      let cart: Cart = cartOf([new CartLine(32, 1200, 2, false)]);
      // The return value only reports that goods 32 exists, so setting an already-false flag twice still yields true.
      let first: boolean = cart.setSelected(32, false);
      let second: boolean = cart.setSelected(32, false);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0120
     * @tc.name      cart_selection_set_selected_unknown_goods_returns_false_012
     * @tc.desc      Verify cart selection set selected unknown goods returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_selected_unknown_goods_returns_false_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_selected_unknown_goods_returns_false_012');
      let cart: Cart = cartOf([new CartLine(33, 1200, 2, true)]);
      let changed: boolean = cart.setSelected(404, true);
      expect(changed).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0130
     * @tc.name      cart_selection_set_selected_unknown_goods_leaves_state_013
     * @tc.desc      Verify cart selection set selected unknown goods leaves state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_selected_unknown_goods_leaves_state_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_selected_unknown_goods_leaves_state_013');
      let cart: Cart = cartOf([
        new CartLine(34, 1000, 2, true),
        new CartLine(35, 2000, 1, false)
      ]);
      let before: number = cart.selectedQuantity();
      cart.setSelected(404, false);
      expect(cart.selectedQuantity()).assertEqual(before);
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0140
     * @tc.name      cart_selection_set_all_true_marks_every_line_014
     * @tc.desc      Verify cart selection set all true marks every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_all_true_marks_every_line_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_all_true_marks_every_line_014');
      let cart: Cart = cartOf([
        new CartLine(36, 100, 1, false),
        new CartLine(37, 200, 2, true),
        new CartLine(38, 300, 3, false)
      ]);
      // Marking all three lines selected sums 1 + 2 + 3, so the selected quantity becomes the full 6.
      cart.setAllSelected(true);
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        expect(lines[index].selected).assertTrue();
      }
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0150
     * @tc.name      cart_selection_set_all_false_clears_every_line_015
     * @tc.desc      Verify cart selection set all false clears every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_all_false_clears_every_line_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_all_false_clears_every_line_015');
      let cart: Cart = cartOf([
        new CartLine(39, 100, 1, true),
        new CartLine(40, 200, 2, true)
      ]);
      cart.setAllSelected(false);
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.selectedLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0160
     * @tc.name      cart_selection_set_all_on_empty_cart_is_a_noop_016
     * @tc.desc      Verify cart selection set all on empty cart is a noop.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_all_on_empty_cart_is_a_noop_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_all_on_empty_cart_is_a_noop_016');
      // With no lines to flip, the all-selected flag stays false rather than becoming vacuously true.
      let cart: Cart = new Cart();
      cart.setAllSelected(true);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0170
     * @tc.name      cart_selection_all_flag_is_false_on_an_empty_cart_017
     * @tc.desc      Verify cart selection all flag is false on an empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_is_false_on_an_empty_cart_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_is_false_on_an_empty_cart_017');
      let cart: Cart = new Cart();
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0180
     * @tc.name      cart_selection_all_flag_is_true_for_a_single_selected_line_018
     * @tc.desc      Verify cart selection all flag is true for a single selected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_is_true_for_a_single_selected_line_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_is_true_for_a_single_selected_line_018');
      let cart: Cart = cartOf([new CartLine(41, 600, 2, true)]);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0190
     * @tc.name      cart_selection_all_flag_is_true_when_every_line_selected_019
     * @tc.desc      Verify cart selection all flag is true when every line selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_is_true_when_every_line_selected_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_is_true_when_every_line_selected_019');
      let cart: Cart = cartOf([
        new CartLine(43, 100, 1, true),
        new CartLine(44, 200, 1, true),
        new CartLine(45, 300, 1, true)
      ]);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0200
     * @tc.name      cart_selection_all_flag_is_false_when_one_line_is_clear_020
     * @tc.desc      Verify cart selection all flag is false when one line is clear.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_is_false_when_one_line_is_clear_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_is_false_when_one_line_is_clear_020');
      let cart: Cart = cartOf([
        new CartLine(46, 100, 1, true),
        new CartLine(47, 200, 1, false),
        new CartLine(48, 300, 1, true)
      ]);
      expect(cart.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0210
     * @tc.name      cart_selection_all_flag_drops_after_toggling_one_line_off_021
     * @tc.desc      Verify cart selection all flag drops after toggling one line off.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_drops_after_toggling_one_line_off_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_drops_after_toggling_one_line_off_021');
      let cart: Cart = cartOf([
        new CartLine(49, 100, 1, true),
        new CartLine(50, 200, 1, true)
      ]);
      expect(cart.isAllSelected()).assertTrue();
      cart.toggleSelected(50);
      expect(cart.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0220
     * @tc.name      cart_selection_all_flag_recovers_after_reselecting_022
     * @tc.desc      Verify cart selection all flag recovers after reselecting.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_all_flag_recovers_after_reselecting_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_all_flag_recovers_after_reselecting_022');
      let cart: Cart = cartOf([
        new CartLine(51, 100, 1, true),
        new CartLine(52, 200, 1, true)
      ]);
      cart.setSelected(51, false);
      expect(cart.isAllSelected()).assertFalse();
      cart.setSelected(51, true);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0230
     * @tc.name      cart_selection_selected_quantity_differs_from_total_when_partial_023
     * @tc.desc      Verify cart selection selected quantity differs from total when partial.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_selected_quantity_differs_from_total_when_partial_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_selected_quantity_differs_from_total_when_partial_023');
      let cart: Cart = cartOf([
        new CartLine(53, 100, 2, true),
        new CartLine(54, 200, 3, false),
        new CartLine(55, 300, 4, true)
      ]);
      // Only the 2 and 4 quantities are selected; the middle line's 3 lifts the total to 9 without joining them.
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0240
     * @tc.name      cart_selection_selected_quantity_equals_total_when_all_selected_024
     * @tc.desc      Verify cart selection selected quantity equals total when all selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_selected_quantity_equals_total_when_all_selected_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_selected_quantity_equals_total_when_all_selected_024');
      let cart: Cart = cartOf([
        new CartLine(56, 100, 2),
        new CartLine(57, 200, 3)
      ]);
      expect(cart.selectedQuantity()).assertEqual(cart.totalQuantity());
      expect(cart.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0250
     * @tc.name      cart_selection_selected_quantity_is_zero_when_none_selected_025
     * @tc.desc      Verify cart selection selected quantity is zero when none selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_selected_quantity_is_zero_when_none_selected_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_selected_quantity_is_zero_when_none_selected_025');
      let cart: Cart = cartOf([
        new CartLine(58, 100, 2),
        new CartLine(59, 200, 3)
      ]);
      cart.setAllSelected(false);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0260
     * @tc.name      cart_selection_total_quantity_ignores_selection_changes_026
     * @tc.desc      Verify cart selection total quantity ignores selection changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_total_quantity_ignores_selection_changes_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_total_quantity_ignores_selection_changes_026');
      let cart: Cart = cartOf([
        new CartLine(60, 100, 2, true),
        new CartLine(61, 200, 3, false)
      ]);
      let before: number = cart.totalQuantity();
      cart.setAllSelected(false);
      let afterClear: number = cart.totalQuantity();
      cart.setAllSelected(true);
      let afterSelect: number = cart.totalQuantity();
      expect(before).assertEqual(5);
      expect(afterClear).assertEqual(before);
      expect(afterSelect).assertEqual(before);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0270
     * @tc.name      cart_selection_selected_quantity_sums_only_selected_quantities_027
     * @tc.desc      Verify cart selection selected quantity sums only selected quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_selected_quantity_sums_only_selected_quantities_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_selected_quantity_sums_only_selected_quantities_027');
      let cart: Cart = cartOf([
        new CartLine(62, 100, 1, true),
        new CartLine(63, 100, 2, false),
        new CartLine(64, 100, 5, true),
        new CartLine(65, 100, 7, false)
      ]);
      // The loop below accumulates only selected rows, so the clear lines of 2 and 7 never reach the expected 6.
      let expected: number = 0;
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        if (lines[index].selected) {

          expected += lines[index].quantity;
        }
      }
      expect(cart.selectedQuantity()).assertEqual(expected);
      expect(cart.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0280
     * @tc.name      cart_selection_subtotal_counts_only_selected_lines_028
     * @tc.desc      Verify cart selection subtotal counts only selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_counts_only_selected_lines_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_counts_only_selected_lines_028');
      let cart: Cart = cartOf([
        new CartLine(66, 1000, 2, true),
        new CartLine(67, 5000, 1, false),
        new CartLine(68, 200, 3, true)
      ]);
      // The selected 1000 x 2 and 200 x 3 lines give 2000 + 600, while the unselected 5000 row drops out.
      let subtotal: number = cart.subtotal().cents();
      expect(subtotal).assertEqual(2600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0290
     * @tc.name      cart_selection_subtotal_ignores_an_unselected_expensive_line_029
     * @tc.desc      Verify cart selection subtotal ignores an unselected expensive line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_ignores_an_unselected_expensive_line_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_ignores_an_unselected_expensive_line_029');
      let cart: Cart = cartOf([
        new CartLine(69, 100, 1, true),
        new CartLine(70, 999999, 1, false)
      ]);
      // subtotal keeps only the selected 100, and allLinesSubtotal adds the unselected 999999 on top of it.
      expect(cart.subtotal().cents()).assertEqual(100);
      expect(cart.allLinesSubtotal().cents()).assertEqual(1000099);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0300
     * @tc.name      cart_selection_subtotal_is_zero_when_nothing_selected_030
     * @tc.desc      Verify cart selection subtotal is zero when nothing selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_is_zero_when_nothing_selected_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_is_zero_when_nothing_selected_030');
      let cart: Cart = cartOf([
        new CartLine(71, 1000, 3, true),
        new CartLine(72, 2000, 2, true)
      ]);
      cart.setAllSelected(false);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0310
     * @tc.name      cart_selection_subtotal_returns_after_selecting_all_again_031
     * @tc.desc      Verify cart selection subtotal returns after selecting all again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_returns_after_selecting_all_again_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_returns_after_selecting_all_again_031');
      let cart: Cart = cartOf([
        new CartLine(73, 1000, 3),
        new CartLine(74, 2000, 2)
      ]);
      // Clearing then reselecting restores 1000 x 3 + 2000 x 2 = 7000 because no quantity or price changed.
      let full: number = cart.subtotal().cents();
      cart.setAllSelected(false);
      cart.setAllSelected(true);
      expect(cart.subtotal().cents()).assertEqual(full);
      expect(full).assertEqual(7000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0320
     * @tc.name      cart_selection_subtotal_tracks_the_toggle_both_ways_032
     * @tc.desc      Verify cart selection subtotal tracks the toggle both ways.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_tracks_the_toggle_both_ways_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_tracks_the_toggle_both_ways_032');
      let cart: Cart = cartOf([
        new CartLine(75, 1500, 2, true),
        new CartLine(76, 400, 5, false)
      ]);
      // Toggling the 400 x 5 line adds 2000 to the initial 3000; toggling it back must return, not accumulate.
      let initial: number = cart.subtotal().cents();
      cart.toggleSelected(76);
      let selected: number = cart.subtotal().cents();
      cart.toggleSelected(76);
      let restored: number = cart.subtotal().cents();
      expect(initial).assertEqual(3000);
      expect(selected - initial).assertEqual(2000);
      expect(selected).assertEqual(5000);
      expect(restored).assertEqual(initial);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0330
     * @tc.name      cart_selection_subtotal_is_zero_on_an_empty_cart_033
     * @tc.desc      Verify cart selection subtotal is zero on an empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_is_zero_on_an_empty_cart_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_is_zero_on_an_empty_cart_033');
      let cart: Cart = new Cart();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0340
     * @tc.name      cart_selection_subtotal_respects_the_selected_quantity_034
     * @tc.desc      Verify cart selection subtotal respects the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_respects_the_selected_quantity_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_respects_the_selected_quantity_034');
      let cart: Cart = cartOf([new CartLine(79, 700, 4, true)]);
      expect(cart.subtotal().cents()).assertEqual(2800);
      // The subtotal follows the stored quantity, so raising 4 to 6 moves 2800 to 4200.
      cart.setQuantity(79, 6, 99);
      expect(cart.subtotal().cents()).assertEqual(4200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0350
     * @tc.name      cart_selection_zero_price_line_still_counts_as_selected_035
     * @tc.desc      Verify cart selection zero price line still counts as selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_zero_price_line_still_counts_as_selected_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_zero_price_line_still_counts_as_selected_035');
      let cart: Cart = cartOf([new CartLine(80, 0, 2, true)]);
      // A zero price adds nothing to the subtotal, yet the line still counts for the quantity 2 and the selected list.
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0360
     * @tc.name      cart_selection_lines_lists_only_selected_entries_036
     * @tc.desc      Verify cart selection lines lists only selected entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_lines_lists_only_selected_entries_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_lines_lists_only_selected_entries_036');
      let cart: Cart = cartOf([
        new CartLine(81, 100, 1, true),
        new CartLine(82, 200, 1, false),
        new CartLine(83, 300, 1, true)
      ]);
      let lines: CartLine[] = cart.selectedLines();
      expect(lines.length).assertEqual(2);
      expect((selectedIds(cart)).length).assertEqual(([81, 83]).length);
      for (let __i31: number = 0; __i31 < ([81, 83]).length; __i31++) {
        expect((selectedIds(cart))[__i31]).assertEqual(([81, 83])[__i31]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0370
     * @tc.name      cart_selection_lines_preserve_cart_order_037
     * @tc.desc      Verify cart selection lines preserve cart order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_lines_preserve_cart_order_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_lines_preserve_cart_order_037');
      let cart: Cart = cartOf([
        new CartLine(84, 100, 1, true),
        new CartLine(85, 200, 1, true),
        new CartLine(86, 300, 1, true)
      ]);
      cart.setSelected(84, false);
      cart.setSelected(86, false);
      let ids: number[] = selectedIds(cart);
      expect((ids).length).assertEqual(([85]).length);
      for (let __i32: number = 0; __i32 < ([85]).length; __i32++) {
        expect((ids)[__i32]).assertEqual(([85])[__i32]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0380
     * @tc.name      cart_selection_lines_are_empty_when_none_selected_038
     * @tc.desc      Verify cart selection lines are empty when none selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_lines_are_empty_when_none_selected_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_lines_are_empty_when_none_selected_038');
      let cart: Cart = cartOf([
        new CartLine(87, 100, 1, true),
        new CartLine(88, 200, 1, true)
      ]);
      cart.setAllSelected(false);
      expect(cart.selectedLines().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0390
     * @tc.name      cart_selection_lines_result_is_a_new_array_039
     * @tc.desc      Verify cart selection lines result is a new array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_lines_result_is_a_new_array_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_lines_result_is_a_new_array_039');
      let cart: Cart = cartOf([
        new CartLine(89, 100, 1, true),
        new CartLine(90, 200, 1, true)
      ]);
      let first: CartLine[] = cart.selectedLines();
      first.splice(0, 1);
      // Each selectedLines() call builds a fresh array, so trimming the first cannot shrink the second or the cart.
      let second: CartLine[] = cart.selectedLines();
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(2);
      expect(cart.allLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0400
     * @tc.name      cart_selection_lines_quantity_sums_to_selected_quantity_040
     * @tc.desc      Verify cart selection lines quantity sums to selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_lines_quantity_sums_to_selected_quantity_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_lines_quantity_sums_to_selected_quantity_040');
      let cart: Cart = cartOf([
        new CartLine(91, 100, 2, true),
        new CartLine(92, 100, 3, false),
        new CartLine(93, 100, 4, true)
      ]);
      let lines: CartLine[] = cart.selectedLines();
      let quantity: number = 0;
      for (let index: number = 0; index < lines.length; index++) {
        quantity += lines[index].quantity;
      }
      expect(quantity).assertEqual(cart.selectedQuantity());
      expect(quantity).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0410
     * @tc.name      cart_selection_quantity_increase_keeps_the_flag_041
     * @tc.desc      Verify cart selection quantity increase keeps the flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_quantity_increase_keeps_the_flag_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_quantity_increase_keeps_the_flag_041');
      let cart: Cart = cartOf([new CartLine(94, 500, 2, true)]);
      cart.setQuantity(94, 5, 99);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
        expect(line.quantity).assertEqual(5);
      }
      expect(cart.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0420
     * @tc.name      cart_selection_quantity_decrease_keeps_the_flag_042
     * @tc.desc      Verify cart selection quantity decrease keeps the flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_quantity_decrease_keeps_the_flag_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_quantity_decrease_keeps_the_flag_042');
      let cart: Cart = cartOf([new CartLine(95, 500, 5, true)]);
      cart.setQuantity(95, 1, 99);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
        expect(line.quantity).assertEqual(1);
      }
      expect(cart.subtotal().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0430
     * @tc.name      cart_selection_other_line_quantity_change_keeps_flags_043
     * @tc.desc      Verify cart selection other line quantity change keeps flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_other_line_quantity_change_keeps_flags_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_other_line_quantity_change_keeps_flags_043');
      let cart: Cart = cartOf([
        new CartLine(96, 500, 2, false),
        new CartLine(97, 700, 1, true)
      ]);
      cart.setQuantity(97, 4, 99);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0440
     * @tc.name      cart_selection_select_all_survives_a_quantity_change_044
     * @tc.desc      Verify cart selection select all survives a quantity change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_select_all_survives_a_quantity_change_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_select_all_survives_a_quantity_change_044');
      let cart: Cart = cartOf([
        new CartLine(98, 500, 1, true),
        new CartLine(99, 700, 1, true)
      ]);
      cart.setQuantity(99, 6, 99);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0450
     * @tc.name      cart_selection_toggle_off_survives_a_quantity_change_045
     * @tc.desc      Verify cart selection toggle off survives a quantity change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_off_survives_a_quantity_change_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_off_survives_a_quantity_change_045');
      let cart: Cart = cartOf([new CartLine(100, 500, 2, true)]);
      cart.toggleSelected(100);
      cart.setQuantity(100, 8, 99);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
        expect(line.quantity).assertEqual(8);
      }
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0460
     * @tc.name      cart_selection_zero_quantity_line_keeps_its_flag_046
     * @tc.desc      Verify cart selection zero quantity line keeps its flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_zero_quantity_line_keeps_its_flag_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_zero_quantity_line_keeps_its_flag_046');
      let cart: Cart = cartOf([new CartLine(101, 500, 0, true)]);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
      }
      expect(cart.selectedLines().length).assertEqual(1);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0470
     * @tc.name      cart_selection_duplicate_goods_set_targets_the_first_line_047
     * @tc.desc      Verify cart selection duplicate goods set targets the first line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_duplicate_goods_set_targets_the_first_line_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_duplicate_goods_set_targets_the_first_line_047');
      let cart: Cart = cartOf([
        new CartLine(102, 1000, 1, true),
        new CartLine(102, 2000, 2, true)
      ]);
      // Both rows carry goods 102, and the lookup stops at the first match, so only the 1-unit row flips.
      let changed: boolean = cart.setSelected(102, false);

      expect(changed).assertTrue();
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
      expect(cart.selectedQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0480
     * @tc.name      cart_selection_duplicate_goods_toggle_targets_the_first_line_048
     * @tc.desc      Verify cart selection duplicate goods toggle targets the first line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_duplicate_goods_toggle_targets_the_first_line_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_duplicate_goods_toggle_targets_the_first_line_048');
      let cart: Cart = cartOf([
        new CartLine(103, 1000, 1, true),
        new CartLine(103, 2000, 2, true)
      ]);
      let toggled: boolean = cart.toggleSelected(103);
      expect(toggled).assertTrue();
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0490
     * @tc.name      cart_selection_set_all_selects_duplicate_goods_lines_049
     * @tc.desc      Verify cart selection set all selects duplicate goods lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_all_selects_duplicate_goods_lines_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_all_selects_duplicate_goods_lines_049');
      let cart: Cart = cartOf([
        new CartLine(104, 1000, 1, true),
        new CartLine(104, 2000, 2, true)
      ]);
      cart.setSelected(104, false);
      cart.setAllSelected(true);
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        expect(lines[index].selected).assertTrue();
      }
      expect(cart.selectedQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0500
     * @tc.name      cart_selection_flags_are_independent_between_lines_050
     * @tc.desc      Verify cart selection flags are independent between lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_flags_are_independent_between_lines_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_flags_are_independent_between_lines_050');
      let cart: Cart = cartOf([
        new CartLine(105, 100, 1, true),
        new CartLine(106, 200, 1, true)
      ]);
      cart.setSelected(105, false);
      cart.setSelected(106, true);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(1);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0510
     * @tc.name      cart_selection_increasing_a_selected_line_raises_selected_quantity_051
     * @tc.desc      Verify cart selection increasing a selected line raises selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_increasing_a_selected_line_raises_selected_quantity_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_increasing_a_selected_line_raises_selected_quantity_051');
      let cart: Cart = cartOf([new CartLine(107, 250, 2, true)]);
      let before: number = cart.selectedQuantity();
      // Adding 3 units to the selected line raises 2 to 5, and the subtotal follows to 250 x 5 = 1250.
      cart.increase(107, 3, 99);
      let after: number = cart.selectedQuantity();
      expect(before).assertEqual(2);
      expect(after).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(1250);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0520
     * @tc.name      cart_selection_clear_all_then_quantity_change_keeps_zero_subtotal_052
     * @tc.desc      Verify cart selection clear all then quantity change keeps zero subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_clear_all_then_quantity_change_keeps_zero_subtotal_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_clear_all_then_quantity_change_keeps_zero_subtotal_052');
      let cart: Cart = cartOf([
        new CartLine(108, 1000, 2, true),
        new CartLine(109, 2000, 1, true)
      ]);
      // Selection stays cleared, so growing line 109 to 4 only raises the total from 3 to 6.
      cart.setAllSelected(false);
      cart.setQuantity(109, 4, 99);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0530
     * @tc.name      cart_selection_remove_unselected_line_keeps_selection_053
     * @tc.desc      Verify cart selection remove unselected line keeps selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_remove_unselected_line_keeps_selection_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_remove_unselected_line_keeps_selection_053');
      let cart: Cart = cartOf([
        new CartLine(110, 100, 1, true),
        new CartLine(111, 200, 2, false),
        new CartLine(112, 300, 3, true)
      ]);
      let removed: boolean = cart.remove(111);
      expect(removed).assertTrue();
      expect(cart.allLines().length).assertEqual(2);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0540
     * @tc.name      cart_selection_remove_selected_line_updates_selected_quantity_054
     * @tc.desc      Verify cart selection remove selected line updates selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_remove_selected_line_updates_selected_quantity_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_remove_selected_line_updates_selected_quantity_054');
      let cart: Cart = cartOf([
        new CartLine(113, 100, 2, true),
        new CartLine(114, 200, 3, true)
      ]);
      cart.remove(113);
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.allLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0550
     * @tc.name      cart_selection_clear_resets_the_selection_state_055
     * @tc.desc      Verify cart selection clear resets the selection state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_clear_resets_the_selection_state_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_clear_resets_the_selection_state_055');
      let cart: Cart = cartOf([
        new CartLine(115, 100, 1, true),
        new CartLine(116, 200, 1, true)
      ]);
      expect(cart.isAllSelected()).assertTrue();
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedLines().length).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0560
     * @tc.name      cart_selection_toggling_every_line_off_empties_the_selection_056
     * @tc.desc      Verify cart selection toggling every line off empties the selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggling_every_line_off_empties_the_selection_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggling_every_line_off_empties_the_selection_056');
      let cart: Cart = cartOf([
        new CartLine(117, 100, 1, true),
        new CartLine(118, 200, 1, true)
      ]);
      cart.toggleSelected(117);
      cart.toggleSelected(118);
      expect(cart.selectedLines().length).assertEqual(0);
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0570
     * @tc.name      cart_selection_individual_toggles_match_select_all_false_057
     * @tc.desc      Verify cart selection individual toggles match select all false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_individual_toggles_match_select_all_false_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_individual_toggles_match_select_all_false_057');
      let toggled: Cart = cartOf([
        new CartLine(119, 100, 1, true),
        new CartLine(120, 200, 2, true)
      ]);
      let batch: Cart = cartOf([
        new CartLine(119, 100, 1, true),
        new CartLine(120, 200, 2, true)
      ]);
      toggled.toggleSelected(119);
      toggled.toggleSelected(120);
      batch.setAllSelected(false);

      expect(toggled.selectedQuantity()).assertEqual(batch.selectedQuantity());
      expect(toggled.selectedLines().length).assertEqual(batch.selectedLines().length);
      expect(toggled.isAllSelected()).assertFalse();
      expect(batch.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0580
     * @tc.name      cart_selection_set_true_on_selected_line_returns_true_058
     * @tc.desc      Verify cart selection set true on selected line returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_true_on_selected_line_returns_true_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_true_on_selected_line_returns_true_058');
      let cart: Cart = cartOf([new CartLine(121, 100, 3, true)]);
      let changed: boolean = cart.setSelected(121, true);
      expect(changed).assertTrue();
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0590
     * @tc.name      cart_selection_large_quantities_are_summed_selectively_059
     * @tc.desc      Verify cart selection large quantities are summed selectively.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_large_quantities_are_summed_selectively_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_large_quantities_are_summed_selectively_059');
      let cart: Cart = cartOf([
        new CartLine(122, 100, 99, true),
        new CartLine(123, 200, 99, true),
        new CartLine(124, 300, 99, false)
      ]);
      // Two selected rows of 99 give 198, and the third unselected 99 lifts the total to 297.
      expect(cart.selectedQuantity()).assertEqual(198);
      expect(cart.totalQuantity()).assertEqual(297);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0600
     * @tc.name      cart_selection_subtotal_equals_all_lines_when_all_selected_060
     * @tc.desc      Verify cart selection subtotal equals all lines when all selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_subtotal_equals_all_lines_when_all_selected_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_subtotal_equals_all_lines_when_all_selected_060');
      let cart: Cart = cartOf([
        new CartLine(125, 1500, 2),
        new CartLine(126, 250, 4),
        new CartLine(127, 90, 1)
      ]);
      expect(cart.isAllSelected()).assertTrue();
      // 1500 x 2 + 250 x 4 + 90 adds up to 4090, so the selected subtotal equals the all-lines figure.
      expect(cart.subtotal().cents()).assertEqual(cart.allLinesSubtotal().cents());
      expect(cart.subtotal().cents()).assertEqual(4090);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0610
     * @tc.name      cart_selection_remove_selected_line_reduces_subtotal_061
     * @tc.desc      Verify cart selection remove selected line reduces subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_remove_selected_line_reduces_subtotal_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_remove_selected_line_reduces_subtotal_061');
      let cart: Cart = cartOf([
        new CartLine(130, 1000, 2, true),
        new CartLine(131, 700, 3, true)
      ]);
      cart.remove(130);
      expect(cart.subtotal().cents()).assertEqual(2100);
      expect(cart.selectedQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0620
     * @tc.name      cart_selection_zero_quantity_selected_line_keeps_all_flag_062
     * @tc.desc      Verify cart selection zero quantity selected line keeps all flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_zero_quantity_selected_line_keeps_all_flag_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_zero_quantity_selected_line_keeps_all_flag_062');
      let cart: Cart = cartOf([
        new CartLine(132, 100, 2, true),
        new CartLine(133, 200, 0, true)
      ]);
      // The zero-quantity line keeps the all flag and the line count but adds nothing to the selected 2.
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.selectedLines().length).assertEqual(2);
      expect(cart.selectedQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0630
     * @tc.name      cart_selection_set_by_id_targets_the_middle_line_063
     * @tc.desc      Verify cart selection set by id targets the middle line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_set_by_id_targets_the_middle_line_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_set_by_id_targets_the_middle_line_063');
      let cart: Cart = cartOf([
        new CartLine(134, 100, 1, true),
        new CartLine(135, 200, 1, true),
        new CartLine(136, 300, 1, true)
      ]);
      cart.setSelected(135, false);
      let ids: number[] = selectedIds(cart);
      expect((ids).length).assertEqual(([134, 136]).length);
      for (let __i33: number = 0; __i33 < ([134, 136]).length; __i33++) {
        expect((ids)[__i33]).assertEqual(([134, 136])[__i33]);
      }
      expect(cart.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0640
     * @tc.name      cart_selection_toggle_updates_selected_quantity_exactly_064
     * @tc.desc      Verify cart selection toggle updates selected quantity exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_updates_selected_quantity_exactly_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_updates_selected_quantity_exactly_064');
      let cart: Cart = cartOf([
        new CartLine(137, 100, 1, false),
        new CartLine(138, 200, 4, false),
        new CartLine(139, 300, 2, true)
      ]);
      // Toggling goods 138 on adds its 4 units to the existing 2, so the jump of 4 and the result 6 must not be conflated.
      let before: number = cart.selectedQuantity();
      cart.toggleSelected(138);
      let after: number = cart.selectedQuantity();
      expect(before).assertEqual(2);
      expect(after - before).assertEqual(4);
      expect(after).assertEqual(6);
      expect(cart.selectedLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0650
     * @tc.name      cart_selection_select_all_after_toggle_restores_subtotal_065
     * @tc.desc      Verify cart selection select all after toggle restores subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_select_all_after_toggle_restores_subtotal_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_select_all_after_toggle_restores_subtotal_065');
      let cart: Cart = cartOf([
        new CartLine(140, 1200, 2, true),
        new CartLine(141, 300, 5, true)
      ]);
      let full: number = cart.subtotal().cents();
      cart.toggleSelected(141);
      let partial: number = cart.subtotal().cents();
      cart.setAllSelected(true);
      let restored: number = cart.subtotal().cents();
      expect(partial).assertEqual(2400);
      expect(restored).assertEqual(full);
      expect(full).assertEqual(3900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SELECTION_0660
     * @tc.name      cart_selection_toggle_order_does_not_matter_066
     * @tc.desc      Verify cart selection toggle order does not matter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selection_toggle_order_does_not_matter_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selection_toggle_order_does_not_matter_066');
      let first: Cart = cartOf([
        new CartLine(142, 100, 1),
        new CartLine(143, 200, 2),
        new CartLine(144, 300, 3)
      ]);
      let second: Cart = cartOf([
        new CartLine(142, 100, 1),
        new CartLine(143, 200, 2),
        new CartLine(144, 300, 3)
      ]);
      first.toggleSelected(142);
      first.toggleSelected(143);
      second.toggleSelected(143);
      second.toggleSelected(142);

      expect((selectedIds(first)).length).assertEqual(([144]).length);
      for (let __i34: number = 0; __i34 < ([144]).length; __i34++) {
        expect((selectedIds(first))[__i34]).assertEqual(([144])[__i34]);
      }
      expect((selectedIds(second)).length).assertEqual(([144]).length);
      for (let __i35: number = 0; __i35 < ([144]).length; __i35++) {
        expect((selectedIds(second))[__i35]).assertEqual(([144])[__i35]);
      }
      // Both carts start from identical lines, so reversing the toggle order on 142 and 143 must land on the same 900.
      expect(first.selectedQuantity()).assertEqual(3);
      expect(first.subtotal().cents()).assertEqual(second.subtotal().cents());
      expect(first.subtotal().cents()).assertEqual(900);
    });
  });
}
