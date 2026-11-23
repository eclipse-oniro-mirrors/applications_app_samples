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
import { throwsAsync } from '../Shared/AsyncSupport';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartSnapshot, Catalog, CouponBook, Goods, Money, Order, OrderCenter, OrderCounts, OrderState, SearchEngine, TaskQueue } from '../Shared/ShopModel';
import { SEARCH_KEYWORDS, UNKNOWN_KEYWORDS, cartLine, cartWith, defaultCatalog, defaultCouponBook, emptyCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Zero-delay thunk; it stays pending until drain() invokes it. */
function numberTask(value: number): () => Promise<number> {
  return (): Promise<number> => {
    return Promise.resolve(value);
  };
}

function idsOf(matches: Goods[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < matches.length; index++) {
    ids.push(matches[index].id);
  }
  return ids;
}

/** Ids start at 500; line costs 1000 + 100 * index, createdAt rises. */
function buildOrders(count: number, state: OrderState): Order[] {
  let orders: Order[] = [];
  for (let index: number = 0; index < count; index++) {
    let amount: number = 1000 + index * 100;
    orders.push(new Order(500 + index, [cartLine(index, amount, 1, true)], state, 10000 + index));
  }
  return orders;
}

export default function concurrencyTest() {
  describe('OrangeShoppingConcurrency', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'concurrency suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0010
     * @tc.name      promise_all_computes_fifty_line_totals_001
     * @tc.desc      Verify promise all computes fifty line totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('promise_all_computes_fifty_line_totals_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: promise_all_computes_fifty_line_totals_001');
      let tasks: Promise<Money>[] = [];
      for (let index: number = 0; index < 50; index++) {
        tasks.push(computeLineTotal(1000 + index * 10, index % 5 + 1));
      }
      let results: Money[] = await Promise.all(tasks);
      expect(results.length).assertEqual(50);
      for (let index: number = 0; index < results.length; index++) {
        let expected: number = (1000 + index * 10) * (index % 5 + 1);
        expect(results[index].cents()).assertEqual(expected);
        expect(results[index].cents() > 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0020
     * @tc.name      promise_all_preserves_the_submission_order_002
     * @tc.desc      Verify promise all preserves the submission order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('promise_all_preserves_the_submission_order_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: promise_all_preserves_the_submission_order_002');
      let tasks: Promise<Money>[] = [];
      for (let index: number = 0; index < 50; index++) {
        tasks.push(computeLineTotal(1000 + index * 10, index % 5 + 1));
      }
      let results: Money[] = await Promise.all(tasks);
      expect(results[0].cents()).assertEqual(1000);
      // Index 24 charges 1240 x 5 and index 49 charges 1490 x 5, so the spot values pin the submission order.
      expect(results[24].cents()).assertEqual(6200);
      expect(results[49].cents()).assertEqual(7450);
      expect(results.length).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0030
     * @tc.name      promise_all_sum_matches_sequential_sum_003
     * @tc.desc      Verify promise all sum matches sequential sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('promise_all_sum_matches_sequential_sum_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: promise_all_sum_matches_sequential_sum_003');
      let tasks: Promise<Money>[] = [];
      let sequential: number = 0;
      for (let index: number = 0; index < 50; index++) {
        let unit: number = 1000 + index * 10;
        let quantity: number = index % 5 + 1;
        tasks.push(computeLineTotal(unit, quantity));
        sequential += unit * quantity;
      }
      let results: Money[] = await Promise.all(tasks);
      expect(Money.sum(results).cents()).assertEqual(sequential);
      expect(Money.sum(results).cents()).assertEqual(187750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0040
     * @tc.name      promise_all_zero_quantity_results_are_zero_004
     * @tc.desc      Verify promise all zero quantity results are zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('promise_all_zero_quantity_results_are_zero_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: promise_all_zero_quantity_results_are_zero_004');
      // Quantity 0 is submitted for all fifty lines to prove multiply resolves to zero instead of rejecting.
      let tasks: Promise<Money>[] = [];
      for (let index: number = 0; index < 50; index++) {
        tasks.push(computeLineTotal(1000 + index, 0));
      }
      let results: Money[] = await Promise.all(tasks);
      expect(results.length).assertEqual(50);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].cents()).assertEqual(0);
        expect(results[index].isZero()).assertTrue();
      }
      expect(Money.sum(results).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0050
     * @tc.name      promise_all_large_quantity_results_stay_consistent_005
     * @tc.desc      Verify promise all large quantity results stay consistent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('promise_all_large_quantity_results_stay_consistent_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: promise_all_large_quantity_results_stay_consistent_005');
      let tasks: Promise<Money>[] = [];
      for (let index: number = 0; index < 50; index++) {
        tasks.push(computeLineTotal(100 + index, 99));
      }
      let results: Money[] = await Promise.all(tasks);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].cents()).assertEqual((100 + index) * 99);
      }
      expect(results[49].cents() > 0).assertTrue();
      // The final task bills 149 x 99 = 14751, just under the 99-unit per-line ceiling.
      expect(results[49].cents()).assertEqual(14751);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0060
     * @tc.name      task_queue_drains_in_enqueue_order_006
     * @tc.desc      Verify task queue drains in enqueue order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_drains_in_enqueue_order_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_drains_in_enqueue_order_006');
      let queue: TaskQueue = new TaskQueue();
      let values: number[] = [10, 20, 30, 40, 50];
      for (let index: number = 0; index < values.length; index++) {
        queue.enqueue(numberTask(values[index]));
      }
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual((values).length);
      for (let __i457: number = 0; __i457 < (values).length; __i457++) {
        expect((results)[__i457]).assertEqual((values)[__i457]);
      }
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0070
     * @tc.name      task_queue_drain_consumes_each_task_once_007
     * @tc.desc      Verify task queue drain consumes each task once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_drain_consumes_each_task_once_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_drain_consumes_each_task_once_007');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(numberTask(1));
      queue.enqueue(numberTask(2));
      queue.enqueue(numberTask(3));
      expect(queue.pending()).assertEqual(3);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(3);
      let __seen463: number[] = [];
      for (let __i463: number = 0; __i463 < (results).length; __i463++) {
        expect(__seen463.indexOf((results)[__i463]) < 0).assertTrue();
        __seen463.push((results)[__i463]);
      }
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0080
     * @tc.name      task_queue_empty_drain_returns_empty_008
     * @tc.desc      Verify task queue empty drain returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_empty_drain_returns_empty_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_empty_drain_returns_empty_008');
      let queue: TaskQueue = new TaskQueue();
      expect(queue.pending()).assertEqual(0);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(0);
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0090
     * @tc.name      task_queue_repeated_drain_returns_empty_009
     * @tc.desc      Verify task queue repeated drain returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_repeated_drain_returns_empty_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_repeated_drain_returns_empty_009');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(numberTask(7));
      queue.enqueue(numberTask(8));
      let first: number[] = await queue.drain();
      let second: number[] = await queue.drain();
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(0);
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0100
     * @tc.name      task_queue_pending_tracks_unconsumed_tasks_010
     * @tc.desc      Verify task queue pending tracks unconsumed tasks.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_pending_tracks_unconsumed_tasks_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_pending_tracks_unconsumed_tasks_010');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(numberTask(1));
      queue.enqueue(numberTask(2));
      queue.enqueue(numberTask(3));
      expect(queue.pending()).assertEqual(3);
      await queue.drain();
      expect(queue.pending()).assertEqual(0);
      queue.enqueue(numberTask(4));
      queue.enqueue(numberTask(5));
      expect(queue.pending()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0110
     * @tc.name      task_queue_enqueue_reports_pending_count_011
     * @tc.desc      Verify task queue enqueue reports pending count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_enqueue_reports_pending_count_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_enqueue_reports_pending_count_011');
      let queue: TaskQueue = new TaskQueue();
      let first: number = queue.enqueue(numberTask(1));
      let second: number = queue.enqueue(numberTask(1));
      let third: number = queue.enqueue(numberTask(1));
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(third).assertEqual(3);
      expect(queue.pending()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0120
     * @tc.name      task_queue_enqueue_after_drain_works_again_012
     * @tc.desc      Verify task queue enqueue after drain works again.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_enqueue_after_drain_works_again_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_enqueue_after_drain_works_again_012');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(numberTask(1));
      await queue.drain();
      queue.enqueue(numberTask(11));
      queue.enqueue(numberTask(12));
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([11, 12]).length);
      for (let __i458: number = 0; __i458 < ([11, 12]).length; __i458++) {
        expect((results)[__i458]).assertEqual(([11, 12])[__i458]);
      }
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0130
     * @tc.name      task_queue_long_chain_preserves_order_013
     * @tc.desc      Verify task queue long chain preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('task_queue_long_chain_preserves_order_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: task_queue_long_chain_preserves_order_013');
      let queue: TaskQueue = new TaskQueue();
      for (let index: number = 0; index < 100; index++) {
        queue.enqueue(numberTask(index));
      }
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(100);
      expect(results[0]).assertEqual(0);
      expect(results[99]).assertEqual(99);
      // An unbroken +1 run over 100 entries shows drain() replayed the queue without reordering it.
      for (let index: number = 1; index < results.length; index++) {
        expect(results[index]).assertEqual(results[index - 1] + 1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0140
     * @tc.name      concurrent_adds_put_one_line_in_each_cart_014
     * @tc.desc      Verify concurrent adds put one line in each cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_adds_put_one_line_in_each_cart_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_adds_put_one_line_in_each_cart_014');
      let carts: Cart[] = [];
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 20; index++) {
        let cart: Cart = new Cart();
        carts.push(cart);
        tasks.push(addGoodsAsync(cart, index, 1000 + index * 10, index % 3 + 1));
      }
      let accepted: number[] = await Promise.all(tasks);
      for (let index: number = 0; index < carts.length; index++) {
        expect(accepted[index]).assertEqual(index % 3 + 1);
        expect(carts[index].distinctCount()).assertEqual(1);
        expect(carts[index].quantityOf(index)).assertEqual(index % 3 + 1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0150
     * @tc.name      concurrent_cart_totals_are_independent_015
     * @tc.desc      Verify concurrent cart totals are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_cart_totals_are_independent_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_cart_totals_are_independent_015');
      let carts: Cart[] = [];
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 20; index++) {
        let cart: Cart = new Cart();
        let quantity: number = index % 4 + 1;
        let price: number = 2000 + index * 20;
        carts.push(cart);
        tasks.push(addGoodsAsync(cart, index, price, quantity));
      }
      await Promise.all(tasks);
      for (let index: number = 0; index < carts.length; index++) {
        let expected: number = (2000 + index * 20) * (index % 4 + 1);

        expect(carts[index].subtotal().cents()).assertEqual(expected);
        expect(carts[index].totalQuantity()).assertEqual(index % 4 + 1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0160
     * @tc.name      concurrent_carts_do_not_share_line_storage_016
     * @tc.desc      Verify concurrent carts do not share line storage.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_carts_do_not_share_line_storage_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_carts_do_not_share_line_storage_016');
      let carts: Cart[] = [];
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 10; index++) {
        let cart: Cart = new Cart();
        carts.push(cart);
        tasks.push(addGoodsAsync(cart, index, 5000, 2));
      }
      await Promise.all(tasks);
      let secondBefore: number = carts[1].subtotal().cents();
      carts[0].clear();
      expect(carts[0].isEmpty()).assertTrue();
      expect(carts[1].subtotal().cents()).assertEqual(secondBefore);
      expect(carts[1].distinctCount()).assertEqual(1);
      expect(carts[1].quantityOf(1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0170
     * @tc.name      concurrent_adds_of_same_goods_are_independent_017
     * @tc.desc      Verify concurrent adds of same goods are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_adds_of_same_goods_are_independent_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_adds_of_same_goods_are_independent_017');
      let carts: Cart[] = [];
      let firstRound: Promise<number>[] = [];
      for (let index: number = 0; index < 12; index++) {
        let cart: Cart = new Cart();
        carts.push(cart);
        firstRound.push(addGoodsAsync(cart, 0, 5000, 1));
      }
      await Promise.all(firstRound);
      let secondRound: Promise<number>[] = [];
      for (let index: number = 0; index < carts.length; index++) {
        secondRound.push(addGoodsAsync(carts[index], 0, 5000, 1));
      }
      await Promise.all(secondRound);
      for (let index: number = 0; index < carts.length; index++) {

        expect(carts[index].distinctCount()).assertEqual(1);
        expect(carts[index].quantityOf(0)).assertEqual(2);
        expect(carts[index].subtotal().cents()).assertEqual(10000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0180
     * @tc.name      concurrent_search_matches_sequential_results_018
     * @tc.desc      Verify concurrent search matches sequential results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_search_matches_sequential_results_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_search_matches_sequential_results_018');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let tasks: Promise<number[]>[] = [];
      for (let index: number = 0; index < SEARCH_KEYWORDS.length; index++) {
        tasks.push(searchIds(engine, SEARCH_KEYWORDS[index]));
      }
      let concurrent: number[][] = await Promise.all(tasks);
      for (let index: number = 0; index < SEARCH_KEYWORDS.length; index++) {
        let sequential: number[] = idsOf(engine.search(SEARCH_KEYWORDS[index]));
        expect((concurrent[index]).length).assertEqual((sequential).length);
        for (let __i459: number = 0; __i459 < (sequential).length; __i459++) {
          expect((concurrent[index])[__i459]).assertEqual((sequential)[__i459]);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0190
     * @tc.name      concurrent_search_multi_keyword_has_no_crosstalk_019
     * @tc.desc      Verify concurrent search multi keyword has no crosstalk.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_search_multi_keyword_has_no_crosstalk_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_search_multi_keyword_has_no_crosstalk_019');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let phoneTask: Promise<number[]> = searchIds(engine, 'phone');
      let teaTask: Promise<number[]> = searchIds(engine, 'tea');
      let phoneIds: number[] = await phoneTask;
      let teaIds: number[] = await teaTask;
      expect(phoneIds.length > 0).assertTrue();
      expect(teaIds.length > 0).assertTrue();
      for (let index: number = 0; index < phoneIds.length; index++) {
        expect(teaIds.indexOf(phoneIds[index])).assertEqual(-1);
      }
      for (let index: number = 0; index < teaIds.length; index++) {
        expect(phoneIds.indexOf(teaIds[index])).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0200
     * @tc.name      concurrent_search_unknown_keyword_is_empty_020
     * @tc.desc      Verify concurrent search unknown keyword is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_search_unknown_keyword_is_empty_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_search_unknown_keyword_is_empty_020');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let tasks: Promise<number[]>[] = [];
      for (let index: number = 0; index < UNKNOWN_KEYWORDS.length; index++) {
        tasks.push(searchIds(engine, UNKNOWN_KEYWORDS[index]));
      }
      let results: number[][] = await Promise.all(tasks);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].length).assertEqual(0);
      }
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0210
     * @tc.name      await_in_reverse_order_keeps_the_same_totals_021
     * @tc.desc      Verify await in reverse order keeps the same totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('await_in_reverse_order_keeps_the_same_totals_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: await_in_reverse_order_keeps_the_same_totals_021');
      let tasks: Promise<Money>[] = [];
      let forward: number = 0;
      for (let index: number = 0; index < 10; index++) {
        let unit: number = 300 + index * 25;
        let quantity: number = index % 3 + 1;
        tasks.push(computeLineTotal(unit, quantity));
        forward += unit * quantity;
      }
      // Awaiting from index 9 down to 0 must still add up to the forward total, since each task is independent.
      let reverse: number = 0;
      for (let index: number = tasks.length - 1; index >= 0; index--) {
        let value: Money = await tasks[index];
        reverse += value.cents();
      }

      expect(reverse).assertEqual(forward);
      expect(reverse > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0220
     * @tc.name      await_in_reverse_order_keeps_the_same_search_ids_022
     * @tc.desc      Verify await in reverse order keeps the same search ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('await_in_reverse_order_keeps_the_same_search_ids_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: await_in_reverse_order_keeps_the_same_search_ids_022');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let firstTask: Promise<number[]> = searchIds(engine, 'watch');
      let secondTask: Promise<number[]> = searchIds(engine, 'shirt');
      let secondIds: number[] = await secondTask;
      let firstIds: number[] = await firstTask;
      expect((firstIds).length).assertEqual((idsOf(engine.search('watch'))).length);
      for (let __i460: number = 0; __i460 < (idsOf(engine.search('watch'))).length; __i460++) {
        expect((firstIds)[__i460]).assertEqual((idsOf(engine.search('watch')))[__i460]);
      }
      expect((secondIds).length).assertEqual((idsOf(engine.search('shirt'))).length);
      for (let __i461: number = 0; __i461 < (idsOf(engine.search('shirt'))).length; __i461++) {
        expect((secondIds)[__i461]).assertEqual((idsOf(engine.search('shirt')))[__i461]);
      }
      expect(firstIds.length > 0).assertTrue();
      expect(secondIds.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0230
     * @tc.name      concurrent_snapshot_restore_is_isolated_023
     * @tc.desc      Verify concurrent snapshot restore is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_snapshot_restore_is_isolated_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_snapshot_restore_is_isolated_023');
      let source: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(4, 2000, 2, true),
        cartLine(7, 3000, 3, true)
      ]);
      let snapshot: CartSnapshot = source.snapshot();
      let tasks: Promise<Cart>[] = [];
      for (let index: number = 0; index < 10; index++) {
        tasks.push(restoreCartAsync(snapshot));
      }
      let restored: Cart[] = await Promise.all(tasks);

      expect(restored.length).assertEqual(10);
      for (let index: number = 0; index < restored.length; index++) {
        expect(restored[index].distinctCount()).assertEqual(3);
        expect(restored[index].subtotal().cents()).assertEqual(source.subtotal().cents());
        // The source holds 1 + 2 + 3 = six units, and every restore must reproduce that count.
        expect(restored[index].totalQuantity()).assertEqual(6);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0240
     * @tc.name      concurrent_snapshot_restore_leaves_the_source_unchanged_024
     * @tc.desc      Verify concurrent snapshot restore leaves the source unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_snapshot_restore_leaves_the_source_unchanged_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_snapshot_restore_leaves_the_source_unchanged_024');
      let source: Cart = cartWith([
        cartLine(1, 4000, 2, true),
        cartLine(2, 5000, 1, false)
      ]);
      let expectedSource: number = source.allLinesSubtotal().cents();
      let snapshot: CartSnapshot = source.snapshot();
      let tasks: Promise<Cart>[] = [];
      for (let index: number = 0; index < 8; index++) {
        tasks.push(restoreCartAsync(snapshot));
      }
      await Promise.all(tasks);

      expect(source.distinctCount()).assertEqual(2);
      expect(source.allLinesSubtotal().cents()).assertEqual(expectedSource);
      expect(snapshot.lines.length).assertEqual(2);
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(snapshot.lines[1].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0250
     * @tc.name      concurrent_restored_cart_mutation_does_not_leak_025
     * @tc.desc      Verify concurrent restored cart mutation does not leak.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_restored_cart_mutation_does_not_leak_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_restored_cart_mutation_does_not_leak_025');
      let source: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(3, 2000, 2, true)
      ]);
      let snapshot: CartSnapshot = source.snapshot();
      let tasks: Promise<Cart>[] = [];
      for (let index: number = 0; index < 5; index++) {
        tasks.push(restoreCartAsync(snapshot));
      }
      let restored: Cart[] = await Promise.all(tasks);
      let baseline: number = restored[1].subtotal().cents();
      restored[0].clear();

      expect(restored[0].isEmpty()).assertTrue();
      expect(restored[1].subtotal().cents()).assertEqual(baseline);
      expect(restored[2].subtotal().cents()).assertEqual(baseline);
      expect(source.subtotal().cents()).assertEqual(baseline);
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0260
     * @tc.name      async_exception_is_caught_by_throws_async_026
     * @tc.desc      Verify async exception is caught by throws async.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('async_exception_is_caught_by_throws_async_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: async_exception_is_caught_by_throws_async_026');
      let failing: () => Promise<void> = async (): Promise<void> => {
        await Promise.resolve();
        throw new Error('concurrent failure');
      };
      let caught: boolean = await throwsAsync(failing);
      expect(caught).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0270
     * @tc.name      async_rejected_task_is_reported_027
     * @tc.desc      Verify async rejected task is reported.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('async_rejected_task_is_reported_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: async_rejected_task_is_reported_027');
      let caught: boolean = await throwsAsync(rejectingAction);
      expect(caught).assertTrue();
      let clean: boolean = await throwsAsync(resolvingAction);
      expect(clean).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0280
     * @tc.name      async_failure_does_not_corrupt_later_calculation_028
     * @tc.desc      Verify async failure does not corrupt later calculation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('async_failure_does_not_corrupt_later_calculation_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: async_failure_does_not_corrupt_later_calculation_028');
      let caught: boolean = await throwsAsync(rejectingAction);
      expect(caught).assertTrue();
      let values: Money[] = [new Money(1000), new Money(2000), new Money(3000)];
      let total: Money = Money.sum(values);
      expect(total.cents()).assertEqual(6000);
      let cart: Cart = new Cart();
      cart.add(0, 1000, 2, 99);
      cart.add(1, 2000, 1, 99);
      expect(cart.subtotal().cents()).assertEqual(4000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0290
     * @tc.name      expect_throws_async_reports_a_failure_029
     * @tc.desc      Verify expect throws async reports a failure.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('expect_throws_async_reports_a_failure_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: expect_throws_async_reports_a_failure_029');
      let __thrown464: boolean = false;
      try {
        await (rejectingAction)();
      } catch (error) {
        __thrown464 = true;
      }
      expect(__thrown464).assertTrue();
      let money: Money = new Money(2500).multiply(4);
      expect(money.cents()).assertEqual(10000);
      expect(money.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0300
     * @tc.name      concurrent_coupon_books_produce_the_same_payable_030
     * @tc.desc      Verify concurrent coupon books produce the same payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_coupon_books_produce_the_same_payable_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_coupon_books_produce_the_same_payable_030');
      let book: CouponBook = defaultCouponBook();
      let sizeBefore: number = book.size();
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 10; index++) {
        let cart: Cart = cartWith([cartLine(900 + index, 50000, 1, true)]);
        tasks.push(payableCentsAsync(cart, book));
      }
      let payable: number[] = await Promise.all(tasks);
      for (let index: number = 0; index < payable.length; index++) {
        // At 50000 cents only C20's 2000 discount opens; C50 needs 100000, so every task pays 48000.
        expect(payable[index]).assertEqual(48000);
      }
      expect(book.size()).assertEqual(sizeBefore);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0310
     * @tc.name      concurrent_order_centers_have_independent_counts_031
     * @tc.desc      Verify concurrent order centers have independent counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_order_centers_have_independent_counts_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_order_centers_have_independent_counts_031');
      let first: OrderCenter = new OrderCenter(buildOrders(2, OrderState.OBLIGATION));
      let second: OrderCenter = new OrderCenter(buildOrders(3, OrderState.CANCELLED));
      let third: OrderCenter = new OrderCenter(buildOrders(4, OrderState.COMPLETED));
      let fourth: OrderCenter = new OrderCenter(buildOrders(5, OrderState.WAIT_DELIVERY));
      let tasks: Promise<OrderCounts>[] = [
        countOrdersAsync(first),
        countOrdersAsync(second),
        countOrdersAsync(third),
        countOrdersAsync(fourth)
      ];
      let counts: OrderCounts[] = await Promise.all(tasks);

      expect(counts[0].obligation).assertEqual(2);
      expect(counts[0].total).assertEqual(2);
      expect(counts[1].cancelled).assertEqual(3);
      expect(counts[1].total).assertEqual(3);
      expect(counts[2].completed).assertEqual(4);
      expect(counts[2].total).assertEqual(4);
      expect(counts[3].waitDelivery).assertEqual(5);
      expect(counts[3].total).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0320
     * @tc.name      concurrent_money_multiply_matches_expected_032
     * @tc.desc      Verify concurrent money multiply matches expected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_money_multiply_matches_expected_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_money_multiply_matches_expected_032');
      let tasks: Promise<Money>[] = [];
      let expected: number = 0;
      for (let index: number = 0; index < 50; index++) {
        let unit: number = 100 + index;
        let factor: number = index % 9 + 1;
        tasks.push(computeLineTotal(unit, factor));
        expected += unit * factor;
      }
      let results: Money[] = await Promise.all(tasks);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].cents()).assertEqual((100 + index) * (index % 9 + 1));
      }
      expect(Money.sum(results).cents()).assertEqual(expected);
      expect(expected > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0330
     * @tc.name      concurrent_restores_from_independent_snapshots_033
     * @tc.desc      Verify concurrent restores from independent snapshots.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_restores_from_independent_snapshots_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_restores_from_independent_snapshots_033');
      let firstSource: Cart = cartWith([cartLine(0, 1000, 1, true)]);
      let secondSource: Cart = cartWith([
        cartLine(1, 2000, 2, true),
        cartLine(2, 3000, 3, true)
      ]);
      let firstSnapshot: CartSnapshot = firstSource.snapshot();
      let secondSnapshot: CartSnapshot = secondSource.snapshot();
      let tasks: Promise<Cart>[] = [];
      for (let index: number = 0; index < 6; index++) {
        if (index % 2 === 0) {
          tasks.push(restoreCartAsync(firstSnapshot));
        } else {
          tasks.push(restoreCartAsync(secondSnapshot));
        }
      }
      let restored: Cart[] = await Promise.all(tasks);
      for (let index: number = 0; index < restored.length; index++) {
        if (index % 2 === 0) {

          expect(restored[index].distinctCount()).assertEqual(1);
          expect(restored[index].subtotal().cents()).assertEqual(1000);
        } else {
          // The odd-index snapshot bills 2000 x 2 + 3000 x 3 = 13000 cents.
          expect(restored[index].distinctCount()).assertEqual(2);
          expect(restored[index].subtotal().cents()).assertEqual(13000);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0340
     * @tc.name      concurrent_adds_to_prefilled_carts_keep_existing_lines_034
     * @tc.desc      Verify concurrent adds to prefilled carts keep existing lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_adds_to_prefilled_carts_keep_existing_lines_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_adds_to_prefilled_carts_keep_existing_lines_034');
      let carts: Cart[] = [];
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 10; index++) {
        let cart: Cart = new Cart();
        cart.add(0, 1000, 1, 99);
        carts.push(cart);
        tasks.push(addGoodsAsync(cart, 1, 2000, 2));
      }
      await Promise.all(tasks);
      for (let index: number = 0; index < carts.length; index++) {

        expect(carts[index].distinctCount()).assertEqual(2);
        expect(carts[index].quantityOf(0)).assertEqual(1);
        expect(carts[index].quantityOf(1)).assertEqual(2);
        // The prefilled 1000-cent line plus 2000 x 2 keeps the concurrent add from overwriting line 0.
        expect(carts[index].subtotal().cents()).assertEqual(5000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0350
     * @tc.name      await_interleaved_tasks_keep_individual_results_035
     * @tc.desc      Verify await interleaved tasks keep individual results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('await_interleaved_tasks_keep_individual_results_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: await_interleaved_tasks_keep_individual_results_035');
      let tasks: Promise<Money>[] = [];
      for (let index: number = 0; index < 6; index++) {
        tasks.push(computeLineTotal(100 + index, index + 1));
      }
      let evenSum: number = 0;
      let oddSum: number = 0;
      for (let index: number = 0; index < 6; index += 2) {
        let value: Money = await tasks[index];
        evenSum += value.cents();
      }
      for (let index: number = 1; index < 6; index += 2) {
        let value: Money = await tasks[index];
        oddSum += value.cents();
      }

      // Even indices give 100 + 306 + 520 = 926 and odd ones 202 + 412 + 630 = 1244, each awaited only once.
      expect(evenSum).assertEqual(926);
      expect(oddSum).assertEqual(1244);
      expect(evenSum + oddSum).assertEqual(2170);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0360
     * @tc.name      concurrent_empty_coupon_wallet_keeps_the_subtotal_036
     * @tc.desc      Verify concurrent empty coupon wallet keeps the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_empty_coupon_wallet_keeps_the_subtotal_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_empty_coupon_wallet_keeps_the_subtotal_036');
      let book: CouponBook = emptyCouponBook();
      let tasks: Promise<number>[] = [];
      for (let index: number = 0; index < 8; index++) {
        let cart: Cart = cartWith([cartLine(910 + index, 25000, 1, true)]);
        tasks.push(payableCentsAsync(cart, book));
      }
      let payable: number[] = await Promise.all(tasks);
      for (let index: number = 0; index < payable.length; index++) {
        expect(payable[index]).assertEqual(25000);
      }
      expect(book.size()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0370
     * @tc.name      concurrent_order_centers_keep_spent_independent_037
     * @tc.desc      Verify concurrent order centers keep spent independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_order_centers_keep_spent_independent_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_order_centers_keep_spent_independent_037');
      let first: OrderCenter = new OrderCenter([
        new Order(600, [cartLine(0, 1000, 1, true)], OrderState.OBLIGATION, 1),
        new Order(601, [cartLine(1, 2000, 1, true)], OrderState.OBLIGATION, 2)
      ]);
      let second: OrderCenter = new OrderCenter([
        new Order(602, [cartLine(2, 3000, 1, true)], OrderState.COMPLETED, 3)
      ]);
      let third: OrderCenter = new OrderCenter([
        new Order(603, [cartLine(3, 4000, 1, true)], OrderState.CANCELLED, 4),
        new Order(604, [cartLine(4, 5000, 1, true)], OrderState.REFUND, 5)
      ]);
      let tasks: Promise<number>[] = [
        spentCentsAsync(first),
        spentCentsAsync(second),
        spentCentsAsync(third)
      ];
      let spent: number[] = await Promise.all(tasks);

      // First centre spends 1000 + 2000, second 3000 from its completed order, third nothing after cancel and refund.
      expect(spent[0]).assertEqual(3000);
      expect(spent[1]).assertEqual(3000);
      expect(spent[2]).assertEqual(0);
      expect(first.size()).assertEqual(2);
      expect(third.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CONCURRENCY_0380
     * @tc.name      concurrent_failure_propagates_through_promise_all_038
     * @tc.desc      Verify concurrent failure propagates through promise all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrent_failure_propagates_through_promise_all_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrent_failure_propagates_through_promise_all_038');
      let tasks: Promise<number>[] = [
        numberTask(1)(),
        rejectedNumberTask(),
        numberTask(3)()
      ];
      let failing: () => Promise<void> = async (): Promise<void> => {
        await Promise.all(tasks);
      };
      let caught: boolean = await throwsAsync(failing);
      expect(caught).assertTrue();
      // The middle rejection fails the whole Promise.all, yet a fresh pair afterwards still resolves 4 and 5.
      let retryTasks: Promise<number>[] = [numberTask(4)(), numberTask(5)()];
      let single: number[] = await Promise.all(retryTasks);
      expect((single).length).assertEqual(([4, 5]).length);
      for (let __i462: number = 0; __i462 < ([4, 5]).length; __i462++) {
        expect((single)[__i462]).assertEqual(([4, 5])[__i462]);
      }
    });
  });
}

/** Quantity 0 is legal and resolves to a zero Money. */
async function computeLineTotal(unitCents: number, quantity: number): Promise<Money> {
  let unit: Money = new Money(unitCents);
  let total: Money = unit.multiply(quantity);
  return total;
}

/** Stock is 99, so the per-line cap never throttles; cart is shared. */
async function addGoodsAsync(cart: Cart, goodsId: number, priceCents: number,
  quantity: number): Promise<number> {
  let accepted: number = cart.add(goodsId, priceCents, quantity, 99);
  return accepted;
}

/** The engine is shared, so this must not cache or mutate state. */
async function searchIds(engine: SearchEngine, keyword: string): Promise<number[]> {
  let matches: Goods[] = engine.search(keyword);
  let ids: number[] = [];
  for (let index: number = 0; index < matches.length; index++) {
    ids.push(matches[index].id);
  }
  return ids;
}

/** Each restored cart owns fresh CartLine copies, not aliases. */
async function restoreCartAsync(snapshot: CartSnapshot): Promise<Cart> {
  let restored: Cart = Cart.restore(snapshot);
  return restored;
}

/** The shared book must keep its wallet size after each call. */
async function payableCentsAsync(cart: Cart, book: CouponBook): Promise<number> {
  let payable: Money = cart.payable(book);
  return payable.cents();
}

/** Each result stays tied to its own centre, never a shared tally. */
async function countOrdersAsync(center: OrderCenter): Promise<OrderCounts> {
  let counts: OrderCounts = center.counts();
  return counts;
}

/** Yields once, then rejects, so earlier results have already arrived. */
async function rejectedNumberTask(): Promise<number> {
  await Promise.resolve();
  throw new Error('one task failed');
}

/** Centres differ in exclusions, so a leaked static total shows up here. */
async function spentCentsAsync(center: OrderCenter): Promise<number> {
  let spent: Money = center.spent();
  return spent.cents();
}

/** Always rejects after one microtask; the throwsAsync control. */
async function rejectingAction(): Promise<void> {
  await Promise.resolve();
  throw new Error('rejected task');
}

/** Resolves with no value, proving throwsAsync returns false. */
async function resolvingAction(): Promise<void> {
  await Promise.resolve();
}
