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
import { CartLine, Order, OrderCenter, OrderState } from '../Shared/ShopModel';
import { cartLine } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Defaults 1000 cents and quantity 1; goodsId is id % 8. */
function makeOrder(id: number, createdAt: number, state: OrderState = OrderState.OBLIGATION,
  cents: number = 1000, quantity: number = 1): Order {
  let lines: CartLine[] = [cartLine(id % 8, cents, quantity, true)];
  return new Order(id, lines, state, createdAt);
}

function idsOf(orders: Order[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < orders.length; index++) {
    ids.push(orders[index].id);
  }
  return ids;
}

function timesOf(orders: Order[]): number[] {
  let times: number[] = [];
  for (let index: number = 0; index < orders.length; index++) {
    times.push(orders[index].createdAt);
  }
  return times;
}

function centerOf(orders: Order[]): OrderCenter {
  return new OrderCenter(orders);
}

export default function orderSortingTest() {
  describe('OrangeShoppingOrderSorting', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'order sorting suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0010
     * @tc.name      sorting_empty_ascending_is_empty_001
     * @tc.desc      Verify sorting empty ascending is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_empty_ascending_is_empty_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_empty_ascending_is_empty_001');
      let center: OrderCenter = centerOf([]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0020
     * @tc.name      sorting_empty_descending_is_empty_002
     * @tc.desc      Verify sorting empty descending is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_empty_descending_is_empty_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_empty_descending_is_empty_002');
      let center: OrderCenter = centerOf([]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0030
     * @tc.name      sorting_single_order_ascending_003
     * @tc.desc      Verify sorting single order ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_single_order_ascending_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_single_order_ascending_003');
      let center: OrderCenter = centerOf([makeOrder(301, 500)]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted.length).assertEqual(1);
      expect(sorted[0].id).assertEqual(301);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0040
     * @tc.name      sorting_single_order_descending_004
     * @tc.desc      Verify sorting single order descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_single_order_descending_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_single_order_descending_004');
      let center: OrderCenter = centerOf([makeOrder(302, 500)]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted.length).assertEqual(1);
      expect(sorted[0].id).assertEqual(302);
      expect(sorted[0].createdAt).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0050
     * @tc.name      sorting_two_orders_ascending_005
     * @tc.desc      Verify sorting two orders ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_two_orders_ascending_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_two_orders_ascending_005');
      let center: OrderCenter = centerOf([makeOrder(311, 200), makeOrder(312, 100)]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([312, 311]).length);
      for (let __i183: number = 0; __i183 < ([312, 311]).length; __i183++) {
        expect((idsOf(sorted))[__i183]).assertEqual(([312, 311])[__i183]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0060
     * @tc.name      sorting_two_orders_descending_006
     * @tc.desc      Verify sorting two orders descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_two_orders_descending_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_two_orders_descending_006');
      let center: OrderCenter = centerOf([makeOrder(321, 100), makeOrder(322, 200)]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect((idsOf(sorted)).length).assertEqual(([322, 321]).length);
      for (let __i184: number = 0; __i184 < ([322, 321]).length; __i184++) {
        expect((idsOf(sorted))[__i184]).assertEqual(([322, 321])[__i184]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0070
     * @tc.name      sorting_ascending_exact_with_distinct_and_tied_times_007
     * @tc.desc      Verify sorting ascending exact with distinct and tied times.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_exact_with_distinct_and_tied_times_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: sorting_ascending_exact_with_distinct_and_tied_times_007');
      // The second row ties every timestamp at 500, so insertion order 521, 522, 523 must
      // survive: this pins stability, not just monotonicity.
      let ids: number[][] = [[331, 332, 333], [521, 522, 523]];
      let times: number[][] = [[300, 100, 200], [500, 500, 500]];
      let expected: number[][] = [[332, 333, 331], [521, 522, 523]];

      expect(expected.length).assertEqual(times.length);
      for (let row: number = 0; row < expected.length; row++) {
        let orders: Order[] = [];
        for (let column: number = 0; column < ids[row].length; column++) {
          orders.push(makeOrder(ids[row][column], times[row][column]));
        }
        let sorted: Order[] = centerOf(orders).sortedByCreatedAt(false);
        expect((idsOf(sorted)).length).assertEqual((expected[row]).length);
        for (let __i185: number = 0; __i185 < (expected[row]).length; __i185++) {
          expect((idsOf(sorted))[__i185]).assertEqual((expected[row])[__i185]);
        }
        for (let index: number = 1; index < sorted.length; index++) {
          expect(sorted[index - 1].createdAt <= sorted[index].createdAt).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0080
     * @tc.name      sorting_descending_exact_with_distinct_and_tied_times_008
     * @tc.desc      Verify sorting descending exact with distinct and tied times.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_exact_with_distinct_and_tied_times_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: sorting_descending_exact_with_distinct_and_tied_times_008');
      let ids: number[][] = [[341, 342, 343], [531, 532, 533]];
      let times: number[][] = [[300, 100, 200], [500, 500, 500]];
      let expected: number[][] = [[341, 343, 342], [531, 532, 533]];

      expect(expected.length).assertEqual(times.length);
      for (let row: number = 0; row < expected.length; row++) {
        let orders: Order[] = [];
        for (let column: number = 0; column < ids[row].length; column++) {
          orders.push(makeOrder(ids[row][column], times[row][column]));
        }
        let sorted: Order[] = centerOf(orders).sortedByCreatedAt(true);
        expect((idsOf(sorted)).length).assertEqual((expected[row]).length);
        for (let __i186: number = 0; __i186 < (expected[row]).length; __i186++) {
          expect((idsOf(sorted))[__i186]).assertEqual((expected[row])[__i186]);
        }
        for (let index: number = 1; index < sorted.length; index++) {
          expect(sorted[index - 1].createdAt >= sorted[index].createdAt).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0090
     * @tc.name      sorting_ascending_is_monotonic_009
     * @tc.desc      Verify sorting ascending is monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_is_monotonic_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_is_monotonic_009');
      let center: OrderCenter = centerOf([
        makeOrder(351, 700),
        makeOrder(352, 100),
        makeOrder(353, 500),
        makeOrder(354, 300)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      let times: number[] = timesOf(sorted);
      for (let index: number = 1; index < times.length; index++) {
        expect(times[index - 1] <= times[index]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0100
     * @tc.name      sorting_descending_is_monotonic_010
     * @tc.desc      Verify sorting descending is monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_is_monotonic_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_is_monotonic_010');
      let center: OrderCenter = centerOf([
        makeOrder(361, 700),
        makeOrder(362, 100),
        makeOrder(363, 500),
        makeOrder(364, 300)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let times: number[] = timesOf(sorted);
      for (let index: number = 1; index < times.length; index++) {
        expect(times[index - 1] >= times[index]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0110
     * @tc.name      sorting_ascending_first_is_minimum_011
     * @tc.desc      Verify sorting ascending first is minimum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_first_is_minimum_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_first_is_minimum_011');
      let center: OrderCenter = centerOf([
        makeOrder(371, 400),
        makeOrder(372, 50),
        makeOrder(373, 900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0].createdAt).assertEqual(50);
      expect(sorted[0].id).assertEqual(372);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0120
     * @tc.name      sorting_ascending_last_is_maximum_012
     * @tc.desc      Verify sorting ascending last is maximum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_last_is_maximum_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_last_is_maximum_012');
      let center: OrderCenter = centerOf([
        makeOrder(381, 400),
        makeOrder(382, 50),
        makeOrder(383, 900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[sorted.length - 1].createdAt).assertEqual(900);
      expect(sorted[sorted.length - 1].id).assertEqual(383);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0130
     * @tc.name      sorting_descending_first_is_maximum_013
     * @tc.desc      Verify sorting descending first is maximum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_first_is_maximum_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_first_is_maximum_013');
      let center: OrderCenter = centerOf([
        makeOrder(391, 400),
        makeOrder(392, 50),
        makeOrder(393, 900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted[0].createdAt).assertEqual(900);
      expect(sorted[0].id).assertEqual(393);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0140
     * @tc.name      sorting_descending_last_is_minimum_014
     * @tc.desc      Verify sorting descending last is minimum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_last_is_minimum_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_last_is_minimum_014');
      let center: OrderCenter = centerOf([
        makeOrder(394, 400),
        makeOrder(395, 50),
        makeOrder(396, 900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted[sorted.length - 1].createdAt).assertEqual(50);
      expect(sorted[sorted.length - 1].id).assertEqual(395);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0150
     * @tc.name      sorting_ascending_preserves_size_015
     * @tc.desc      Verify sorting ascending preserves size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_preserves_size_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_preserves_size_015');
      let center: OrderCenter = centerOf([
        makeOrder(401, 4),
        makeOrder(402, 3),
        makeOrder(403, 2),
        makeOrder(404, 1)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted.length).assertEqual(4);
      expect(sorted.length).assertEqual(center.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0160
     * @tc.name      sorting_descending_preserves_size_016
     * @tc.desc      Verify sorting descending preserves size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_preserves_size_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_preserves_size_016');
      let center: OrderCenter = centerOf([
        makeOrder(411, 4),
        makeOrder(412, 3),
        makeOrder(413, 2),
        makeOrder(414, 1)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted.length).assertEqual(4);
      expect(sorted.length).assertEqual(center.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0170
     * @tc.name      sorting_ascending_keeps_all_ids_017
     * @tc.desc      Verify sorting ascending keeps all ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_keeps_all_ids_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_keeps_all_ids_017');
      let center: OrderCenter = centerOf([
        makeOrder(421, 30),
        makeOrder(422, 10),
        makeOrder(423, 50),
        makeOrder(424, 20)
      ]);
      let ids: number[] = idsOf(center.sortedByCreatedAt(false));
      // Timestamps 30, 10, 50, 20 belong to ids 421..424, so the sorted time order 10, 20, 30, 50
      // must read 422, 424, 421, 423.
      expect((ids).length).assertEqual(([422, 424, 421, 423]).length);
      for (let __i187: number = 0; __i187 < ([422, 424, 421, 423]).length; __i187++) {
        expect((ids)[__i187]).assertEqual(([422, 424, 421, 423])[__i187]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0180
     * @tc.name      sorting_descending_keeps_all_ids_018
     * @tc.desc      Verify sorting descending keeps all ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_keeps_all_ids_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_keeps_all_ids_018');
      let center: OrderCenter = centerOf([
        makeOrder(431, 30),
        makeOrder(432, 10),
        makeOrder(433, 50),
        makeOrder(434, 20)
      ]);
      let ids: number[] = idsOf(center.sortedByCreatedAt(true));
      expect((ids).length).assertEqual(([433, 431, 434, 432]).length);
      for (let __i188: number = 0; __i188 < ([433, 431, 434, 432]).length; __i188++) {
        expect((ids)[__i188]).assertEqual(([433, 431, 434, 432])[__i188]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0190
     * @tc.name      sorting_ascending_keeps_instances_019
     * @tc.desc      Verify sorting ascending keeps instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_keeps_instances_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_keeps_instances_019');
      let early: Order = makeOrder(441, 100);
      let late: Order = makeOrder(442, 900);
      let center: OrderCenter = centerOf([late, early]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0] === early).assertTrue();
      expect(sorted[1] === late).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0200
     * @tc.name      sorting_does_not_change_center_order_020
     * @tc.desc      Verify sorting does not change center order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_does_not_change_center_order_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_does_not_change_center_order_020');
      let center: OrderCenter = centerOf([
        makeOrder(451, 300),
        makeOrder(452, 100),
        makeOrder(453, 200)
      ]);
      // A descending sort must leave all() reporting 451, 452, 453, the construction order.
      let before: number[] = idsOf(center.all());
      center.sortedByCreatedAt(true);
      let after: number[] = idsOf(center.all());
      expect((after).length).assertEqual((before).length);
      for (let __i189: number = 0; __i189 < (before).length; __i189++) {
        expect((after)[__i189]).assertEqual((before)[__i189]);
      }
      expect((after).length).assertEqual(([451, 452, 453]).length);
      for (let __i190: number = 0; __i190 < ([451, 452, 453]).length; __i190++) {
        expect((after)[__i190]).assertEqual(([451, 452, 453])[__i190]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0210
     * @tc.name      sorting_does_not_change_center_size_021
     * @tc.desc      Verify sorting does not change center size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_does_not_change_center_size_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_does_not_change_center_size_021');
      let center: OrderCenter = centerOf([
        makeOrder(461, 300),
        makeOrder(462, 100),
        makeOrder(463, 200)
      ]);
      center.sortedByCreatedAt(false);
      center.sortedByCreatedAt(true);
      expect(center.size()).assertEqual(3);
      expect(center.all().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0220
     * @tc.name      sorting_ascending_returns_new_array_022
     * @tc.desc      Verify sorting ascending returns new array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_returns_new_array_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_returns_new_array_022');
      let center: OrderCenter = centerOf([makeOrder(471, 10), makeOrder(472, 20)]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted !== center.all()).assertTrue();
      expect(sorted.length).assertEqual(center.all().length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0230
     * @tc.name      sorting_descending_returns_new_array_023
     * @tc.desc      Verify sorting descending returns new array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_returns_new_array_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_returns_new_array_023');
      let center: OrderCenter = centerOf([makeOrder(481, 10), makeOrder(482, 20)]);
      let first: Order[] = center.sortedByCreatedAt(true);
      let second: Order[] = center.sortedByCreatedAt(true);
      expect(first !== second).assertTrue();
      expect((idsOf(first)).length).assertEqual((idsOf(second)).length);
      for (let __i191: number = 0; __i191 < (idsOf(second)).length; __i191++) {
        expect((idsOf(first))[__i191]).assertEqual((idsOf(second))[__i191]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0240
     * @tc.name      sorting_result_mutation_does_not_touch_center_024
     * @tc.desc      Verify sorting result mutation does not touch center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_result_mutation_does_not_touch_center_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_result_mutation_does_not_touch_center_024');
      let center: OrderCenter = centerOf([
        makeOrder(491, 100),
        makeOrder(492, 200),
        makeOrder(493, 300)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      // sortedByCreatedAt hands back a copy, so dropping two entries here cannot shrink
      // the centre's three orders.
      sorted.splice(0, 2);
      expect(sorted.length).assertEqual(1);
      expect(center.size()).assertEqual(3);
      expect(center.all().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0250
     * @tc.name      sorting_ascending_twice_is_stable_025
     * @tc.desc      Verify sorting ascending twice is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_twice_is_stable_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_twice_is_stable_025');
      let center: OrderCenter = centerOf([
        makeOrder(501, 300),
        makeOrder(502, 100),
        makeOrder(503, 200)
      ]);
      let first: number[] = idsOf(center.sortedByCreatedAt(false));
      let second: number[] = idsOf(center.sortedByCreatedAt(false));
      expect((second).length).assertEqual((first).length);
      for (let __i192: number = 0; __i192 < (first).length; __i192++) {
        expect((second)[__i192]).assertEqual((first)[__i192]);
      }
      expect((first).length).assertEqual(([502, 503, 501]).length);
      for (let __i193: number = 0; __i193 < ([502, 503, 501]).length; __i193++) {
        expect((first)[__i193]).assertEqual(([502, 503, 501])[__i193]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0260
     * @tc.name      sorting_descending_twice_is_stable_026
     * @tc.desc      Verify sorting descending twice is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_twice_is_stable_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_twice_is_stable_026');
      let center: OrderCenter = centerOf([
        makeOrder(511, 300),
        makeOrder(512, 100),
        makeOrder(513, 200)
      ]);
      let first: number[] = idsOf(center.sortedByCreatedAt(true));
      let second: number[] = idsOf(center.sortedByCreatedAt(true));
      expect((second).length).assertEqual((first).length);
      for (let __i194: number = 0; __i194 < (first).length; __i194++) {
        expect((second)[__i194]).assertEqual((first)[__i194]);
      }
      expect((first).length).assertEqual(([511, 513, 512]).length);
      for (let __i195: number = 0; __i195 < ([511, 513, 512]).length; __i195++) {
        expect((first)[__i195]).assertEqual(([511, 513, 512])[__i195]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0270
     * @tc.name      sorting_ascending_tie_groups_stay_adjacent_027
     * @tc.desc      Verify sorting ascending tie groups stay adjacent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_tie_groups_stay_adjacent_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_tie_groups_stay_adjacent_027');
      // Timestamps alternate 200/100, so stable ascending gives 542, 544 for the 100 group
      // and then 541, 543 for the 200 group.
      let ids: number[][] = [[541, 542, 543, 544], [571, 572, 573, 574]];
      let times: number[][] = [[200, 100, 200, 100], [42, 42, 42, 42]];
      let expected: number[][] = [[542, 544, 541, 543], [571, 572, 573, 574]];
      expect(expected.length).assertEqual(times.length);
      for (let row: number = 0; row < expected.length; row++) {
        let orders: Order[] = [];
        for (let column: number = 0; column < ids[row].length; column++) {
          orders.push(makeOrder(ids[row][column], times[row][column]));
        }
        let sorted: Order[] = centerOf(orders).sortedByCreatedAt(false);
        expect((idsOf(sorted)).length).assertEqual((expected[row]).length);
        for (let __i196: number = 0; __i196 < (expected[row]).length; __i196++) {
          expect((idsOf(sorted))[__i196]).assertEqual((expected[row])[__i196]);
        }
        expect(sorted[0].createdAt).assertEqual(sorted[1].createdAt);
        expect(sorted[2].createdAt).assertEqual(sorted[3].createdAt);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0280
     * @tc.name      sorting_descending_tie_groups_keep_internal_order_028
     * @tc.desc      Verify sorting descending tie groups keep internal order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_tie_groups_keep_internal_order_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_tie_groups_keep_internal_order_028');
      let ids: number[][] = [[551, 552, 553, 554], [581, 582, 583, 584]];
      let times: number[][] = [[200, 100, 200, 100], [42, 42, 42, 42]];
      let expected: number[][] = [[551, 553, 552, 554], [581, 582, 583, 584]];
      expect(expected.length).assertEqual(times.length);
      for (let row: number = 0; row < expected.length; row++) {
        let orders: Order[] = [];
        for (let column: number = 0; column < ids[row].length; column++) {
          orders.push(makeOrder(ids[row][column], times[row][column]));
        }
        let sorted: Order[] = centerOf(orders).sortedByCreatedAt(true);
        expect((idsOf(sorted)).length).assertEqual((expected[row]).length);
        for (let __i197: number = 0; __i197 < (expected[row]).length; __i197++) {
          expect((idsOf(sorted))[__i197]).assertEqual((expected[row])[__i197]);
        }
        expect(sorted[0].createdAt).assertEqual(sorted[1].createdAt);
        expect(sorted[2].createdAt).assertEqual(sorted[3].createdAt);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0290
     * @tc.name      sorting_tie_group_stays_contiguous_029
     * @tc.desc      Verify sorting tie group stays contiguous.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_tie_group_stays_contiguous_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_tie_group_stays_contiguous_029');
      let center: OrderCenter = centerOf([
        makeOrder(561, 5),
        makeOrder(562, 1),
        makeOrder(563, 5),
        makeOrder(564, 3),
        makeOrder(565, 5)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      // The three orders sharing timestamp 5 must sit together at the tail, with no 1 or 3
      // timestamp breaking the group.
      expect((idsOf(sorted)).length).assertEqual(([562, 564, 561, 563, 565]).length);
      for (let __i198: number = 0; __i198 < ([562, 564, 561, 563, 565]).length; __i198++) {
        expect((idsOf(sorted))[__i198]).assertEqual(([562, 564, 561, 563, 565])[__i198]);
      }
      for (let index: number = 2; index < 5; index++) {
        expect(sorted[index].createdAt).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0300
     * @tc.name      sorting_tie_at_both_ends_ascending_030
     * @tc.desc      Verify sorting tie at both ends ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_tie_at_both_ends_ascending_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_tie_at_both_ends_ascending_030');
      let center: OrderCenter = centerOf([
        makeOrder(591, 100),
        makeOrder(592, 50),
        makeOrder(593, 100),
        makeOrder(594, 50)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([592, 594, 591, 593]).length);
      for (let __i199: number = 0; __i199 < ([592, 594, 591, 593]).length; __i199++) {
        expect((idsOf(sorted))[__i199]).assertEqual(([592, 594, 591, 593])[__i199]);
      }
      expect(sorted[0].createdAt).assertEqual(sorted[1].createdAt);
      expect(sorted[2].createdAt).assertEqual(sorted[3].createdAt);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0310
     * @tc.name      latest_equals_descending_first_031
     * @tc.desc      Verify latest equals descending first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('latest_equals_descending_first_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: latest_equals_descending_first_031');
      let center: OrderCenter = centerOf([
        makeOrder(601, 100),
        makeOrder(602, 900),
        makeOrder(603, 500)
      ]);
      let latest: Order | undefined = center.latest();
      let descending: Order[] = center.sortedByCreatedAt(true);
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(descending[0].id);
        expect(latest.createdAt).assertEqual(descending[0].createdAt);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0320
     * @tc.name      latest_equals_ascending_last_032
     * @tc.desc      Verify latest equals ascending last.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('latest_equals_ascending_last_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: latest_equals_ascending_last_032');
      let center: OrderCenter = centerOf([
        makeOrder(611, 100),
        makeOrder(612, 900),
        makeOrder(613, 500)
      ]);
      let latest: Order | undefined = center.latest();
      let ascending: Order[] = center.sortedByCreatedAt(false);
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(ascending[ascending.length - 1].id);
        expect(latest.createdAt).assertEqual(ascending[ascending.length - 1].createdAt);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0330
     * @tc.name      latest_returns_same_instance_as_sorted_033
     * @tc.desc      Verify latest returns same instance as sorted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('latest_returns_same_instance_as_sorted_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: latest_returns_same_instance_as_sorted_033');
      let newest: Order = makeOrder(621, 900);
      let center: OrderCenter = centerOf([
        makeOrder(622, 100),
        newest,
        makeOrder(623, 400)
      ]);
      let latest: Order | undefined = center.latest();
      let descending: Order[] = center.sortedByCreatedAt(true);
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest === descending[0]).assertTrue();
        expect(latest === newest).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0340
     * @tc.name      negative_timestamps_ascending_034
     * @tc.desc      Verify negative timestamps ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_timestamps_ascending_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_timestamps_ascending_034');
      let center: OrderCenter = centerOf([
        makeOrder(631, -500),
        makeOrder(632, -100),
        makeOrder(633, -900)
      ]);
      // Negative stamps must order numerically: -900 < -500 < -100, which a sign-blind
      // or absolute-value comparison would invert.
      let sorted: Order[] = center.sortedByCreatedAt(false);
      let times: number[] = timesOf(sorted);
      expect((times).length).assertEqual(([-900, -500, -100]).length);
      for (let __i200: number = 0; __i200 < ([-900, -500, -100]).length; __i200++) {
        expect((times)[__i200]).assertEqual(([-900, -500, -100])[__i200]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0350
     * @tc.name      negative_timestamps_descending_035
     * @tc.desc      Verify negative timestamps descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_timestamps_descending_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_timestamps_descending_035');
      let center: OrderCenter = centerOf([
        makeOrder(641, -500),
        makeOrder(642, -100),
        makeOrder(643, -900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let times: number[] = timesOf(sorted);
      expect((times).length).assertEqual(([-100, -500, -900]).length);
      for (let __i201: number = 0; __i201 < ([-100, -500, -900]).length; __i201++) {
        expect((times)[__i201]).assertEqual(([-100, -500, -900])[__i201]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0360
     * @tc.name      zero_and_negative_ascending_036
     * @tc.desc      Verify zero and negative ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_and_negative_ascending_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_and_negative_ascending_036');
      let center: OrderCenter = centerOf([
        makeOrder(651, -5),
        makeOrder(652, 0),
        makeOrder(653, -1)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      let times: number[] = timesOf(sorted);
      expect((times).length).assertEqual(([-5, -1, 0]).length);
      for (let __i202: number = 0; __i202 < ([-5, -1, 0]).length; __i202++) {
        expect((times)[__i202]).assertEqual(([-5, -1, 0])[__i202]);
      }
      expect(sorted[sorted.length - 1].id).assertEqual(652);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0370
     * @tc.name      zero_and_positive_descending_037
     * @tc.desc      Verify zero and positive descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_and_positive_descending_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_and_positive_descending_037');
      let center: OrderCenter = centerOf([
        makeOrder(661, 0),
        makeOrder(662, 5),
        makeOrder(663, 1)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let times: number[] = timesOf(sorted);
      expect((times).length).assertEqual(([5, 1, 0]).length);
      for (let __i203: number = 0; __i203 < ([5, 1, 0]).length; __i203++) {
        expect((times)[__i203]).assertEqual(([5, 1, 0])[__i203]);
      }
      expect(sorted[sorted.length - 1].id).assertEqual(661);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0380
     * @tc.name      extreme_high_descending_first_038
     * @tc.desc      Verify extreme high descending first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('extreme_high_descending_first_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extreme_high_descending_first_038');
      let center: OrderCenter = centerOf([
        makeOrder(671, 100),
        // MAX_SAFE_INTEGER is the largest timestamp that stays exact, so descending must
        // put it first without a 2^53 rounding surprise.
        makeOrder(672, Number.MAX_SAFE_INTEGER),
        makeOrder(673, 900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect(sorted[0].createdAt).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(sorted[0].id).assertEqual(672);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0390
     * @tc.name      extreme_low_ascending_first_039
     * @tc.desc      Verify extreme low ascending first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('extreme_low_ascending_first_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extreme_low_ascending_first_039');
      let center: OrderCenter = centerOf([
        makeOrder(681, 100),
        makeOrder(682, Number.MIN_SAFE_INTEGER),
        makeOrder(683, -900)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0].createdAt).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(sorted[0].id).assertEqual(682);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0400
     * @tc.name      extreme_both_ends_ascending_040
     * @tc.desc      Verify extreme both ends ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('extreme_both_ends_ascending_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extreme_both_ends_ascending_040');
      let center: OrderCenter = centerOf([
        makeOrder(691, 0),
        makeOrder(692, Number.MAX_SAFE_INTEGER),
        makeOrder(693, Number.MIN_SAFE_INTEGER)
      ]);
      // Across the whole safe range ascending puts MIN_SAFE_INTEGER first, 0 in the middle
      // and MAX_SAFE_INTEGER last.
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([693, 691, 692]).length);
      for (let __i204: number = 0; __i204 < ([693, 691, 692]).length; __i204++) {
        expect((idsOf(sorted))[__i204]).assertEqual(([693, 691, 692])[__i204]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0410
     * @tc.name      extreme_both_ends_descending_041
     * @tc.desc      Verify extreme both ends descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('extreme_both_ends_descending_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extreme_both_ends_descending_041');
      let center: OrderCenter = centerOf([
        makeOrder(701, 0),
        makeOrder(702, Number.MAX_SAFE_INTEGER),
        makeOrder(703, Number.MIN_SAFE_INTEGER)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect((idsOf(sorted)).length).assertEqual(([702, 701, 703]).length);
      for (let __i205: number = 0; __i205 < ([702, 701, 703]).length; __i205++) {
        expect((idsOf(sorted))[__i205]).assertEqual(([702, 701, 703])[__i205]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0420
     * @tc.name      sorting_preserves_created_at_values_042
     * @tc.desc      Verify sorting preserves created at values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_preserves_created_at_values_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_preserves_created_at_values_042');
      let center: OrderCenter = centerOf([
        makeOrder(711, 30),
        makeOrder(712, 10),
        makeOrder(713, 20)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let times: number[] = timesOf(sorted);
      expect((times).length).assertEqual(([30, 20, 10]).length);
      for (let __i206: number = 0; __i206 < ([30, 20, 10]).length; __i206++) {
        expect((times)[__i206]).assertEqual(([30, 20, 10])[__i206]);
      }
      expect(center.all()[0].createdAt).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0430
     * @tc.name      sorting_preserves_order_states_043
     * @tc.desc      Verify sorting preserves order states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_preserves_order_states_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_preserves_order_states_043');
      let center: OrderCenter = centerOf([
        makeOrder(721, 300, OrderState.CANCELLED),
        makeOrder(722, 100, OrderState.COMPLETED),
        makeOrder(723, 200, OrderState.WAIT_RECEIVE)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      // Sorting moves whole orders, so each state must travel with its timestamp instead of
      // being re-derived from the enum index.
      expect(sorted[0].state).assertEqual(OrderState.COMPLETED);
      expect(sorted[1].state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(sorted[2].state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0440
     * @tc.name      sorting_preserves_order_totals_044
     * @tc.desc      Verify sorting preserves order totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_preserves_order_totals_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_preserves_order_totals_044');
      let center: OrderCenter = centerOf([
        makeOrder(731, 300, OrderState.OBLIGATION, 30000, 2),
        makeOrder(732, 100, OrderState.OBLIGATION, 10000, 1),
        makeOrder(733, 200, OrderState.OBLIGATION, 20000, 3)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0].total().cents()).assertEqual(10000);
      // Line totals are 30000 x 2 = 60000, 10000 x 1 and 20000 x 3 = 60000; after sorting the
      // 10000 order leads and the two 60000 ties keep their timestamp order.
      expect(sorted[1].total().cents()).assertEqual(60000);
      expect(sorted[2].total().cents()).assertEqual(60000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0450
     * @tc.name      sorting_by_created_at_not_by_id_045
     * @tc.desc      Verify sorting by created at not by id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_by_created_at_not_by_id_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_by_created_at_not_by_id_045');
      let center: OrderCenter = centerOf([
        makeOrder(999, 100),
        makeOrder(1, 900),
        makeOrder(500, 500)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect((idsOf(sorted)).length).assertEqual(([1, 500, 999]).length);
      for (let __i207: number = 0; __i207 < ([1, 500, 999]).length; __i207++) {
        expect((idsOf(sorted))[__i207]).assertEqual(([1, 500, 999])[__i207]);
      }
      // Ids 999, 1, 500 are anti-correlated with their timestamps, so an id-based sort
      // would hand back the reverse sequence.
      expect(sorted[0].id > sorted[1].id).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0460
     * @tc.name      ascending_and_descending_are_reverses_046
     * @tc.desc      Verify ascending and descending are reverses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('ascending_and_descending_are_reverses_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ascending_and_descending_are_reverses_046');
      let center: OrderCenter = centerOf([
        makeOrder(741, 700),
        makeOrder(742, 100),
        makeOrder(743, 400),
        makeOrder(744, 900),
        makeOrder(745, 200)
      ]);
      let ascending: number[] = idsOf(center.sortedByCreatedAt(false));
      let descending: number[] = idsOf(center.sortedByCreatedAt(true));
      // Five distinct timestamps make the two results exact mirrors, so reversing one must
      // reproduce the other element for element.
      let reversed: number[] = [];
      for (let index: number = descending.length - 1; index >= 0; index--) {
        reversed.push(descending[index]);
      }
      expect((reversed).length).assertEqual((ascending).length);
      for (let __i208: number = 0; __i208 < (ascending).length; __i208++) {
        expect((reversed)[__i208]).assertEqual((ascending)[__i208]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0470
     * @tc.name      seven_orders_ascending_exact_047
     * @tc.desc      Verify seven orders ascending exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('seven_orders_ascending_exact_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: seven_orders_ascending_exact_047');
      let center: OrderCenter = centerOf([
        makeOrder(751, 70),
        makeOrder(752, 10),
        makeOrder(753, 50),
        makeOrder(754, 30),
        makeOrder(755, 60),
        makeOrder(756, 20),
        makeOrder(757, 40)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([752, 756, 754, 757, 753, 755, 751]).length);
      for (let __i209: number = 0; __i209 < ([752, 756, 754, 757, 753, 755, 751]).length; __i209++) {
        expect((idsOf(sorted))[__i209]).assertEqual(([752, 756, 754, 757, 753, 755, 751])[__i209]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0480
     * @tc.name      seven_orders_descending_exact_048
     * @tc.desc      Verify seven orders descending exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('seven_orders_descending_exact_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: seven_orders_descending_exact_048');
      let center: OrderCenter = centerOf([
        makeOrder(761, 70),
        makeOrder(762, 10),
        makeOrder(763, 50),
        makeOrder(764, 30),
        makeOrder(765, 60),
        makeOrder(766, 20),
        makeOrder(767, 40)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect((idsOf(sorted)).length).assertEqual(([761, 765, 763, 767, 764, 766, 762]).length);
      for (let __i210: number = 0; __i210 < ([761, 765, 763, 767, 764, 766, 762]).length; __i210++) {
        expect((idsOf(sorted))[__i210]).assertEqual(([761, 765, 763, 767, 764, 766, 762])[__i210]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0490
     * @tc.name      sorting_eight_orders_ascending_exact_049
     * @tc.desc      Verify sorting eight orders ascending exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_eight_orders_ascending_exact_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_eight_orders_ascending_exact_049');
      let center: OrderCenter = centerOf([
        makeOrder(771, 80),
        makeOrder(772, 10),
        makeOrder(773, 50),
        makeOrder(774, 30),
        makeOrder(775, 70),
        makeOrder(776, 20),
        makeOrder(777, 60),
        makeOrder(778, 40)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      let ids: number[] = idsOf(sorted);

      expect(ids.length).assertEqual(8);
      expect(([ids[0], ids[1], ids[2]]).length).assertEqual(([772, 776, 774]).length);
      for (let __i211: number = 0; __i211 < ([772, 776, 774]).length; __i211++) {
        expect(([ids[0], ids[1], ids[2]])[__i211]).assertEqual(([772, 776, 774])[__i211]);
      }
      // Timestamps step by 10 up to 80, so the head is 10, 20, 30 (ids 772, 776, 774) and the
      // 80-timestamp order 771 is the tail.
      expect(ids[7]).assertEqual(771);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0500
     * @tc.name      sorting_eight_orders_descending_exact_050
     * @tc.desc      Verify sorting eight orders descending exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_eight_orders_descending_exact_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_eight_orders_descending_exact_050');
      let center: OrderCenter = centerOf([
        makeOrder(781, 80),
        makeOrder(782, 10),
        makeOrder(783, 50),
        makeOrder(784, 30),
        makeOrder(785, 70),
        makeOrder(786, 20),
        makeOrder(787, 60),
        makeOrder(788, 40)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let ids: number[] = idsOf(sorted);

      expect(ids.length).assertEqual(8);
      expect(([ids[0], ids[1], ids[2]]).length).assertEqual(([781, 785, 787]).length);
      for (let __i212: number = 0; __i212 < ([781, 785, 787]).length; __i212++) {
        expect(([ids[0], ids[1], ids[2]])[__i212]).assertEqual(([781, 785, 787])[__i212]);
      }
      expect(ids[7]).assertEqual(782);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0510
     * @tc.name      sorting_ten_orders_ascending_monotonic_051
     * @tc.desc      Verify sorting ten orders ascending monotonic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ten_orders_ascending_monotonic_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ten_orders_ascending_monotonic_051');
      let orders: Order[] = [];
      for (let index: number = 0; index < 10; index++) {
        // Timestamps fall by 10 from 1000, so ascending starts at 910 and ends at 1000.
        orders.push(makeOrder(800 + index, 1000 - index * 10));
      }
      let center: OrderCenter = centerOf(orders);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted.length).assertEqual(10);
      let times: number[] = timesOf(sorted);
      for (let index: number = 1; index < times.length; index++) {
        expect(times[index - 1] <= times[index]).assertTrue();
      }
      expect(sorted[0].createdAt).assertEqual(910);
      expect(sorted[9].createdAt).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0520
     * @tc.name      sorting_ties_do_not_swap_instances_052
     * @tc.desc      Verify sorting ties do not swap instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ties_do_not_swap_instances_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ties_do_not_swap_instances_052');
      // Two orders share createdAt 100, so a stable sort must return the same two object
      // references, first then second, rather than swapping them.
      let first: Order = makeOrder(811, 100);
      let second: Order = makeOrder(812, 100);
      let late: Order = makeOrder(813, 200);
      let center: OrderCenter = centerOf([first, second, late]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect(sorted[0] === first).assertTrue();
      expect(sorted[1] === second).assertTrue();
      expect(sorted[2] === late).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0530
     * @tc.name      sorting_descending_tie_group_keeps_relative_order_053
     * @tc.desc      Verify sorting descending tie group keeps relative order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_descending_tie_group_keeps_relative_order_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_descending_tie_group_keeps_relative_order_053');
      let center: OrderCenter = centerOf([
        makeOrder(821, 5),
        makeOrder(822, 1),
        makeOrder(823, 5),
        makeOrder(824, 3),
        makeOrder(825, 5)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      // Descending groups the three timestamp-5 orders at the head in input order 821, 823,
      // 825, then falls to 3 and 1.
      expect((idsOf(sorted)).length).assertEqual(([821, 823, 825, 824, 822]).length);
      for (let __i213: number = 0; __i213 < ([821, 823, 825, 824, 822]).length; __i213++) {
        expect((idsOf(sorted))[__i213]).assertEqual(([821, 823, 825, 824, 822])[__i213]);
      }
      for (let index: number = 0; index < 3; index++) {
        expect(sorted[index].createdAt).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0540
     * @tc.name      sorting_preserves_line_count_per_order_054
     * @tc.desc      Verify sorting preserves line count per order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_preserves_line_count_per_order_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_preserves_line_count_per_order_054');
      let center: OrderCenter = centerOf([
        makeOrder(831, 30, OrderState.OBLIGATION, 1000, 1),
        makeOrder(832, 10, OrderState.OBLIGATION, 2000, 2),
        makeOrder(833, 20, OrderState.OBLIGATION, 3000, 3)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      for (let index: number = 0; index < sorted.length; index++) {
        expect(sorted[index].lines.length).assertEqual(1);
      }
      expect(sorted[1].lines[0].quantity).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0550
     * @tc.name      ascending_sort_does_not_sort_by_state_055
     * @tc.desc      Verify ascending sort does not sort by state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('ascending_sort_does_not_sort_by_state_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ascending_sort_does_not_sort_by_state_055');
      let center: OrderCenter = centerOf([
        makeOrder(841, 300, OrderState.CANCELLED),
        makeOrder(842, 100, OrderState.COMPLETED),
        makeOrder(843, 200, OrderState.WAIT_RECEIVE)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([842, 843, 841]).length);
      for (let __i214: number = 0; __i214 < ([842, 843, 841]).length; __i214++) {
        expect((idsOf(sorted))[__i214]).assertEqual(([842, 843, 841])[__i214]);
      }
      expect(sorted[0].state).assertEqual(OrderState.COMPLETED);
      expect(sorted[2].state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0560
     * @tc.name      descending_sort_does_not_sort_by_total_056
     * @tc.desc      Verify descending sort does not sort by total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('descending_sort_does_not_sort_by_total_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: descending_sort_does_not_sort_by_total_056');
      let center: OrderCenter = centerOf([
        makeOrder(851, 300, OrderState.OBLIGATION, 100, 1),
        makeOrder(852, 100, OrderState.OBLIGATION, 300, 1),
        makeOrder(853, 200, OrderState.OBLIGATION, 200, 1)
      ]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      expect((idsOf(sorted)).length).assertEqual(([851, 853, 852]).length);
      for (let __i215: number = 0; __i215 < ([851, 853, 852]).length; __i215++) {
        expect((idsOf(sorted))[__i215]).assertEqual(([851, 853, 852])[__i215]);
      }
      expect(sorted[0].total().cents()).assertEqual(100);
      expect(sorted[2].total().cents()).assertEqual(300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0570
     * @tc.name      sorting_ascending_after_descending_is_stable_057
     * @tc.desc      Verify sorting ascending after descending is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_ascending_after_descending_is_stable_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_ascending_after_descending_is_stable_057');
      let center: OrderCenter = centerOf([
        makeOrder(861, 400),
        makeOrder(862, 100),
        makeOrder(863, 300),
        makeOrder(864, 200)
      ]);
      center.sortedByCreatedAt(true);
      let sorted: Order[] = center.sortedByCreatedAt(false);
      expect((idsOf(sorted)).length).assertEqual(([862, 864, 863, 861]).length);
      for (let __i216: number = 0; __i216 < ([862, 864, 863, 861]).length; __i216++) {
        expect((idsOf(sorted))[__i216]).assertEqual(([862, 864, 863, 861])[__i216]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0580
     * @tc.name      sorting_does_not_change_latest_058
     * @tc.desc      Verify sorting does not change latest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_does_not_change_latest_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_does_not_change_latest_058');
      let center: OrderCenter = centerOf([
        makeOrder(871, 100),
        makeOrder(872, 900),
        makeOrder(873, 500)
      ]);
      let before: Order | undefined = center.latest();
      center.sortedByCreatedAt(true);
      center.sortedByCreatedAt(false);
      let after: Order | undefined = center.latest();

      expect(before !== null && before !== undefined).assertTrue();
      expect(after !== null && after !== undefined).assertTrue();
      if (before !== undefined && after !== undefined) {
        expect(after.id).assertEqual(before.id);
        expect(after.id).assertEqual(872);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0590
     * @tc.name      sorting_does_not_change_counts_and_spent_059
     * @tc.desc      Verify sorting does not change counts and spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_does_not_change_counts_and_spent_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_does_not_change_counts_and_spent_059');
      let center: OrderCenter = centerOf([
        makeOrder(881, 100, OrderState.COMPLETED, 10000, 1),
        makeOrder(882, 200, OrderState.CANCELLED, 20000, 1),
        makeOrder(883, 300, OrderState.OBLIGATION, 30000, 1)
      ]);
      let spentBefore: number = center.spent().cents();
      let totalBefore: number = center.counts().total;
      center.sortedByCreatedAt(true);
      center.sortedByCreatedAt(false);
      expect(center.spent().cents()).assertEqual(spentBefore);
      expect(center.counts().total).assertEqual(totalBefore);
      expect(center.counts().cancelled).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0600
     * @tc.name      sorting_single_order_with_max_timestamp_060
     * @tc.desc      Verify sorting single order with max timestamp.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_single_order_with_max_timestamp_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_single_order_with_max_timestamp_060');
      let order: Order = makeOrder(891, Number.MAX_SAFE_INTEGER);
      let center: OrderCenter = centerOf([order]);
      let ascending: Order[] = center.sortedByCreatedAt(false);
      let descending: Order[] = center.sortedByCreatedAt(true);
      expect(ascending.length).assertEqual(1);
      expect(descending.length).assertEqual(1);
      expect(ascending[0].createdAt).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(descending[0].id).assertEqual(891);
      expect(ascending[0] === order).assertTrue();
      expect(descending[0] === order).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_SORTING_0610
     * @tc.name      sorting_zero_negative_and_positive_ascending_061
     * @tc.desc      Verify sorting zero negative and positive ascending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sorting_zero_negative_and_positive_ascending_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sorting_zero_negative_and_positive_ascending_061');
      let center: OrderCenter = centerOf([
        makeOrder(901, 0),
        makeOrder(902, 5),
        makeOrder(903, -5)
      ]);
      // One fixture gives both directions across the sign boundary at 0: ascending is
      // -5, 0, 5 and descending is 5, 0, -5.
      let ascending: Order[] = center.sortedByCreatedAt(false);
      let descending: Order[] = center.sortedByCreatedAt(true);
      expect((timesOf(ascending)).length).assertEqual(([-5, 0, 5]).length);
      for (let __i217: number = 0; __i217 < ([-5, 0, 5]).length; __i217++) {
        expect((timesOf(ascending))[__i217]).assertEqual(([-5, 0, 5])[__i217]);
      }
      expect((timesOf(descending)).length).assertEqual(([5, 0, -5]).length);
      for (let __i218: number = 0; __i218 < ([5, 0, -5]).length; __i218++) {
        expect((timesOf(descending))[__i218]).assertEqual(([5, 0, -5])[__i218]);
      }
    });
  });
}
