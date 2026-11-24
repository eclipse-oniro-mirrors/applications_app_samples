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

import { describe, beforeAll, afterEach, expect, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CartLine, Catalog, Goods, Order, OrderCenter, OrderCounts, OrderState, SearchEngine } from '../Shared/ShopModel';
import { createGoods, defaultCatalog, PRODUCTS } from '../Shared/TestData';
import { yieldToEventLoop } from '../Shared/TestDriver';

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

const ALL_LABELS: string[] = [
  'obligation',
  'wait_delivery',
  'wait_receive',
  'wait_evaluate',
  'refund',
  'completed',
  'cancelled'
];

/** Always selected; LineTotal ignores the flag, removing one variable. */
function lineOf(goodsId: number, priceCents: number, quantity: number): CartLine {
  return new CartLine(goodsId, priceCents, quantity, true);
}

/** Two lines worth 517700 cents and 3 units; only state and time vary. */
function makeMixedOrder(id: number, state: OrderState, createdAt: number): Order {
  let lines: CartLine[] = [lineOf(0, 499900, 1), lineOf(4, 8900, 2)];
  return new Order(id, lines, state, createdAt);
}

/** goodsId is id % 8; defaults to OBLIGATION at 1700000000. */
function makeSingleLineOrder(id: number, priceCents: number, quantity: number,
  state: OrderState = OrderState.OBLIGATION, createdAt: number = 1700000000): Order {
  let lines: CartLine[] = [lineOf(id % 8, priceCents, quantity)];
  return new Order(id, lines, state, createdAt);
}

/** Seven counters plus total, packed in ALL_STATES order. */
function countsVector(counts: OrderCounts): number[] {
  return [counts.obligation, counts.waitDelivery, counts.waitReceive, counts.waitEvaluate,
    counts.refund, counts.completed, counts.cancelled, counts.total];
}

function idsOf(goods: Goods[]): number[] {
  let result: number[] = [];
  for (let index: number = 0; index < goods.length; index++) {
    result.push(goods[index].id);
  }
  return result;
}

function titlesOf(goods: Goods[]): string[] {
  let result: string[] = [];
  for (let index: number = 0; index < goods.length; index++) {
    result.push(goods[index].title);
  }
  return result;
}

/** Fresh engine per call, so keyword sweeps stay independent. */
function searchIds(keyword: string): number[] {
  let engine: SearchEngine = new SearchEngine(defaultCatalog());
  return idsOf(engine.search(keyword));
}

/** Rows 200-202: only 202 matches both 'alpha' and 'beta'. */
function customEngine(): SearchEngine {
  let goods: Goods[] = [
    createGoods(200, 'Alpha Stand', 1200, 'phone', 'plain info', 'plain_label'),
    createGoods(201, 'Beta Stand', 1300, 'phone', 'beta info', 'plain_label'),
    createGoods(202, 'Alpha Beta Combo', 1400, 'phone', 'combo info', 'combo_label')
  ];
  return new SearchEngine(new Catalog(goods));
}

export default function deepOrderSearchTest() {
  describe('OrangeShoppingDeepOrderSearch', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'deep order search suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0010
     * @tc.name      deep_order_state_ordinals_match_center_tab_slot_numbers_001
     * @tc.desc      Verify the order state ordinals match the centre tab slot numbers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_state_ordinals_match_center_tab_slot_numbers_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_state_ordinals_match_center_tab_slot_numbers_001');
      let ordinals: number[] = [0, 1, 2, 3, 4, 5, 6];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        expect(ALL_STATES[index]).assertEqual(ordinals[index]);
        let order: Order = makeMixedOrder(800 + index, ALL_STATES[index], 1700000000 + index);
        expect(order.stateLabel()).assertEqual(ALL_LABELS[index]);
        let expectedFinal: boolean = index === 4 || index === 5 || index === 6;
        expect(order.isFinal()).assertEqual(expectedFinal);
      }
      expect(ALL_STATES[ALL_STATES.length - 1]).assertEqual(OrderState.CANCELLED);
      expect(OrderState.CANCELLED).assertEqual(6);
      expect(OrderState.REFUND).assertEqual(4);
      expect(makeMixedOrder(894, OrderState.OBLIGATION, 1).canRefund()).assertFalse();
      expect(makeMixedOrder(895, OrderState.WAIT_RECEIVE, 2).canRefund()).assertTrue();
      expect(makeMixedOrder(896, OrderState.WAIT_DELIVERY, 3).canCancel()).assertTrue();
      expect(makeMixedOrder(899, OrderState.WAIT_EVALUATE, 7).isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0020
     * @tc.name      deep_order_advance_distance_from_open_states_counts_down_002
     * @tc.desc      Verify the advance distance from each open state counts down to completion.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_advance_distance_from_open_states_counts_down_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_advance_distance_from_open_states_counts_down_002');
      let starts: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE
      ];
      let expected: number[] = [4, 3, 2, 1];
      for (let index: number = 0; index < starts.length; index++) {
        let order: Order = makeMixedOrder(810 + index, starts[index], 1700000100);
        let steps: number = 0;
        // advance() returns false only in a terminal state, so the loop counts the hops left to COMPLETED.
        while (order.advance()) {
          steps++;
        }
        expect(steps).assertEqual(expected[index]);
        expect(order.state).assertEqual(OrderState.COMPLETED);
        expect(order.stateLabel()).assertEqual('completed');
        expect(order.total().cents()).assertEqual(517700);
      }
      let tail: Order = makeMixedOrder(819, OrderState.WAIT_EVALUATE, 1700000101);
      expect(tail.advance()).assertTrue();
      expect(tail.state).assertEqual(OrderState.COMPLETED);
      expect(tail.advance()).assertFalse();
      expect(tail.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0030
     * @tc.name      deep_order_terminal_states_reject_three_operations_003
     * @tc.desc      Verify every terminal state rejects advance, cancel and refund together.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_terminal_states_reject_three_operations_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_terminal_states_reject_three_operations_003');
      let terminals: OrderState[] = [OrderState.REFUND, OrderState.COMPLETED, OrderState.CANCELLED];
      let labels: string[] = ['refund', 'completed', 'cancelled'];
      for (let index: number = 0; index < terminals.length; index++) {
        let order: Order = makeMixedOrder(820 + index, terminals[index], 1700000200);
        expect(order.advance()).assertFalse();
        expect(order.cancel()).assertFalse();
        expect(order.refund()).assertFalse();
        expect(order.state).assertEqual(terminals[index]);
        expect(order.stateLabel()).assertEqual(labels[index]);
        expect(order.isFinal()).assertTrue();
      }
      let refunded: Order = makeMixedOrder(829, OrderState.REFUND, 1700000201);
      expect(refunded.canCancel()).assertFalse();
      expect(refunded.canRefund()).assertFalse();
      expect(refunded.stateLabel()).assertEqual('refund');
      expect(refunded.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0040
     * @tc.name      deep_order_cancelled_orders_keep_totals_and_stay_closed_004
     * @tc.desc      Verify cancelled orders keep their totals while rejecting all later operations.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_cancelled_orders_keep_totals_and_stay_closed_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_cancelled_orders_keep_totals_and_stay_closed_004');
      let prices: number[] = [8900, 19900, 499900];
      for (let index: number = 0; index < prices.length; index++) {
        let order: Order = makeSingleLineOrder(830 + index, prices[index], 1);
        expect(order.cancel()).assertTrue();
        expect(order.advance()).assertFalse();
        expect(order.refund()).assertFalse();
        expect(order.cancel()).assertFalse();
        expect(order.state).assertEqual(OrderState.CANCELLED);
        expect(order.stateLabel()).assertEqual('cancelled');
      }
      let kept: Order = makeSingleLineOrder(839, 15900, 4);
      // Cancel first: final state and the closed cancel gate only hold afterwards.
      expect(kept.cancel()).assertTrue();
      expect(kept.total().cents()).assertEqual(63600);
      expect(kept.quantity()).assertEqual(4);
      expect(kept.isFinal()).assertTrue();
      expect(kept.canCancel()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0050
     * @tc.name      deep_order_total_follows_price_times_quantity_sweep_005
     * @tc.desc      Verify order totals follow unit price times quantity across five quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_total_follows_price_times_quantity_sweep_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_total_follows_price_times_quantity_sweep_005');
      // Every total is 12345 cents multiplied by the swept quantity, ending at 99 x 12345 = 1222155.
      let quantities: number[] = [1, 2, 7, 42, 99];
      let totals: number[] = [12345, 24690, 86415, 518490, 1222155];
      for (let index: number = 0; index < quantities.length; index++) {
        let order: Order = makeSingleLineOrder(840 + index, 12345, quantities[index]);
        expect(order.total().cents()).assertEqual(totals[index]);
        expect(order.quantity()).assertEqual(quantities[index]);
        expect(order.lines.length).assertEqual(1);
      }
      expect(makeSingleLineOrder(848, 12345, 99).total().format()).assertEqual('¥12221.55');
      let capped: Order = makeSingleLineOrder(849, 1, 99);
      expect(capped.total().cents()).assertEqual(99);
      expect(capped.quantity()).assertEqual(99);
      expect(capped.total().isPositive()).assertTrue();
      expect(capped.lines[0].unitPriceCents).assertEqual(1);
      expect(capped.lines[0].goodsId).assertEqual(849 % 8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0060
     * @tc.name      deep_order_quantity_sums_mixed_lines_independently_of_price_006
     * @tc.desc      Verify order quantity sums mixed line quantities independently of prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_quantity_sums_mixed_lines_independently_of_price_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_quantity_sums_mixed_lines_independently_of_price_006');
      // Quantity adds the unit counts 3 + 0 + 5 + 1 = 9, while the total adds line prices 300 + 0 + 0 + 123456.
      let lines: CartLine[] = [
        lineOf(0, 100, 3),
        lineOf(1, 999, 0),
        lineOf(2, 0, 5),
        lineOf(3, 123456, 1)
      ];
      let order: Order = new Order(850, lines, OrderState.OBLIGATION, 1700000300);
      expect(order.quantity()).assertEqual(9);
      expect(order.total().cents()).assertEqual(123756);
      expect(order.lines.length).assertEqual(4);
      expect(order.lines[1].lineTotal().cents()).assertEqual(0);
      expect(order.lines[3].lineTotal().cents()).assertEqual(123456);
      expect(order.lines[0].lineTotal().cents()).assertEqual(300);
      expect(order.lines[2].lineTotal().cents()).assertEqual(0);
      expect(order.total().format()).assertEqual('¥1237.56');
      expect(order.quantity() === order.lines.length).assertFalse();
      expect(order.lines[3].quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0070
     * @tc.name      deep_order_negative_unit_price_parcel_lowers_total_007
     * @tc.desc      Verify a negative unit price line lowers the order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_negative_unit_price_parcel_lowers_total_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_negative_unit_price_parcel_lowers_total_007');
      // The -2500 x 3 parcel subtracts 7500 from the 20000-cent line, leaving 12500.
      let lines: CartLine[] = [
        lineOf(0, 10000, 2),
        lineOf(1, -2500, 3)
      ];
      let order: Order = new Order(860, lines, OrderState.WAIT_DELIVERY, 1700000400);
      expect(order.total().cents()).assertEqual(12500);
      expect(order.quantity()).assertEqual(5);
      expect(order.total().isPositive()).assertTrue();
      expect(order.total().isNegative()).assertFalse();
      expect(order.lines[1].lineTotal().cents()).assertEqual(-7500);
      expect(order.total().format()).assertEqual('¥125.00');
      expect(order.lines[0].lineTotal().cents()).assertEqual(20000);
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(order.refund()).assertFalse();
      expect(order.cancel()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0080
     * @tc.name      deep_order_negative_line_quantity_lowers_quantity_008
     * @tc.desc      Verify a negative line quantity lowers the summed order quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_negative_line_quantity_lowers_quantity_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_negative_line_quantity_lowers_quantity_008');
      let lines: CartLine[] = [
        lineOf(0, 1000, 5),
        lineOf(1, 1000, -2)
      ];
      let order: Order = new Order(870, lines, OrderState.WAIT_RECEIVE, 1700000500);
      expect(order.quantity()).assertEqual(3);
      expect(order.total().cents()).assertEqual(3000);
      expect(order.lines[0].quantity).assertEqual(5);
      expect(order.lines[1].quantity).assertEqual(-2);
      expect(order.refund()).assertTrue();
      expect(order.quantity()).assertEqual(3);
      expect(order.lines[1].lineTotal().cents()).assertEqual(-2000);
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
      expect(order.total().cents()).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0090
     * @tc.name      deep_order_lines_are_deep_copies_of_source_lines_009
     * @tc.desc      Verify order lines are deep copies of the supplied source lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_order_lines_are_deep_copies_of_source_lines_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_order_lines_are_deep_copies_of_source_lines_009');
      let sourceLine: CartLine = lineOf(0, 8900, 2);
      let lines: CartLine[] = [sourceLine];
      let order: Order = new Order(880, lines, OrderState.OBLIGATION, 1700000600);
      sourceLine.unitPriceCents = 1;
      sourceLine.quantity = 9;
      sourceLine.selected = false;
      expect(sourceLine === order.lines[0]).assertFalse();
      expect(order.lines[0].unitPriceCents).assertEqual(8900);
      expect(order.lines[0].quantity).assertEqual(2);
      expect(order.lines[0].selected).assertTrue();
      expect(order.total().cents()).assertEqual(17800);
      expect(order.quantity()).assertEqual(2);
      expect(order.lines[0].goodsId).assertEqual(0);
      expect(sourceLine.quantity).assertEqual(9);
      expect(order.lines[0] === sourceLine).assertFalse();
      expect(order.state).assertEqual(OrderState.OBLIGATION);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0100
     * @tc.name      deep_center_counters_update_after_cancel_and_refund_010
     * @tc.desc      Verify centre counters update after a cancel and a refund in one collection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_counters_update_after_cancel_and_refund_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_counters_update_after_cancel_and_refund_010');
      let orders: Order[] = [];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        orders.push(makeMixedOrder(890 + index, ALL_STATES[index], 1700000700 + index));
      }
      let center: OrderCenter = new OrderCenter(orders);
      expect(orders[0].cancel()).assertTrue();
      expect(orders[2].refund()).assertTrue();
      let counts: OrderCounts = center.counts();
      // Cancel empties obligation and refund empties waitReceive, so those slots drop to 0 as refund and cancelled reach 2.
      let expected: number[] = [0, 1, 0, 1, 2, 1, 2, 7];
      let observed: number[] = countsVector(counts);
      for (let index: number = 0; index < expected.length; index++) {
        expect(observed[index]).assertEqual(expected[index]);
      }
      expect(center.size()).assertEqual(7);
      expect(counts.obligation).assertEqual(0);
      expect(counts.cancelled).assertEqual(2);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(2);
      expect(center.byState(OrderState.OBLIGATION).length).assertEqual(0);
      expect(center.latest() !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0110
     * @tc.name      deep_center_spent_includes_completed_but_not_refund_011
     * @tc.desc      Verify centre spending includes completed orders but excludes refund and cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_spent_includes_completed_but_not_refund_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_spent_includes_completed_but_not_refund_011');
      let prices: number[] = [100000, 20000, 3000, 400, 500, 999999, 777];
      let orders: Order[] = [];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        orders.push(makeSingleLineOrder(900 + index, prices[index], 1, ALL_STATES[index],
          1700000000 + index));
      }
      let center: OrderCenter = new OrderCenter(orders);
      // Completed (999999) counts; refund (500) and cancelled (777) do not.
      expect(center.spent().cents()).assertEqual(1123399);
      expect(orders[2].refund()).assertTrue();
      // The 3000-cent order is now refunded too, so spending drops to 1120399.
      expect(center.spent().cents()).assertEqual(1120399);
      let counts: OrderCounts = center.counts();
      expect(counts.refund).assertEqual(2);
      expect(counts.total).assertEqual(7);
      expect(center.counts().completed).assertEqual(1);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(1);
      expect(center.size()).assertEqual(7);
      expect(center.latest() === orders[6]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0120
     * @tc.name      deep_center_by_state_buckets_match_counters_after_changes_012
     * @tc.desc      Verify by-state buckets keep matching the counters after state changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_by_state_buckets_match_counters_after_changes_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_by_state_buckets_match_counters_after_changes_012');
      let starts: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.COMPLETED
      ];
      let orders: Order[] = [];
      for (let index: number = 0; index < starts.length; index++) {
        orders.push(makeMixedOrder(910 + index, starts[index], 1700000800 + index));
      }
      let center: OrderCenter = new OrderCenter(orders);
      expect(orders[0].cancel()).assertTrue();
      expect(orders[3].refund()).assertTrue();
      let counts: OrderCounts = center.counts();
      let fields: number[] = countsVector(counts);
      let sum: number = 0;
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let bucket: Order[] = center.byState(ALL_STATES[index]);
        expect(bucket.length).assertEqual(fields[index]);
        sum += bucket.length;
      }
      expect(sum).assertEqual(5);
      expect(counts.total).assertEqual(5);
      expect(counts.obligation).assertEqual(0);
      expect(counts.refund).assertEqual(1);
      expect(center.byState(OrderState.WAIT_EVALUATE).length).assertEqual(0);
      expect(center.size()).assertEqual(5);
      expect(center.spent().cents()).assertEqual(517700 * 3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0130
     * @tc.name      deep_center_all_view_exposes_live_internal_array_013
     * @tc.desc      Verify the centre all view exposes its live internal array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_all_view_exposes_live_internal_array_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_all_view_exposes_live_internal_array_013');
      let orders: Order[] = [
        makeMixedOrder(920, OrderState.OBLIGATION, 1),
        makeMixedOrder(921, OrderState.WAIT_DELIVERY, 2),
        makeMixedOrder(922, OrderState.COMPLETED, 3),
        makeMixedOrder(923, OrderState.REFUND, 4)
      ];
      let center: OrderCenter = new OrderCenter(orders);
      let live: Order[] = center.all();
      expect(live === center.all()).assertTrue();
      // all() hands back the centre's own array, so pop really removes the refund row and push really adds one.
      let removed: Order | undefined = live.pop();
      expect(removed !== undefined).assertTrue();
      expect(center.size()).assertEqual(3);
      expect(center.all().length).assertEqual(3);
      expect(center.counts().total).assertEqual(3);
      live.push(makeMixedOrder(924, OrderState.CANCELLED, 5));
      expect(center.size()).assertEqual(4);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(1);
      expect(center.byState(OrderState.WAIT_DELIVERY).length).assertEqual(1);
      expect(center.byState(OrderState.REFUND).length).assertEqual(0);
      expect(center.all() === live).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0140
     * @tc.name      deep_center_spent_absorbs_active_negative_total_014
     * @tc.desc      Verify centre spending includes an active negative order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_spent_absorbs_active_negative_total_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_spent_absorbs_active_negative_total_014');
      let positive: Order = makeSingleLineOrder(930, 5000, 1, OrderState.OBLIGATION);
      let negative: Order = makeSingleLineOrder(931, -700, 1, OrderState.WAIT_DELIVERY);
      let center: OrderCenter = new OrderCenter([positive, negative]);
      expect(center.spent().cents()).assertEqual(4300);
      expect(center.size()).assertEqual(2);
      expect(negative.cancel()).assertTrue();
      expect(center.spent().cents()).assertEqual(5000);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().waitDelivery).assertEqual(0);
      expect(center.spent().isPositive()).assertTrue();
      expect(negative.total().isNegative()).assertTrue();
      expect(positive.total().cents()).assertEqual(5000);
      expect(center.latest() === positive).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0150
     * @tc.name      deep_center_latest_ignores_not_a_number_creation_time_015
     * @tc.desc      Verify centre latest ignores a not-a-number creation time.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_center_latest_ignores_not_a_number_creation_time_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_center_latest_ignores_not_a_number_creation_time_015');
      let first: Order = makeMixedOrder(940, OrderState.OBLIGATION, 10);
      let broken: Order = makeMixedOrder(941, OrderState.WAIT_DELIVERY, Number.NaN);
      let third: Order = makeMixedOrder(942, OrderState.WAIT_RECEIVE, 5);
      let center: OrderCenter = new OrderCenter([first, broken, third]);
      // NaN compares false under >, so the broken timestamp never displaces the running latest at 10.
      let latest: Order | undefined = center.latest();
      expect(latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(940);
        expect(latest.createdAt).assertEqual(10);
        expect(latest.state).assertEqual(OrderState.OBLIGATION);
      }
      expect(center.size()).assertEqual(3);
      expect(center.spent().cents()).assertEqual(1553100);
      expect(center.byState(OrderState.OBLIGATION).length).assertEqual(1);
      expect(center.sortedByCreatedAt(false).length).assertEqual(3);
      expect(broken.total().cents()).assertEqual(517700);
      expect(center.latest() === first).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0160
     * @tc.name      deep_search_info_token_returns_equal_duplicate_pair_016
     * @tc.desc      Verify an info-only token returns the duplicate pair with equal prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_info_token_returns_equal_duplicate_pair_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_info_token_returns_equal_duplicate_pair_016');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('organic');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(4);
      expect(results[1].id).assertEqual(12);
      expect(results[0].title).assertEqual('Green Tea Pack');
      expect(results[1].title).assertEqual('Green Tea Pack');
      expect(results[0].price.cents()).assertEqual(8900);
      expect(results[1].stock).assertEqual(200);
      expect(engine.search('ORGANIC').length).assertEqual(2);
      expect(results[0].category).assertEqual('food');
      expect(idsOf(results)[0]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0170
     * @tc.name      deep_search_phone_and_flagship_tokens_narrow_to_two_017
     * @tc.desc      Verify the phone and flagship tokens narrow the result to two rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_phone_and_flagship_tokens_narrow_to_two_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_phone_and_flagship_tokens_narrow_to_two_017');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone flagship');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(0);
      expect(results[1].id).assertEqual(8);
      expect(titlesOf(results)[0]).assertEqual('Harmony Phone One');
      expect(titlesOf(results)[1]).assertEqual('Harmony Phone One');
      expect(results[0].price.cents()).assertEqual(499900);
      expect(results[0].labels).assertEqual('new_product');
      expect(engine.search('FLAGSHIP').length).assertEqual(2);
      expect(idsOf(results)[1]).assertEqual(8);
      expect(results[1].sales).assertEqual(1200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0180
     * @tc.name      deep_search_two_token_results_are_subset_of_each_token_018
     * @tc.desc      Verify two-token results are a subset of every single-token result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_two_token_results_are_subset_of_each_token_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_two_token_results_are_subset_of_each_token_018');
      let pairs: string[][] = [
        ['phone', 'flagship'],
        ['hot_sale', 'earbuds'],
        ['discount', 'shoes']
      ];
      let expected: number[][] = [[0, 8], [6, 14], [3, 11]];
      for (let index: number = 0; index < pairs.length; index++) {
        let firstIds: number[] = searchIds(pairs[index][0]);
        let secondIds: number[] = searchIds(pairs[index][1]);
        let bothIds: number[] = searchIds(pairs[index][0] + ' ' + pairs[index][1]);
        expect(bothIds.length).assertEqual(expected[index].length);
        for (let slot: number = 0; slot < bothIds.length; slot++) {
          expect(bothIds[slot]).assertEqual(expected[index][slot]);
          expect(firstIds.indexOf(bothIds[slot]) === -1).assertFalse();
          expect(secondIds.indexOf(bothIds[slot]) === -1).assertFalse();
        }
      }
      expect(searchIds('hot_sale earbuds').length).assertEqual(2);
      expect(searchIds('discount shoes').length).assertEqual(2);
      expect(searchIds('phone flagship').length).assertEqual(2);
      expect(searchIds('phone flagship')[0]).assertEqual(0);
      expect(searchIds('discount shoes')[1]).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0190
     * @tc.name      deep_search_ranking_differs_from_sales_ranking_019
     * @tc.desc      Verify search ranking differs from the sales ranking of the same rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_ranking_differs_from_sales_ranking_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_ranking_differs_from_sales_ranking_019');
      let phoneIds: number[] = searchIds('phone');
      let phoneGoods: Goods[] = defaultCatalog().byCategory('phone');
      let salesGoods: Goods[] = new Catalog(phoneGoods).sortedBySales();
      let salesIds: number[] = idsOf(salesGoods);
      let expectedSearch: number[] = [0, 1, 8, 9, 6, 14];
      let expectedSales: number[] = [6, 14, 0, 8, 1, 9];
      for (let index: number = 0; index < expectedSearch.length; index++) {
        expect(phoneIds[index]).assertEqual(expectedSearch[index]);
        expect(salesIds[index]).assertEqual(expectedSales[index]);
      }
      expect(phoneIds[0] === salesIds[0]).assertFalse();
      expect(phoneIds.length).assertEqual(6);
      expect(phoneGoods.length).assertEqual(6);
      expect(salesGoods.length).assertEqual(6);
      expect(phoneIds[4]).assertEqual(6);
      expect(salesIds[5]).assertEqual(9);
      expect(phoneIds.length === salesIds.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0200
     * @tc.name      deep_search_single_letter_sweep_covers_every_identifier_020
     * @tc.desc      Verify the single letter sweep covers every catalog identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_single_letter_sweep_covers_every_identifier_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_single_letter_sweep_covers_every_identifier_020');
      // The sweep walks ASCII 97..122 and marks which of the 16 catalog ids each single letter can reach.
      let covered: boolean[] = [];
      for (let index: number = 0; index < 16; index++) {
        covered.push(false);
      }
      let nonEmpty: number = 0;
      for (let code: number = 97; code <= 122; code++) {
        let ids: number[] = searchIds(String.fromCharCode(code));
        if (ids.length > 0) {
          nonEmpty++;
        }
        for (let slot: number = 0; slot < ids.length; slot++) {
          covered[ids[slot]] = true;
        }
      }
      expect(nonEmpty).assertEqual(21);
      for (let index: number = 0; index < covered.length; index++) {
        expect(covered[index]).assertTrue();
      }
      let emptyLetters: string[] = ['j', 'q', 'v', 'x', 'z'];
      for (let index: number = 0; index < emptyLetters.length; index++) {
        expect(searchIds(emptyLetters[index]).length).assertEqual(0);
      }
      expect(searchIds('a').length).assertEqual(14);
      expect(searchIds('z').length).assertEqual(0);
      expect(covered[0]).assertTrue();
      expect(nonEmpty === 26).assertFalse();
      expect(searchIds('e').length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0210
     * @tc.name      deep_search_inner_tab_and_newline_do_not_split_tokens_021
     * @tc.desc      Verify inner tab and newline characters do not split search tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_inner_tab_and_newline_do_not_split_tokens_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_inner_tab_and_newline_do_not_split_tokens_021');
      // Tokenizing splits on a space only, so the tab or newline query stays one impossible token and matches nothing.
      let separators: string[] = ['phone\tflagship', 'phone\nflagship'];
      for (let index: number = 0; index < separators.length; index++) {
        let ids: number[] = searchIds(separators[index]);
        expect(ids.length).assertEqual(0);
      }
      let control: number[] = searchIds('phone flagship');
      expect(control.length).assertEqual(2);
      expect(control[0]).assertEqual(0);
      expect(control[1]).assertEqual(8);
      expect(searchIds('phone\tflagship').length).assertEqual(0);
      expect(searchIds('phone\nflagship').length).assertEqual(0);
      expect(searchIds('phone flagship').length).assertEqual(2);
      expect(searchIds('phone').length).assertEqual(6);
      expect(control.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0220
     * @tc.name      deep_search_three_letter_fragment_matches_runner_pair_022
     * @tc.desc      Verify the run fragment matches the runner title and info pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_three_letter_fragment_matches_runner_pair_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_three_letter_fragment_matches_runner_pair_022');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('run');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(3);
      expect(results[1].id).assertEqual(11);
      expect(results[0].title).assertEqual('Sport Runner Shoes');
      expect(results[1].title).assertEqual('Sport Runner Shoes');
      expect(results[0].price.cents()).assertEqual(59900);
      expect(idsOf(results)[0]).assertEqual(3);
      expect(results[1].sales).assertEqual(1500);
      expect(results[0].stock).assertEqual(80);
      expect(results[0].labels).assertEqual('discount');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0230
     * @tc.name      deep_search_four_token_query_without_a_shared_goods_is_empty_023
     * @tc.desc      Verify a four-token query without a shared goods returns nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_four_token_query_without_a_shared_goods_is_empty_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_four_token_query_without_a_shared_goods_is_empty_023');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let none: Goods[] = engine.search('harmony tea pack blender');
      expect(none.length).assertEqual(0);
      let family: Goods[] = engine.search('harmony phone');
      expect(family.length).assertEqual(4);
      expect(family[0].id).assertEqual(0);
      expect(family[1].id).assertEqual(1);
      expect(family[2].id).assertEqual(8);
      expect(family[3].id).assertEqual(9);
      let alone: Goods[] = engine.search('two');
      expect(idsOf(family)[3]).assertEqual(9);
      expect(idsOf(alone)[0]).assertEqual(1);
      expect(engine.search('tea blender').length).assertEqual(0);
      expect(alone[0].title).assertEqual('Harmony Phone Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0240
     * @tc.name      deep_search_uppercase_query_matches_lowercase_query_024
     * @tc.desc      Verify an uppercase two-token query returns the same rows as its lowercase form.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_uppercase_query_matches_lowercase_query_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_uppercase_query_matches_lowercase_query_024');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let upper: Goods[] = engine.search('PHONE LITE');
      let lower: Goods[] = engine.search('phone lite');
      expect(upper.length).assertEqual(2);
      expect(lower.length).assertEqual(upper.length);
      for (let index: number = 0; index < upper.length; index++) {
        expect(upper[index].id).assertEqual(lower[index].id);
        expect(upper[index] === lower[index]).assertTrue();
      }
      expect(upper[0].id).assertEqual(1);
      expect(upper[1].id).assertEqual(9);
      expect(upper[0].info).assertEqual('lite phone');
      expect(upper[0].category).assertEqual('phone');
      expect(upper[0].labels).assertEqual('hot_sale');
      expect(engine.search('PHONE LITE LITE').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0250
     * @tc.name      deep_search_padded_query_matches_single_spaced_query_025
     * @tc.desc      Verify a padded query keeps exactly the rows of its single-spaced form.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_padded_query_matches_single_spaced_query_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_padded_query_matches_single_spaced_query_025');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let padded: Goods[] = engine.search('  phone   flagship  ');
      let plain: Goods[] = engine.search('phone flagship');
      expect(padded.length).assertEqual(2);
      expect(plain.length).assertEqual(padded.length);
      for (let index: number = 0; index < padded.length; index++) {
        expect(padded[index].id).assertEqual(plain[index].id);
        expect(padded[index] === plain[index]).assertTrue();
        expect(padded[index].price.cents()).assertEqual(499900);
      }
      expect(padded[0].id).assertEqual(0);
      expect(padded[0].title).assertEqual('Harmony Phone One');
      expect(padded[0].labels).assertEqual('new_product');
      expect(padded[0].stock).assertEqual(30);
      expect(padded[0].liveRoomId).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0260
     * @tc.name      deep_search_label_and_title_tiers_order_hot_sale_phones_026
     * @tc.desc      Verify a label and title token query ranks title hits before category hits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_label_and_title_tiers_order_hot_sale_phones_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_label_and_title_tiers_order_hot_sale_phones_026');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('hot_sale phone');
      expect(results.length).assertEqual(4);
      expect(results[0].id).assertEqual(1);
      expect(results[1].id).assertEqual(9);
      expect(results[2].id).assertEqual(6);
      expect(results[3].id).assertEqual(14);
      expect(results[0].title).assertEqual('Harmony Phone Two');
      expect(results[2].price.cents()).assertEqual(19900);
      expect(results[2].category).assertEqual('phone');
      expect(engine.search('HOT_SALE PHONE').length).assertEqual(4);
      expect(idsOf(results)[3]).assertEqual(14);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0270
     * @tc.name      deep_search_category_and_info_tokens_keep_blenders_027
     * @tc.desc      Verify the appliances and home tokens keep the blender pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_category_and_info_tokens_keep_blenders_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_category_and_info_tokens_keep_blenders_027');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('appliances home');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(5);
      expect(results[1].id).assertEqual(13);
      expect(results[0].title).assertEqual('Kitchen Blender');
      expect(results[1].title).assertEqual('Kitchen Blender');
      expect(results[0].info).assertEqual('home appliance');
      expect(engine.search('APPLIANCES HOME').length).assertEqual(2);
      expect(results[0].stock).assertEqual(25);
      expect(results[0].sales).assertEqual(430);
      expect(results[0].liveRoomId).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0280
     * @tc.name      deep_search_title_and_category_tokens_keep_sport_pair_028
     * @tc.desc      Verify the shoes and sport tokens keep the same two sport rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_title_and_category_tokens_keep_sport_pair_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_title_and_category_tokens_keep_sport_pair_028');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('shoes sport');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(3);
      expect(results[1].id).assertEqual(11);
      expect(results[0].category).assertEqual('sport');
      expect(results[1].category).assertEqual('sport');
      expect(results[0].price.cents()).assertEqual(59900);
      expect(engine.search('SPORT SHOES').length).assertEqual(2);
      expect(results[0].stock).assertEqual(80);
      expect(results[0].labels).assertEqual('discount');
      expect(idsOf(results)[0]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0290
     * @tc.name      deep_search_symbol_only_keywords_return_nothing_029
     * @tc.desc      Verify symbol-only keywords return no catalog rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_symbol_only_keywords_return_nothing_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_symbol_only_keywords_return_nothing_029');
      let symbols: string[] = ['#', '%', '@', '&', '+', '~'];
      for (let index: number = 0; index < symbols.length; index++) {
        let ids: number[] = searchIds(symbols[index]);
        expect(ids.length).assertEqual(0);
      }
      let mixed: number[] = searchIds('&%#');
      expect(mixed.length).assertEqual(0);
      let known: number[] = searchIds('shirt');
      expect(known.length).assertEqual(2);
      expect(known[0]).assertEqual(7);
      expect(known[1]).assertEqual(15);
      expect(searchIds('').length).assertEqual(0);
      expect(searchIds(' ').length).assertEqual(0);
      expect(searchIds('shirt').length).assertEqual(2);
      expect(searchIds('@').length).assertEqual(0);
      expect(mixed.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0300
     * @tc.name      deep_search_custom_and_query_requires_both_tokens_in_one_goods_030
     * @tc.desc      Verify a custom and query requires both tokens in one goods row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_custom_and_query_requires_both_tokens_in_one_goods_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_custom_and_query_requires_both_tokens_in_one_goods_030');
      let engine: SearchEngine = customEngine();
      let both: Goods[] = engine.search('alpha beta');
      expect(both.length).assertEqual(1);
      expect(both[0].id).assertEqual(202);
      expect(both[0].title).assertEqual('Alpha Beta Combo');
      let alpha: Goods[] = engine.search('alpha');
      expect(alpha.length).assertEqual(2);
      expect(idsOf(alpha)[0]).assertEqual(200);
      expect(idsOf(alpha)[1]).assertEqual(202);
      let beta: Goods[] = engine.search('beta');
      expect(alpha[0].title).assertEqual('Alpha Stand');
      expect(engine.search('alpha combo').length).assertEqual(1);
      expect(engine.search('gamma').length).assertEqual(0);
      expect(both[0].price.cents()).assertEqual(1400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0310
     * @tc.name      deep_search_duplicate_pair_rows_are_distinct_instances_031
     * @tc.desc      Verify the tea duplicate pair returns two distinct goods instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_duplicate_pair_rows_are_distinct_instances_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_duplicate_pair_rows_are_distinct_instances_031');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(4);
      expect(results[1].id).assertEqual(12);
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].title).assertEqual(results[1].title);
      expect(results[0].price.cents()).assertEqual(results[1].price.cents());
      expect(results[1].stock).assertEqual(200);
      expect(engine.search('TEA').length).assertEqual(2);
      expect(results[0].category).assertEqual('food');
      expect(results[0].labels).assertEqual('hot_sale');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0320
     * @tc.name      deep_search_single_underscore_token_hits_label_and_category_032
     * @tc.desc      Verify a single underscore token hits underscore labels and categories.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_single_underscore_token_hits_label_and_category_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_single_underscore_token_hits_label_and_category_032');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('_');
      expect(results.length).assertEqual(14);
      // Underscore labels score 2 while the men_wear category scores 0, so rows 7 and 15 trail the other twelve.
      let expected: number[] = [0, 1, 2, 4, 5, 6, 8, 9, 10, 12, 13, 14, 7, 15];
      let observed: number[] = idsOf(results);
      for (let index: number = 0; index < expected.length; index++) {
        expect(observed[index]).assertEqual(expected[index]);
      }
      expect(results[0].labels).assertEqual('new_product');
      expect(results[1].labels).assertEqual('hot_sale');
      expect(results[12].category).assertEqual('men_wear');
      expect(results[13].category).assertEqual('men_wear');
      expect(results[10].labels).assertEqual('new_product');
      expect(results[11].labels).assertEqual('hot_sale');
      expect(engine.search('new_product').length).assertEqual(6);
      expect(engine.search('hot_sale').length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0330
     * @tc.name      deep_search_repeated_middle_token_keeps_flagship_pair_033
     * @tc.desc      Verify a repeated middle token keeps the flagship pair unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_repeated_middle_token_keeps_flagship_pair_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_repeated_middle_token_keeps_flagship_pair_033');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone flagship flagship');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(0);
      expect(results[1].id).assertEqual(8);
      let plain: Goods[] = engine.search('phone flagship');
      expect(plain.length).assertEqual(results.length);
      expect(plain[0] === results[0]).assertTrue();
      expect(plain[1] === results[1]).assertTrue();
      expect(results[0].title).assertEqual('Harmony Phone One');
      expect(results[0].labels).assertEqual('new_product');
      expect(results[1].id).assertEqual(8);
      expect(results.length).assertEqual(plain.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0340
     * @tc.name      deep_suggest_letter_e_returns_six_sorted_titles_034
     * @tc.desc      Verify the letter e prefix returns six sorted distinct titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_letter_e_returns_six_sorted_titles_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_letter_e_returns_six_sorted_titles_034');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // Six distinct titles contain 'e'; the default limit of 5 explains why every argument-less call below returns five.
      let titles: string[] = engine.suggest('e', 20);
      let expected: string[] = ['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds'];
      expect(titles.length).assertEqual(6);
      for (let index: number = 0; index < expected.length; index++) {
        expect(titles[index]).assertEqual(expected[index]);
      }
      expect(titles[0] === titles[5]).assertFalse();
      expect(engine.suggest('E', 20).length).assertEqual(6);
      expect(titles[1]).assertEqual('Harmony Phone One');
      expect(titles[5]).assertEqual('Wireless Earbuds');
      expect(engine.suggest('e').length).assertEqual(5);
      expect(engine.suggest('E', 3).length).assertEqual(3);
      expect(titles.length === 5).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0350
     * @tc.name      deep_suggest_non_finite_limit_keeps_the_full_list_035
     * @tc.desc      Verify a non-finite suggestion limit keeps the full sorted list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_non_finite_limit_keeps_the_full_list_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_non_finite_limit_keeps_the_full_list_035');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // The truncation guard only fires when length > limit, and NaN or Infinity makes that false, keeping all six.
      let plain: string[] = engine.suggest('e', 20);
      let nanLimited: string[] = engine.suggest('e', Number.NaN);
      let infinite: string[] = engine.suggest('e', Number.POSITIVE_INFINITY);
      expect(plain.length).assertEqual(6);
      expect(nanLimited.length).assertEqual(6);
      expect(infinite.length).assertEqual(6);
      expect(nanLimited[0]).assertEqual(plain[0]);
      expect(nanLimited[5]).assertEqual(plain[5]);
      expect(infinite[0]).assertEqual('Green Tea Pack');
      expect(infinite[2]).assertEqual(plain[2]);
      expect(engine.suggest('e', 0).length).assertEqual(0);
      expect(engine.suggest('e', -1).length).assertEqual(0);
      expect(nanLimited.length === infinite.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0360
     * @tc.name      deep_suggest_every_title_is_searchable_back_036
     * @tc.desc      Verify every suggested title is searchable back to its duplicate pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_every_title_is_searchable_back_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_every_title_is_searchable_back_036');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let prefixes: string[] = ['e', 'p', 's'];
      let counts: number[] = [6, 5, 4];
      let checked: number = 0;
      for (let index: number = 0; index < prefixes.length; index++) {
        let titles: string[] = engine.suggest(prefixes[index], 20);
        expect(titles.length).assertEqual(counts[index]);
        for (let slot: number = 0; slot < titles.length; slot++) {
          // Each suggested title searches back to a pair, so two distinct Goods instances must come back.
          let back: Goods[] = engine.search(titles[slot]);
          expect(back.length === 0).assertFalse();
          expect(back[0].title).assertEqual(titles[slot]);
          expect(titles.indexOf(titles[slot])).assertEqual(slot);
          expect(back[0] === back[1]).assertFalse();
          expect(back[0].id === back[1].id).assertFalse();
          checked++;
        }
      }
      expect(engine.suggest('e', 20)[0]).assertEqual('Green Tea Pack');
      expect(engine.suggest('p', 20)[0]).assertEqual('Green Tea Pack');
      expect(engine.suggest('s', 20)[0]).assertEqual('Classic Shirt');
      expect(engine.suggest('s', 20).length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0370
     * @tc.name      deep_suggest_numeric_prefixes_match_no_title_037
     * @tc.desc      Verify numeric suggestion prefixes match no default title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_numeric_prefixes_match_no_title_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_numeric_prefixes_match_no_title_037');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < 9; index++) {
        let prefix: string = String.fromCharCode(49 + index);
        let titles: string[] = engine.suggest(prefix, 10);
        expect(titles.length).assertEqual(0);
      }
      let letter: string[] = engine.suggest('h', 10);
      expect(letter.length).assertEqual(6);
      expect(letter[0]).assertEqual('Classic Shirt');
      expect(engine.suggest('0', 10).length).assertEqual(0);
      expect(engine.suggest('9', 10).length).assertEqual(0);
      expect(engine.suggest('H', 10).length).assertEqual(6);
      expect(letter[5]).assertEqual('Sport Runner Shoes');
      expect(engine.suggest('', 10).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0380
     * @tc.name      deep_suggest_overlong_prefix_returns_no_title_038
     * @tc.desc      Verify an overlong suggestion prefix returns no title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_overlong_prefix_returns_no_title_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_overlong_prefix_returns_no_title_038');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let buffer: string = '';
      for (let index: number = 0; index < 80; index++) {
        buffer = buffer + 'z';
      }
      expect(buffer.length).assertEqual(80);
      expect(engine.suggest(buffer, 10).length).assertEqual(0);
      expect(engine.suggest('zz', 10).length).assertEqual(0);
      expect(engine.suggest('harmony', 10).length).assertEqual(2);
      expect(engine.suggest('zzz', 10).length).assertEqual(0);
      expect(engine.suggest('harmony', 10).length).assertEqual(2);
      expect(engine.suggest('harmony phone', 10).length).assertEqual(2);
      expect(engine.suggest('Harmony Phone One', 10).length).assertEqual(1);
      expect(engine.suggest('zzz', 10).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0390
     * @tc.name      deep_suggest_harmony_returns_two_sorted_titles_039
     * @tc.desc      Verify the harmony prefix returns two sorted titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_suggest_harmony_returns_two_sorted_titles_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_suggest_harmony_returns_two_sorted_titles_039');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let titles: string[] = engine.suggest('harmony');
      expect(titles.length).assertEqual(2);
      expect(titles[0]).assertEqual('Harmony Phone One');
      expect(titles[1]).assertEqual('Harmony Phone Two');
      expect(titles[0] === titles[1]).assertFalse();
      let limited: string[] = engine.suggest('harmony', 1);
      expect(limited.length).assertEqual(1);
      expect(limited[0]).assertEqual('Harmony Phone One');
      expect(engine.suggest('harmony phone two', 10).length).assertEqual(1);
      expect(engine.suggest('harm', 10).length).assertEqual(2);
      expect(engine.suggest('harmony', 1)[0]).assertEqual('Harmony Phone One');
      expect(engine.suggest('harmony', 5).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0400
     * @tc.name      deep_search_result_mutation_keeps_engine_output_040
     * @tc.desc      Verify mutating a returned result array keeps the engine output stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_result_mutation_keeps_engine_output_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_result_mutation_keeps_engine_output_040');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('phone');
      let firstIds: number[] = idsOf(first);
      expect(firstIds.length).assertEqual(6);
      let removed: Goods | undefined = first.pop();
      expect(removed !== undefined).assertTrue();
      expect(first.length).assertEqual(5);
      let second: Goods[] = engine.search('phone');
      let secondIds: number[] = idsOf(second);
      expect(second === first).assertFalse();
      expect(secondIds.length).assertEqual(6);
      for (let index: number = 0; index < firstIds.length; index++) {
        expect(secondIds[index]).assertEqual(firstIds[index]);
      }
      expect(firstIds[5]).assertEqual(14);
      expect(secondIds[0]).assertEqual(0);
      expect(secondIds[5]).assertEqual(14);
      expect(second.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0410
     * @tc.name      deep_search_results_can_be_price_sorted_without_loss_041
     * @tc.desc      Verify search results can be price sorted without losing a row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_results_can_be_price_sorted_without_loss_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_results_can_be_price_sorted_without_loss_041');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      expect(results.length).assertEqual(16);
      let sorted: Goods[] = new Catalog(results).sortedByPrice(true);
      // Prices repeat in pairs, so equal-price rows keep catalog order: 4 before 12, 7 before 15, and so on down to 8.
      let expected: number[] = [4, 12, 7, 15, 6, 14, 5, 13, 3, 11, 2, 10, 1, 9, 0, 8];
      let observed: number[] = idsOf(sorted);
      expect(observed.length).assertEqual(16);
      for (let index: number = 0; index < expected.length; index++) {
        expect(observed[index]).assertEqual(expected[index]);
      }
      expect(sorted[0].price.cents()).assertEqual(8900);
      expect(sorted[15].price.cents()).assertEqual(499900);
      expect(observed[0]).assertEqual(4);
      expect(observed[7]).assertEqual(13);
      expect(observed[15]).assertEqual(8);
      expect(sorted[1].price.cents()).assertEqual(8900);
      expect(sorted[14].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0420
     * @tc.name      deep_search_ranking_can_be_paged_without_reordering_042
     * @tc.desc      Verify the search ranking can be paged without reordering rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_search_ranking_can_be_paged_without_reordering_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_search_ranking_can_be_paged_without_reordering_042');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      let paged: Catalog = new Catalog(results);
      // The six phone rows split into three pages of two, so page index 3 starts past the end and is empty.
      let first: Goods[] = paged.page(0, 2);
      let second: Goods[] = paged.page(1, 2);
      let third: Goods[] = paged.page(2, 2);
      let empty: Goods[] = paged.page(3, 2);
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(2);
      expect(third.length).assertEqual(2);
      expect(empty.length).assertEqual(0);
      expect(idsOf(first)[0]).assertEqual(0);
      expect(idsOf(first)[1]).assertEqual(1);
      expect(paged.pageCount(3)).assertEqual(2);
      expect(idsOf(third)[0]).assertEqual(6);
      expect(empty === first).assertFalse();
      expect(engine.search('phone').length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0430
     * @tc.name      deep_mix_tea_result_price_drives_order_lifecycle_043
     * @tc.desc      Verify a tea search result price drives an order through its lifecycle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_tea_result_price_drives_order_lifecycle_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_tea_result_price_drives_order_lifecycle_043');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea');
      expect(results.length).assertEqual(2);
      let price: number = results[0].price.cents();
      expect(price).assertEqual(8900);
      let lines: CartLine[] = [lineOf(results[0].id, price, 3)];
      let order: Order = new Order(950, lines, OrderState.OBLIGATION, 1700000900);
      expect(order.total().cents()).assertEqual(26700);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.lines.length).assertEqual(1);
      expect(order.lines[0].goodsId).assertEqual(4);
      // At wait_receive a refund is allowed, so the order closes in refund state.
      expect(order.refund()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0440
     * @tc.name      deep_mix_watch_suggestion_order_spending_matches_price_044
     * @tc.desc      Verify a watch suggestion builds an order whose spending matches its price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_watch_suggestion_order_spending_matches_price_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_watch_suggestion_order_spending_matches_price_044');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let titles: string[] = engine.suggest('watch');
      expect(titles.length).assertEqual(1);
      expect(titles[0]).assertEqual('Smart Watch Pro');
      let results: Goods[] = engine.search(titles[0]);
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(2);
      expect(results[0].price.cents()).assertEqual(129900);
      let order: Order = new Order(960, [lineOf(results[0].id, 129900, 2)],
        OrderState.WAIT_DELIVERY, 1700001000);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.size()).assertEqual(1);
      expect(center.byState(OrderState.WAIT_DELIVERY).length).assertEqual(1);
      expect(order.total().cents()).assertEqual(259800);
      expect(order.lines[0].goodsId).assertEqual(2);
      expect(center.sortedByCreatedAt(true)[0].id).assertEqual(960);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0450
     * @tc.name      deep_mix_earbud_pair_orders_accumulate_then_refund_045
     * @tc.desc      Verify earbud pair orders accumulate spending and a refund removes one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_earbud_pair_orders_accumulate_then_refund_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_earbud_pair_orders_accumulate_then_refund_045');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('earbud');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(6);
      expect(results[1].id).assertEqual(14);
      expect(results[0].price.cents()).assertEqual(19900);
      let first: Order = makeSingleLineOrder(970, 19900, 1, OrderState.WAIT_RECEIVE);
      let second: Order = makeSingleLineOrder(971, 19900, 1, OrderState.WAIT_RECEIVE);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.spent().cents()).assertEqual(39800);
      expect(first.refund()).assertTrue();
      expect(second.id).assertEqual(971);
      expect(center.counts().total).assertEqual(2);
      expect(second.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(center.byState(OrderState.REFUND).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0460
     * @tc.name      deep_mix_absent_keyword_leaves_center_snapshot_empty_046
     * @tc.desc      Verify an absent keyword leaves the derived centre snapshot empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_absent_keyword_leaves_center_snapshot_empty_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_absent_keyword_leaves_center_snapshot_empty_046');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tablet');
      expect(results.length).assertEqual(0);
      let orders: Order[] = [];
      for (let index: number = 0; index < results.length; index++) {
        orders.push(makeSingleLineOrder(980 + index, results[index].price.cents(), 1));
      }
      let center: OrderCenter = new OrderCenter(orders);
      let latest: Order | undefined = center.latest();
      expect(center.size()).assertEqual(0);
      expect(center.counts().total).assertEqual(0);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.sortedByCreatedAt(true).length).assertEqual(0);
      expect(latest === undefined).assertTrue();
      expect(center.size() === 1).assertFalse();
      expect(engine.search('tablet').length).assertEqual(0);
      expect(engine.suggest('tablet').length).assertEqual(0);
      expect(orders.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0470
     * @tc.name      deep_mix_flagship_pair_orders_double_center_spending_047
     * @tc.desc      Verify flagship pair orders double the centre spending at two units each.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_flagship_pair_orders_double_center_spending_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_flagship_pair_orders_double_center_spending_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone flagship');
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(0);
      expect(results[1].id).assertEqual(8);
      let first: Order = makeSingleLineOrder(990, 499900, 2, OrderState.OBLIGATION, 100);
      let second: Order = makeSingleLineOrder(991, 499900, 2, OrderState.WAIT_DELIVERY, 200);
      expect(first.total().cents()).assertEqual(999800);
      expect(second.total().cents()).assertEqual(999800);
      let center: OrderCenter = new OrderCenter([first, second]);
      // Each order costs 499900 x 2 = 999800, and the centre doubles that to 1999600.
      expect(center.spent().cents()).assertEqual(1999600);
      let latest: Order | undefined = center.latest();
      if (latest !== undefined) {
      }
      expect(center.latest() === second).assertTrue();
      expect(latest !== second).assertFalse();
      expect(center.counts().total).assertEqual(2);
      expect(center.spent().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0480
     * @tc.name      deep_mix_cheapest_search_row_builds_cheapest_order_048
     * @tc.desc      Verify the cheapest search row builds the cheapest possible order line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_cheapest_search_row_builds_cheapest_order_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_cheapest_search_row_builds_cheapest_order_048');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      let sorted: Goods[] = new Catalog(results).sortedByPrice(true);
      expect(sorted.length).assertEqual(16);
      expect(sorted[0].id).assertEqual(4);
      expect(sorted[0].price.cents()).assertEqual(8900);
      let cheapest: Goods | undefined = defaultCatalog().cheapest();
      expect(cheapest !== undefined).assertTrue();
      if (cheapest !== undefined) {
        expect(cheapest.id).assertEqual(sorted[0].id);
        expect(cheapest.price.cents()).assertEqual(sorted[0].price.cents());
      }
      let order: Order = new Order(1000, [lineOf(sorted[0].id, sorted[0].price.cents(), 1)],
        OrderState.OBLIGATION, 1700001100);
      expect(sorted[0].category).assertEqual('food');
      expect(order.lines.length).assertEqual(1);
      expect(engine.search('e').length).assertEqual(16);
      expect(sorted[15].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0490
     * @tc.name      deep_mix_phone_triple_cancel_updates_counts_and_spending_049
     * @tc.desc      Verify cancelling the middle phone order updates counters and spending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_phone_triple_cancel_updates_counts_and_spending_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_phone_triple_cancel_updates_counts_and_spending_049');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      expect(results.length).assertEqual(6);
      expect(results[0].id).assertEqual(0);
      expect(results[1].id).assertEqual(1);
      expect(results[4].id).assertEqual(6);
      let lines: Order[] = [
        makeSingleLineOrder(1010, 499900, 1, OrderState.OBLIGATION, 1),
        makeSingleLineOrder(1011, 399900, 1, OrderState.OBLIGATION, 2),
        makeSingleLineOrder(1012, 19900, 1, OrderState.OBLIGATION, 3)
      ];
      let center: OrderCenter = new OrderCenter(lines);
      // 499900 + 399900 + 19900 = 919700 before the 399900 order is cancelled in the middle.
      expect(center.spent().cents()).assertEqual(919700);
      expect(lines[1].cancel()).assertTrue();
      expect(center.counts().waitDelivery).assertEqual(0);
      expect(center.counts().completed).assertEqual(0);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(1);
      expect(center.spent().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0500
     * @tc.name      deep_mix_tea_pair_same_time_latest_uses_first_order_050
     * @tc.desc      Verify tea pair orders with equal times keep the first order as latest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_tea_pair_same_time_latest_uses_first_order_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_tea_pair_same_time_latest_uses_first_order_050');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea');
      expect(results.length).assertEqual(2);
      let first: Order = makeSingleLineOrder(1020, 8900, 2, OrderState.WAIT_DELIVERY, 50);
      let second: Order = makeSingleLineOrder(1021, 8900, 2, OrderState.WAIT_DELIVERY, 50);
      let center: OrderCenter = new OrderCenter([first, second]);
      // Both orders carry created time 50, and latest() uses strict >, so the first inserted 1020 wins the tie.
      let latest: Order | undefined = center.latest();
      expect(latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(1020);
        expect(latest.createdAt).assertEqual(50);
      }
      expect(center.spent().cents()).assertEqual(35600);
      expect(center.sortedByCreatedAt(true)[0].id).assertEqual(1020);
      expect(center.size()).assertEqual(2);
      expect(center.counts().waitDelivery).assertEqual(2);
      expect(center.sortedByCreatedAt(false)[0].id).assertEqual(1020);
      expect(center.sortedByCreatedAt(true)[1].id).assertEqual(1021);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0510
     * @tc.name      deep_mix_sport_search_rows_page_keep_sport_category_051
     * @tc.desc      Verify paged sport search rows keep the sport category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_sport_search_rows_page_keep_sport_category_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_sport_search_rows_page_keep_sport_category_051');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sport');
      expect(results.length).assertEqual(4);
      expect(idsOf(results)[0]).assertEqual(3);
      expect(idsOf(results)[1]).assertEqual(11);
      expect(idsOf(results)[2]).assertEqual(2);
      expect(idsOf(results)[3]).assertEqual(10);
      let catalog: Catalog = new Catalog(results);
      let first: Goods[] = catalog.page(0, 2);
      let second: Goods[] = catalog.page(1, 2);
      expect(first.length).assertEqual(2);
      for (let index: number = 0; index < first.length; index++) {
      }
      expect(results[1].category).assertEqual('sport');
      expect(idsOf(results)[1]).assertEqual(11);
      expect(idsOf(first)[1]).assertEqual(11);
      expect(idsOf(second)[0]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ORDER_SEARCH_0520
     * @tc.name      deep_mix_harmony_suggestions_differ_in_catalog_price_052
     * @tc.desc      Verify the two harmony suggestion titles resolve to different prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_mix_harmony_suggestions_differ_in_catalog_price_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_mix_harmony_suggestions_differ_in_catalog_price_052');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let titles: string[] = engine.suggest('harmony');
      expect(titles.length).assertEqual(2);
      expect(titles[0]).assertEqual('Harmony Phone One');
      expect(titles[1]).assertEqual('Harmony Phone Two');
      let prices: number[] = [];
      for (let index: number = 0; index < titles.length; index++) {
        let results: Goods[] = engine.search(titles[index]);
        expect(results.length === 0).assertFalse();
        expect(results[0].title).assertEqual(titles[index]);
        prices.push(results[0].price.cents());
      }
      expect(prices[0]).assertEqual(499900);
      expect(engine.suggest('harmony', 2)[1]).assertEqual('Harmony Phone Two');
      expect(prices[1]).assertEqual(PRODUCTS[9].price.cents());
      expect(titles[0] === titles[1]).assertFalse();
      expect(engine.search('harmony').length).assertEqual(4);
    });
  });
}
