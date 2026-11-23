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

import { describe, beforeAll, it, expect, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartLine, Money } from '../Shared/ShopModel';
import { cartLine, cartWith } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function cartLineTest() {
  describe('OrangeShoppingCartLine', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart line suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0010
     * @tc.name      line_total_multiplies_unit_price_by_quantity_exactly_001
     * @tc.desc      Verify line total multiplies unit price by quantity exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_multiplies_unit_price_by_quantity_exactly_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_multiplies_unit_price_by_quantity_exactly_001');
      let prices: number[] = [15900, 123456, 999999, 3333, 1, 499900];
      let quantities: number[] = [3, 99, 77, 3, 99, 99];
      let expected: number[] = [47700, 12222144, 76999923, 9999, 99, 49490100];
      expect(prices.length).assertEqual(expected.length);
      expect(quantities.length).assertEqual(expected.length);
      // Each expected figure is unit price times quantity in cents, so 123456 x 99 must land on 12222144.
      for (let index: number = 0; index < prices.length; index++) {
        let line: CartLine = new CartLine(1, prices[index], quantities[index]);
        let total: Money = line.lineTotal();
        expect(total.cents()).assertEqual(expected[index]);
        expect(total.cents()).assertEqual(prices[index] * quantities[index]);
        expect(total.isPositive()).assertTrue();
        expect(line.unitPriceCents).assertEqual(prices[index]);
        expect(line.quantity).assertEqual(quantities[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0020
     * @tc.name      line_total_for_quantity_one_equals_price_002
     * @tc.desc      Verify line total for quantity one equals price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_quantity_one_equals_price_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_quantity_one_equals_price_002');
      let line: CartLine = new CartLine(1, 499900, 1);
      expect(line.lineTotal().cents()).assertEqual(499900);
      expect(line.lineTotal().cents()).assertEqual(line.unitPriceCents);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0030
     * @tc.name      line_total_for_zero_quantity_is_zero_003
     * @tc.desc      Verify line total for zero quantity is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_zero_quantity_is_zero_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_zero_quantity_is_zero_003');
      let line: CartLine = new CartLine(1, 15900, 0);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0040
     * @tc.name      line_total_for_zero_price_is_zero_004
     * @tc.desc      Verify line total for zero price is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_zero_price_is_zero_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_zero_price_is_zero_004');
      let line: CartLine = new CartLine(1, 0, 9);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(line.unitPriceCents).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0050
     * @tc.name      line_total_for_negative_unit_price_is_negative_005
     * @tc.desc      Verify line total for negative unit price is negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_negative_unit_price_is_negative_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_negative_unit_price_is_negative_005');
      // A negative unit price is not clamped, so -1500 x 2 propagates to -3000 and reports negative.
      let line: CartLine = new CartLine(1, -1500, 2);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(-3000);
      expect(total.isNegative()).assertTrue();
      expect(total.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0060
     * @tc.name      line_total_negative_price_with_quantity_one_is_price_006
     * @tc.desc      Verify line total negative price with quantity one is price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_negative_price_with_quantity_one_is_price_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_negative_price_with_quantity_one_is_price_006');
      let line: CartLine = new CartLine(1, -250, 1);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(-250);
      expect(total.cents()).assertEqual(line.unitPriceCents);
      expect(total.isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0070
     * @tc.name      line_total_for_negative_quantity_is_negative_007
     * @tc.desc      Verify line total for negative quantity is negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_negative_quantity_is_negative_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_negative_quantity_is_negative_007');
      let line: CartLine = new CartLine(1, 1000, -3);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(-3000);
      expect(total.isNegative()).assertTrue();
      expect(line.quantity).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0080
     * @tc.name      line_total_for_two_negatives_is_positive_008
     * @tc.desc      Verify line total for two negatives is positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_two_negatives_is_positive_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_two_negatives_is_positive_008');
      // A negative price times a negative quantity cancels both signs, leaving the positive 2000.
      let line: CartLine = new CartLine(1, -500, -4);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(2000);
      expect(total.isPositive()).assertTrue();
      expect(total.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0090
     * @tc.name      line_total_does_not_mutate_quantity_009
     * @tc.desc      Verify line total does not mutate quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_does_not_mutate_quantity_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_does_not_mutate_quantity_009');
      let line: CartLine = new CartLine(1, 15900, 6);
      line.lineTotal();
      line.lineTotal();
      expect(line.quantity).assertEqual(6);
      expect(line.lineTotal().cents()).assertEqual(95400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0100
     * @tc.name      line_total_does_not_mutate_unit_price_010
     * @tc.desc      Verify line total does not mutate unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_does_not_mutate_unit_price_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_does_not_mutate_unit_price_010');
      let line: CartLine = new CartLine(1, 15900, 6);
      line.lineTotal();
      expect(line.unitPriceCents).assertEqual(15900);
      expect(line.goodsId).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0110
     * @tc.name      line_total_returns_a_new_money_instance_011
     * @tc.desc      Verify line total returns a new money instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_returns_a_new_money_instance_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_returns_a_new_money_instance_011');
      let line: CartLine = new CartLine(1, 15900, 3);
      let first: Money = line.lineTotal();
      let second: Money = line.lineTotal();
      expect(first !== second).assertTrue();
      expect(first.cents()).assertEqual(second.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0120
     * @tc.name      line_total_scales_with_quantity_loop_012
     * @tc.desc      Verify line total scales with quantity loop.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_scales_with_quantity_loop_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_scales_with_quantity_loop_012');
      let quantities: number[] = [1, 2, 5, 10];
      let unitPrice: number = 1234;
      for (let index: number = 0; index < quantities.length; index++) {
        let line: CartLine = new CartLine(0, unitPrice, quantities[index]);
        expect(line.lineTotal().cents()).assertEqual(unitPrice * quantities[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0130
     * @tc.name      line_total_with_zero_price_and_large_quantity_is_zero_013
     * @tc.desc      Verify line total with zero price and large quantity is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_with_zero_price_and_large_quantity_is_zero_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_with_zero_price_and_large_quantity_is_zero_013');
      // A zero price zeroes out even a 123456 quantity, so the multiplier cannot rescue the total.
      let line: CartLine = new CartLine(1, 0, 123456);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(line.quantity).assertEqual(123456);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0140
     * @tc.name      constructor_defaults_selected_to_true_014
     * @tc.desc      Verify constructor defaults selected to true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_defaults_selected_to_true_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_defaults_selected_to_true_014');
      // Selection is the only omitted field here; leaving it out keeps a fresh line selected.
      let line: CartLine = new CartLine(1, 15900);
      expect(line.selected).assertTrue();
      expect(line.quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0150
     * @tc.name      constructor_accepts_explicit_true_selection_015
     * @tc.desc      Verify constructor accepts explicit true selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_accepts_explicit_true_selection_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_accepts_explicit_true_selection_015');
      let line: CartLine = new CartLine(1, 15900, 2, true);
      expect(line.selected).assertTrue();
      expect(line.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0160
     * @tc.name      constructor_accepts_explicit_false_selection_016
     * @tc.desc      Verify constructor accepts explicit false selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_accepts_explicit_false_selection_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_accepts_explicit_false_selection_016');
      let line: CartLine = new CartLine(1, 15900, 2, false);
      expect(line.selected).assertFalse();
      expect(line.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0170
     * @tc.name      constructor_defaults_quantity_to_one_017
     * @tc.desc      Verify constructor defaults quantity to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_defaults_quantity_to_one_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_defaults_quantity_to_one_017');
      let line: CartLine = new CartLine(1, 499900);
      expect(line.quantity).assertEqual(1);
      expect(line.lineTotal().cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0180
     * @tc.name      constructor_stores_explicit_quantity_018
     * @tc.desc      Verify constructor stores explicit quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_stores_explicit_quantity_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_stores_explicit_quantity_018');
      let line: CartLine = new CartLine(1, 499900, 8);
      expect(line.quantity).assertEqual(8);
      expect(line.unitPriceCents).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0190
     * @tc.name      constructor_stores_unit_price_019
     * @tc.desc      Verify constructor stores unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_stores_unit_price_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_stores_unit_price_019');
      let line: CartLine = new CartLine(1, 129900, 3);
      expect(line.unitPriceCents).assertEqual(129900);
      expect(line.lineTotal().cents()).assertEqual(389700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0200
     * @tc.name      constructor_stores_goods_id_020
     * @tc.desc      Verify constructor stores goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_stores_goods_id_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_stores_goods_id_020');
      let line: CartLine = new CartLine(15, 15900, 2);
      expect(line.goodsId).assertEqual(15);
      expect(line.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0210
     * @tc.name      constructor_accepts_zero_goods_id_021
     * @tc.desc      Verify constructor accepts zero goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_accepts_zero_goods_id_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_accepts_zero_goods_id_021');
      let line: CartLine = new CartLine(0, 499900, 1);
      expect(line.goodsId).assertEqual(0);
      expect(line.lineTotal().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0220
     * @tc.name      constructor_accepts_negative_goods_id_022
     * @tc.desc      Verify constructor accepts negative goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_accepts_negative_goods_id_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_accepts_negative_goods_id_022');
      let line: CartLine = new CartLine(-1, 1000, 2);
      expect(line.goodsId).assertEqual(-1);
      expect(line.lineTotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0230
     * @tc.name      copy_returns_a_distinct_instance_023
     * @tc.desc      Verify copy returns a distinct instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_returns_a_distinct_instance_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_returns_a_distinct_instance_023');
      let line: CartLine = new CartLine(1, 15900, 3);
      let copy: CartLine = line.copy();
      expect(copy !== line).assertTrue();
      expect(copy.goodsId).assertEqual(line.goodsId);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0240
     * @tc.name      copy_preserves_goods_id_024
     * @tc.desc      Verify copy preserves goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_goods_id_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_goods_id_024');
      let line: CartLine = new CartLine(7, 15900, 3, false);
      let copy: CartLine = line.copy();
      expect(copy.goodsId).assertEqual(7);
      expect(copy.selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0250
     * @tc.name      copy_preserves_unit_price_025
     * @tc.desc      Verify copy preserves unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_unit_price_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_unit_price_025');
      let line: CartLine = new CartLine(1, 129900, 3);
      let copy: CartLine = line.copy();
      expect(copy.unitPriceCents).assertEqual(129900);
      expect(copy.lineTotal().cents()).assertEqual(389700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0260
     * @tc.name      copy_preserves_quantity_026
     * @tc.desc      Verify copy preserves quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_quantity_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_quantity_026');
      let line: CartLine = new CartLine(1, 15900, 9);
      let copy: CartLine = line.copy();
      expect(copy.quantity).assertEqual(9);
      expect(copy.lineTotal().cents()).assertEqual(143100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0270
     * @tc.name      copy_preserves_false_selection_027
     * @tc.desc      Verify copy preserves false selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_false_selection_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_false_selection_027');
      let line: CartLine = new CartLine(1, 15900, 2, false);
      let copy: CartLine = line.copy();
      expect(copy.selected).assertFalse();
      expect(copy.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0280
     * @tc.name      copy_preserves_true_selection_028
     * @tc.desc      Verify copy preserves true selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_true_selection_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_true_selection_028');
      let line: CartLine = new CartLine(1, 15900, 2, true);
      let copy: CartLine = line.copy();
      expect(copy.selected).assertTrue();
      expect(copy.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0290
     * @tc.name      copy_quantity_is_independent_of_source_029
     * @tc.desc      Verify copy quantity is independent of source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_quantity_is_independent_of_source_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_quantity_is_independent_of_source_029');
      let line: CartLine = new CartLine(1, 15900, 2);
      let copy: CartLine = line.copy();
      let sourceBefore: number = line.lineTotal().cents();
      // Raising the copy from 2 to 8 adds six units, so the gap against the source total is 15900 x 6.
      copy.quantity = 8;
      let copyAfter: number = copy.lineTotal().cents();
      expect(copyAfter - sourceBefore).assertEqual(15900 * 6);
      expect(line.lineTotal().cents()).assertEqual(sourceBefore);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0300
     * @tc.name      copy_unit_price_is_independent_of_source_030
     * @tc.desc      Verify copy unit price is independent of source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_unit_price_is_independent_of_source_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_unit_price_is_independent_of_source_030');
      let line: CartLine = new CartLine(1, 15900, 2);
      let copy: CartLine = line.copy();
      // A 9999 price on the copy shifts its total by the 5901-cent gap against 15900, times 2 units.
      copy.unitPriceCents = 9999;
      expect(copy.lineTotal().cents()).assertEqual(9999 * 2);
      expect(line.lineTotal().cents()).assertEqual(15900 * 2);
      expect(copy.lineTotal().cents() - line.lineTotal().cents()).assertEqual((9999 - 15900) * 2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0310
     * @tc.name      copy_goods_id_is_independent_of_source_031
     * @tc.desc      Verify copy goods id is independent of source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_goods_id_is_independent_of_source_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_goods_id_is_independent_of_source_031');
      let line: CartLine = new CartLine(1, 15900, 2);
      let copies: CartLine[] = [line.copy(), line.copy()];
      // Two separate copy() calls yield independent objects, so renaming the first leaves the second on goods 1.
      copies[0].goodsId = 9;
      for (let index: number = 0; index < copies.length; index++) {
        expect(copies[index].goodsId).assertEqual(index === 0 ? 9 : 1);
        expect(copies[index].quantity).assertEqual(2);
      }
      expect(line.goodsId).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0320
     * @tc.name      copy_selection_is_independent_of_source_032
     * @tc.desc      Verify copy selection is independent of source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_selection_is_independent_of_source_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_selection_is_independent_of_source_032');
      let line: CartLine = new CartLine(1, 15900, 2, true);
      let copy: CartLine = line.copy();
      copy.selected = false;
      expect(copy.selected).assertFalse();
      expect(line.selected).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0330
     * @tc.name      source_stays_intact_when_copy_changes_033
     * @tc.desc      Verify source stays intact when copy changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('source_stays_intact_when_copy_changes_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: source_stays_intact_when_copy_changes_033');
      let line: CartLine = new CartLine(1, 15900, 3, true);
      let copy: CartLine = line.copy();
      copy.quantity = 10;
      copy.unitPriceCents = 1;
      copy.selected = false;
      expect(line.quantity).assertEqual(3);
      expect(line.unitPriceCents).assertEqual(15900);
      expect(line.selected).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0340
     * @tc.name      source_mutation_does_not_change_existing_copy_034
     * @tc.desc      Verify source mutation does not change existing copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('source_mutation_does_not_change_existing_copy_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: source_mutation_does_not_change_existing_copy_034');
      let line: CartLine = new CartLine(1, 15900, 3);
      let copy: CartLine = line.copy();
      let copyTotal: number = copy.lineTotal().cents();
      // The copy was taken at quantity 3; mutating the source to 10 and the copy to 1 keeps each total on its own field.
      line.quantity = 10;
      expect(copy.lineTotal().cents()).assertEqual(copyTotal);
      let lineTotalAfterSource: number = line.lineTotal().cents();
      copy.quantity = 1;
      expect(line.lineTotal().cents()).assertEqual(lineTotalAfterSource);
      expect(copy.lineTotal().cents()).assertEqual(15900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0350
     * @tc.name      copy_of_copy_preserves_fields_035
     * @tc.desc      Verify copy of copy preserves fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_of_copy_preserves_fields_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_of_copy_preserves_fields_035');
      let line: CartLine = new CartLine(5, 29900, 4, false);
      let copy: CartLine = line.copy().copy();
      expect(copy.goodsId).assertEqual(5);
      expect(copy.unitPriceCents).assertEqual(29900);
      expect(copy.quantity).assertEqual(4);
      expect(copy.selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0360
     * @tc.name      copy_total_equals_source_total_036
     * @tc.desc      Verify copy total equals source total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_total_equals_source_total_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_total_equals_source_total_036');
      let line: CartLine = new CartLine(1, 15900, 6);
      let copy: CartLine = line.copy();
      expect(copy.lineTotal().cents()).assertEqual(line.lineTotal().cents());
      expect(line.lineTotal().cents()).assertEqual(95400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0370
     * @tc.name      cart_with_copies_input_lines_037
     * @tc.desc      Verify cart with copies input lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_copies_input_lines_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_copies_input_lines_037');
      let source: CartLine = new CartLine(1, 15900, 2);
      let cart: Cart = cartWith([source]);
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0380
     * @tc.name      cart_with_isolates_later_source_mutation_038
     * @tc.desc      Verify cart with isolates later source mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_isolates_later_source_mutation_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_isolates_later_source_mutation_038');
      let source: CartLine = new CartLine(1, 15900, 2);
      let cart: Cart = cartWith([source]);
      // cartWith deep-copies the input line, so changing the caller's 15900 x 2 source afterwards must not leak in.
      source.quantity = 9;
      source.unitPriceCents = 1;
      expect(cart.quantityOf(1)).assertEqual(2);
      let stored: CartLine | undefined = cart.lineAt(0);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.unitPriceCents).assertEqual(15900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0390
     * @tc.name      cart_with_line_total_matches_source_039
     * @tc.desc      Verify cart with line total matches source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_line_total_matches_source_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_line_total_matches_source_039');
      let source: CartLine = new CartLine(1, 15900, 3);
      let cart: Cart = cartWith([source]);
      let stored: CartLine | undefined = cart.lineAt(0);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.lineTotal().cents()).assertEqual(source.lineTotal().cents());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0400
     * @tc.name      line_at_returns_the_line_at_each_valid_index_040
     * @tc.desc      Verify line at returns the line at each valid index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_returns_the_line_at_each_valid_index_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_returns_the_line_at_each_valid_index_040');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      // lineAt and allLines expose the same stored object, so the identity comparison must hold at every index.
      let ids: number[] = [1, 2];
      let quantities: number[] = [2, 3];
      expect(ids.length).assertEqual(quantities.length);
      for (let index: number = 0; index < ids.length; index++) {
        let line: CartLine | undefined = cart.lineAt(index);
        expect(line !== null && line !== undefined).assertTrue();
        if (line !== undefined) {
          expect(line.goodsId).assertEqual(ids[index]);
          expect(line.quantity).assertEqual(quantities[index]);
          expect(line === cart.allLines()[index]).assertTrue();
        }
      }
      expect(cart.lineAt(0) === cart.lineAt(ids.length - 1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0410
     * @tc.name      line_at_negative_index_is_undefined_041
     * @tc.desc      Verify line at negative index is undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_negative_index_is_undefined_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_negative_index_is_undefined_041');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let line: CartLine | undefined = cart.lineAt(-1);
      expect(line === undefined).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0420
     * @tc.name      line_at_index_equal_to_length_is_undefined_042
     * @tc.desc      Verify line at index equal to length is undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_index_equal_to_length_is_undefined_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_index_equal_to_length_is_undefined_042');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      // Index 2 equals the line count, so lineAt treats the length itself as out of range instead of wrapping.
      let line: CartLine | undefined = cart.lineAt(2);
      expect(line === undefined).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0430
     * @tc.name      line_at_index_beyond_length_is_undefined_043
     * @tc.desc      Verify line at index beyond length is undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_index_beyond_length_is_undefined_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_index_beyond_length_is_undefined_043');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let line: CartLine | undefined = cart.lineAt(99);
      expect(line === undefined).assertTrue();
      expect(cart.lineAt(-99) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0440
     * @tc.name      line_at_on_empty_cart_is_undefined_044
     * @tc.desc      Verify line at on empty cart is undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_on_empty_cart_is_undefined_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_on_empty_cart_is_undefined_044');
      let cart: Cart = new Cart();
      let atZero: CartLine | undefined = cart.lineAt(0);
      expect(atZero === undefined).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0450
     * @tc.name      line_at_returns_the_internal_line_identity_045
     * @tc.desc      Verify line at returns the internal line identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_returns_the_internal_line_identity_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_returns_the_internal_line_identity_045');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line === lines[0]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0460
     * @tc.name      all_lines_length_matches_distinct_count_046
     * @tc.desc      Verify all lines length matches distinct count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_length_matches_distinct_count_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_length_matches_distinct_count_046');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let lines: CartLine[] = cart.allLines();
      expect(lines.length).assertEqual(3);
      expect(lines.length).assertEqual(cart.distinctCount());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0470
     * @tc.name      all_lines_returns_the_internal_array_047
     * @tc.desc      Verify all lines returns the internal array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_returns_the_internal_array_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_returns_the_internal_array_047');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      // Unlike the filtered selections elsewhere, allLines hands back the live internal array, so both calls share one reference.
      let first: CartLine[] = cart.allLines();
      let second: CartLine[] = cart.allLines();
      expect(first === second).assertTrue();
      expect(first.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0480
     * @tc.name      all_lines_push_is_visible_in_the_cart_048
     * @tc.desc      Verify all lines push is visible in the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_push_is_visible_in_the_cart_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_push_is_visible_in_the_cart_048');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      // Because allLines is the internal array, appending goods 2 is immediately visible to count and quantity.
      lines.push(new CartLine(2, 129900, 3));
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.contains(2)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0490
     * @tc.name      all_lines_element_mutation_is_visible_049
     * @tc.desc      Verify all lines element mutation is visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_mutation_is_visible_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_mutation_is_visible_049');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      lines[0].quantity = 7;
      expect(cart.quantityOf(1)).assertEqual(7);
      expect(cart.totalQuantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0500
     * @tc.name      all_lines_element_price_mutation_is_visible_050
     * @tc.desc      Verify all lines element price mutation is visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_price_mutation_is_visible_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_price_mutation_is_visible_050');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      lines[0].unitPriceCents = 1000;
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(1000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0510
     * @tc.name      all_lines_splice_is_visible_in_the_cart_051
     * @tc.desc      Verify all lines splice is visible in the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_splice_is_visible_in_the_cart_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_splice_is_visible_in_the_cart_051');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let lines: CartLine[] = cart.allLines();
      lines.splice(0, 1);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(1)).assertFalse();
      expect(cart.quantityOf(2)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0520
     * @tc.name      line_at_reflects_all_lines_element_assignment_052
     * @tc.desc      Verify line at reflects all lines element assignment.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_reflects_all_lines_element_assignment_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_reflects_all_lines_element_assignment_052');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      // Overwriting slot 0 with goods 5 removes goods 1, so the old id stops resolving through indexOf.
      lines[0] = new CartLine(5, 5000, 4);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.goodsId).assertEqual(5);
        expect(line.quantity).assertEqual(4);
      }
      expect(cart.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0530
     * @tc.name      all_lines_on_empty_cart_is_empty_053
     * @tc.desc      Verify all lines on empty cart is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_on_empty_cart_is_empty_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_on_empty_cart_is_empty_053');
      let cart: Cart = new Cart();
      let lines: CartLine[] = cart.allLines();
      expect(lines.length).assertEqual(0);
      expect(lines.length).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0540
     * @tc.name      all_lines_contains_lines_in_order_054
     * @tc.desc      Verify all lines contains lines in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_contains_lines_in_order_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_contains_lines_in_order_054');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3),
        cartLine(3, 59900, 4)]);
      let lines: CartLine[] = cart.allLines();
      expect(lines[0].goodsId).assertEqual(1);
      expect(lines[1].goodsId).assertEqual(2);
      expect(lines[2].goodsId).assertEqual(3);
      expect(lines.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0550
     * @tc.name      all_lines_element_zero_quantity_updates_total_055
     * @tc.desc      Verify all lines element zero quantity updates total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_zero_quantity_updates_total_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_zero_quantity_updates_total_055');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let lines: CartLine[] = cart.allLines();
      lines[1].quantity = 0;
      expect(cart.quantityOf(2)).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0560
     * @tc.name      all_lines_element_selection_change_updates_selected_056
     * @tc.desc      Verify all lines element selection change updates selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_selection_change_updates_selected_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_selection_change_updates_selected_056');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, true)]);
      let lines: CartLine[] = cart.allLines();
      lines[0].selected = false;
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0570
     * @tc.name      line_total_negative_quantity_with_zero_price_is_zero_057
     * @tc.desc      Verify line total negative quantity with zero price is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_negative_quantity_with_zero_price_is_zero_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_negative_quantity_with_zero_price_is_zero_057');
      let line: CartLine = new CartLine(1, 0, -5);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(line.quantity).assertEqual(-5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0580
     * @tc.name      line_total_negative_price_with_zero_quantity_is_zero_058
     * @tc.desc      Verify line total negative price with zero quantity is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_negative_price_with_zero_quantity_is_zero_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_negative_price_with_zero_quantity_is_zero_058');
      let line: CartLine = new CartLine(1, -500, 0);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(line.unitPriceCents).assertEqual(-500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0590
     * @tc.name      constructor_with_all_arguments_sets_every_field_059
     * @tc.desc      Verify constructor with all arguments sets every field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_with_all_arguments_sets_every_field_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_with_all_arguments_sets_every_field_059');
      let line: CartLine = new CartLine(12, 3456, 7, false);
      expect(line.goodsId).assertEqual(12);
      expect(line.unitPriceCents).assertEqual(3456);
      expect(line.quantity).assertEqual(7);
      expect(line.selected).assertFalse();
      expect(line.lineTotal().cents()).assertEqual(24192);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0600
     * @tc.name      default_selection_of_two_instances_is_independent_060
     * @tc.desc      Verify default selection of two instances is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('default_selection_of_two_instances_is_independent_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: default_selection_of_two_instances_is_independent_060');
      let first: CartLine = new CartLine(1, 1000, 1);
      let second: CartLine = new CartLine(2, 2000, 1);
      first.selected = false;
      expect(first.selected).assertFalse();
      expect(second.selected).assertTrue();
      expect(second.quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0610
     * @tc.name      copy_preserves_zero_quantity_061
     * @tc.desc      Verify copy preserves zero quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_zero_quantity_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_zero_quantity_061');
      let line: CartLine = new CartLine(1, 15900, 0);
      let copy: CartLine = line.copy();
      expect(copy.quantity).assertEqual(0);
      expect(copy.lineTotal().cents()).assertEqual(0);
      expect(copy.selected).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0620
     * @tc.name      copy_preserves_negative_unit_price_062
     * @tc.desc      Verify copy preserves negative unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_negative_unit_price_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_negative_unit_price_062');
      let line: CartLine = new CartLine(1, -700, 2);
      let copy: CartLine = line.copy();
      expect(copy.unitPriceCents).assertEqual(-700);
      expect(copy.lineTotal().cents()).assertEqual(-1400);
      expect(copy.lineTotal().isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0630
     * @tc.name      copy_preserves_negative_quantity_sign_063
     * @tc.desc      Verify copy preserves negative quantity sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_preserves_negative_quantity_sign_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_preserves_negative_quantity_sign_063');
      let line: CartLine = new CartLine(1, 1000, -3);
      let copy: CartLine = line.copy();
      expect(copy.quantity).assertEqual(-3);
      expect(copy.lineTotal().cents()).assertEqual(-3000);
      expect(copy.lineTotal().isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0640
     * @tc.name      cart_with_does_not_reuse_input_array_064
     * @tc.desc      Verify cart with does not reuse input array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_does_not_reuse_input_array_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_does_not_reuse_input_array_064');
      let input: CartLine[] = [cartLine(1, 399900, 2)];
      let cart: Cart = cartWith(input);
      expect(cart.allLines() !== input).assertTrue();
      // The cart keeps its own container, so the caller's array grows to 2 while the cart still counts 1.
      input.push(cartLine(2, 129900, 3));
      expect(cart.distinctCount()).assertEqual(1);
      expect(input.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0650
     * @tc.name      cart_with_two_lines_copies_each_065
     * @tc.desc      Verify cart with two lines copies each.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_two_lines_copies_each_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_two_lines_copies_each_065');
      let first: CartLine = new CartLine(1, 1000, 2);
      let second: CartLine = new CartLine(2, 2000, 3);
      let cart: Cart = cartWith([first, second]);
      first.quantity = 9;
      second.unitPriceCents = 1;
      expect(cart.quantityOf(1)).assertEqual(2);
      expect(cart.quantityOf(2)).assertEqual(3);
      let stored: CartLine | undefined = cart.lineAt(1);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.unitPriceCents).assertEqual(2000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0660
     * @tc.name      cart_with_preserves_line_order_066
     * @tc.desc      Verify cart with preserves line order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_preserves_line_order_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_preserves_line_order_066');
      let cart: Cart = cartWith([cartLine(5, 29900, 1), cartLine(2, 129900, 1),
        cartLine(8, 15900, 1)]);
      let lines: CartLine[] = cart.allLines();
      expect(lines[0].goodsId).assertEqual(5);
      expect(lines[1].goodsId).assertEqual(2);
      expect(lines[2].goodsId).assertEqual(8);
      expect(cart.indexOf(8)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0670
     * @tc.name      cart_with_preserves_selection_flags_067
     * @tc.desc      Verify cart with preserves selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_preserves_selection_flags_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_preserves_selection_flags_067');
      let cart: Cart = cartWith([cartLine(1, 1000, 2, true),
        cartLine(2, 2000, 3, false), cartLine(3, 3000, 4, true)]);
      let lines: CartLine[] = cart.allLines();
      expect(lines[0].selected).assertTrue();
      expect(lines[1].selected).assertFalse();
      expect(lines[2].selected).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0680
     * @tc.name      copy_total_changes_independently_when_copy_quantity_changes_068
     * @tc.desc      Verify copy total changes independently when copy quantity changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('copy_total_changes_independently_when_copy_quantity_changes_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_total_changes_independently_when_copy_quantity_changes_068');
      let line: CartLine = new CartLine(1, 1000, 2);
      let copy: CartLine = line.copy();
      copy.quantity = 5;
      expect(copy.lineTotal().cents()).assertEqual(5000);
      expect(line.lineTotal().cents()).assertEqual(2000);
      expect(line.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0690
     * @tc.name      all_lines_element_goods_id_change_updates_index_069
     * @tc.desc      Verify all lines element goods id change updates index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_goods_id_change_updates_index_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_goods_id_change_updates_index_069');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      // Indexing reads the live goods id on every call, so mutating 1 to 9 moves the lookup without a reindex.
      lines[0].goodsId = 9;
      expect(cart.indexOf(9)).assertEqual(0);
      expect(cart.indexOf(1)).assertEqual(-1);
      expect(cart.contains(9)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0700
     * @tc.name      all_lines_unshift_is_visible_070
     * @tc.desc      Verify all lines unshift is visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_unshift_is_visible_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_unshift_is_visible_070');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let lines: CartLine[] = cart.allLines();
      lines.unshift(new CartLine(9, 1000, 3));
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.indexOf(9)).assertEqual(0);
      expect(cart.quantityOf(9)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0710
     * @tc.name      all_lines_pop_is_visible_071
     * @tc.desc      Verify all lines pop is visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_pop_is_visible_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_pop_is_visible_071');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let lines: CartLine[] = cart.allLines();
      let removed: CartLine | undefined = lines.pop();
      expect(removed !== null && removed !== undefined).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.contains(2)).assertFalse();
      expect(cart.lineAt(1) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0720
     * @tc.name      all_lines_reverse_is_visible_072
     * @tc.desc      Verify all lines reverse is visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_reverse_is_visible_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_reverse_is_visible_072');
      let cart: Cart = cartWith([cartLine(1, 399900, 1), cartLine(2, 129900, 1),
        cartLine(3, 59900, 1)]);
      let lines: CartLine[] = cart.allLines();
      // Reversing the shared array flips positions, so goods 3 becomes index 0 and goods 1 moves to index 2.
      lines.reverse();
      expect(cart.indexOf(3)).assertEqual(0);
      expect(cart.indexOf(1)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0730
     * @tc.name      line_at_returns_same_line_on_repeated_reads_073
     * @tc.desc      Verify line at returns same line on repeated reads.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_at_returns_same_line_on_repeated_reads_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_at_returns_same_line_on_repeated_reads_073');
      let cart: Cart = cartWith([cartLine(1, 399900, 2)]);
      let first: CartLine | undefined = cart.lineAt(0);
      let second: CartLine | undefined = cart.lineAt(0);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first === second).assertTrue();
        expect(second.quantity).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0740
     * @tc.name      all_lines_element_quantity_change_does_not_change_other_074
     * @tc.desc      Verify all lines element quantity change does not change other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_element_quantity_change_does_not_change_other_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_element_quantity_change_does_not_change_other_074');
      let cart: Cart = cartWith([cartLine(1, 399900, 2), cartLine(2, 129900, 3)]);
      let lines: CartLine[] = cart.allLines();
      lines[0].quantity = 7;
      expect(cart.quantityOf(1)).assertEqual(7);
      expect(cart.quantityOf(2)).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0750
     * @tc.name      constructor_quantity_zero_and_unselected_fields_075
     * @tc.desc      Verify constructor quantity zero and unselected fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('constructor_quantity_zero_and_unselected_fields_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: constructor_quantity_zero_and_unselected_fields_075');
      let line: CartLine = new CartLine(3, 500, 0, false);
      expect(line.quantity).assertEqual(0);
      expect(line.selected).assertFalse();
      expect(line.unitPriceCents).assertEqual(500);
      expect(line.lineTotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_LINE_0760
     * @tc.name      all_lines_selection_change_does_not_change_other_076
     * @tc.desc      Verify all lines selection change does not change other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('all_lines_selection_change_does_not_change_other_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: all_lines_selection_change_does_not_change_other_076');
      let cart: Cart = cartWith([cartLine(1, 399900, 2, true),
        cartLine(2, 129900, 3, false)]);
      let lines: CartLine[] = cart.allLines();
      lines[0].selected = false;
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(lines[1].selected).assertFalse();
    });
  });
}
