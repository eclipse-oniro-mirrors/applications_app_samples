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
import { CartLine, Order, OrderCenter, OrderCounts, OrderState } from '../Shared/ShopModel';
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

/** One selected line; goodsId is id % 8. */
function makeOrder(id: number, state: OrderState, cents: number, quantity: number,
  createdAt: number): Order {
  let lines: CartLine[] = [cartLine(id % 8, cents, quantity, true)];
  return new Order(id, lines, state, createdAt);
}

/** Eight orders, OBLIGATION twice (201, 208); prices rise by 10000. */
function mixedOrders(): Order[] {
  let orders: Order[] = [
    makeOrder(201, OrderState.OBLIGATION, 10000, 2, 100),
    makeOrder(202, OrderState.WAIT_DELIVERY, 20000, 1, 200),
    makeOrder(203, OrderState.WAIT_RECEIVE, 30000, 1, 300),
    makeOrder(204, OrderState.WAIT_EVALUATE, 40000, 1, 400),
    makeOrder(205, OrderState.REFUND, 50000, 1, 500),
    makeOrder(206, OrderState.COMPLETED, 60000, 1, 600),
    makeOrder(207, OrderState.CANCELLED, 70000, 1, 700),
    makeOrder(208, OrderState.OBLIGATION, 80000, 1, 800)
  ];
  return orders;
}

/** New order list per call, so mutations cannot leak between cases. */
function mixedCenter(): OrderCenter {
  return new OrderCenter(mixedOrders());
}

export default function orderCenterTest() {
  describe('OrangeShoppingOrderCenter', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'order centre suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0010
     * @tc.name      center_empty_size_is_zero_001
     * @tc.desc      Verify center empty size is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_size_is_zero_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_size_is_zero_001');
      let center: OrderCenter = new OrderCenter([]);
      expect(center.size()).assertEqual(0);
      expect(center.all().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0020
     * @tc.name      center_empty_counts_total_is_zero_002
     * @tc.desc      Verify center empty counts total is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_counts_total_is_zero_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_counts_total_is_zero_002');
      let center: OrderCenter = new OrderCenter([]);
      let counts: OrderCounts = center.counts();
      expect(counts.total).assertEqual(0);
      expect(counts.total).assertEqual(center.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0030
     * @tc.name      center_empty_seven_counters_are_zero_003
     * @tc.desc      Verify center empty seven counters are zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_seven_counters_are_zero_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_seven_counters_are_zero_003');
      let counts: OrderCounts = new OrderCenter([]).counts();
      let values: number[] = [
        counts.obligation,
        counts.waitDelivery,
        counts.waitReceive,
        counts.waitEvaluate,
        counts.refund,
        counts.completed,
        counts.cancelled
      ];
      for (let index: number = 0; index < values.length; index++) {
        expect(values[index]).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0040
     * @tc.name      center_empty_spent_is_zero_004
     * @tc.desc      Verify center empty spent is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_spent_is_zero_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_spent_is_zero_004');
      let center: OrderCenter = new OrderCenter([]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.spent().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0050
     * @tc.name      center_empty_latest_is_undefined_005
     * @tc.desc      Verify center empty latest is undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_latest_is_undefined_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_latest_is_undefined_005');
      let center: OrderCenter = new OrderCenter([]);
      let latest: Order | undefined = center.latest();
      expect(latest === null || latest === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0060
     * @tc.name      center_empty_by_state_lists_are_empty_006
     * @tc.desc      Verify center empty by state lists are empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_empty_by_state_lists_are_empty_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_empty_by_state_lists_are_empty_006');
      let center: OrderCenter = new OrderCenter([]);
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        expect(center.byState(ALL_STATES[index]).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0070
     * @tc.name      center_single_order_has_size_one_007
     * @tc.desc      Verify center single order has size one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_has_size_one_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_has_size_one_007');
      let order: Order = makeOrder(301, OrderState.OBLIGATION, 19900, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.size()).assertEqual(1);
      expect(center.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0080
     * @tc.name      center_single_order_counts_only_its_state_008
     * @tc.desc      Verify center single order counts only its state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_counts_only_its_state_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_counts_only_its_state_008');
      let order: Order = makeOrder(302, OrderState.WAIT_RECEIVE, 19900, 1, 10);
      let counts: OrderCounts = new OrderCenter([order]).counts();
      expect(counts.waitReceive).assertEqual(1);
      expect(counts.obligation).assertEqual(0);
      expect(counts.completed).assertEqual(0);
      expect(counts.cancelled).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0090
     * @tc.name      center_single_order_counts_total_is_one_009
     * @tc.desc      Verify center single order counts total is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_counts_total_is_one_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_counts_total_is_one_009');
      let order: Order = makeOrder(303, OrderState.COMPLETED, 29900, 2, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.counts().total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0100
     * @tc.name      center_single_order_spent_equals_its_total_010
     * @tc.desc      Verify center single order spent equals its total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_spent_equals_its_total_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_spent_equals_its_total_010');
      let order: Order = makeOrder(304, OrderState.WAIT_DELIVERY, 29900, 2, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(order.total().cents());
      // 29900 cents times the line quantity 2 gives the 59800 billable total.
      expect(center.spent().cents()).assertEqual(59800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0110
     * @tc.name      center_single_order_latest_is_that_order_011
     * @tc.desc      Verify center single order latest is that order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_latest_is_that_order_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_latest_is_that_order_011');
      let order: Order = makeOrder(305, OrderState.REFUND, 15900, 3, 777);
      let center: OrderCenter = new OrderCenter([order]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(305);
        expect(latest.createdAt).assertEqual(777);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0120
     * @tc.name      center_single_order_by_state_returns_it_012
     * @tc.desc      Verify center single order by state returns it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_by_state_returns_it_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_by_state_returns_it_012');
      let order: Order = makeOrder(306, OrderState.WAIT_EVALUATE, 8900, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      let list: Order[] = center.byState(OrderState.WAIT_EVALUATE);
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(306);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0130
     * @tc.name      center_single_order_other_states_are_empty_013
     * @tc.desc      Verify center single order other states are empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_single_order_other_states_are_empty_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_single_order_other_states_are_empty_013');
      let order: Order = makeOrder(307, OrderState.CANCELLED, 8900, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        if (ALL_STATES[index] !== OrderState.CANCELLED) {
          expect(center.byState(ALL_STATES[index]).length).assertEqual(0);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0140
     * @tc.name      center_constructor_copies_input_array_014
     * @tc.desc      Verify center constructor copies input array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_constructor_copies_input_array_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_constructor_copies_input_array_014');
      let source: Order[] = [makeOrder(308, OrderState.OBLIGATION, 1000, 1, 10)];
      let center: OrderCenter = new OrderCenter(source);
      // Appending to the caller's array afterwards must not grow the centre's snapshot.
      source.push(makeOrder(309, OrderState.COMPLETED, 2000, 1, 20));
      expect(source.length).assertEqual(2);
      expect(center.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0150
     * @tc.name      center_all_preserves_input_order_015
     * @tc.desc      Verify center all preserves input order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_all_preserves_input_order_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_all_preserves_input_order_015');
      let center: OrderCenter = mixedCenter();
      let ids: number[] = [];
      for (let index: number = 0; index < center.all().length; index++) {
        ids.push(center.all()[index].id);
      }
      expect(ids.length).assertEqual(8);
      expect(ids[0]).assertEqual(201);
      expect(ids[7]).assertEqual(208);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0160
     * @tc.name      center_size_matches_input_length_016
     * @tc.desc      Verify center size matches input length.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_size_matches_input_length_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_size_matches_input_length_016');
      let orders: Order[] = mixedOrders();
      let center: OrderCenter = new OrderCenter(orders);
      expect(center.size()).assertEqual(orders.length);
      expect(center.all().length).assertEqual(orders.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0170
     * @tc.name      center_counts_obligation_has_two_orders_017
     * @tc.desc      Verify center counts obligation has two orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_obligation_has_two_orders_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_obligation_has_two_orders_017');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.obligation).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0180
     * @tc.name      center_counts_wait_delivery_has_one_order_018
     * @tc.desc      Verify center counts wait delivery has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_wait_delivery_has_one_order_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_wait_delivery_has_one_order_018');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.waitDelivery).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0190
     * @tc.name      center_counts_wait_receive_has_one_order_019
     * @tc.desc      Verify center counts wait receive has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_wait_receive_has_one_order_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_wait_receive_has_one_order_019');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.waitReceive).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0200
     * @tc.name      center_counts_wait_evaluate_has_one_order_020
     * @tc.desc      Verify center counts wait evaluate has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_wait_evaluate_has_one_order_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_wait_evaluate_has_one_order_020');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.waitEvaluate).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0210
     * @tc.name      center_counts_refund_has_one_order_021
     * @tc.desc      Verify center counts refund has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_refund_has_one_order_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_refund_has_one_order_021');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0220
     * @tc.name      center_counts_completed_has_one_order_022
     * @tc.desc      Verify center counts completed has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_completed_has_one_order_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_completed_has_one_order_022');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0230
     * @tc.name      center_counts_cancelled_has_one_order_023
     * @tc.desc      Verify center counts cancelled has one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_cancelled_has_one_order_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_cancelled_has_one_order_023');
      let counts: OrderCounts = mixedCenter().counts();
      expect(counts.cancelled).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0240
     * @tc.name      center_counts_total_is_eight_024
     * @tc.desc      Verify center counts total is eight.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_total_is_eight_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_total_is_eight_024');
      let center: OrderCenter = mixedCenter();
      expect(center.counts().total).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0250
     * @tc.name      center_counts_sum_equals_size_025
     * @tc.desc      Verify center counts sum equals size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_sum_equals_size_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_sum_equals_size_025');
      let center: OrderCenter = mixedCenter();
      let counts: OrderCounts = center.counts();
      let sum: number = counts.obligation + counts.waitDelivery + counts.waitReceive +
        counts.waitEvaluate + counts.refund + counts.completed + counts.cancelled;
      // Each mixed order lands in exactly one bucket, so the seven counters partition all eight.
      expect(sum).assertEqual(center.size());
      expect(sum).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0260
     * @tc.name      center_counts_total_equals_size_026
     * @tc.desc      Verify center counts total equals size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_total_equals_size_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_total_equals_size_026');
      let center: OrderCenter = mixedCenter();
      expect(center.counts().total).assertEqual(center.size());
      expect(center.counts().total).assertEqual(center.all().length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0270
     * @tc.name      center_by_state_obligation_lists_two_orders_027
     * @tc.desc      Verify center by state obligation lists two orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_obligation_lists_two_orders_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_obligation_lists_two_orders_027');
      let center: OrderCenter = mixedCenter();
      let list: Order[] = center.byState(OrderState.OBLIGATION);
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(201);
      expect(list[1].id).assertEqual(208);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0280
     * @tc.name      center_by_state_wait_delivery_lists_one_order_028
     * @tc.desc      Verify center by state wait delivery lists one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_wait_delivery_lists_one_order_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_wait_delivery_lists_one_order_028');
      let center: OrderCenter = mixedCenter();
      let list: Order[] = center.byState(OrderState.WAIT_DELIVERY);
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(202);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0290
     * @tc.name      center_by_state_refund_lists_one_order_029
     * @tc.desc      Verify center by state refund lists one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_refund_lists_one_order_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_refund_lists_one_order_029');
      let center: OrderCenter = mixedCenter();
      let list: Order[] = center.byState(OrderState.REFUND);
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(205);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0300
     * @tc.name      center_by_state_cancelled_lists_one_order_030
     * @tc.desc      Verify center by state cancelled lists one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_cancelled_lists_one_order_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_cancelled_lists_one_order_030');
      let center: OrderCenter = mixedCenter();
      let list: Order[] = center.byState(OrderState.CANCELLED);
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(207);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0310
     * @tc.name      center_by_state_returns_a_fresh_array_031
     * @tc.desc      Verify center by state returns a fresh array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_returns_a_fresh_array_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_returns_a_fresh_array_031');
      let center: OrderCenter = mixedCenter();
      let first: Order[] = center.byState(OrderState.OBLIGATION);
      // Trimming the returned array must not touch the centre's own storage.
      first.splice(0, 1);
      let second: Order[] = center.byState(OrderState.OBLIGATION);
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(2);
      expect(first !== second).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0320
     * @tc.name      center_by_state_preserves_insertion_order_032
     * @tc.desc      Verify center by state preserves insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_preserves_insertion_order_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_preserves_insertion_order_032');
      let center: OrderCenter = new OrderCenter([
        makeOrder(401, OrderState.OBLIGATION, 1000, 1, 10),
        makeOrder(402, OrderState.COMPLETED, 2000, 1, 20),
        makeOrder(403, OrderState.OBLIGATION, 3000, 1, 30)
      ]);
      let list: Order[] = center.byState(OrderState.OBLIGATION);
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(401);
      expect(list[1].id).assertEqual(403);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0330
     * @tc.name      center_by_state_contains_only_matching_state_033
     * @tc.desc      Verify center by state contains only matching state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_contains_only_matching_state_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_contains_only_matching_state_033');
      let center: OrderCenter = mixedCenter();
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let list: Order[] = center.byState(ALL_STATES[index]);
        for (let orderIndex: number = 0; orderIndex < list.length; orderIndex++) {
          expect(list[orderIndex].state).assertEqual(ALL_STATES[index]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0340
     * @tc.name      center_by_state_lengths_match_counts_034
     * @tc.desc      Verify center by state lengths match counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_lengths_match_counts_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_lengths_match_counts_034');
      let center: OrderCenter = mixedCenter();
      // Two orders sit in OBLIGATION (201 and 208); every other state holds a single order.
      let expected: number[] = [2, 1, 1, 1, 1, 1, 1];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        expect(center.byState(ALL_STATES[index]).length).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0350
     * @tc.name      center_by_state_without_matches_is_empty_035
     * @tc.desc      Verify center by state without matches is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_without_matches_is_empty_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_without_matches_is_empty_035');
      let center: OrderCenter = new OrderCenter([
        makeOrder(404, OrderState.OBLIGATION, 1000, 1, 10),
        makeOrder(405, OrderState.COMPLETED, 2000, 1, 20)
      ]);
      expect(center.byState(OrderState.REFUND).length).assertEqual(0);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(0);
      expect(center.byState(OrderState.WAIT_RECEIVE).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0360
     * @tc.name      center_spent_excludes_cancelled_036
     * @tc.desc      Verify center spent excludes cancelled.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_excludes_cancelled_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_excludes_cancelled_036');
      let center: OrderCenter = new OrderCenter([
        makeOrder(406, OrderState.CANCELLED, 80000, 1, 10),
        makeOrder(407, OrderState.OBLIGATION, 20000, 1, 20)
      ]);
      expect(center.spent().cents() === 20000).assertTrue();
      expect(center.counts().cancelled).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0370
     * @tc.name      center_spent_excludes_refunded_037
     * @tc.desc      Verify center spent excludes refunded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_excludes_refunded_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_excludes_refunded_037');
      let center: OrderCenter = new OrderCenter([
        makeOrder(408, OrderState.REFUND, 90000, 1, 10),
        makeOrder(409, OrderState.WAIT_RECEIVE, 10000, 1, 20)
      ]);
      expect(center.spent().cents() === 10000).assertTrue();
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0380
     * @tc.name      center_spent_includes_each_active_state_038
     * @tc.desc      Verify center spent includes each active state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_includes_each_active_state_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_includes_each_active_state_038');
      let activeStates: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.COMPLETED
      ];
      for (let index: number = 0; index < activeStates.length; index++) {
        let order: Order = makeOrder(410 + index, activeStates[index], 10000, 1, 10 + index);
        let center: OrderCenter = new OrderCenter([order]);
        expect(center.spent().cents()).assertEqual(10000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0390
     * @tc.name      center_spent_equals_manual_active_sum_039
     * @tc.desc      Verify center spent equals manual active sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_equals_manual_active_sum_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_equals_manual_active_sum_039');
      let orders: Order[] = mixedOrders();
      let center: OrderCenter = new OrderCenter(orders);
      let expected: number = 0;
      for (let index: number = 0; index < orders.length; index++) {
        let state: OrderState = orders[index].state;
        if (state !== OrderState.CANCELLED && state !== OrderState.REFUND) {
          expected += orders[index].total().cents();
        }
      }
      expect(center.spent().cents()).assertEqual(expected);
      // 20000 + 20000 + 30000 + 40000 + 60000 + 80000, dropping the 50000 refund and 70000 cancel.
      expect(center.spent().cents()).assertEqual(250000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0400
     * @tc.name      center_spent_is_zero_when_nothing_is_billable_040
     * @tc.desc      Verify center spent is zero when nothing is billable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_is_zero_when_nothing_is_billable_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_is_zero_when_nothing_is_billable_040');
      let center: OrderCenter = new OrderCenter([
        makeOrder(415, OrderState.CANCELLED, 30000, 1, 10),
        makeOrder(416, OrderState.REFUND, 70000, 2, 20)
      ]);
      // Both orders sit in CANCELLED or REFUND, the two states spent() skips, yet size stays 2.
      expect(center.spent().cents()).assertEqual(0);
      expect(center.spent().isZero()).assertTrue();
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0410
     * @tc.name      center_spent_is_stable_across_calls_041
     * @tc.desc      Verify center spent is stable across calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_is_stable_across_calls_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_is_stable_across_calls_041');
      let center: OrderCenter = mixedCenter();
      let first: number = center.spent().cents();
      let second: number = center.spent().cents();
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0420
     * @tc.name      center_spent_ignores_zero_total_order_042
     * @tc.desc      Verify center spent ignores zero total order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_ignores_zero_total_order_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_ignores_zero_total_order_042');
      let center: OrderCenter = new OrderCenter([
        makeOrder(417, OrderState.OBLIGATION, 0, 4, 10),
        makeOrder(418, OrderState.OBLIGATION, 25000, 1, 20)
      ]);
      expect(center.spent().cents() === 25000).assertTrue();
      expect(center.counts().obligation).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0430
     * @tc.name      center_spent_accumulates_large_amounts_043
     * @tc.desc      Verify center spent accumulates large amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_accumulates_large_amounts_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_accumulates_large_amounts_043');
      let center: OrderCenter = new OrderCenter([
        makeOrder(419, OrderState.COMPLETED, 100000000, 10, 10),
        makeOrder(420, OrderState.WAIT_DELIVERY, 50000000, 20, 20)
      ]);
      // (100000000 x 10) + (50000000 x 20) = 2000000000, well inside integer precision.
      expect(center.spent().cents()).assertEqual(2000000000);
      expect(center.counts().total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0440
     * @tc.name      center_latest_selects_the_greatest_created_at_044
     * @tc.desc      Verify center latest selects the greatest created at.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_selects_the_greatest_created_at_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_selects_the_greatest_created_at_044');
      let ids: number[][] = [[421, 422, 423], [427, 428, 429], [481, 482, 483], [488, 489, 490]];
      let times: number[][] = [[500, 900, 300], [500, 500, 100], [900, 500, 100], [0, 1, 0]];
      let latestIds: number[] = [422, 427, 481, 489];
      let latestTimes: number[] = [900, 500, 900, 1];

      expect(ids.length).assertEqual(latestTimes.length);
      for (let row: number = 0; row < ids.length; row++) {
        let orders: Order[] = [];
        for (let column: number = 0; column < ids[row].length; column++) {
          orders.push(makeOrder(ids[row][column], OrderState.OBLIGATION, 1000, 1, times[row][column]));
        }
        // Row two repeats created time 500, where the strict greater-than keeps 427.
        let latest: Order | undefined = new OrderCenter(orders).latest();
        expect(latest !== null && latest !== undefined).assertTrue();
        if (latest !== undefined) {
          expect(latest.id).assertEqual(latestIds[row]);
          expect(latest.createdAt).assertEqual(latestTimes[row]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0450
     * @tc.name      center_latest_is_not_the_last_inserted_045
     * @tc.desc      Verify center latest is not the last inserted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_is_not_the_last_inserted_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_is_not_the_last_inserted_045');
      let center: OrderCenter = new OrderCenter([
        makeOrder(424, OrderState.OBLIGATION, 1000, 1, 800),
        makeOrder(425, OrderState.COMPLETED, 2000, 1, 100),
        makeOrder(426, OrderState.CANCELLED, 3000, 1, 400)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        // Created time 800 belongs to the first inserted order, not array slot two (426).
        expect(latest.id).assertEqual(424);
      }
      expect(center.all()[2].id).assertEqual(426);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0460
     * @tc.name      center_latest_all_ties_returns_first_inserted_046
     * @tc.desc      Verify center latest all ties returns first inserted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_all_ties_returns_first_inserted_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_all_ties_returns_first_inserted_046');
      let center: OrderCenter = new OrderCenter([
        makeOrder(430, OrderState.OBLIGATION, 1000, 1, 700),
        makeOrder(431, OrderState.OBLIGATION, 2000, 1, 700),
        makeOrder(432, OrderState.OBLIGATION, 3000, 1, 700)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(430);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0470
     * @tc.name      center_latest_handles_negative_timestamps_047
     * @tc.desc      Verify center latest handles negative timestamps.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_handles_negative_timestamps_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_handles_negative_timestamps_047');
      let center: OrderCenter = new OrderCenter([
        makeOrder(433, OrderState.OBLIGATION, 1000, 1, -500),
        makeOrder(434, OrderState.OBLIGATION, 2000, 1, -100),
        makeOrder(435, OrderState.OBLIGATION, 3000, 1, -900)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        // Among -500, -100 and -900 the largest is -100, so negative times order normally.
        expect(latest.id).assertEqual(434);
        expect(latest.createdAt).assertEqual(-100);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0480
     * @tc.name      center_latest_handles_zero_timestamps_048
     * @tc.desc      Verify center latest handles zero timestamps.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_handles_zero_timestamps_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_handles_zero_timestamps_048');
      let center: OrderCenter = new OrderCenter([
        makeOrder(436, OrderState.OBLIGATION, 1000, 1, 0),
        makeOrder(437, OrderState.OBLIGATION, 2000, 1, 0)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(436);
        expect(latest.createdAt).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0490
     * @tc.name      center_latest_compares_created_at_not_id_049
     * @tc.desc      Verify center latest compares created at not id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_compares_created_at_not_id_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_compares_created_at_not_id_049');
      let center: OrderCenter = new OrderCenter([
        makeOrder(999, OrderState.OBLIGATION, 1000, 1, 100),
        makeOrder(1, OrderState.COMPLETED, 2000, 1, 900)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0500
     * @tc.name      center_latest_can_be_a_cancelled_order_050
     * @tc.desc      Verify center latest can be a cancelled order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_can_be_a_cancelled_order_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_can_be_a_cancelled_order_050');
      let center: OrderCenter = new OrderCenter([
        makeOrder(438, OrderState.OBLIGATION, 1000, 1, 100),
        makeOrder(439, OrderState.CANCELLED, 2000, 1, 900)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(439);
        expect(latest.state).assertEqual(OrderState.CANCELLED);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0510
     * @tc.name      center_counts_follow_order_advance_051
     * @tc.desc      Verify center counts follow order advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_follow_order_advance_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_follow_order_advance_051');
      let first: Order = makeOrder(440, OrderState.OBLIGATION, 1000, 1, 10);
      let second: Order = makeOrder(441, OrderState.OBLIGATION, 2000, 1, 20);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.counts().obligation).assertEqual(2);
      // advance() mutates the instance the centre still holds, moving it out of the obligation bucket.
      first.advance();
      let after: OrderCounts = center.counts();
      expect(after.obligation).assertEqual(1);
      expect(after.waitDelivery).assertEqual(1);
      expect(after.total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0520
     * @tc.name      center_counts_total_stays_after_advance_052
     * @tc.desc      Verify center counts total stays after advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_total_stays_after_advance_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_total_stays_after_advance_052');
      let order: Order = makeOrder(442, OrderState.OBLIGATION, 1000, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      // Two steps walk OBLIGATION to WAIT_DELIVERY to WAIT_RECEIVE without touching total.
      order.advance();
      order.advance();
      expect(center.counts().total).assertEqual(1);
      expect(center.size()).assertEqual(1);
      expect(center.counts().waitReceive).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0530
     * @tc.name      center_counts_follow_cancel_053
     * @tc.desc      Verify center counts follow cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_follow_cancel_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_follow_cancel_053');
      let first: Order = makeOrder(443, OrderState.OBLIGATION, 1000, 1, 10);
      let second: Order = makeOrder(444, OrderState.OBLIGATION, 2000, 1, 20);
      let center: OrderCenter = new OrderCenter([first, second]);
      first.cancel();
      let after: OrderCounts = center.counts();
      expect(after.cancelled).assertEqual(1);
      expect(after.obligation).assertEqual(1);
      expect(after.total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0540
     * @tc.name      center_spent_drops_after_cancel_054
     * @tc.desc      Verify center spent drops after cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_drops_after_cancel_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_drops_after_cancel_054');
      let first: Order = makeOrder(445, OrderState.OBLIGATION, 10000, 1, 10);
      let second: Order = makeOrder(446, OrderState.OBLIGATION, 20000, 1, 20);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.spent().cents()).assertEqual(30000);
      // 10000 + 20000 starts billable; cancelling the first order removes its 10000 share.
      first.cancel();
      expect(center.spent().cents()).assertEqual(20000);
      expect(center.spent().cents()).assertEqual(second.total().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0550
     * @tc.name      center_counts_follow_refund_055
     * @tc.desc      Verify center counts follow refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_follow_refund_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_follow_refund_055');
      let order: Order = makeOrder(447, OrderState.WAIT_EVALUATE, 10000, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.counts().waitEvaluate).assertEqual(1);
      expect(order.refund()).assertTrue();
      let after: OrderCounts = center.counts();
      expect(after.refund).assertEqual(1);
      expect(after.waitEvaluate).assertEqual(0);
      expect(after.total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0560
     * @tc.name      center_spent_drops_after_refund_056
     * @tc.desc      Verify center spent drops after refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_drops_after_refund_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_drops_after_refund_056');
      let order: Order = makeOrder(448, OrderState.WAIT_RECEIVE, 45000, 2, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(90000);
      expect(order.refund()).assertTrue();
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0570
     * @tc.name      center_all_orders_keep_their_states_057
     * @tc.desc      Verify center all orders keep their states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_all_orders_keep_their_states_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_all_orders_keep_their_states_057');
      let center: OrderCenter = mixedCenter();
      let expected: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.REFUND,
        OrderState.COMPLETED,
        OrderState.CANCELLED,
        OrderState.OBLIGATION
      ];
      for (let index: number = 0; index < expected.length; index++) {
        expect(center.all()[index].state).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0580
     * @tc.name      center_duplicate_instance_is_counted_twice_058
     * @tc.desc      Verify center duplicate instance is counted twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_duplicate_instance_is_counted_twice_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_duplicate_instance_is_counted_twice_058');
      let order: Order = makeOrder(449, OrderState.COMPLETED, 10000, 1, 10);
      // The identical instance occupies two slots, so counts and the 10000-cent charge both double.
      let center: OrderCenter = new OrderCenter([order, order]);
      expect(center.size()).assertEqual(2);
      expect(center.counts().total).assertEqual(2);
      expect(center.counts().completed).assertEqual(2);
      expect(center.spent().cents()).assertEqual(20000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0590
     * @tc.name      center_one_order_per_state_counts_one_each_059
     * @tc.desc      Verify center one order per state counts one each.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_one_order_per_state_counts_one_each_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_one_order_per_state_counts_one_each_059');
      let orders: Order[] = [];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        orders.push(makeOrder(450 + index, ALL_STATES[index], 1000, 1, 10 + index));
      }
      let center: OrderCenter = new OrderCenter(orders);
      let counts: OrderCounts = center.counts();
      expect(counts.obligation).assertEqual(1);
      expect(counts.waitDelivery).assertEqual(1);
      expect(counts.waitReceive).assertEqual(1);
      expect(counts.waitEvaluate).assertEqual(1);
      expect(counts.refund).assertEqual(1);
      expect(counts.completed).assertEqual(1);
      expect(counts.cancelled).assertEqual(1);
      expect(counts.total).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0600
     * @tc.name      center_size_counts_duplicate_order_ids_060
     * @tc.desc      Verify center size counts duplicate order ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_size_counts_duplicate_order_ids_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_size_counts_duplicate_order_ids_060');
      let first: Order = makeOrder(42, OrderState.OBLIGATION, 1000, 1, 10);
      let second: Order = makeOrder(42, OrderState.COMPLETED, 2000, 1, 20);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.size()).assertEqual(2);
      expect(center.counts().total).assertEqual(2);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.counts().completed).assertEqual(1);
      expect(first !== second).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0610
     * @tc.name      center_spent_single_cancelled_order_is_zero_061
     * @tc.desc      Verify center spent single cancelled order is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_single_cancelled_order_is_zero_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_single_cancelled_order_is_zero_061');
      let center: OrderCenter = new OrderCenter([
        makeOrder(460, OrderState.CANCELLED, 499900, 2, 10)
      ]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0620
     * @tc.name      center_spent_single_refunded_order_is_zero_062
     * @tc.desc      Verify center spent single refunded order is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_single_refunded_order_is_zero_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_single_refunded_order_is_zero_062');
      let center: OrderCenter = new OrderCenter([
        makeOrder(461, OrderState.REFUND, 129900, 3, 10)
      ]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(center.spent().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0630
     * @tc.name      center_latest_handles_max_safe_timestamp_063
     * @tc.desc      Verify center latest handles max safe timestamp.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_handles_max_safe_timestamp_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_handles_max_safe_timestamp_063');
      let center: OrderCenter = new OrderCenter([
        makeOrder(462, OrderState.OBLIGATION, 1000, 1, 100),
        makeOrder(463, OrderState.OBLIGATION, 2000, 1, Number.MAX_SAFE_INTEGER),
        makeOrder(464, OrderState.OBLIGATION, 3000, 1, 200)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(463);
        expect(latest.createdAt).assertEqual(Number.MAX_SAFE_INTEGER);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0640
     * @tc.name      center_latest_handles_min_safe_timestamp_064
     * @tc.desc      Verify center latest handles min safe timestamp.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_handles_min_safe_timestamp_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_handles_min_safe_timestamp_064');
      let center: OrderCenter = new OrderCenter([
        makeOrder(465, OrderState.OBLIGATION, 1000, 1, Number.MIN_SAFE_INTEGER),
        makeOrder(466, OrderState.OBLIGATION, 2000, 1, -100),
        makeOrder(467, OrderState.OBLIGATION, 3000, 1, Number.MIN_SAFE_INTEGER + 1)
      ]);
      // -100 outranks both MIN_SAFE_INTEGER and MIN_SAFE_INTEGER + 1, so extreme negatives compare correctly.
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(466);
        expect(latest.createdAt).assertEqual(-100);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0650
     * @tc.name      center_by_state_follows_advance_065
     * @tc.desc      Verify center by state follows advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_follows_advance_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_follows_advance_065');
      let order: Order = makeOrder(468, OrderState.OBLIGATION, 1000, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.byState(OrderState.OBLIGATION).length).assertEqual(1);
      order.advance();
      expect(center.byState(OrderState.OBLIGATION).length).assertEqual(0);
      let moved: Order[] = center.byState(OrderState.WAIT_DELIVERY);
      expect(moved.length).assertEqual(1);
      expect(moved[0].id).assertEqual(468);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0660
     * @tc.name      center_by_state_follows_cancel_066
     * @tc.desc      Verify center by state follows cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_follows_cancel_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_follows_cancel_066');
      let order: Order = makeOrder(469, OrderState.WAIT_DELIVERY, 1000, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      order.cancel();
      expect(center.byState(OrderState.WAIT_DELIVERY).length).assertEqual(0);
      let cancelled: Order[] = center.byState(OrderState.CANCELLED);
      expect(cancelled.length).assertEqual(1);
      expect(cancelled[0].id).assertEqual(469);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0670
     * @tc.name      center_by_state_follows_refund_067
     * @tc.desc      Verify center by state follows refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_follows_refund_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_follows_refund_067');
      let order: Order = makeOrder(470, OrderState.WAIT_RECEIVE, 1000, 1, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.byState(OrderState.WAIT_RECEIVE).length).assertEqual(1);
      order.refund();
      expect(center.byState(OrderState.WAIT_RECEIVE).length).assertEqual(0);
      expect(center.byState(OrderState.REFUND).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0680
     * @tc.name      center_all_returns_the_same_order_instances_068
     * @tc.desc      Verify center all returns the same order instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_all_returns_the_same_order_instances_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_all_returns_the_same_order_instances_068');
      let first: Order = makeOrder(471, OrderState.OBLIGATION, 1000, 1, 10);
      let second: Order = makeOrder(472, OrderState.COMPLETED, 2000, 1, 20);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.all()[0] === first).assertTrue();
      expect(center.all()[1] === second).assertTrue();
      expect(center.all().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0690
     * @tc.name      center_counts_repeated_calls_are_stable_069
     * @tc.desc      Verify center counts repeated calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_repeated_calls_are_stable_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_repeated_calls_are_stable_069');
      let center: OrderCenter = mixedCenter();
      let first: OrderCounts = center.counts();
      let second: OrderCounts = center.counts();
      expect(first.total).assertEqual(second.total);
      expect(first.obligation).assertEqual(second.obligation);
      expect(first.cancelled).assertEqual(second.cancelled);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0700
     * @tc.name      center_counts_result_is_independent_each_call_070
     * @tc.desc      Verify center counts result is independent each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_result_is_independent_each_call_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_result_is_independent_each_call_070');
      let center: OrderCenter = mixedCenter();
      let first: OrderCounts = center.counts();
      first.total = 999;
      first.obligation = 999;
      let second: OrderCounts = center.counts();
      expect(second.total).assertEqual(8);
      expect(second.obligation).assertEqual(2);
      expect(center.size()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0710
     * @tc.name      center_spent_after_advance_is_unchanged_071
     * @tc.desc      Verify center spent after advance is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_after_advance_is_unchanged_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_after_advance_is_unchanged_071');
      let order: Order = makeOrder(473, OrderState.OBLIGATION, 25000, 2, 10);
      let center: OrderCenter = new OrderCenter([order]);
      let before: number = center.spent().cents();
      // OBLIGATION to WAIT_RECEIVE stays billable, so the 25000 x 2 charge must not move.
      order.advance();
      order.advance();
      expect(center.spent().cents()).assertEqual(before);
      expect(center.spent().cents()).assertEqual(50000);
      expect(center.counts().waitReceive).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0720
     * @tc.name      center_latest_after_advance_is_unchanged_072
     * @tc.desc      Verify center latest after advance is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_after_advance_is_unchanged_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_after_advance_is_unchanged_072');
      let early: Order = makeOrder(474, OrderState.OBLIGATION, 1000, 1, 100);
      let late: Order = makeOrder(475, OrderState.OBLIGATION, 2000, 1, 900);
      let center: OrderCenter = new OrderCenter([early, late]);
      early.advance();
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(475);
      }
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0730
     * @tc.name      center_refunded_order_is_counted_in_total_073
     * @tc.desc      Verify center refunded order is counted in total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_refunded_order_is_counted_in_total_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_refunded_order_is_counted_in_total_073');
      let center: OrderCenter = new OrderCenter([
        makeOrder(476, OrderState.REFUND, 1000, 1, 10),
        makeOrder(477, OrderState.OBLIGATION, 2000, 1, 20)
      ]);
      let counts: OrderCounts = center.counts();
      expect(counts.refund).assertEqual(1);
      expect(counts.total).assertEqual(2);
      expect(counts.total).assertEqual(center.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0740
     * @tc.name      center_cancelled_order_is_counted_in_total_074
     * @tc.desc      Verify center cancelled order is counted in total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_cancelled_order_is_counted_in_total_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_cancelled_order_is_counted_in_total_074');
      let center: OrderCenter = new OrderCenter([
        makeOrder(478, OrderState.CANCELLED, 1000, 1, 10),
        makeOrder(479, OrderState.WAIT_DELIVERY, 2000, 1, 20)
      ]);
      let counts: OrderCounts = center.counts();
      expect(counts.cancelled).assertEqual(1);
      expect(counts.total).assertEqual(2);
      expect(counts.waitDelivery).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0750
     * @tc.name      center_spent_single_zero_price_order_is_zero_075
     * @tc.desc      Verify center spent single zero price order is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_single_zero_price_order_is_zero_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_single_zero_price_order_is_zero_075');
      let center: OrderCenter = new OrderCenter([
        makeOrder(480, OrderState.COMPLETED, 0, 9, 10)
      ]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().completed).assertEqual(1);
      expect(center.counts().total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0760
     * @tc.name      center_spent_after_refund_and_cancel_together_076
     * @tc.desc      Verify center spent after refund and cancel together.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_after_refund_and_cancel_together_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_after_refund_and_cancel_together_076');
      let refunded: Order = makeOrder(484, OrderState.WAIT_EVALUATE, 10000, 1, 10);
      let cancelled: Order = makeOrder(485, OrderState.OBLIGATION, 20000, 1, 20);
      let active: Order = makeOrder(486, OrderState.COMPLETED, 30000, 1, 30);
      let center: OrderCenter = new OrderCenter([refunded, cancelled, active]);
      // The three billable orders start at 10000 + 20000 + 30000 = 60000.
      expect(center.spent().cents()).assertEqual(60000);
      refunded.refund();
      cancelled.cancel();
      // Refund and cancel each drop their amount, leaving only the 30000 completed order.
      expect(center.spent().cents()).assertEqual(30000);
      expect(center.counts().total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0770
     * @tc.name      center_spent_scales_with_line_quantity_077
     * @tc.desc      Verify center spent scales with line quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_scales_with_line_quantity_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_scales_with_line_quantity_077');
      let center: OrderCenter = new OrderCenter([
        makeOrder(487, OrderState.COMPLETED, 19900, 99, 10)
      ]);
      // 19900 cents per unit across 99 units produces 1970100.
      expect(center.spent().cents()).assertEqual(1970100);
      expect(center.counts().completed).assertEqual(1);
      expect(center.spent().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0780
     * @tc.name      center_spent_call_does_not_change_counts_078
     * @tc.desc      Verify center spent call does not change counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_spent_call_does_not_change_counts_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_spent_call_does_not_change_counts_078');
      let center: OrderCenter = mixedCenter();
      let before: OrderCounts = center.counts();
      center.spent();
      let after: OrderCounts = center.counts();
      expect(after.total).assertEqual(before.total);
      expect(after.obligation).assertEqual(before.obligation);
      expect(after.cancelled).assertEqual(before.cancelled);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0790
     * @tc.name      center_by_state_call_does_not_change_size_079
     * @tc.desc      Verify center by state call does not change size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_call_does_not_change_size_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_call_does_not_change_size_079');
      let center: OrderCenter = mixedCenter();
      center.byState(OrderState.OBLIGATION);
      center.byState(OrderState.CANCELLED);
      center.byState(OrderState.REFUND);
      expect(center.size()).assertEqual(8);
      expect(center.all().length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0800
     * @tc.name      center_counts_after_advance_and_cancel_080
     * @tc.desc      Verify center counts after advance and cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_counts_after_advance_and_cancel_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_counts_after_advance_and_cancel_080');
      let first: Order = makeOrder(491, OrderState.OBLIGATION, 1000, 1, 10);
      let second: Order = makeOrder(492, OrderState.OBLIGATION, 2000, 1, 20);
      let third: Order = makeOrder(493, OrderState.OBLIGATION, 3000, 1, 30);
      let center: OrderCenter = new OrderCenter([first, second, third]);
      first.advance();
      second.cancel();
      let counts: OrderCounts = center.counts();
      expect(counts.obligation).assertEqual(1);
      expect(counts.waitDelivery).assertEqual(1);
      expect(counts.cancelled).assertEqual(1);
      expect(counts.total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0810
     * @tc.name      center_by_state_lists_multiple_refunded_orders_081
     * @tc.desc      Verify center by state lists multiple refunded orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_by_state_lists_multiple_refunded_orders_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_by_state_lists_multiple_refunded_orders_081');
      let center: OrderCenter = new OrderCenter([
        makeOrder(494, OrderState.REFUND, 10000, 1, 10),
        makeOrder(495, OrderState.OBLIGATION, 20000, 1, 20),
        makeOrder(496, OrderState.REFUND, 30000, 2, 30)
      ]);
      let refunds: Order[] = center.byState(OrderState.REFUND);
      expect(refunds.length).assertEqual(2);
      expect(refunds[0].id).assertEqual(494);
      expect(refunds[1].id).assertEqual(496);
      expect(center.spent().cents()).assertEqual(20000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_CENTER_0820
     * @tc.name      center_latest_single_order_with_negative_timestamp_082
     * @tc.desc      Verify center latest single order with negative timestamp.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('center_latest_single_order_with_negative_timestamp_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: center_latest_single_order_with_negative_timestamp_082');
      let center: OrderCenter = new OrderCenter([
        makeOrder(497, OrderState.OBLIGATION, 5000, 1, -12345)
      ]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(497);
        expect(latest.createdAt).assertEqual(-12345);
      }
      expect(center.size()).assertEqual(1);
    });
  });
}
