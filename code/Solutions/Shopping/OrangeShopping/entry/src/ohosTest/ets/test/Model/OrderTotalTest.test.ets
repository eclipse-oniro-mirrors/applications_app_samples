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

import { describe, beforeAll, expect, it, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CartLine, Money, Order, OrderState } from '../Shared/ShopModel';
import { cartLine } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

const ALL_STATES: OrderState[] = [
  OrderState.OBLIGATION,
  OrderState.WAIT_DELIVERY,
  OrderState.WAIT_RECEIVE,
  OrderState.WAIT_EVALUATE,
  OrderState.REFUND,
  OrderState.COMPLETED,
  OrderState.CANCELLED
];

/** Defaults state to OBLIGATION and createdAt to 1700000000. */
function makeOrder(id: number, lines: CartLine[], state: OrderState = OrderState.OBLIGATION,
  createdAt: number = 1700000000): Order {
  return new Order(id, lines, state, createdAt);
}

export default function orderTotalTest() {
  describe('OrangeShoppingOrderTotal', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'order total suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0010
     * @tc.name      total_empty_order_is_zero_001
     * @tc.desc      Verify total empty order is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_empty_order_is_zero_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_empty_order_is_zero_001');
      let order: Order = makeOrder(900, []);
      expect(order.total().cents()).assertEqual(0);
      expect(order.total().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0020
     * @tc.name      quantity_empty_order_is_zero_002
     * @tc.desc      Verify quantity empty order is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_empty_order_is_zero_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_empty_order_is_zero_002');
      let order: Order = makeOrder(901, []);
      expect(order.quantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0030
     * @tc.name      empty_order_has_no_lines_003
     * @tc.desc      Verify empty order has no lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_order_has_no_lines_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_order_has_no_lines_003');
      let order: Order = makeOrder(902, []);
      expect(order.lines.length).assertEqual(0);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0040
     * @tc.name      total_single_line_multiplies_unit_and_quantity_004
     * @tc.desc      Verify total single line multiplies unit and quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_single_line_multiplies_unit_and_quantity_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_single_line_multiplies_unit_and_quantity_004');
      // One line of 19900 cents at quantity 3 gives 59700.
      let order: Order = makeOrder(903, [cartLine(0, 19900, 3)]);
      expect(order.total().cents()).assertEqual(59700);
      expect(order.lines.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0050
     * @tc.name      quantity_single_line_matches_its_quantity_005
     * @tc.desc      Verify quantity single line matches its quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_single_line_matches_its_quantity_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_single_line_matches_its_quantity_005');
      let order: Order = makeOrder(904, [cartLine(1, 399900, 4)]);
      expect(order.quantity()).assertEqual(4);
      expect(order.lines[0].quantity).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0060
     * @tc.name      total_single_line_quantity_one_006
     * @tc.desc      Verify total single line quantity one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_single_line_quantity_one_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_single_line_quantity_one_006');
      let order: Order = makeOrder(905, [cartLine(2, 129900, 1)]);
      expect(order.total().cents()).assertEqual(129900);
      expect(order.total().cents()).assertEqual(order.lines[0].unitPriceCents);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0070
     * @tc.name      total_single_line_zero_quantity_007
     * @tc.desc      Verify total single line zero quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_single_line_zero_quantity_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_single_line_zero_quantity_007');
      let order: Order = makeOrder(906, [cartLine(3, 59900, 0)]);
      expect(order.total().cents()).assertEqual(0);
      expect(order.lines.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0080
     * @tc.name      quantity_single_line_zero_quantity_008
     * @tc.desc      Verify quantity single line zero quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_single_line_zero_quantity_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_single_line_zero_quantity_008');
      let order: Order = makeOrder(907, [cartLine(4, 8900, 0)]);
      expect(order.quantity()).assertEqual(0);
      expect(order.lines[0].unitPriceCents).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0090
     * @tc.name      total_zero_price_single_line_is_zero_009
     * @tc.desc      Verify total zero price single line is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_zero_price_single_line_is_zero_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_zero_price_single_line_is_zero_009');
      let order: Order = makeOrder(908, [cartLine(5, 0, 4)]);
      expect(order.total().cents()).assertEqual(0);
      expect(order.total().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0100
     * @tc.name      quantity_zero_price_line_is_counted_010
     * @tc.desc      Verify quantity zero price line is counted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_zero_price_line_is_counted_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_zero_price_line_is_counted_010');
      let order: Order = makeOrder(909, [cartLine(6, 0, 7)]);
      expect(order.quantity()).assertEqual(7);
      expect(order.total().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0110
     * @tc.name      total_two_lines_is_sum_011
     * @tc.desc      Verify total two lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_two_lines_is_sum_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_two_lines_is_sum_011');
      let order: Order = makeOrder(910, [cartLine(0, 499900, 1), cartLine(4, 8900, 2)]);
      expect(order.total().cents()).assertEqual(517700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0120
     * @tc.name      quantity_two_lines_is_sum_012
     * @tc.desc      Verify quantity two lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_two_lines_is_sum_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_two_lines_is_sum_012');
      let order: Order = makeOrder(911, [cartLine(0, 499900, 2), cartLine(4, 8900, 3)]);
      expect(order.quantity()).assertEqual(5);
      expect(order.total().cents()).assertEqual(1026500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0130
     * @tc.name      total_three_lines_is_sum_013
     * @tc.desc      Verify total three lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_three_lines_is_sum_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_three_lines_is_sum_013');
      let order: Order = makeOrder(912, [
        cartLine(0, 10000, 2),
        cartLine(1, 20000, 1),
        cartLine(2, 30000, 3)
      ]);
      expect(order.total().cents()).assertEqual(130000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0140
     * @tc.name      quantity_three_lines_is_sum_014
     * @tc.desc      Verify quantity three lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_three_lines_is_sum_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_three_lines_is_sum_014');
      let order: Order = makeOrder(913, [
        cartLine(0, 10000, 4),
        cartLine(1, 20000, 0),
        cartLine(2, 30000, 2)
      ]);
      expect(order.quantity()).assertEqual(6);
      expect(order.lines.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0150
     * @tc.name      total_four_lines_is_sum_015
     * @tc.desc      Verify total four lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_four_lines_is_sum_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_four_lines_is_sum_015');
      let order: Order = makeOrder(914, [
        cartLine(0, 1000, 1),
        cartLine(1, 2000, 2),
        cartLine(2, 3000, 3),
        cartLine(3, 4000, 4)
      ]);
      expect(order.total().cents()).assertEqual(30000);
      expect(order.quantity()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0160
     * @tc.name      total_eight_lines_is_sum_016
     * @tc.desc      Verify total eight lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_eight_lines_is_sum_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_eight_lines_is_sum_016');
      // Lines i=0..7 use price 1000*(i+1) at quantity i+1: 1000 * 204 = 204000, with 36 units.
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 8; index++) {
        lines.push(cartLine(index, 1000 * (index + 1), index + 1));
      }
      let order: Order = makeOrder(915, lines);
      expect(order.total().cents()).assertEqual(204000);
      expect(order.quantity()).assertEqual(36);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0170
     * @tc.name      total_matches_line_total_sum_017
     * @tc.desc      Verify total matches line total sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_matches_line_total_sum_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_matches_line_total_sum_017');
      let order: Order = makeOrder(916, [
        cartLine(0, 499900, 1),
        cartLine(2, 129900, 2),
        cartLine(4, 8900, 3)
      ]);
      let expected: number = 0;
      for (let index: number = 0; index < order.lines.length; index++) {
        expected += order.lines[index].lineTotal().cents();
      }
      expect(order.total().cents()).assertEqual(expected);
      expect(expected).assertEqual(786400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0180
     * @tc.name      quantity_matches_line_quantity_sum_018
     * @tc.desc      Verify quantity matches line quantity sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_matches_line_quantity_sum_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_matches_line_quantity_sum_018');
      let order: Order = makeOrder(917, [
        cartLine(1, 399900, 1),
        cartLine(3, 59900, 4),
        cartLine(5, 29900, 2)
      ]);
      let expected: number = 0;
      for (let index: number = 0; index < order.lines.length; index++) {
        expected += order.lines[index].quantity;
      }
      expect(order.quantity()).assertEqual(expected);
      expect(expected).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0190
     * @tc.name      total_repeated_calls_are_stable_019
     * @tc.desc      Verify total repeated calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_repeated_calls_are_stable_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_repeated_calls_are_stable_019');
      // 29900*3 + 8900*2 = 107500 on both calls.
      let order: Order = makeOrder(918, [cartLine(0, 29900, 3), cartLine(4, 8900, 2)]);
      let first: Money = order.total();
      let second: Money = order.total();
      expect(first.cents()).assertEqual(second.cents());
      expect(first.equals(second)).assertTrue();
      expect(first.cents()).assertEqual(107500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0200
     * @tc.name      quantity_repeated_calls_are_stable_020
     * @tc.desc      Verify quantity repeated calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_repeated_calls_are_stable_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_repeated_calls_are_stable_020');
      let order: Order = makeOrder(919, [cartLine(0, 29900, 5), cartLine(4, 8900, 1)]);
      let first: number = order.quantity();
      let second: number = order.quantity();
      expect(first).assertEqual(second);
      expect(first).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0210
     * @tc.name      total_scales_exactly_for_boundary_quantity_and_price_021
     * @tc.desc      Verify total scales exactly for boundary quantity and price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_scales_exactly_for_boundary_quantity_and_price_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: total_scales_exactly_for_boundary_quantity_and_price_021');
      // 900000000 * 2 = 1800000000 must stay exact on the cent grid.
      let goodsIds: number[] = [0, 1];
      let prices: number[] = [100, 900000000];
      let quantities: number[] = [99, 2];
      let totals: number[] = [9900, 1800000000];
      expect(prices.length).assertEqual(totals.length);
      for (let index: number = 0; index < prices.length; index++) {
        let order: Order = makeOrder(920 + index,
          [cartLine(goodsIds[index], prices[index], quantities[index])]);
        expect(order.total().cents()).assertEqual(totals[index]);
        expect(order.total().cents()).assertEqual(prices[index] * quantities[index]);
        expect(order.quantity()).assertEqual(quantities[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0220
     * @tc.name      total_max_quantity_times_flagship_price_022
     * @tc.desc      Verify total max quantity times flagship price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_max_quantity_times_flagship_price_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_max_quantity_times_flagship_price_022');
      // 499900 * 99 = 49490100 for a maximum-quantity flagship line.
      let order: Order = makeOrder(922, [cartLine(0, 499900, 99)]);
      expect(order.total().cents()).assertEqual(49490100);
      expect(order.total().cents()).assertEqual(499900 * 99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0230
     * @tc.name      total_quantity_beyond_cart_cap_is_not_clamped_023
     * @tc.desc      Verify total quantity beyond cart cap is not clamped.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_beyond_cart_cap_is_not_clamped_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_beyond_cart_cap_is_not_clamped_023');
      // Order.total() does not clamp quantity at the cart cap of 99: 129900 * 100000 = 12990000000.
      let order: Order = makeOrder(923, [cartLine(2, 129900, 100000)]);
      expect(order.quantity()).assertEqual(100000);
      expect(order.total().cents()).assertEqual(12990000000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0240
     * @tc.name      total_mixed_large_and_small_lines_024
     * @tc.desc      Verify total mixed large and small lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_mixed_large_and_small_lines_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_mixed_large_and_small_lines_024');
      let order: Order = makeOrder(924, [
        cartLine(0, 499900, 2),
        cartLine(4, 8900, 99),
        cartLine(7, 15900, 1)
      ]);
      expect(order.total().cents()).assertEqual(999800 + 881100 + 15900);
      expect(order.total().cents()).assertEqual(1896800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0250
     * @tc.name      zero_price_line_adds_no_money_in_mixed_order_025
     * @tc.desc      Verify zero price line adds no money in mixed order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_line_adds_no_money_in_mixed_order_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_line_adds_no_money_in_mixed_order_025');
      let order: Order = makeOrder(925, [cartLine(9, 0, 5), cartLine(0, 10000, 2)]);
      expect(order.total().cents()).assertEqual(20000);
      expect(order.quantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0260
     * @tc.name      zero_quantity_line_adds_no_money_in_mixed_order_026
     * @tc.desc      Verify zero quantity line adds no money in mixed order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_quantity_line_adds_no_money_in_mixed_order_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_quantity_line_adds_no_money_in_mixed_order_026');
      let order: Order = makeOrder(926, [cartLine(1, 399900, 0), cartLine(4, 8900, 2)]);
      expect(order.total().cents()).assertEqual(17800);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0270
     * @tc.name      zero_quantity_line_adds_no_quantity_in_mixed_order_027
     * @tc.desc      Verify zero quantity line adds no quantity in mixed order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_quantity_line_adds_no_quantity_in_mixed_order_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_quantity_line_adds_no_quantity_in_mixed_order_027');
      let order: Order = makeOrder(927, [cartLine(1, 399900, 0), cartLine(4, 8900, 5)]);
      expect(order.quantity()).assertEqual(5);
      expect(order.lines[0].quantity).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0280
     * @tc.name      total_counts_unselected_line_028
     * @tc.desc      Verify total counts unselected line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_counts_unselected_line_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_counts_unselected_line_028');
      // The single line is deselected, yet its 10000 cents still count toward the order.
      let order: Order = makeOrder(928, [cartLine(0, 10000, 1, false)]);
      expect(order.total().cents()).assertEqual(10000);
      expect(order.lines[0].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0290
     * @tc.name      total_counts_all_lines_regardless_of_selection_029
     * @tc.desc      Verify total counts all lines regardless of selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_counts_all_lines_regardless_of_selection_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_counts_all_lines_regardless_of_selection_029');
      let order: Order = makeOrder(929, [
        cartLine(0, 10000, 1, true),
        cartLine(1, 20000, 1, false),
        cartLine(2, 30000, 1, true)
      ]);
      expect(order.total().cents()).assertEqual(60000);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0300
     * @tc.name      total_counts_duplicate_goods_ids_030
     * @tc.desc      Verify total counts duplicate goods ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_counts_duplicate_goods_ids_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_counts_duplicate_goods_ids_030');
      // Two lines for goods 0 still add up: 10000*2 + 10000*3 = 50000.
      let order: Order = makeOrder(930, [cartLine(0, 10000, 2), cartLine(0, 10000, 3)]);
      expect(order.total().cents()).assertEqual(50000);
      expect(order.quantity()).assertEqual(5);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0310
     * @tc.name      total_counts_three_lines_with_same_price_031
     * @tc.desc      Verify total counts three lines with same price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_counts_three_lines_with_same_price_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_counts_three_lines_with_same_price_031');
      let order: Order = makeOrder(931, [
        cartLine(0, 5000, 1),
        cartLine(1, 5000, 2),
        cartLine(2, 5000, 3)
      ]);
      expect(order.total().cents()).assertEqual(30000);
      expect(order.quantity()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0320
     * @tc.name      order_copies_source_line_quantity_032
     * @tc.desc      Verify order copies source line quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_copies_source_line_quantity_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_copies_source_line_quantity_032');
      // Changing source[0].quantity to 9 must not move the copied 2-unit order.
      let source: CartLine[] = [cartLine(0, 10000, 2)];
      let order: Order = makeOrder(932, source);
      source[0].quantity = 9;
      expect(order.total().cents()).assertEqual(20000);
      expect(order.quantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0330
     * @tc.name      order_copies_source_line_price_033
     * @tc.desc      Verify order copies source line price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_copies_source_line_price_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_copies_source_line_price_033');
      let source: CartLine[] = [cartLine(1, 20000, 2)];
      let order: Order = makeOrder(933, source);
      source[0].unitPriceCents = 99999;
      expect(order.total().cents()).assertEqual(40000);
      expect(order.lines[0].unitPriceCents).assertEqual(20000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0340
     * @tc.name      order_copies_source_line_selection_034
     * @tc.desc      Verify order copies source line selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_copies_source_line_selection_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_copies_source_line_selection_034');
      let source: CartLine[] = [cartLine(2, 30000, 1, false)];
      let order: Order = makeOrder(934, source);
      source[0].selected = true;
      expect(order.lines[0].selected).assertFalse();
      expect(order.total().cents()).assertEqual(30000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0350
     * @tc.name      order_lines_are_distinct_instances_035
     * @tc.desc      Verify order lines are distinct instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_lines_are_distinct_instances_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_lines_are_distinct_instances_035');
      // The constructor clones each line, so order.lines[0] and source[0] must not be the same object.
      let source: CartLine[] = [cartLine(3, 40000, 1), cartLine(4, 5000, 2)];
      let order: Order = makeOrder(935, source);
      expect(order.lines[0] !== source[0]).assertTrue();
      expect(order.lines[1] !== source[1]).assertTrue();
      expect(order.lines[0].goodsId).assertEqual(3);
      expect(order.lines[1].goodsId).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0360
     * @tc.name      source_array_push_does_not_affect_order_036
     * @tc.desc      Verify source array push does not affect order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('source_array_push_does_not_affect_order_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: source_array_push_does_not_affect_order_036');
      let source: CartLine[] = [cartLine(0, 10000, 1)];
      let order: Order = makeOrder(936, source);
      source.push(cartLine(1, 20000, 1));
      expect(source.length).assertEqual(2);
      expect(order.lines.length).assertEqual(1);
      expect(order.total().cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0370
     * @tc.name      source_array_splice_does_not_affect_order_037
     * @tc.desc      Verify source array splice does not affect order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('source_array_splice_does_not_affect_order_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: source_array_splice_does_not_affect_order_037');
      let source: CartLine[] = [cartLine(0, 10000, 1), cartLine(1, 20000, 1)];
      let order: Order = makeOrder(937, source);
      source.splice(0, 2);
      expect(source.length).assertEqual(0);
      expect(order.lines.length).assertEqual(2);
      expect(order.total().cents()).assertEqual(30000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0380
     * @tc.name      total_independent_of_order_state_038
     * @tc.desc      Verify total independent of order state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_independent_of_order_state_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_independent_of_order_state_038');
      // All seven values in ALL_STATES must leave the 48700 total and 3 units unchanged.
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(940 + index,
          [cartLine(0, 19900, 2), cartLine(4, 8900, 1)], ALL_STATES[index]);
        expect(order.total().cents()).assertEqual(48700);
        expect(order.quantity()).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0390
     * @tc.name      total_independent_of_order_id_039
     * @tc.desc      Verify total independent of order id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_independent_of_order_id_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_independent_of_order_id_039');
      let first: Order = makeOrder(1, [cartLine(0, 15900, 3)]);
      let second: Order = makeOrder(999999, [cartLine(0, 15900, 3)]);
      expect(first.total().cents()).assertEqual(second.total().cents());
      expect(first.total().cents()).assertEqual(47700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0400
     * @tc.name      total_independent_of_created_at_040
     * @tc.desc      Verify total independent of created at.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_independent_of_created_at_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_independent_of_created_at_040');
      let early: Order = makeOrder(950, [cartLine(1, 29900, 2)], OrderState.OBLIGATION, -1000);
      let late: Order = makeOrder(951, [cartLine(1, 29900, 2)], OrderState.OBLIGATION, 2000000000);
      expect(early.total().cents()).assertEqual(late.total().cents());
      expect(early.total().cents()).assertEqual(59800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0410
     * @tc.name      total_positive_for_priced_order_041
     * @tc.desc      Verify total positive for priced order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_positive_for_priced_order_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_positive_for_priced_order_041');
      let order: Order = makeOrder(952, [cartLine(2, 129900, 1)]);
      expect(order.total().isPositive()).assertTrue();
      expect(order.total().isZero()).assertFalse();
      expect(order.total().isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0420
     * @tc.name      total_three_line_permutations_equal_042
     * @tc.desc      Verify total three line permutations equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_three_line_permutations_equal_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_three_line_permutations_equal_042');
      // Swapping the same three lines must keep both the 130000 total and the 6 units.
      let first: Order = makeOrder(953, [
        cartLine(0, 10000, 2),
        cartLine(1, 20000, 1),
        cartLine(2, 30000, 3)
      ]);
      let second: Order = makeOrder(954, [
        cartLine(2, 30000, 3),
        cartLine(0, 10000, 2),
        cartLine(1, 20000, 1)
      ]);
      expect(first.total().cents()).assertEqual(second.total().cents());
      expect(first.quantity()).assertEqual(second.quantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0430
     * @tc.name      quantity_ignores_unit_price_043
     * @tc.desc      Verify quantity ignores unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_ignores_unit_price_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_ignores_unit_price_043');
      let cheap: Order = makeOrder(955, [cartLine(0, 1, 4), cartLine(1, 2, 3)]);
      let expensive: Order = makeOrder(956, [cartLine(0, 499900, 4), cartLine(1, 399900, 3)]);
      expect(cheap.quantity()).assertEqual(expensive.quantity());
      expect(cheap.quantity()).assertEqual(7);
      expect(cheap.total().cents() === expensive.total().cents()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0440
     * @tc.name      total_safe_integer_boundary_044
     * @tc.desc      Verify total safe integer boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_safe_integer_boundary_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_safe_integer_boundary_044');
      // 90000000 * 99 = 8910000000, below Number.MAX_SAFE_INTEGER (9007199254740991).
      let order: Order = makeOrder(957, [cartLine(0, 90000000, 99)]);
      expect(order.total().cents()).assertEqual(8910000000);
      expect(order.total().cents() < Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0450
     * @tc.name      total_ignores_live_selection_toggle_045
     * @tc.desc      Verify total ignores live selection toggle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_ignores_live_selection_toggle_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_ignores_live_selection_toggle_045');
      // Flipping the first line's selected flag must not change the 49800 money total.
      let order: Order = makeOrder(958, [
        cartLine(4, 19900, 2, true),
        cartLine(0, 10000, 1, true)
      ]);
      let before: number = order.total().cents();
      order.lines[0].selected = false;
      expect(order.lines[0].selected).assertFalse();
      expect(order.total().cents()).assertEqual(before);
      expect(order.total().cents()).assertEqual(49800);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0460
     * @tc.name      total_two_identical_lines_double_single_046
     * @tc.desc      Verify total two identical lines double single.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_two_identical_lines_double_single_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_two_identical_lines_double_single_046');
      let single: Order = makeOrder(959, [cartLine(0, 10000, 4)]);
      let double: Order = makeOrder(960, [cartLine(0, 10000, 2), cartLine(0, 10000, 2)]);
      expect(double.total().cents()).assertEqual(single.total().cents());
      expect(single.total().cents()).assertEqual(40000);
      expect(double.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0470
     * @tc.name      total_zero_money_object_contract_047
     * @tc.desc      Verify total zero money object contract.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_zero_money_object_contract_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_zero_money_object_contract_047');
      let order: Order = makeOrder(961, []);
      let total: Money = order.total();
      expect(total.isZero()).assertTrue();
      expect(total.equals(Money.zero())).assertTrue();
      expect(total.compareTo(new Money(0))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0480
     * @tc.name      total_zero_quantity_and_zero_price_mixed_048
     * @tc.desc      Verify total zero quantity and zero price mixed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_zero_quantity_and_zero_price_mixed_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_zero_quantity_and_zero_price_mixed_048');
      let order: Order = makeOrder(962, [
        cartLine(0, 0, 5),
        cartLine(1, 100, 0),
        cartLine(2, 200, 2)
      ]);
      expect(order.total().cents()).assertEqual(400);
      expect(order.quantity()).assertEqual(7);
      expect(order.lines.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0490
     * @tc.name      total_of_one_cent_lines_stays_integer_049
     * @tc.desc      Verify total of one cent lines stays integer.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_one_cent_lines_stays_integer_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_one_cent_lines_stays_integer_049');
      let order: Order = makeOrder(963, [
        cartLine(0, 1, 1),
        cartLine(1, 1, 2),
        cartLine(2, 1, 3)
      ]);
      expect(order.total().cents()).assertEqual(6);
      expect(order.quantity()).assertEqual(6);
      expect(order.total().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0500
     * @tc.name      total_after_zeroing_one_line_quantity_050
     * @tc.desc      Verify total after zeroing one line quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_after_zeroing_one_line_quantity_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_after_zeroing_one_line_quantity_050');
      let order: Order = makeOrder(964, [
        cartLine(0, 10000, 2),
        cartLine(1, 20000, 3)
      ]);
      expect(order.total().cents()).assertEqual(80000);
      order.lines[0].quantity = 0;
      expect(order.lines[0].quantity).assertEqual(0);
      expect(order.total().cents()).assertEqual(60000);
      expect(order.quantity()).assertEqual(3);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0510
     * @tc.name      total_sixteen_lines_is_sum_051
     * @tc.desc      Verify total sixteen lines is sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_sixteen_lines_is_sum_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_sixteen_lines_is_sum_051');
      // Quantity cycles 1..4 four times (40 units) at a flat 1000 cents, so the total is 40000.
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 16; index++) {
        lines.push(cartLine(index, 1000, index % 4 + 1));
      }
      let order: Order = makeOrder(965, lines);
      expect(order.quantity()).assertEqual(40);
      expect(order.total().cents()).assertEqual(40000);
      expect(order.lines.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0520
     * @tc.name      total_line_total_cross_check_single_052
     * @tc.desc      Verify total line total cross check single.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_line_total_cross_check_single_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_line_total_cross_check_single_052');
      let order: Order = makeOrder(966, [cartLine(2, 129900, 3)]);
      let lineTotal: number = order.lines[0].lineTotal().cents();
      expect(lineTotal).assertEqual(389700);
      expect(order.total().cents()).assertEqual(lineTotal);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0530
     * @tc.name      total_line_total_cross_check_eight_053
     * @tc.desc      Verify total line total cross check eight.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_line_total_cross_check_eight_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_line_total_cross_check_eight_053');
      // Lines i=0..7 carry 500*(i+1) at quantity i+1, summing to 500 * 204 = 102000.
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 8; index++) {
        lines.push(cartLine(index, 500 * (index + 1), index + 1));
      }
      let order: Order = makeOrder(967, lines);
      let expected: number = 0;
      for (let index: number = 0; index < order.lines.length; index++) {
        expected += order.lines[index].lineTotal().cents();
      }
      expect(order.total().cents()).assertEqual(expected);
      expect(expected).assertEqual(102000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0540
     * @tc.name      total_two_lines_same_goods_different_prices_054
     * @tc.desc      Verify total two lines same goods different prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_two_lines_same_goods_different_prices_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_two_lines_same_goods_different_prices_054');
      let order: Order = makeOrder(968, [cartLine(0, 10000, 1), cartLine(0, 15000, 2)]);
      expect(order.total().cents()).assertEqual(40000);
      expect(order.lines[0].unitPriceCents).assertEqual(10000);
      expect(order.lines[1].unitPriceCents).assertEqual(15000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0550
     * @tc.name      total_constructor_keeps_line_order_055
     * @tc.desc      Verify total constructor keeps line order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_constructor_keeps_line_order_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_constructor_keeps_line_order_055');
      let order: Order = makeOrder(969, [
        cartLine(7, 15900, 1),
        cartLine(3, 59900, 2),
        cartLine(5, 29900, 3)
      ]);
      expect(order.lines[0].goodsId).assertEqual(7);
      expect(order.lines[1].goodsId).assertEqual(3);
      expect(order.lines[2].goodsId).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0560
     * @tc.name      total_constructor_keeps_line_quantities_056
     * @tc.desc      Verify total constructor keeps line quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_constructor_keeps_line_quantities_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_constructor_keeps_line_quantities_056');
      let source: CartLine[] = [cartLine(0, 1000, 2), cartLine(1, 2000, 5)];
      let order: Order = makeOrder(970, source);
      let expected: number[] = [2, 5];
      for (let index: number = 0; index < expected.length; index++) {
        expect(order.lines[index].quantity).assertEqual(expected[index]);
      }
      expect(order.quantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0570
     * @tc.name      total_constructor_keeps_line_prices_057
     * @tc.desc      Verify total constructor keeps line prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_constructor_keeps_line_prices_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_constructor_keeps_line_prices_057');
      let source: CartLine[] = [cartLine(0, 11100, 1), cartLine(1, 22200, 1)];
      let order: Order = makeOrder(971, source);
      expect(order.lines[0].unitPriceCents).assertEqual(11100);
      expect(order.lines[1].unitPriceCents).assertEqual(22200);
      expect(order.total().cents()).assertEqual(33300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0580
     * @tc.name      total_adds_price_delta_of_one_line_058
     * @tc.desc      Verify total adds price delta of one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_adds_price_delta_of_one_line_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_adds_price_delta_of_one_line_058');
      // The new price 12345 adds 3 * 2345 = 7035 on top of 30000, giving 37035.
      let order: Order = makeOrder(972, [cartLine(4, 10000, 3)]);
      let before: number = order.total().cents();
      order.lines[0].unitPriceCents = 12345;
      expect(order.total().cents()).assertEqual(before + 3 * 2345);
      expect(order.total().cents()).assertEqual(37035);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0590
     * @tc.name      total_with_alternating_zero_and_priced_lines_059
     * @tc.desc      Verify total with alternating zero and priced lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_with_alternating_zero_and_priced_lines_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_with_alternating_zero_and_priced_lines_059');
      let order: Order = makeOrder(973, [
        cartLine(0, 0, 2),
        cartLine(1, 10000, 1),
        cartLine(2, 0, 3),
        cartLine(3, 20000, 2)
      ]);
      expect(order.total().cents()).assertEqual(50000);
      expect(order.quantity()).assertEqual(8);
      expect(order.lines.length).assertEqual(4);
      expect(order.lines[0].lineTotal().cents()).assertEqual(0);
      expect(order.lines[2].lineTotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0600
     * @tc.name      total_of_three_equal_lines_triple_single_060
     * @tc.desc      Verify total of three equal lines triple single.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_three_equal_lines_triple_single_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_three_equal_lines_triple_single_060');
      let single: Order = makeOrder(974, [cartLine(0, 10000, 3)]);
      let triple: Order = makeOrder(975, [
        cartLine(0, 10000, 1),
        cartLine(0, 10000, 1),
        cartLine(0, 10000, 1)
      ]);
      expect(triple.total().cents()).assertEqual(single.total().cents());
      expect(triple.total().cents()).assertEqual(30000);
      expect(triple.quantity()).assertEqual(single.quantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0610
     * @tc.name      total_of_only_zero_price_lines_061
     * @tc.desc      Verify total of only zero price lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_only_zero_price_lines_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_only_zero_price_lines_061');
      let order: Order = makeOrder(976, [cartLine(0, 0, 2), cartLine(1, 0, 5)]);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(7);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0620
     * @tc.name      total_of_only_zero_quantity_lines_062
     * @tc.desc      Verify total of only zero quantity lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_only_zero_quantity_lines_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_only_zero_quantity_lines_062');
      let order: Order = makeOrder(977, [cartLine(0, 10000, 0), cartLine(1, 20000, 0)]);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(0);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0630
     * @tc.name      total_empty_order_in_each_state_is_zero_063
     * @tc.desc      Verify total empty order in each state is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_empty_order_in_each_state_is_zero_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_empty_order_in_each_state_is_zero_063');
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(980 + index, [], ALL_STATES[index]);
        expect(order.total().cents()).assertEqual(0);
        expect(order.state).assertEqual(ALL_STATES[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0640
     * @tc.name      quantity_empty_order_in_each_state_is_zero_064
     * @tc.desc      Verify quantity empty order in each state is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_empty_order_in_each_state_is_zero_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_empty_order_in_each_state_is_zero_064');
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(990 + index, [], ALL_STATES[index]);
        expect(order.quantity()).assertEqual(0);
        expect(order.lines.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0650
     * @tc.name      total_of_hundred_one_cent_lines_065
     * @tc.desc      Verify total of hundred one cent lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_hundred_one_cent_lines_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_hundred_one_cent_lines_065');
      // 100 lines of one unit at one cent each total 100 cents and 100 units.
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 100; index++) {
        lines.push(cartLine(index % 8, 1, 1));
      }
      let order: Order = makeOrder(1000, lines);
      expect(order.lines.length).assertEqual(100);
      expect(order.total().cents()).assertEqual(100);
      expect(order.quantity()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0660
     * @tc.name      total_quantity_unchanged_by_source_array_push_066
     * @tc.desc      Verify total quantity unchanged by source array push.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_unchanged_by_source_array_push_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_unchanged_by_source_array_push_066');
      let source: CartLine[] = [cartLine(0, 10000, 2)];
      let order: Order = makeOrder(1001, source);
      source.push(cartLine(1, 20000, 3));
      expect(order.quantity()).assertEqual(2);
      expect(order.lines.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0670
     * @tc.name      total_line_count_does_not_affect_quantity_067
     * @tc.desc      Verify total line count does not affect quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_line_count_does_not_affect_quantity_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_line_count_does_not_affect_quantity_067');
      let oneLine: Order = makeOrder(1002, [cartLine(0, 1000, 6)]);
      let threeLines: Order = makeOrder(1003, [
        cartLine(0, 1000, 2),
        cartLine(1, 1000, 2),
        cartLine(2, 1000, 2)
      ]);
      expect(oneLine.quantity()).assertEqual(threeLines.quantity());
      expect(oneLine.quantity()).assertEqual(6);
      expect(oneLine.total().cents()).assertEqual(threeLines.total().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0680
     * @tc.name      total_manual_product_sum_three_lines_068
     * @tc.desc      Verify total manual product sum three lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_manual_product_sum_three_lines_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_manual_product_sum_three_lines_068');
      // 499900*1 + 129900*2 + 8900*3 = 786400.
      let order: Order = makeOrder(1004, [
        cartLine(0, 499900, 1),
        cartLine(2, 129900, 2),
        cartLine(4, 8900, 3)
      ]);
      let expected: number = 499900 * 1 + 129900 * 2 + 8900 * 3;
      expect(order.total().cents()).assertEqual(expected);
      expect(order.total().cents()).assertEqual(786400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0690
     * @tc.name      total_each_line_total_non_negative_069
     * @tc.desc      Verify total each line total non negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_each_line_total_non_negative_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_each_line_total_non_negative_069');
      let order: Order = makeOrder(1005, [
        cartLine(0, 0, 1),
        cartLine(1, 100, 0),
        cartLine(2, 200, 2)
      ]);
      for (let index: number = 0; index < order.lines.length; index++) {
        expect(order.lines[index].lineTotal().cents() >= 0).assertTrue();
      }
      expect(order.total().cents()).assertEqual(400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0700
     * @tc.name      total_first_line_dominates_sum_070
     * @tc.desc      Verify total first line dominates sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_first_line_dominates_sum_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_first_line_dominates_sum_070');
      let order: Order = makeOrder(1006, [cartLine(0, 499900, 1), cartLine(4, 100, 1)]);
      expect(order.total().cents()).assertEqual(500000);
      expect(order.lines[0].lineTotal().cents() > order.lines[1].lineTotal().cents()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0710
     * @tc.name      total_quantity_sum_of_five_lines_071
     * @tc.desc      Verify total quantity sum of five lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_quantity_sum_of_five_lines_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_quantity_sum_of_five_lines_071');
      let order: Order = makeOrder(1007, [
        cartLine(0, 1000, 1),
        cartLine(1, 2000, 2),
        cartLine(2, 3000, 3),
        cartLine(3, 4000, 4),
        cartLine(4, 5000, 5)
      ]);
      expect(order.quantity()).assertEqual(15);
      expect(order.total().cents()).assertEqual(55000);
      expect(order.lines.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0720
     * @tc.name      total_reflects_line_quantity_mutation_072
     * @tc.desc      Verify total reflects line quantity mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_reflects_line_quantity_mutation_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_reflects_line_quantity_mutation_072');
      let order: Order = makeOrder(1008, [cartLine(6, 10000, 1), cartLine(7, 20000, 1)]);
      expect(order.total().cents()).assertEqual(30000);
      order.lines[0].quantity = 4;
      expect(order.total().cents()).assertEqual(60000);
      expect(order.quantity()).assertEqual(5);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0730
     * @tc.name      total_reflects_line_price_mutation_073
     * @tc.desc      Verify total reflects line price mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_reflects_line_price_mutation_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_reflects_line_price_mutation_073');
      let order: Order = makeOrder(1009, [cartLine(7, 10000, 2)]);
      expect(order.total().cents()).assertEqual(20000);
      order.lines[0].unitPriceCents = 15000;
      expect(order.total().cents()).assertEqual(30000);
      expect(order.quantity()).assertEqual(2);
      expect(order.lines.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0740
     * @tc.name      total_of_minimum_positive_order_074
     * @tc.desc      Verify total of minimum positive order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_minimum_positive_order_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_minimum_positive_order_074');
      let order: Order = makeOrder(1010, [cartLine(0, 1, 1)]);
      expect(order.total().cents()).assertEqual(1);
      expect(order.quantity()).assertEqual(1);
      expect(order.total().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0750
     * @tc.name      total_of_copied_line_matches_source_075
     * @tc.desc      Verify total of copied line matches source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_copied_line_matches_source_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_copied_line_matches_source_075');
      let source: CartLine = cartLine(1, 99, 4);
      let copy: CartLine = source.copy();
      let order: Order = makeOrder(1011, [copy]);
      expect(copy.lineTotal().cents()).assertEqual(source.lineTotal().cents());
      expect(order.total().cents()).assertEqual(source.lineTotal().cents());
      expect(order.quantity()).assertEqual(4);
      expect(source !== copy).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0760
     * @tc.name      total_of_two_large_lines_076
     * @tc.desc      Verify total of two large lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_two_large_lines_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_two_large_lines_076');
      // 100000000*2 + 200000000*3 = 800000000, still below MAX_SAFE_INTEGER.
      let order: Order = makeOrder(1012, [
        cartLine(0, 100000000, 2),
        cartLine(1, 200000000, 3)
      ]);
      expect(order.total().cents()).assertEqual(800000000);
      expect(order.total().cents() < Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0770
     * @tc.name      total_of_duplicate_line_instances_077
     * @tc.desc      Verify total of duplicate line instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_duplicate_line_instances_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_duplicate_line_instances_077');
      // Passing the same CartLine twice yields two cloned lines and 2+2 units.
      let shared: CartLine = cartLine(0, 7000, 2);
      let order: Order = makeOrder(1013, [shared, shared]);
      expect(order.lines.length).assertEqual(2);
      expect(order.quantity()).assertEqual(4);
      expect(order.total().cents()).assertEqual(28000);
      expect(order.lines[0] !== order.lines[1]).assertTrue();
      expect(order.lines[0] !== shared).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0780
     * @tc.name      total_line_order_two_lines_swapped_078
     * @tc.desc      Verify total line order two lines swapped.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_line_order_two_lines_swapped_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_line_order_two_lines_swapped_078');
      let forward: Order = makeOrder(1014, [cartLine(0, 10000, 2), cartLine(1, 25000, 1)]);
      let reversed: Order = makeOrder(1015, [cartLine(1, 25000, 1), cartLine(0, 10000, 2)]);
      expect(forward.total().cents()).assertEqual(reversed.total().cents());
      expect(forward.total().cents()).assertEqual(45000);
      expect(forward.lines[0].goodsId).assertEqual(0);
      expect(reversed.lines[0].goodsId).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0790
     * @tc.name      quantity_of_multiple_zero_price_lines_079
     * @tc.desc      Verify quantity of multiple zero price lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_of_multiple_zero_price_lines_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_of_multiple_zero_price_lines_079');
      let order: Order = makeOrder(1016, [cartLine(0, 0, 3), cartLine(1, 0, 4), cartLine(2, 0, 5)]);
      expect(order.quantity()).assertEqual(12);
      expect(order.total().cents()).assertEqual(0);
      expect(order.lines.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0800
     * @tc.name      total_after_zeroing_one_line_price_080
     * @tc.desc      Verify total after zeroing one line price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_after_zeroing_one_line_price_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_after_zeroing_one_line_price_080');
      let order: Order = makeOrder(1017, [
        cartLine(3, 10000, 2),
        cartLine(4, 20000, 1)
      ]);
      expect(order.total().cents()).assertEqual(40000);
      order.lines[0].unitPriceCents = 0;
      expect(order.lines[0].lineTotal().cents()).assertEqual(0);
      expect(order.total().cents()).assertEqual(20000);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0810
     * @tc.name      total_of_order_constructed_from_order_lines_081
     * @tc.desc      Verify total of order constructed from order lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_of_order_constructed_from_order_lines_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_of_order_constructed_from_order_lines_081');
      let first: Order = makeOrder(1018, [cartLine(0, 10000, 2), cartLine(1, 20000, 1)]);
      let second: Order = makeOrder(1019, first.lines);
      expect(second.total().cents()).assertEqual(first.total().cents());
      first.lines[0].quantity = 9;
      expect(second.quantity()).assertEqual(3);
      expect(second.total().cents()).assertEqual(40000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0820
     * @tc.name      total_grows_by_added_line_total_082
     * @tc.desc      Verify total grows by added line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_grows_by_added_line_total_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_grows_by_added_line_total_082');
      let base: CartLine[] = [cartLine(0, 10000, 1), cartLine(1, 20000, 2)];
      let first: Order = makeOrder(1020, base);
      let extended: CartLine[] = [
        cartLine(0, 10000, 1),
        cartLine(1, 20000, 2),
        cartLine(2, 30000, 3)
      ];
      let second: Order = makeOrder(1021, extended);
      expect(first.total().cents()).assertEqual(50000);
      expect(second.total().cents() - first.total().cents()).assertEqual(90000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0830
     * @tc.name      total_equals_constant_price_times_quantity_083
     * @tc.desc      Verify total equals constant price times quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_equals_constant_price_times_quantity_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_equals_constant_price_times_quantity_083');
      // Three lines at a flat 7000 with quantities 1, 2 and 4: 7000 * 7 = 49000.
      let order: Order = makeOrder(1022, [
        cartLine(0, 7000, 1),
        cartLine(1, 7000, 2),
        cartLine(2, 7000, 4)
      ]);
      expect(order.quantity()).assertEqual(7);
      expect(order.total().cents()).assertEqual(7000 * order.quantity());
      expect(order.total().cents()).assertEqual(49000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0840
     * @tc.name      total_after_source_element_replacement_084
     * @tc.desc      Verify total after source element replacement.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_after_source_element_replacement_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_after_source_element_replacement_084');
      let source: CartLine[] = [cartLine(0, 10000, 1), cartLine(1, 20000, 2)];
      let order: Order = makeOrder(1023, source);
      source[0] = cartLine(0, 999999, 9);
      expect(order.total().cents()).assertEqual(50000);
      expect(order.lines[0].unitPriceCents).assertEqual(10000);
      expect(order.lines[0].quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0850
     * @tc.name      total_after_source_array_reverse_085
     * @tc.desc      Verify total after source array reverse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_after_source_array_reverse_085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_after_source_array_reverse_085');
      let source: CartLine[] = [
        cartLine(0, 10000, 1),
        cartLine(1, 20000, 2),
        cartLine(2, 30000, 3)
      ];
      let order: Order = makeOrder(1024, source);
      source.reverse();
      expect(order.lines[0].goodsId).assertEqual(0);
      expect(order.lines[2].goodsId).assertEqual(2);
      expect(order.total().cents()).assertEqual(140000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0860
     * @tc.name      total_after_removing_one_line_086
     * @tc.desc      Verify total after removing one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_after_removing_one_line_086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_after_removing_one_line_086');
      // Baseline 31000; removing the 5000 cent line leaves 31000 - 5000 = 26000.
      let order: Order = makeOrder(1025, [
        cartLine(0, 10000, 2),
        cartLine(1, 5000, 1),
        cartLine(2, 2000, 3)
      ]);
      expect(order.total().cents()).assertEqual(31000);
      let removed: CartLine = order.lines[1];
      order.lines.splice(1, 1);
      expect(order.total().cents()).assertEqual(31000 - removed.lineTotal().cents());
      expect(order.total().cents()).assertEqual(26000);
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0870
     * @tc.name      total_zero_price_line_cross_check_with_line_total_087
     * @tc.desc      Verify total zero price line cross check with line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_zero_price_line_cross_check_with_line_total_087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_zero_price_line_cross_check_with_line_total_087');
      // The zero-price line adds 8 units but no money, so the total is just 45000*2 = 90000.
      let order: Order = makeOrder(1026, [cartLine(9, 0, 8), cartLine(0, 45000, 2)]);
      expect(order.lines[0].lineTotal().cents()).assertEqual(0);
      expect(order.lines[1].lineTotal().cents()).assertEqual(90000);
      expect(order.total().cents()).assertEqual(order.lines[1].lineTotal().cents());
      expect(order.quantity()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_TOTAL_0880
     * @tc.name      total_two_orders_from_same_source_are_independent_088
     * @tc.desc      Verify total two orders from same source are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_two_orders_from_same_source_are_independent_088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_two_orders_from_same_source_are_independent_088');
      let source: CartLine[] = [cartLine(0, 10000, 2)];
      let first: Order = makeOrder(1027, source);
      let second: Order = makeOrder(1028, source);
      expect(first.total().cents()).assertEqual(second.total().cents());
      first.lines[0].quantity = 5;
      expect(first.total().cents()).assertEqual(50000);
      expect(second.total().cents()).assertEqual(20000);
    });
  });
}
