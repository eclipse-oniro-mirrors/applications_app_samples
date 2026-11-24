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
import { Cart, CartLine } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

function cartOf(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

function goodsIds(cart: Cart): number[] {
  let ids: number[] = [];
  let lines: CartLine[] = cart.allLines();
  for (let index: number = 0; index < lines.length; index++) {
    ids.push(lines[index].goodsId);
  }
  return ids;
}

export default function cartMergeTest() {
  describe('OrangeShoppingCartMerge', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart merge suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0010
     * @tc.name      cart_merge_empty_cart_into_empty_cart_001
     * @tc.desc      Verify cart merge empty cart into empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_empty_cart_into_empty_cart_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_empty_cart_into_empty_cart_001');
      let target: Cart = new Cart();
      let source: Cart = new Cart();
      target.merge(source);
      expect(target.isEmpty()).assertTrue();
      expect(target.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0020
     * @tc.name      cart_merge_non_empty_source_into_empty_target_002
     * @tc.desc      Verify cart merge non empty source into empty target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_non_empty_source_into_empty_target_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_non_empty_source_into_empty_target_002');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(1, 100, 2),
        new CartLine(2, 200, 3)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0030
     * @tc.name      cart_merge_into_empty_transfers_quantities_003
     * @tc.desc      Verify cart merge into empty transfers quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_empty_transfers_quantities_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_empty_transfers_quantities_003');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(3, 100, 2),
        new CartLine(4, 200, 3)
      ]);
      target.merge(source);
      expect(target.quantityOf(3)).assertEqual(2);
      expect(target.quantityOf(4)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0040
     * @tc.name      cart_merge_into_empty_transfers_unit_prices_004
     * @tc.desc      Verify cart merge into empty transfers unit prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_empty_transfers_unit_prices_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_empty_transfers_unit_prices_004');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(5, 1500, 1),
        new CartLine(6, 250, 1)
      ]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.unitPriceCents).assertEqual(1500);
        expect(second.unitPriceCents).assertEqual(250);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0050
     * @tc.name      cart_merge_into_empty_copies_selection_flags_005
     * @tc.desc      Verify cart merge into empty copies selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_empty_copies_selection_flags_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_empty_copies_selection_flags_005');
      let idPairs: number[][] = [[7, 8], [78, 79]];

      expect(idPairs.length).assertEqual(2);
      for (let index: number = 0; index < idPairs.length; index++) {
        let target: Cart = new Cart();
        let source: Cart = cartOf([
          new CartLine(idPairs[index][0], 100, 1, false),
          new CartLine(idPairs[index][1], 200, 1, true)
        ]);
        target.merge(source);
        let first: CartLine | undefined = target.lineAt(0);
        let second: CartLine | undefined = target.lineAt(1);
        expect(first !== null && first !== undefined).assertTrue();
        expect(second !== null && second !== undefined).assertTrue();
        if (first !== undefined && second !== undefined) {
          expect(first.selected).assertFalse();
          expect(second.selected).assertTrue();
          expect(first.goodsId).assertEqual(idPairs[index][0]);
          expect(second.goodsId).assertEqual(idPairs[index][1]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0060
     * @tc.name      cart_merge_disjoint_carts_concatenate_lines_006
     * @tc.desc      Verify cart merge disjoint carts concatenate lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_disjoint_carts_concatenate_lines_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_disjoint_carts_concatenate_lines_006');
      let target: Cart = cartOf([
        new CartLine(10, 100, 1),
        new CartLine(11, 200, 1)
      ]);
      let source: Cart = cartOf([
        new CartLine(12, 300, 1),
        new CartLine(13, 400, 1)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0070
     * @tc.name      cart_merge_disjoint_count_is_the_sum_007
     * @tc.desc      Verify cart merge disjoint count is the sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_disjoint_count_is_the_sum_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_disjoint_count_is_the_sum_007');
      let target: Cart = cartOf([new CartLine(14, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(15, 200, 1),
        new CartLine(16, 300, 1)
      ]);
      // Disjoint goods make the merged count the plain sum of both carts: 1 + 2.
      let expected: number = target.distinctCount() + source.distinctCount();
      target.merge(source);
      expect(target.distinctCount()).assertEqual(expected);
      expect(target.distinctCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0080
     * @tc.name      cart_merge_disjoint_keeps_target_then_source_order_008
     * @tc.desc      Verify cart merge disjoint keeps target then source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_disjoint_keeps_target_then_source_order_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_disjoint_keeps_target_then_source_order_008');
      let target: Cart = cartOf([
        new CartLine(17, 100, 1),
        new CartLine(18, 200, 1)
      ]);
      let source: Cart = cartOf([
        new CartLine(19, 300, 1),
        new CartLine(20, 400, 1)
      ]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([17, 18, 19, 20]).length);
      for (let __i23: number = 0; __i23 < ([17, 18, 19, 20]).length; __i23++) {
        expect((goodsIds(target))[__i23]).assertEqual(([17, 18, 19, 20])[__i23]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0090
     * @tc.name      cart_merge_overlap_sums_and_caps_at_ninety_nine_009
     * @tc.desc      Verify cart merge overlap sums and caps at ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_overlap_sums_and_caps_at_ninety_nine_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_overlap_sums_and_caps_at_ninety_nine_009');
      // Sums above 99 clamp to the cap, so 60 + 40 and 60 + 39 both stop at 99.
      let targetQuantities: number[] = [2, 60, 60, 2];
      let sourceQuantities: number[] = [3, 39, 40, 0];
      let expected: number[] = [5, 99, 99, 2];
      expect(targetQuantities.length).assertEqual(expected.length);
      expect(sourceQuantities.length).assertEqual(expected.length);
      for (let index: number = 0; index < targetQuantities.length; index++) {
        let goodsId: number = 21 + index;
        let target: Cart = cartOf([new CartLine(goodsId, 100, targetQuantities[index])]);
        let source: Cart = cartOf([new CartLine(goodsId, 100, sourceQuantities[index])]);
        target.merge(source);
        expect(target.quantityOf(goodsId)).assertEqual(expected[index]);
        expect(target.distinctCount()).assertEqual(1);
        expect(target.quantityOf(goodsId) <= 99).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0100
     * @tc.name      cart_merge_same_goods_keeps_one_line_010
     * @tc.desc      Verify cart merge same goods keeps one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_same_goods_keeps_one_line_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_same_goods_keeps_one_line_010');
      let target: Cart = cartOf([new CartLine(22, 100, 2)]);
      let source: Cart = cartOf([new CartLine(22, 100, 3)]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.allLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0110
     * @tc.name      cart_merge_same_goods_distinct_count_unchanged_011
     * @tc.desc      Verify cart merge same goods distinct count unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_same_goods_distinct_count_unchanged_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_same_goods_distinct_count_unchanged_011');
      let target: Cart = cartOf([new CartLine(23, 100, 2)]);
      let source: Cart = cartOf([new CartLine(23, 100, 3)]);
      let before: number = target.distinctCount();
      target.merge(source);
      expect(target.distinctCount()).assertEqual(before);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0120
     * @tc.name      cart_merge_same_goods_keeps_target_unit_price_012
     * @tc.desc      Verify cart merge same goods keeps target unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_same_goods_keeps_target_unit_price_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_same_goods_keeps_target_unit_price_012');
      let target: Cart = cartOf([new CartLine(24, 100, 2)]);
      // Overlap sums only the quantity; the target's 100-cent unit price survives.
      let source: Cart = cartOf([new CartLine(24, 999, 3)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(100);
        expect(line.quantity).assertEqual(5);
        expect(line.lineTotal().cents()).assertEqual(100 * 5);
      }
      expect(target.allLinesSubtotal().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0130
     * @tc.name      cart_merge_multiple_shared_goods_sum_each_013
     * @tc.desc      Verify cart merge multiple shared goods sum each.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_multiple_shared_goods_sum_each_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_multiple_shared_goods_sum_each_013');
      let target: Cart = cartOf([
        new CartLine(25, 100, 2),
        new CartLine(26, 200, 1)
      ]);
      let source: Cart = cartOf([
        new CartLine(26, 300, 3),
        new CartLine(25, 400, 4)
      ]);
      target.merge(source);
      expect(target.quantityOf(25)).assertEqual(6);
      expect(target.quantityOf(26)).assertEqual(4);
      expect(target.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0140
     * @tc.name      cart_merge_partial_overlap_appends_only_new_goods_014
     * @tc.desc      Verify cart merge partial overlap appends only new goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_partial_overlap_appends_only_new_goods_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_partial_overlap_appends_only_new_goods_014');
      let target: Cart = cartOf([
        new CartLine(27, 100, 1),
        new CartLine(28, 200, 1)
      ]);
      let source: Cart = cartOf([
        new CartLine(28, 200, 4),
        new CartLine(29, 300, 1)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(3);
      expect((goodsIds(target)).length).assertEqual(([27, 28, 29]).length);
      for (let __i24: number = 0; __i24 < ([27, 28, 29]).length; __i24++) {
        expect((goodsIds(target))[__i24]).assertEqual(([27, 28, 29])[__i24]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0150
     * @tc.name      cart_merge_partial_overlap_sums_the_shared_goods_015
     * @tc.desc      Verify cart merge partial overlap sums the shared goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_partial_overlap_sums_the_shared_goods_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_partial_overlap_sums_the_shared_goods_015');
      let target: Cart = cartOf([new CartLine(30, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(30, 100, 4),
        new CartLine(31, 200, 2)
      ]);
      target.merge(source);
      expect(target.quantityOf(30)).assertEqual(5);
      expect(target.quantityOf(31)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0160
     * @tc.name      cart_merge_leaves_source_line_count_untouched_016
     * @tc.desc      Verify cart merge leaves source line count untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_leaves_source_line_count_untouched_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_leaves_source_line_count_untouched_016');
      let target: Cart = cartOf([new CartLine(36, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(36, 100, 2),
        new CartLine(37, 200, 1)
      ]);
      target.merge(source);
      expect(source.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0170
     * @tc.name      cart_merge_leaves_source_quantity_untouched_017
     * @tc.desc      Verify cart merge leaves source quantity untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_leaves_source_quantity_untouched_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_leaves_source_quantity_untouched_017');
      let target: Cart = cartOf([new CartLine(38, 100, 2)]);
      let source: Cart = cartOf([new CartLine(38, 100, 3)]);
      let sourceBefore: number = source.totalQuantity();
      let sourceLinesBefore: number = source.distinctCount();
      target.merge(source);
      expect(source.quantityOf(38)).assertEqual(3);
      expect(source.totalQuantity()).assertEqual(sourceBefore);
      expect(source.distinctCount()).assertEqual(sourceLinesBefore);
      expect(target.quantityOf(38)).assertEqual(5);
      expect(target.quantityOf(38) > source.quantityOf(38)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0180
     * @tc.name      cart_merge_leaves_source_selection_untouched_018
     * @tc.desc      Verify cart merge leaves source selection untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_leaves_source_selection_untouched_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_leaves_source_selection_untouched_018');
      let target: Cart = cartOf([new CartLine(39, 100, 2, true)]);
      let source: Cart = cartOf([new CartLine(39, 100, 3, false)]);
      target.merge(source);
      let sourceLine: CartLine | undefined = source.lineAt(0);
      expect(sourceLine !== null && sourceLine !== undefined).assertTrue();
      if (sourceLine !== undefined) {
        expect(sourceLine.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0190
     * @tc.name      cart_merge_leaves_source_unit_price_untouched_019
     * @tc.desc      Verify cart merge leaves source unit price untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_leaves_source_unit_price_untouched_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_leaves_source_unit_price_untouched_019');
      let target: Cart = cartOf([new CartLine(40, 100, 1)]);
      let source: Cart = cartOf([new CartLine(40, 999, 2)]);
      let sourceTotalBefore: number = source.allLinesSubtotal().cents();
      target.merge(source);
      let sourceLine: CartLine | undefined = source.lineAt(0);
      expect(sourceLine !== null && sourceLine !== undefined).assertTrue();
      if (sourceLine !== undefined) {
        expect(sourceLine.unitPriceCents).assertEqual(999);
        expect(sourceLine.quantity).assertEqual(2);
      }
      expect(source.allLinesSubtotal().cents()).assertEqual(sourceTotalBefore);
      expect(sourceTotalBefore).assertEqual(999 * 2);
      expect(target.allLines()[0].unitPriceCents !== source.allLines()[0].unitPriceCents).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0200
     * @tc.name      cart_merge_new_line_is_selected_by_default_020
     * @tc.desc      Verify cart merge new line is selected by default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_new_line_is_selected_by_default_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_new_line_is_selected_by_default_020');
      let target: Cart = new Cart();
      let source: Cart = cartOf([new CartLine(41, 100, 2)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
      }
      expect(target.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0210
     * @tc.name      cart_merge_new_line_copies_an_unselected_source_021
     * @tc.desc      Verify cart merge new line copies an unselected source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_new_line_copies_an_unselected_source_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_new_line_copies_an_unselected_source_021');
      let target: Cart = new Cart();
      // A newly appended line carries the source's false flag instead of defaulting to selected.
      let source: Cart = cartOf([new CartLine(42, 100, 2, false)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0220
     * @tc.name      cart_merge_keeps_target_selected_flag_on_overlap_022
     * @tc.desc      Verify cart merge keeps target selected flag on overlap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_target_selected_flag_on_overlap_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_target_selected_flag_on_overlap_022');
      // Overlap leaves the target's true flag alone even though the source line is unselected.
      let target: Cart = cartOf([new CartLine(43, 100, 2, true)]);
      let source: Cart = cartOf([new CartLine(43, 100, 3, false)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0230
     * @tc.name      cart_merge_keeps_target_unselected_flag_on_overlap_023
     * @tc.desc      Verify cart merge keeps target unselected flag on overlap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_target_unselected_flag_on_overlap_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_target_unselected_flag_on_overlap_023');
      let target: Cart = cartOf([new CartLine(44, 100, 2, false)]);
      let source: Cart = cartOf([new CartLine(44, 100, 3, true)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0240
     * @tc.name      cart_merge_shared_line_is_a_separate_object_024
     * @tc.desc      Verify cart merge shared line is a separate object.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_shared_line_is_a_separate_object_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_shared_line_is_a_separate_object_024');
      let target: Cart = cartOf([new CartLine(45, 100, 2)]);
      let source: Cart = cartOf([new CartLine(45, 100, 3)]);
      let sourceLine: CartLine | undefined = source.lineAt(0);
      target.merge(source);
      let targetLine: CartLine | undefined = target.lineAt(0);
      expect(sourceLine !== null && sourceLine !== undefined).assertTrue();
      expect(targetLine !== null && targetLine !== undefined).assertTrue();
      if (sourceLine !== undefined && targetLine !== undefined) {
        expect(targetLine !== sourceLine).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0250
     * @tc.name      cart_merge_new_line_is_a_separate_object_025
     * @tc.desc      Verify cart merge new line is a separate object.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_new_line_is_a_separate_object_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_new_line_is_a_separate_object_025');
      let target: Cart = new Cart();
      let source: Cart = cartOf([new CartLine(46, 100, 2)]);
      let sourceLine: CartLine | undefined = source.lineAt(0);
      target.merge(source);
      let targetLine: CartLine | undefined = target.lineAt(0);
      expect(sourceLine !== null && sourceLine !== undefined).assertTrue();
      expect(targetLine !== null && targetLine !== undefined).assertTrue();
      if (sourceLine !== undefined && targetLine !== undefined) {
        expect(targetLine !== sourceLine).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0260
     * @tc.name      cart_merge_shared_quantity_mutation_is_isolated_026
     * @tc.desc      Verify cart merge shared quantity mutation is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_shared_quantity_mutation_is_isolated_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_shared_quantity_mutation_is_isolated_026');
      let target: Cart = cartOf([new CartLine(47, 100, 2)]);
      let source: Cart = cartOf([new CartLine(47, 100, 3)]);
      target.merge(source);
      target.setQuantity(47, 9, 99);
      expect(target.quantityOf(47)).assertEqual(9);
      expect(source.quantityOf(47)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0270
     * @tc.name      cart_merge_new_line_mutation_is_isolated_027
     * @tc.desc      Verify cart merge new line mutation is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_new_line_mutation_is_isolated_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_new_line_mutation_is_isolated_027');
      let target: Cart = new Cart();
      let source: Cart = cartOf([new CartLine(48, 100, 2)]);
      target.merge(source);
      target.setQuantity(48, 9, 99);
      expect(target.quantityOf(48)).assertEqual(9);
      expect(source.quantityOf(48)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0280
     * @tc.name      cart_merge_self_doubles_then_caps_the_quantity_028
     * @tc.desc      Verify cart merge self doubles then caps the quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_doubles_then_caps_the_quantity_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_doubles_then_caps_the_quantity_028');
      // A self-merge reads each line once, so quantities double unless the cap bites: 49 → 98, 60 → 99.
      let starts: number[] = [1, 5, 49, 60];
      let expected: number[] = [2, 10, 98, 99];
      expect(starts.length).assertEqual(expected.length);
      for (let index: number = 0; index < starts.length; index++) {
        let goodsId: number = 49 + index;
        let cart: Cart = cartOf([new CartLine(goodsId, 100, starts[index])]);
        cart.merge(cart);
        expect(cart.quantityOf(goodsId)).assertEqual(expected[index]);
        expect(cart.distinctCount()).assertEqual(1);
        expect(cart.quantityOf(goodsId) <= starts[index] * 2).assertTrue();
        expect(cart.quantityOf(goodsId) <= 99).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0290
     * @tc.name      cart_merge_self_doubles_every_line_029
     * @tc.desc      Verify cart merge self doubles every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_doubles_every_line_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_doubles_every_line_029');
      let cart: Cart = cartOf([
        new CartLine(52, 100, 2),
        new CartLine(53, 200, 3)
      ]);
      cart.merge(cart);
      expect(cart.quantityOf(52)).assertEqual(4);
      expect(cart.quantityOf(53)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0300
     * @tc.name      cart_merge_self_keeps_the_distinct_count_030
     * @tc.desc      Verify cart merge self keeps the distinct count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_keeps_the_distinct_count_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_keeps_the_distinct_count_030');
      let cart: Cart = cartOf([
        new CartLine(54, 100, 2),
        new CartLine(55, 200, 3)
      ]);
      let before: number = cart.distinctCount();
      cart.merge(cart);
      expect(cart.distinctCount()).assertEqual(before);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0310
     * @tc.name      cart_merge_self_keeps_selection_flags_031
     * @tc.desc      Verify cart merge self keeps selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_keeps_selection_flags_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_keeps_selection_flags_031');
      let cart: Cart = cartOf([
        new CartLine(56, 100, 2, false),
        new CartLine(57, 200, 3, true)
      ]);
      cart.merge(cart);
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
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0320
     * @tc.name      cart_merge_self_clamps_only_the_overflowing_line_032
     * @tc.desc      Verify cart merge self clamps only the overflowing line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_clamps_only_the_overflowing_line_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_clamps_only_the_overflowing_line_032');
      let cart: Cart = cartOf([
        new CartLine(58, 100, 2),
        new CartLine(59, 200, 60),
        new CartLine(60, 300, 3)
      ]);
      cart.merge(cart);
      expect(cart.quantityOf(58)).assertEqual(4);
      expect(cart.quantityOf(59)).assertEqual(99);
      expect(cart.quantityOf(60)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0330
     * @tc.name      cart_merge_same_source_twice_adds_twice_033
     * @tc.desc      Verify cart merge same source twice adds twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_same_source_twice_adds_twice_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_same_source_twice_adds_twice_033');
      let target: Cart = cartOf([new CartLine(61, 100, 2)]);
      let source: Cart = cartOf([new CartLine(61, 100, 3)]);
      target.merge(source);
      expect(target.quantityOf(61)).assertEqual(5);
      // The source keeps its 3 units after the first merge, so a second merge adds another 3.
      target.merge(source);
      expect(target.quantityOf(61)).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0340
     * @tc.name      cart_merge_empty_source_leaves_the_target_034
     * @tc.desc      Verify cart merge empty source leaves the target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_empty_source_leaves_the_target_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_empty_source_leaves_the_target_034');
      let target: Cart = cartOf([
        new CartLine(62, 100, 2),
        new CartLine(63, 200, 1)
      ]);
      let source: Cart = new Cart();
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(62)).assertEqual(2);
      expect(target.quantityOf(63)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0350
     * @tc.name      cart_merge_keeps_existing_target_order_035
     * @tc.desc      Verify cart merge keeps existing target order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_existing_target_order_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_existing_target_order_035');
      let target: Cart = cartOf([
        new CartLine(64, 100, 1),
        new CartLine(65, 200, 1)
      ]);
      let source: Cart = cartOf([new CartLine(66, 300, 1)]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.goodsId).assertEqual(64);
        expect(second.goodsId).assertEqual(65);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0360
     * @tc.name      cart_merge_appends_new_goods_in_source_order_036
     * @tc.desc      Verify cart merge appends new goods in source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_appends_new_goods_in_source_order_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_appends_new_goods_in_source_order_036');
      let target: Cart = cartOf([new CartLine(67, 100, 1)]);
      // New goods keep the source order, so the merged ids read 67, 68, 69, 70.
      let source: Cart = cartOf([
        new CartLine(68, 200, 1),
        new CartLine(69, 300, 1),
        new CartLine(70, 400, 1)
      ]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([67, 68, 69, 70]).length);
      for (let __i25: number = 0; __i25 < ([67, 68, 69, 70]).length; __i25++) {
        expect((goodsIds(target))[__i25]).assertEqual(([67, 68, 69, 70])[__i25]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0370
     * @tc.name      cart_merge_zero_quantity_new_goods_adds_a_line_037
     * @tc.desc      Verify cart merge zero quantity new goods adds a line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_zero_quantity_new_goods_adds_a_line_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_zero_quantity_new_goods_adds_a_line_037');
      let target: Cart = cartOf([new CartLine(72, 100, 1)]);
      // A zero-quantity line is still appended, because merge never inspects the quantity.
      let source: Cart = cartOf([new CartLine(73, 200, 0)]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(73)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0380
     * @tc.name      cart_merge_large_source_adds_every_line_038
     * @tc.desc      Verify cart merge large source adds every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_large_source_adds_every_line_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_large_source_adds_every_line_038');
      let target: Cart = cartOf([new CartLine(74, 100, 1)]);
      let sourceLines: CartLine[] = [];
      for (let index: number = 0; index < 10; index++) {
        sourceLines.push(new CartLine(800 + index, 100 + index, 1));
      }
      let source: Cart = cartOf(sourceLines);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(11);
      expect(source.distinctCount()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0390
     * @tc.name      cart_merge_into_selected_target_stays_all_selected_039
     * @tc.desc      Verify cart merge into selected target stays all selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_selected_target_stays_all_selected_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_selected_target_stays_all_selected_039');
      let target: Cart = cartOf([new CartLine(75, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(76, 200, 2),
        new CartLine(77, 300, 3)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(3);
      expect(target.isAllSelected()).assertTrue();
      expect(target.selectedQuantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0400
     * @tc.name      cart_merge_copies_mixed_selection_of_new_lines_040
     * @tc.desc      Verify cart merge copies mixed selection of new lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_copies_mixed_selection_of_new_lines_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_copies_mixed_selection_of_new_lines_040');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(78, 100, 1, false),
        new CartLine(79, 200, 1, true)
      ]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0410
     * @tc.name      cart_merge_leaves_source_distinct_count_untouched_041
     * @tc.desc      Verify cart merge leaves source distinct count untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_leaves_source_distinct_count_untouched_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_leaves_source_distinct_count_untouched_041');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(80, 100, 1),
        new CartLine(81, 200, 1)
      ]);
      target.merge(source);
      expect(source.distinctCount()).assertEqual(2);
      expect(target.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0420
     * @tc.name      cart_merge_into_empty_keeps_source_order_042
     * @tc.desc      Verify cart merge into empty keeps source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_empty_keeps_source_order_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_empty_keeps_source_order_042');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(82, 100, 1),
        new CartLine(83, 200, 1),
        new CartLine(84, 300, 1)
      ]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([82, 83, 84]).length);
      for (let __i26: number = 0; __i26 < ([82, 83, 84]).length; __i26++) {
        expect((goodsIds(target))[__i26]).assertEqual(([82, 83, 84])[__i26]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0430
     * @tc.name      cart_merge_disjoint_preserves_quantities_043
     * @tc.desc      Verify cart merge disjoint preserves quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_disjoint_preserves_quantities_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_disjoint_preserves_quantities_043');
      let target: Cart = cartOf([new CartLine(85, 100, 4)]);
      let source: Cart = cartOf([new CartLine(86, 200, 7)]);
      target.merge(source);
      expect(target.quantityOf(85)).assertEqual(4);
      expect(target.quantityOf(86)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0440
     * @tc.name      cart_merge_does_not_remove_target_lines_044
     * @tc.desc      Verify cart merge does not remove target lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_does_not_remove_target_lines_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_does_not_remove_target_lines_044');
      let target: Cart = cartOf([
        new CartLine(87, 100, 1),
        new CartLine(88, 200, 1)
      ]);
      let source: Cart = cartOf([new CartLine(89, 300, 1)]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([87, 88, 89]).length);
      for (let __i27: number = 0; __i27 < ([87, 88, 89]).length; __i27++) {
        expect((goodsIds(target))[__i27]).assertEqual(([87, 88, 89])[__i27]);
      }
      expect(target.contains(87)).assertTrue();
      expect(target.contains(88)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0450
     * @tc.name      cart_merge_three_sources_accumulate_045
     * @tc.desc      Verify cart merge three sources accumulate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_three_sources_accumulate_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_three_sources_accumulate_045');
      // Successive merges accumulate: 2 → 5 → 9, while each source keeps its own count.
      let target: Cart = cartOf([new CartLine(90, 100, 2)]);
      let second: Cart = cartOf([new CartLine(90, 100, 3)]);
      let third: Cart = cartOf([new CartLine(90, 100, 4)]);
      target.merge(second);
      target.merge(third);
      expect(target.quantityOf(90)).assertEqual(9);
      expect(second.quantityOf(90)).assertEqual(3);
      expect(third.quantityOf(90)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0460
     * @tc.name      cart_merge_keeps_flags_of_other_target_lines_046
     * @tc.desc      Verify cart merge keeps flags of other target lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_flags_of_other_target_lines_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_flags_of_other_target_lines_046');
      let target: Cart = cartOf([
        new CartLine(91, 100, 1, true),
        new CartLine(92, 200, 1, false)
      ]);
      let source: Cart = cartOf([new CartLine(93, 300, 1, false)]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertTrue();
        expect(second.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0470
     * @tc.name      cart_merge_overlap_updates_only_the_shared_line_047
     * @tc.desc      Verify cart merge overlap updates only the shared line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_overlap_updates_only_the_shared_line_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_overlap_updates_only_the_shared_line_047');
      let target: Cart = cartOf([
        new CartLine(94, 100, 2),
        new CartLine(95, 200, 1)
      ]);
      let source: Cart = cartOf([new CartLine(95, 200, 3)]);
      target.merge(source);
      expect(target.quantityOf(94)).assertEqual(2);
      expect(target.quantityOf(95)).assertEqual(4);
      expect(target.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0480
     * @tc.name      cart_merge_partial_overlap_keeps_shared_position_048
     * @tc.desc      Verify cart merge partial overlap keeps shared position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_partial_overlap_keeps_shared_position_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_partial_overlap_keeps_shared_position_048');
      let target: Cart = cartOf([
        new CartLine(96, 100, 1),
        new CartLine(97, 200, 1)
      ]);
      let source: Cart = cartOf([new CartLine(97, 200, 3)]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([96, 97]).length);
      for (let __i28: number = 0; __i28 < ([96, 97]).length; __i28++) {
        expect((goodsIds(target))[__i28]).assertEqual(([96, 97])[__i28]);
      }
      expect(target.indexOf(97)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0490
     * @tc.name      cart_merge_two_disjoint_sources_sequential_049
     * @tc.desc      Verify cart merge two disjoint sources sequential.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_two_disjoint_sources_sequential_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_two_disjoint_sources_sequential_049');
      let target: Cart = cartOf([new CartLine(98, 100, 1)]);
      let second: Cart = cartOf([new CartLine(99, 200, 1)]);
      let third: Cart = cartOf([new CartLine(1000, 300, 1)]);
      target.merge(second);
      target.merge(third);
      expect(target.distinctCount()).assertEqual(3);
      expect((goodsIds(target)).length).assertEqual(([98, 99, 1000]).length);
      for (let __i29: number = 0; __i29 < ([98, 99, 1000]).length; __i29++) {
        expect((goodsIds(target))[__i29]).assertEqual(([98, 99, 1000])[__i29]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0500
     * @tc.name      cart_merge_overlap_of_two_zero_quantities_stays_zero_050
     * @tc.desc      Verify cart merge overlap of two zero quantities stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_overlap_of_two_zero_quantities_stays_zero_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_overlap_of_two_zero_quantities_stays_zero_050');
      let target: Cart = cartOf([new CartLine(1006, 100, 0)]);
      let source: Cart = cartOf([new CartLine(1006, 100, 0)]);
      target.merge(source);
      expect(target.quantityOf(1006)).assertEqual(0);
      expect(target.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0510
     * @tc.name      cart_merge_does_not_share_the_lines_array_051
     * @tc.desc      Verify cart merge does not share the lines array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_does_not_share_the_lines_array_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_does_not_share_the_lines_array_051');
      let target: Cart = cartOf([new CartLine(1007, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(1008, 200, 1),
        new CartLine(1009, 300, 1)
      ]);
      target.merge(source);
      // allLines() hands back the live array, yet splicing it only shrinks this cart, not the source.
      target.allLines().splice(0, 2);
      expect(target.distinctCount()).assertEqual(1);
      expect(source.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0520
     * @tc.name      cart_merge_shared_goods_appears_only_once_052
     * @tc.desc      Verify cart merge shared goods appears only once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_shared_goods_appears_only_once_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_shared_goods_appears_only_once_052');
      let target: Cart = cartOf([new CartLine(1010, 100, 1)]);
      let source: Cart = cartOf([new CartLine(1010, 100, 2)]);
      target.merge(source);
      let occurrences: number = 0;
      let lines: CartLine[] = target.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        if (lines[index].goodsId === 1010) {
          occurrences++;
        }
      }
      expect(occurrences).assertEqual(1);
      expect(target.quantityOf(1010)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0530
     * @tc.name      cart_merge_after_clear_restarts_from_the_source_053
     * @tc.desc      Verify cart merge after clear restarts from the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_after_clear_restarts_from_the_source_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_after_clear_restarts_from_the_source_053');
      let target: Cart = cartOf([new CartLine(1011, 100, 2)]);
      let source: Cart = cartOf([
        new CartLine(1011, 100, 3),
        new CartLine(1012, 200, 1)
      ]);
      target.merge(source);
      expect(target.quantityOf(1011)).assertEqual(5);
      // After clear the target is empty, so the second merge starts from 0 + 3 instead of 5 + 3.
      target.clear();
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(1011)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0540
     * @tc.name      cart_merge_same_disjoint_source_twice_doubles_quantities_054
     * @tc.desc      Verify cart merge same disjoint source twice doubles quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_same_disjoint_source_twice_doubles_quantities_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_same_disjoint_source_twice_doubles_quantities_054');
      let target: Cart = cartOf([new CartLine(1013, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(1014, 200, 1),
        new CartLine(1015, 300, 1)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(3);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(3);
      expect(target.quantityOf(1014)).assertEqual(2);
      expect(target.quantityOf(1015)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0550
     * @tc.name      cart_merge_overlap_extends_the_selected_quantity_055
     * @tc.desc      Verify cart merge overlap extends the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_overlap_extends_the_selected_quantity_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_overlap_extends_the_selected_quantity_055');
      let target: Cart = cartOf([new CartLine(1017, 100, 2, true)]);
      let source: Cart = cartOf([new CartLine(1017, 100, 3, false)]);
      target.merge(source);
      expect(target.quantityOf(1017)).assertEqual(5);
      expect(target.selectedQuantity()).assertEqual(5);
      expect(target.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0560
     * @tc.name      cart_merge_into_empty_sums_the_selected_quantity_056
     * @tc.desc      Verify cart merge into empty sums the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_into_empty_sums_the_selected_quantity_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_into_empty_sums_the_selected_quantity_056');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(1018, 100, 2, true),
        new CartLine(1019, 200, 3, true)
      ]);
      target.merge(source);
      expect(target.selectedQuantity()).assertEqual(5);
      expect(target.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0570
     * @tc.name      cart_merge_self_doubles_the_selected_quantity_057
     * @tc.desc      Verify cart merge self doubles the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_doubles_the_selected_quantity_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_doubles_the_selected_quantity_057');
      let cart: Cart = cartOf([new CartLine(1021, 100, 3, true)]);
      cart.merge(cart);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0580
     * @tc.name      cart_merge_disjoint_source_keeps_mixed_selection_058
     * @tc.desc      Verify cart merge disjoint source keeps mixed selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_disjoint_source_keeps_mixed_selection_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_disjoint_source_keeps_mixed_selection_058');
      let target: Cart = cartOf([new CartLine(1022, 100, 1, true)]);
      let source: Cart = cartOf([
        new CartLine(1023, 200, 1, false),
        new CartLine(1024, 300, 1, true)
      ]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      let third: CartLine | undefined = target.lineAt(2);

      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      expect(third !== null && third !== undefined).assertTrue();
      if (first !== undefined && second !== undefined && third !== undefined) {
        expect(first.selected).assertTrue();
        expect(second.selected).assertFalse();
        expect(third.selected).assertTrue();
      }
      expect(target.selectedQuantity()).assertEqual(2);
      expect(target.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0590
     * @tc.name      cart_merge_self_keeps_zero_quantity_at_zero_059
     * @tc.desc      Verify cart merge self keeps zero quantity at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_self_keeps_zero_quantity_at_zero_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_self_keeps_zero_quantity_at_zero_059');
      let cart: Cart = cartOf([new CartLine(1025, 100, 0, true)]);
      cart.merge(cart);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.quantity).assertEqual(0);
        expect(line.selected).assertTrue();
      }
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0600
     * @tc.name      cart_merge_source_duplicate_goods_collapse_060
     * @tc.desc      Verify cart merge source duplicate goods collapse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_source_duplicate_goods_collapse_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_source_duplicate_goods_collapse_060');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(1026, 100, 2),
        new CartLine(1026, 200, 3)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.quantityOf(1026)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0610
     * @tc.name      cart_merge_source_duplicates_add_to_existing_061
     * @tc.desc      Verify cart merge source duplicates add to existing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_source_duplicates_add_to_existing_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_source_duplicates_add_to_existing_061');
      let target: Cart = cartOf([new CartLine(1027, 100, 1)]);
      let source: Cart = cartOf([
        new CartLine(1027, 100, 2),
        new CartLine(1027, 100, 3)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.quantityOf(1027)).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0620
     * @tc.name      cart_merge_duplicate_source_keeps_first_selection_062
     * @tc.desc      Verify cart merge duplicate source keeps first selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_duplicate_source_keeps_first_selection_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_duplicate_source_keeps_first_selection_062');
      let target: Cart = new Cart();
      // When the source repeats goods 1028, the first line's false flag wins and only the quantities add.
      let source: Cart = cartOf([
        new CartLine(1028, 100, 1, false),
        new CartLine(1028, 100, 2, true)
      ]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertFalse();
        expect(line.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0630
     * @tc.name      cart_merge_keeps_target_unselected_with_new_line_063
     * @tc.desc      Verify cart merge keeps target unselected with new line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_target_unselected_with_new_line_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_target_unselected_with_new_line_063');
      let target: Cart = cartOf([new CartLine(1029, 100, 1, false)]);
      let source: Cart = cartOf([new CartLine(1030, 200, 2)]);
      target.merge(source);
      let first: CartLine | undefined = target.lineAt(0);
      let second: CartLine | undefined = target.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
      expect(target.selectedQuantity()).assertEqual(2);
      expect(target.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0640
     * @tc.name      cart_merge_all_unselected_source_into_empty_064
     * @tc.desc      Verify cart merge all unselected source into empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_all_unselected_source_into_empty_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_all_unselected_source_into_empty_064');
      let target: Cart = new Cart();
      let source: Cart = cartOf([
        new CartLine(1031, 100, 1, false),
        new CartLine(1032, 200, 2, false)
      ]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.selectedQuantity()).assertEqual(0);
      expect(target.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0650
     * @tc.name      cart_merge_source_clear_does_not_affect_target_065
     * @tc.desc      Verify cart merge source clear does not affect target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_source_clear_does_not_affect_target_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_source_clear_does_not_affect_target_065');
      let target: Cart = cartOf([new CartLine(1033, 100, 2)]);
      let source: Cart = cartOf([new CartLine(1033, 100, 3)]);
      target.merge(source);
      source.clear();
      expect(source.isEmpty()).assertTrue();
      expect(target.quantityOf(1033)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0660
     * @tc.name      cart_merge_source_growth_is_seen_only_on_next_merge_066
     * @tc.desc      Verify cart merge source growth is seen only on next merge.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_source_growth_is_seen_only_on_next_merge_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_source_growth_is_seen_only_on_next_merge_066');
      let target: Cart = new Cart();
      let source: Cart = cartOf([new CartLine(1034, 100, 1)]);
      target.merge(source);
      // The merge copies at call time, so goods 1035 added later appears only after the second merge.
      source.add(1035, 200, 1, 99);
      expect(target.distinctCount()).assertEqual(1);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(1034)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0670
     * @tc.name      cart_merge_appends_new_lines_after_shared_067
     * @tc.desc      Verify cart merge appends new lines after shared.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_appends_new_lines_after_shared_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_appends_new_lines_after_shared_067');
      let target: Cart = cartOf([
        new CartLine(1036, 100, 1),
        new CartLine(1037, 200, 1)
      ]);
      let source: Cart = cartOf([
        new CartLine(1037, 200, 2),
        new CartLine(1038, 300, 1),
        new CartLine(1039, 400, 1)
      ]);
      target.merge(source);
      expect((goodsIds(target)).length).assertEqual(([1036, 1037, 1038, 1039]).length);
      for (let __i30: number = 0; __i30 < ([1036, 1037, 1038, 1039]).length; __i30++) {
        expect((goodsIds(target))[__i30]).assertEqual(([1036, 1037, 1038, 1039])[__i30]);
      }
      expect(target.indexOf(1038)).assertEqual(2);
      expect(target.quantityOf(1037)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_MERGE_0680
     * @tc.name      cart_merge_zero_source_does_not_deselect_target_068
     * @tc.desc      Verify cart merge zero source does not deselect target.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_zero_source_does_not_deselect_target_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_zero_source_does_not_deselect_target_068');
      // A zero-quantity overlap changes nothing, so the target keeps its true flag and quantity 2.
      let target: Cart = cartOf([new CartLine(1040, 100, 2, true)]);
      let source: Cart = cartOf([new CartLine(1040, 100, 0, false)]);
      target.merge(source);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
        expect(line.quantity).assertEqual(2);
      }
      expect(target.isAllSelected()).assertTrue();
    });
  });
}
