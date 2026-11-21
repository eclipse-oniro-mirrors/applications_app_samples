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
import { Cart, CartSnapshot, Money, TaskQueue } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

async function addAsync(cart: Cart, goodsId: number, cents: number, quantity: number): Promise<number> {
  return cart.add(goodsId, cents, quantity);
}

async function addMoneyAsync(left: Money, right: Money): Promise<Money> {
  return left.add(right);
}

/** Rejections surface inside the promise, as Promise.all cases expect. */
async function multiplyMoneyAsync(money: Money, quantity: number): Promise<Money> {
  return money.multiply(quantity);
}

/** A percent outside 0-100 rejects rather than throwing at call time. */
async function percentageMoneyAsync(money: Money, percent: number): Promise<Money> {
  return money.percentage(percent);
}

function moneyList(cents: number[]): Money[] {
  let result: Money[] = [];
  for (let index: number = 0; index < cents.length; index++) {
    result.push(new Money(cents[index]));
  }
  return result;
}

/** Tasks resolve in array order; drain() replays that order unchanged. */
function queueOf(values: number[]): TaskQueue {
  let queue: TaskQueue = new TaskQueue();
  for (let index: number = 0; index < values.length; index++) {
    let value: number = values[index];
    queue.enqueue(async (): Promise<number> => {
      return value;
    });
  }
  return queue;
}

export default function modelConcurrencyTest() {
  describe('OrangeShoppingModelConcurrency', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'concurrency model suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0010
     * @tc.name      concurrency_new_queue_has_no_pending_tasks_001
     * @tc.desc      Verify concurrency new queue has no pending tasks.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_new_queue_has_no_pending_tasks_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_new_queue_has_no_pending_tasks_001');
      let queue: TaskQueue = new TaskQueue();
      expect(queue.pending()).assertEqual(0);
      expect(queue.pending()).assertEqual(0);
      expect(queue.pending() > 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0020
     * @tc.name      concurrency_enqueue_first_task_returns_one_002
     * @tc.desc      Verify concurrency enqueue first task returns one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_first_task_returns_one_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_first_task_returns_one_002');
      let queue: TaskQueue = new TaskQueue();
      let pending: number = queue.enqueue(async (): Promise<number> => {
        return 11;
      });
      expect(pending).assertEqual(1);
      expect(queue.pending()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0030
     * @tc.name      concurrency_enqueue_second_task_returns_two_003
     * @tc.desc      Verify concurrency enqueue second task returns two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_second_task_returns_two_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_second_task_returns_two_003');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        return 1;
      });
      let pending: number = queue.enqueue(async (): Promise<number> => {
        return 2;
      });
      expect(pending).assertEqual(2);
      expect(queue.pending()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0040
     * @tc.name      concurrency_enqueue_third_task_returns_three_004
     * @tc.desc      Verify concurrency enqueue third task returns three.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_third_task_returns_three_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_third_task_returns_three_004');
      let queue: TaskQueue = new TaskQueue();
      let first: number = queue.enqueue(async (): Promise<number> => {
        return 1;
      });
      let second: number = queue.enqueue(async (): Promise<number> => {
        return 2;
      });
      let third: number = queue.enqueue(async (): Promise<number> => {
        return 3;
      });
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(third).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0050
     * @tc.name      concurrency_enqueue_does_not_execute_the_task_005
     * @tc.desc      Verify concurrency enqueue does not execute the task.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_does_not_execute_the_task_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_does_not_execute_the_task_005');
      let executed: number = 0;
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        executed++;
        return 1;
      });
      expect(executed).assertEqual(0);
      expect(queue.pending()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0060
     * @tc.name      concurrency_pending_counts_every_queued_task_006
     * @tc.desc      Verify concurrency pending counts every queued task.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_pending_counts_every_queued_task_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_pending_counts_every_queued_task_006');
      // The helper preloads four tasks; the extra enqueue below raises the count to five.
      let queue: TaskQueue = queueOf([1, 2, 3, 4]);
      expect(queue.pending()).assertEqual(4);
      expect(queue.enqueue(async (): Promise<number> => {
        return 5;
      })).assertEqual(5);
      expect(queue.pending()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0070
     * @tc.name      concurrency_enqueue_return_matches_pending_after_each_add_007
     * @tc.desc      Verify concurrency enqueue return matches pending after each add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_return_matches_pending_after_each_add_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_return_matches_pending_after_each_add_007');
      let queue: TaskQueue = new TaskQueue();
      for (let count: number = 1; count <= 5; count++) {
        let pending: number = queue.enqueue(async (): Promise<number> => {
          return count;
        });
        expect(pending).assertEqual(count);
        expect(queue.pending()).assertEqual(count);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0080
     * @tc.name      concurrency_drain_single_task_returns_its_value_008
     * @tc.desc      Verify concurrency drain single task returns its value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_single_task_returns_its_value_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_single_task_returns_its_value_008');
      let queue: TaskQueue = queueOf([7]);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0090
     * @tc.name      concurrency_drain_two_tasks_returns_both_009
     * @tc.desc      Verify concurrency drain two tasks returns both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_two_tasks_returns_both_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_two_tasks_returns_both_009');
      let queue: TaskQueue = queueOf([3, 4]);
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([3, 4]).length);
      for (let __i151: number = 0; __i151 < ([3, 4]).length; __i151++) {
        expect((results)[__i151]).assertEqual(([3, 4])[__i151]);
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0100
     * @tc.name      concurrency_drain_three_tasks_preserves_order_010
     * @tc.desc      Verify concurrency drain three tasks preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_three_tasks_preserves_order_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_three_tasks_preserves_order_010');
      let queue: TaskQueue = queueOf([10, 20, 30]);
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([10, 20, 30]).length);
      for (let __i152: number = 0; __i152 < ([10, 20, 30]).length; __i152++) {
        expect((results)[__i152]).assertEqual(([10, 20, 30])[__i152]);
      }
      expect(results[0]).assertEqual(10);
      expect(results[2]).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0110
     * @tc.name      concurrency_drain_clears_pending_count_011
     * @tc.desc      Verify concurrency drain clears pending count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_clears_pending_count_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_clears_pending_count_011');
      let queue: TaskQueue = queueOf([1, 2, 3]);
      expect(queue.pending()).assertEqual(3);
      await queue.drain();
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0120
     * @tc.name      concurrency_second_drain_returns_no_results_012
     * @tc.desc      Verify concurrency second drain returns no results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_second_drain_returns_no_results_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_second_drain_returns_no_results_012');
      let queue: TaskQueue = queueOf([1, 2]);
      let first: number[] = await queue.drain();
      let second: number[] = await queue.drain();
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0130
     * @tc.name      concurrency_third_drain_returns_no_results_013
     * @tc.desc      Verify concurrency third drain returns no results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_third_drain_returns_no_results_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_third_drain_returns_no_results_013');
      let queue: TaskQueue = queueOf([5]);
      await queue.drain();
      await queue.drain();
      let third: number[] = await queue.drain();
      expect(third.length).assertEqual(0);
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0140
     * @tc.name      concurrency_drain_empty_queue_returns_empty_014
     * @tc.desc      Verify concurrency drain empty queue returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_empty_queue_returns_empty_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_empty_queue_returns_empty_014');
      let queue: TaskQueue = new TaskQueue();
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(0);
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0150
     * @tc.name      concurrency_enqueue_after_drain_returns_one_015
     * @tc.desc      Verify concurrency enqueue after drain returns one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_after_drain_returns_one_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_after_drain_returns_one_015');
      let queue: TaskQueue = queueOf([1]);
      await queue.drain();
      let pending: number = queue.enqueue(async (): Promise<number> => {
        return 2;
      });
      expect(pending).assertEqual(1);
      expect(queue.pending()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0160
     * @tc.name      concurrency_drain_after_restart_returns_only_new_tasks_016
     * @tc.desc      Verify concurrency drain after restart returns only new tasks.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_after_restart_returns_only_new_tasks_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_after_restart_returns_only_new_tasks_016');
      let queue: TaskQueue = queueOf([1, 2]);
      await queue.drain();
      queue.enqueue(async (): Promise<number> => {
        return 3;
      });
      queue.enqueue(async (): Promise<number> => {
        return 4;
      });
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([3, 4]).length);
      for (let __i153: number = 0; __i153 < ([3, 4]).length; __i153++) {
        expect((results)[__i153]).assertEqual(([3, 4])[__i153]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0170
     * @tc.name      concurrency_drain_runs_each_task_once_017
     * @tc.desc      Verify concurrency drain runs each task once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_runs_each_task_once_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_runs_each_task_once_017');
      let executions: number = 0;
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        executions++;
        return executions;
      });
      queue.enqueue(async (): Promise<number> => {
        executions++;
        return executions;
      });
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([1, 2]).length);
      for (let __i154: number = 0; __i154 < ([1, 2]).length; __i154++) {
        expect((results)[__i154]).assertEqual(([1, 2])[__i154]);
      }
      expect(executions).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0180
     * @tc.name      concurrency_drain_five_tasks_returns_five_results_018
     * @tc.desc      Verify concurrency drain five tasks returns five results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_five_tasks_returns_five_results_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_five_tasks_returns_five_results_018');
      // Five queued tasks must come back in order, so indices 0 and 4 hold the ends.
      let queue: TaskQueue = queueOf([1, 2, 3, 4, 5]);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(1);
      expect(results[4]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0190
     * @tc.name      concurrency_drain_five_tasks_preserves_every_value_019
     * @tc.desc      Verify concurrency drain five tasks preserves every value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_five_tasks_preserves_every_value_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_five_tasks_preserves_every_value_019');
      let queue: TaskQueue = queueOf([11, 12, 13, 14, 15]);
      let results: number[] = await queue.drain();
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index]).assertEqual(11 + index);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0200
     * @tc.name      concurrency_enqueue_hundred_tasks_reports_hundred_pending_020
     * @tc.desc      Verify concurrency enqueue hundred tasks reports hundred pending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_enqueue_hundred_tasks_reports_hundred_pending_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_enqueue_hundred_tasks_reports_hundred_pending_020');
      let queue: TaskQueue = new TaskQueue();
      // One hundred enqueues show the pending counter has no small-queue ceiling.
      for (let index: number = 0; index < 100; index++) {
        queue.enqueue(async (): Promise<number> => {
          return index;
        });
      }
      expect(queue.pending()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0210
     * @tc.name      concurrency_drain_hundred_tasks_returns_hundred_results_021
     * @tc.desc      Verify concurrency drain hundred tasks returns hundred results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_hundred_tasks_returns_hundred_results_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_hundred_tasks_returns_hundred_results_021');
      let values: number[] = [];
      for (let index: number = 0; index < 100; index++) {
        values.push(index);
      }
      let queue: TaskQueue = queueOf(values);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(100);
      expect(results[0]).assertEqual(0);
      expect(results[99]).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0220
     * @tc.name      concurrency_drain_hundred_tasks_preserves_every_index_022
     * @tc.desc      Verify concurrency drain hundred tasks preserves every index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_hundred_tasks_preserves_every_index_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_hundred_tasks_preserves_every_index_022');
      let values: number[] = [];
      for (let index: number = 0; index < 100; index++) {
        values.push(index);
      }
      let queue: TaskQueue = queueOf(values);
      let results: number[] = await queue.drain();
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index]).assertEqual(index);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0230
     * @tc.name      concurrency_drain_hundred_tasks_runs_each_once_023
     * @tc.desc      Verify concurrency drain hundred tasks runs each once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_hundred_tasks_runs_each_once_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_hundred_tasks_runs_each_once_023');
      let executions: number = 0;
      let queue: TaskQueue = new TaskQueue();
      // One shared counter across 100 tasks: 100 is only reached if every task ran exactly once.
      for (let index: number = 0; index < 100; index++) {
        queue.enqueue(async (): Promise<number> => {
          executions++;
          return executions;
        });
      }
      await queue.drain();
      expect(executions).assertEqual(100);
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0240
     * @tc.name      concurrency_task_can_return_zero_024
     * @tc.desc      Verify concurrency task can return zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_task_can_return_zero_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_task_can_return_zero_024');
      let queue: TaskQueue = queueOf([0]);
      let results: number[] = await queue.drain();
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0250
     * @tc.name      concurrency_task_can_return_negative_value_025
     * @tc.desc      Verify concurrency task can return negative value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_task_can_return_negative_value_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_task_can_return_negative_value_025');
      let queue: TaskQueue = queueOf([-5, -1]);
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([-5, -1]).length);
      for (let __i155: number = 0; __i155 < ([-5, -1]).length; __i155++) {
        expect((results)[__i155]).assertEqual(([-5, -1])[__i155]);
      }
      expect(results[0] < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0260
     * @tc.name      concurrency_drain_keeps_duplicate_values_026
     * @tc.desc      Verify concurrency drain keeps duplicate values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_keeps_duplicate_values_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_keeps_duplicate_values_026');
      let queue: TaskQueue = queueOf([4, 4, 4]);
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([4, 4, 4]).length);
      for (let __i156: number = 0; __i156 < ([4, 4, 4]).length; __i156++) {
        expect((results)[__i156]).assertEqual(([4, 4, 4])[__i156]);
      }
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0270
     * @tc.name      concurrency_drain_sum_matches_enqueued_values_027
     * @tc.desc      Verify concurrency drain sum matches enqueued values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_sum_matches_enqueued_values_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_sum_matches_enqueued_values_027');
      let queue: TaskQueue = queueOf([2, 4, 6, 8]);
      let results: number[] = await queue.drain();
      let sum: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        sum += results[index];
      }
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0280
     * @tc.name      concurrency_task_reads_the_captured_variable_at_drain_028
     * @tc.desc      Verify concurrency task reads the captured variable at drain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_task_reads_the_captured_variable_at_drain_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_task_reads_the_captured_variable_at_drain_028');
      let value: number = 5;
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        return value;
      });
      // The task captures the binding, so drain sees 99 rather than the 5 present at enqueue time.
      value = 99;
      let results: number[] = await queue.drain();
      expect(results[0]).assertEqual(99);
      expect(value).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0290
     * @tc.name      concurrency_drain_propagates_a_task_rejection_029
     * @tc.desc      Verify concurrency drain propagates a task rejection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_propagates_a_task_rejection_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_propagates_a_task_rejection_029');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        throw new Error('task failed');
      });
      let __thrown164: boolean = false;
      try {
        await (async (): Promise<void> => {
        await queue.drain();
      })();
      } catch (error) {
        __thrown164 = true;
      }
      expect(__thrown164).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0300
     * @tc.name      concurrency_rejection_leaves_following_tasks_pending_030
     * @tc.desc      Verify concurrency rejection leaves following tasks pending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_rejection_leaves_following_tasks_pending_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_rejection_leaves_following_tasks_pending_030');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        return 1;
      });
      queue.enqueue(async (): Promise<number> => {
        throw new Error('second task failed');
      });
      queue.enqueue(async (): Promise<number> => {
        return 3;
      });
      let thrown: boolean = false;
      try {
        await queue.drain();
      } catch (error) {
        thrown = true;
      }

      // The second task throws, so drain stops there and the third task is still queued.
      expect(thrown).assertTrue();
      expect(queue.pending()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0310
     * @tc.name      concurrency_drain_after_rejection_processes_remaining_task_031
     * @tc.desc      Verify concurrency drain after rejection processes remaining task.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_drain_after_rejection_processes_remaining_task_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_drain_after_rejection_processes_remaining_task_031');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        return 1;
      });
      queue.enqueue(async (): Promise<number> => {
        throw new Error('second task failed');
      });
      queue.enqueue(async (): Promise<number> => {
        return 3;
      });
      let thrown: boolean = false;
      try {
        await queue.drain();
      } catch (error) {
        thrown = true;
      }

      expect(thrown).assertTrue();
      let remaining: number[] = await queue.drain();
      expect((remaining).length).assertEqual(([3]).length);
      for (let __i157: number = 0; __i157 < ([3]).length; __i157++) {
        expect((remaining)[__i157]).assertEqual(([3])[__i157]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0320
     * @tc.name      concurrency_rejection_of_first_task_leaves_two_pending_032
     * @tc.desc      Verify concurrency rejection of first task leaves two pending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_rejection_of_first_task_leaves_two_pending_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_rejection_of_first_task_leaves_two_pending_032');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        throw new Error('first task failed');
      });
      queue.enqueue(async (): Promise<number> => {
        return 2;
      });
      queue.enqueue(async (): Promise<number> => {
        return 3;
      });
      let thrown: boolean = false;
      try {
        await queue.drain();
      } catch (error) {
        thrown = true;
      }

      // The very first task throws, leaving the second and third tasks untouched in the queue.
      expect(thrown).assertTrue();
      expect(queue.pending()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0330
     * @tc.name      concurrency_rejection_of_last_task_leaves_zero_pending_033
     * @tc.desc      Verify concurrency rejection of last task leaves zero pending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_rejection_of_last_task_leaves_zero_pending_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_rejection_of_last_task_leaves_zero_pending_033');
      let queue: TaskQueue = new TaskQueue();
      queue.enqueue(async (): Promise<number> => {
        return 1;
      });
      queue.enqueue(async (): Promise<number> => {
        throw new Error('last task failed');
      });
      let thrown: boolean = false;
      try {
        await queue.drain();
      } catch (error) {
        thrown = true;
      }

      expect(thrown).assertTrue();
      expect(queue.pending()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0340
     * @tc.name      concurrency_two_queues_are_independent_034
     * @tc.desc      Verify concurrency two queues are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_two_queues_are_independent_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_two_queues_are_independent_034');
      let first: TaskQueue = queueOf([1, 2]);
      let second: TaskQueue = queueOf([9]);
      let firstResults: number[] = await first.drain();
      expect((firstResults).length).assertEqual(([1, 2]).length);
      for (let __i158: number = 0; __i158 < ([1, 2]).length; __i158++) {
        expect((firstResults)[__i158]).assertEqual(([1, 2])[__i158]);
      }
      expect(second.pending()).assertEqual(1);
      let secondResults: number[] = await second.drain();
      expect((secondResults).length).assertEqual(([9]).length);
      for (let __i159: number = 0; __i159 < ([9]).length; __i159++) {
        expect((secondResults)[__i159]).assertEqual(([9])[__i159]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0350
     * @tc.name      concurrency_queue_is_reusable_after_a_single_task_drain_035
     * @tc.desc      Verify concurrency queue is reusable after a single task drain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_queue_is_reusable_after_a_single_task_drain_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_queue_is_reusable_after_a_single_task_drain_035');
      let queue: TaskQueue = queueOf([1]);
      await queue.drain();
      queue.enqueue(async (): Promise<number> => {
        return 2;
      });
      let results: number[] = await queue.drain();
      expect((results).length).assertEqual(([2]).length);
      for (let __i160: number = 0; __i160 < ([2]).length; __i160++) {
        expect((results)[__i160]).assertEqual(([2])[__i160]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0360
     * @tc.name      concurrency_promise_all_sum_matches_sync_sum_036
     * @tc.desc      Verify concurrency promise all sum matches sync sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_sum_matches_sync_sum_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_sum_matches_sync_sum_036');
      // 100 + 200 + 300 = 600 cents, the same whether folded through promises or synchronously.
      let values: Money[] = moneyList([100, 200, 300]);
      let promises: Promise<Money>[] = [];
      for (let index: number = 0; index < values.length; index++) {
        promises.push(addMoneyAsync(values[index], new Money(0)));
      }
      let results: Money[] = await Promise.all(promises);
      let asyncSum: Money = Money.sum(results);
      let syncSum: Money = Money.sum(values);
      expect(asyncSum.cents()).assertEqual(syncSum.cents());
      expect(asyncSum.cents()).assertEqual(600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0370
     * @tc.name      concurrency_promise_all_sum_of_two_values_037
     * @tc.desc      Verify concurrency promise all sum of two values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_sum_of_two_values_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_sum_of_two_values_037');
      let promises: Promise<Money>[] = [
        addMoneyAsync(new Money(120), new Money(30)),
        addMoneyAsync(new Money(200), new Money(40))
      ];
      let results: Money[] = await Promise.all(promises);
      expect(results.length).assertEqual(2);
      expect(results[0].cents()).assertEqual(150);
      expect(results[1].cents()).assertEqual(240);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0380
     * @tc.name      concurrency_promise_all_empty_returns_empty_array_038
     * @tc.desc      Verify concurrency promise all empty returns empty array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_empty_returns_empty_array_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_empty_returns_empty_array_038');
      let promises: Promise<Money>[] = [];
      let results: Money[] = await Promise.all(promises);
      expect(results.length).assertEqual(0);
      expect(Money.sum(results).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0390
     * @tc.name      concurrency_promise_all_preserves_input_order_039
     * @tc.desc      Verify concurrency promise all preserves input order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_preserves_input_order_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_preserves_input_order_039');
      let cents: number[] = [5, 10, 15, 20];
      let promises: Promise<Money>[] = [];
      for (let index: number = 0; index < cents.length; index++) {
        promises.push(addMoneyAsync(new Money(cents[index]), new Money(0)));
      }
      let results: Money[] = await Promise.all(promises);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].cents()).assertEqual(cents[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0400
     * @tc.name      concurrency_promise_all_of_yuan_matches_sync_040
     * @tc.desc      Verify concurrency promise all of yuan matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_of_yuan_matches_sync_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_of_yuan_matches_sync_040');
      let promises: Promise<Money>[] = [];
      for (let index: number = 1; index <= 4; index++) {
        // ofYuan scales by 100, so this loop's 1..4 becomes 100, 200, 300, 400 cents.
        let yuan: number = index;
        promises.push(Promise.resolve(Money.ofYuan(yuan)));
      }
      let results: Money[] = await Promise.all(promises);
      expect(results[0].cents()).assertEqual(100);
      expect(results[3].cents()).assertEqual(400);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0410
     * @tc.name      concurrency_promise_all_percentage_matches_sync_041
     * @tc.desc      Verify concurrency promise all percentage matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_percentage_matches_sync_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_percentage_matches_sync_041');
      let base: Money = new Money(10000);
      let promises: Promise<Money>[] = [
        Promise.resolve(base.percentage(10)),
        Promise.resolve(base.percentage(50)),
        Promise.resolve(base.percentage(100))
      ];
      let results: Money[] = await Promise.all(promises);
      expect(results[0].cents()).assertEqual(1000);
      expect(results[1].cents()).assertEqual(5000);
      expect(results[2].cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0420
     * @tc.name      concurrency_promise_all_multiply_matches_sync_042
     * @tc.desc      Verify concurrency promise all multiply matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_multiply_matches_sync_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_multiply_matches_sync_042');
      let base: Money = new Money(250);
      let promises: Promise<Money>[] = [];
      for (let quantity: number = 1; quantity <= 4; quantity++) {
        promises.push(multiplyMoneyAsync(base, quantity));
      }
      let results: Money[] = await Promise.all(promises);
      expect(results[0].cents()).assertEqual(250);
      expect(results[3].cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0430
     * @tc.name      concurrency_promise_all_subtract_matches_sync_043
     * @tc.desc      Verify concurrency promise all subtract matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_subtract_matches_sync_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_subtract_matches_sync_043');
      let base: Money = new Money(1000);
      let promises: Promise<Money>[] = [
        Promise.resolve(base.subtract(new Money(100))),
        Promise.resolve(base.subtract(new Money(250)))
      ];
      let results: Money[] = await Promise.all(promises);
      expect(results[0].cents()).assertEqual(900);
      expect(results[1].cents()).assertEqual(750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0440
     * @tc.name      concurrency_promise_all_clamp_matches_sync_044
     * @tc.desc      Verify concurrency promise all clamp matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_clamp_matches_sync_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_clamp_matches_sync_044');
      let promises: Promise<Money>[] = [
        // Clamping a negative amount yields 0, while 10 cents passes through unchanged.
        Promise.resolve(new Money(-10).clampAtZero()),
        Promise.resolve(new Money(10).clampAtZero())
      ];
      let results: Money[] = await Promise.all(promises);
      expect(results[0].cents()).assertEqual(0);
      expect(results[1].cents()).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0450
     * @tc.name      concurrency_promise_all_rejects_negative_multiply_045
     * @tc.desc      Verify concurrency promise all rejects negative multiply.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_rejects_negative_multiply_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_rejects_negative_multiply_045');
      let promises: Promise<Money>[] = [
        Promise.resolve(new Money(100)),
        // A negative multiplier is invalid, so this promise rejects and Promise.all surfaces it.
        multiplyMoneyAsync(new Money(100), -1)
      ];
      let __thrown165: boolean = false;
      try {
        await (async (): Promise<void> => {
        await Promise.all(promises);
      })();
      } catch (error) {
        __thrown165 = true;
      }
      expect(__thrown165).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0460
     * @tc.name      concurrency_promise_all_rejects_percent_above_hundred_046
     * @tc.desc      Verify concurrency promise all rejects percent above hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_rejects_percent_above_hundred_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_rejects_percent_above_hundred_046');
      let promises: Promise<Money>[] = [
        Promise.resolve(new Money(100).percentage(10)),
        // 100 percent is the ceiling, so 101 is the first percentage that must be rejected.
        percentageMoneyAsync(new Money(100), 101)
      ];
      let __thrown166: boolean = false;
      try {
        await (async (): Promise<void> => {
        await Promise.all(promises);
      })();
      } catch (error) {
        __thrown166 = true;
      }
      expect(__thrown166).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0470
     * @tc.name      concurrency_promise_all_rejects_negative_percent_047
     * @tc.desc      Verify concurrency promise all rejects negative percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_rejects_negative_percent_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_rejects_negative_percent_047');
      let promises: Promise<Money>[] = [
        percentageMoneyAsync(new Money(100), -1)
      ];
      let __thrown167: boolean = false;
      try {
        await (async (): Promise<void> => {
        await Promise.all(promises);
      })();
      } catch (error) {
        __thrown167 = true;
      }
      expect(__thrown167).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0480
     * @tc.name      concurrency_async_add_zero_is_identity_048
     * @tc.desc      Verify concurrency async add zero is identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_add_zero_is_identity_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_add_zero_is_identity_048');
      let original: Money = new Money(4321);
      let result: Money = await addMoneyAsync(original, Money.zero());
      expect(result.cents()).assertEqual(original.cents());
      expect(result.equals(original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0490
     * @tc.name      concurrency_async_add_negative_amounts_049
     * @tc.desc      Verify concurrency async add negative amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_add_negative_amounts_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_add_negative_amounts_049');
      let result: Money = await addMoneyAsync(new Money(100), new Money(-250));
      expect(result.cents()).assertEqual(-150);
      expect(result.isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0500
     * @tc.name      concurrency_async_subtract_can_go_negative_050
     * @tc.desc      Verify concurrency async subtract can go negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_subtract_can_go_negative_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_subtract_can_go_negative_050');
      let result: Money = await Promise.resolve(new Money(100).subtract(new Money(150)));
      expect(result.cents()).assertEqual(-50);
      expect(result.isNegative()).assertTrue();
      expect(result.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0510
     * @tc.name      concurrency_async_compare_matches_sync_051
     * @tc.desc      Verify concurrency async compare matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_compare_matches_sync_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_compare_matches_sync_051');
      let lower: Money = new Money(100);
      let higher: Money = new Money(200);
      let comparison: number = await Promise.resolve(lower.compareTo(higher));
      expect(comparison).assertEqual(-1);
      expect(lower.compareTo(lower)).assertEqual(0);
      expect(higher.compareTo(lower)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0520
     * @tc.name      concurrency_hundred_async_sums_match_single_sync_sum_052
     * @tc.desc      Verify concurrency hundred async sums match single sync sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_hundred_async_sums_match_single_sync_sum_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_hundred_async_sums_match_single_sync_sum_052');
      let promises: Promise<Money>[] = [];
      for (let index: number = 0; index < 100; index++) {
        promises.push(Promise.resolve(new Money(10)));
      }
      let results: Money[] = await Promise.all(promises);
      let asyncSum: Money = Money.sum(results);
      expect(asyncSum.cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0530
     * @tc.name      concurrency_fifty_values_preserve_order_053
     * @tc.desc      Verify concurrency fifty values preserve order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_fifty_values_preserve_order_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_fifty_values_preserve_order_053');
      let promises: Promise<Money>[] = [];
      for (let index: number = 0; index < 50; index++) {
        promises.push(Promise.resolve(new Money(index)));
      }
      let results: Money[] = await Promise.all(promises);
      expect(results.length).assertEqual(50);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].cents()).assertEqual(index);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0540
     * @tc.name      concurrency_async_money_instances_are_independent_054
     * @tc.desc      Verify concurrency async money instances are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_money_instances_are_independent_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_money_instances_are_independent_054');
      let first: Money = new Money(100);
      let second: Money = new Money(200);
      let results: Money[] = await Promise.all([
        addMoneyAsync(first, new Money(50)),
        addMoneyAsync(second, new Money(50))
      ]);
      expect(results[0].cents()).assertEqual(150);
      expect(results[1].cents()).assertEqual(250);
      expect(first.cents()).assertEqual(100);
      expect(second.cents()).assertEqual(200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0550
     * @tc.name      concurrency_rejection_does_not_affect_an_independent_result_055
     * @tc.desc      Verify concurrency rejection does not affect an independent result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_rejection_does_not_affect_an_independent_result_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_rejection_does_not_affect_an_independent_result_055');
      let good: Promise<Money> = addMoneyAsync(new Money(10), new Money(20));
      let bad: Promise<Money> = multiplyMoneyAsync(new Money(10), -2);
      let __thrown168: boolean = false;
      try {
        await (async (): Promise<void> => {
        await bad;
      })();
      } catch (error) {
        __thrown168 = true;
      }
      expect(__thrown168).assertTrue();
      let result: Money = await good;
      expect(result.cents()).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0560
     * @tc.name      concurrency_mixed_operations_match_sync_056
     * @tc.desc      Verify concurrency mixed operations match sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_mixed_operations_match_sync_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_mixed_operations_match_sync_056');
      let base: Money = new Money(1000);
      let results: Money[] = await Promise.all([
        Promise.resolve(base.add(new Money(100))),
        Promise.resolve(base.subtract(new Money(100))),
        Promise.resolve(base.multiply(2)),
        Promise.resolve(base.percentage(10))
      ]);
      expect(results[0].cents()).assertEqual(1100);
      expect(results[1].cents()).assertEqual(900);
      expect(results[2].cents()).assertEqual(2000);
      expect(results[3].cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0570
     * @tc.name      concurrency_async_sum_of_empty_money_list_is_zero_057
     * @tc.desc      Verify concurrency async sum of empty money list is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_sum_of_empty_money_list_is_zero_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_sum_of_empty_money_list_is_zero_057');
      let empty: Money[] = [];
      let result: Money = await Promise.resolve(Money.sum(empty));
      expect(result.cents()).assertEqual(0);
      expect(result.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0580
     * @tc.name      concurrency_async_cents_conversion_matches_sync_058
     * @tc.desc      Verify concurrency async cents conversion matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_cents_conversion_matches_sync_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_cents_conversion_matches_sync_058');
      // 12345 cents formats as ¥123.45: the value divided by 100 with two decimals.
      let money: Money = new Money(12345);
      let cents: number = await Promise.resolve(money.cents());
      expect(cents).assertEqual(12345);
      expect(money.format()).assertEqual('¥123.45');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0590
     * @tc.name      concurrency_promise_all_ten_sums_match_sync_059
     * @tc.desc      Verify concurrency promise all ten sums match sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_ten_sums_match_sync_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_ten_sums_match_sync_059');
      let promises: Promise<Money>[] = [];
      for (let index: number = 1; index <= 10; index++) {
        promises.push(addMoneyAsync(new Money(index), new Money(index)));
      }
      let results: Money[] = await Promise.all(promises);
      // Each task adds index to itself, so the sync total is the sum of index * 2 for 1..10 = 110.
      let expected: number = 0;
      for (let index: number = 1; index <= 10; index++) {
        expected += index * 2;
      }
      expect(Money.sum(results).cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0600
     * @tc.name      concurrency_two_carts_are_independent_060
     * @tc.desc      Verify concurrency two carts are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_two_carts_are_independent_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_two_carts_are_independent_060');
      let first: Cart = new Cart();
      let second: Cart = new Cart();
      let firstJobs: Promise<number>[] = [addAsync(first, 1, 1000, 2)];
      let secondJobs: Promise<number>[] = [addAsync(second, 2, 2000, 3)];
      await Promise.all(firstJobs);
      await Promise.all(secondJobs);
      expect(first.quantityOf(1)).assertEqual(2);
      expect(second.quantityOf(2)).assertEqual(3);
      expect(first.quantityOf(2)).assertEqual(0);
      expect(second.quantityOf(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0610
     * @tc.name      concurrency_concurrent_adds_to_two_carts_do_not_mix_061
     * @tc.desc      Verify concurrency concurrent adds to two carts do not mix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_concurrent_adds_to_two_carts_do_not_mix_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_concurrent_adds_to_two_carts_do_not_mix_061');
      let first: Cart = new Cart();
      let second: Cart = new Cart();
      let jobs: Promise<number>[] = [
        addAsync(first, 1, 1000, 1),
        addAsync(second, 2, 2000, 2),
        addAsync(first, 3, 3000, 3),
        addAsync(second, 4, 4000, 4)
      ];
      await Promise.all(jobs);
      expect(first.distinctCount()).assertEqual(2);
      expect(second.distinctCount()).assertEqual(2);
      expect(first.quantityOf(3)).assertEqual(3);
      expect(second.quantityOf(4)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0620
     * @tc.name      concurrency_concurrent_adds_of_different_goods_make_two_lines_062
     * @tc.desc      Verify concurrency concurrent adds of different goods make two lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_concurrent_adds_of_different_goods_make_two_lines_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_concurrent_adds_of_different_goods_make_two_lines_062');
      let cart: Cart = new Cart();
      let jobs: Promise<number>[] = [
        addAsync(cart, 1, 1000, 1),
        addAsync(cart, 2, 2000, 1)
      ];
      await Promise.all(jobs);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.contains(1)).assertTrue();
      expect(cart.contains(2)).assertTrue();
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0630
     * @tc.name      concurrency_concurrent_adds_of_same_good_make_one_line_063
     * @tc.desc      Verify concurrency concurrent adds of same good make one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_concurrent_adds_of_same_good_make_one_line_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_concurrent_adds_of_same_good_make_one_line_063');
      let cart: Cart = new Cart();
      let jobs: Promise<number>[] = [];
      for (let index: number = 0; index < 5; index++) {
        // Five concurrent adds of goods 7 must still collapse into a single line of quantity 5.
        jobs.push(addAsync(cart, 7, 1000, 1));
      }
      await Promise.all(jobs);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.quantityOf(7)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0640
     * @tc.name      concurrency_promise_all_cart_quantities_match_jobs_064
     * @tc.desc      Verify concurrency promise all cart quantities match jobs.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_promise_all_cart_quantities_match_jobs_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_promise_all_cart_quantities_match_jobs_064');
      let goodsIds: number[] = [7, 1];
      let deltas: number[][] = [[2, 3, 4], [1, 2, 3]];
      // Running quantities per row: 2, 2+3=5, 5+4=9 and 1, 1+2=3, 3+3=6.
      let expected: number[][] = [[2, 5, 9], [1, 3, 6]];

      expect(goodsIds.length).assertEqual(deltas.length);
      for (let row: number = 0; row < goodsIds.length; row++) {
        let cart: Cart = new Cart();
        let jobs: Promise<number>[] = [];
        for (let column: number = 0; column < deltas[row].length; column++) {
          jobs.push(addAsync(cart, goodsIds[row], 1000, deltas[row][column]));
        }
        let quantities: number[] = await Promise.all(jobs);
        expect((quantities).length).assertEqual((expected[row]).length);
        for (let __i161: number = 0; __i161 < (expected[row]).length; __i161++) {
          expect((quantities)[__i161]).assertEqual((expected[row])[__i161]);
        }
        expect(cart.quantityOf(goodsIds[row])).assertEqual(expected[row][expected[row].length - 1]);
        expect(cart.distinctCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0650
     * @tc.name      concurrency_concurrent_adds_of_same_good_are_deterministic_065
     * @tc.desc      Verify concurrency concurrent adds of same good are deterministic.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_concurrent_adds_of_same_good_are_deterministic_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_concurrent_adds_of_same_good_are_deterministic_065');
      let cart: Cart = new Cart();
      let jobs: Promise<number>[] = [];
      for (let index: number = 0; index < 5; index++) {
        jobs.push(addAsync(cart, 9, 500, 1));
      }
      let quantities: number[] = await Promise.all(jobs);
      expect((quantities).length).assertEqual(([1, 2, 3, 4, 5]).length);
      for (let __i162: number = 0; __i162 < ([1, 2, 3, 4, 5]).length; __i162++) {
        expect((quantities)[__i162]).assertEqual(([1, 2, 3, 4, 5])[__i162]);
      }
      expect(cart.quantityOf(9)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0660
     * @tc.name      concurrency_repeated_same_cart_runs_give_same_result_066
     * @tc.desc      Verify concurrency repeated same cart runs give same result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_repeated_same_cart_runs_give_same_result_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_repeated_same_cart_runs_give_same_result_066');
      let firstCart: Cart = new Cart();
      let secondCart: Cart = new Cart();
      let firstJobs: Promise<number>[] = [];
      let secondJobs: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        firstJobs.push(addAsync(firstCart, 4, 100, 1));
        secondJobs.push(addAsync(secondCart, 4, 100, 1));
      }
      let firstQuantities: number[] = await Promise.all(firstJobs);
      let secondQuantities: number[] = await Promise.all(secondJobs);
      expect((firstQuantities).length).assertEqual((secondQuantities).length);
      for (let __i163: number = 0; __i163 < (secondQuantities).length; __i163++) {
        expect((firstQuantities)[__i163]).assertEqual((secondQuantities)[__i163]);
      }
      expect(firstCart.quantityOf(4)).assertEqual(secondCart.quantityOf(4));
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0670
     * @tc.name      concurrency_async_subtotal_matches_sync_subtotal_067
     * @tc.desc      Verify concurrency async subtotal matches sync subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_subtotal_matches_sync_subtotal_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_subtotal_matches_sync_subtotal_067');
      // 1000 x 2 plus 500 x 3 gives the 3500 cents both the async and sync carts report.
      let asyncCart: Cart = new Cart();
      let syncCart: Cart = new Cart();
      await addAsync(asyncCart, 1, 1000, 2);
      await addAsync(asyncCart, 2, 500, 3);
      syncCart.add(1, 1000, 2);
      syncCart.add(2, 500, 3);
      expect(asyncCart.subtotal().cents()).assertEqual(syncCart.subtotal().cents());
      expect(asyncCart.subtotal().cents()).assertEqual(3500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0680
     * @tc.name      concurrency_async_total_quantity_matches_sync_068
     * @tc.desc      Verify concurrency async total quantity matches sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_total_quantity_matches_sync_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_total_quantity_matches_sync_068');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 2),
        addAsync(cart, 2, 200, 3)
      ]);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0690
     * @tc.name      concurrency_async_distinct_count_matches_lines_069
     * @tc.desc      Verify concurrency async distinct count matches lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_distinct_count_matches_lines_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_distinct_count_matches_lines_069');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 1),
        addAsync(cart, 2, 200, 1),
        addAsync(cart, 3, 300, 1)
      ]);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.allLines().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0700
     * @tc.name      concurrency_async_cart_contains_after_adds_070
     * @tc.desc      Verify concurrency async cart contains after adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_cart_contains_after_adds_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_cart_contains_after_adds_070');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 5, 100, 1),
        addAsync(cart, 6, 200, 1)
      ]);
      expect(cart.contains(5)).assertTrue();
      expect(cart.contains(6)).assertTrue();
      expect(cart.contains(7)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0710
     * @tc.name      concurrency_async_remove_after_adds_071
     * @tc.desc      Verify concurrency async remove after adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_remove_after_adds_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_remove_after_adds_071');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 5, 100, 1),
        addAsync(cart, 6, 200, 1)
      ]);
      expect(cart.remove(5)).assertTrue();
      expect(cart.contains(5)).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0720
     * @tc.name      concurrency_async_clear_after_adds_072
     * @tc.desc      Verify concurrency async clear after adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_clear_after_adds_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_clear_after_adds_072');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 2),
        addAsync(cart, 2, 200, 3)
      ]);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0730
     * @tc.name      concurrency_async_selection_after_adds_073
     * @tc.desc      Verify concurrency async selection after adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_selection_after_adds_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_selection_after_adds_073');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 2),
        addAsync(cart, 2, 200, 3)
      ]);
      expect(cart.setSelected(2, false)).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.selectedLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0740
     * @tc.name      concurrency_async_snapshot_after_adds_074
     * @tc.desc      Verify concurrency async snapshot after adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_snapshot_after_adds_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_snapshot_after_adds_074');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 2),
        addAsync(cart, 2, 200, 3)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(2);
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(snapshot.lines[1].quantity).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0750
     * @tc.name      concurrency_async_restore_snapshot_matches_totals_075
     * @tc.desc      Verify concurrency async restore snapshot matches totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_restore_snapshot_matches_totals_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_restore_snapshot_matches_totals_075');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 100, 2),
        addAsync(cart, 2, 200, 3)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.distinctCount()).assertEqual(2);
      expect(restored.subtotal().cents()).assertEqual(cart.subtotal().cents());
      expect(restored.totalQuantity()).assertEqual(cart.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0760
     * @tc.name      concurrency_async_add_respects_stock_076
     * @tc.desc      Verify concurrency async add respects stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_add_respects_stock_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_add_respects_stock_076');
      let cart: Cart = new Cart();
      // The fourth argument is stock 10; a request for 3 fits, so all three units are accepted.
      let accepted: number = await Promise.resolve(cart.add(1, 100, 10, 3));
      expect(accepted).assertEqual(3);
      expect(cart.quantityOf(1)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0770
     * @tc.name      concurrency_async_set_quantity_after_add_077
     * @tc.desc      Verify concurrency async set quantity after add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_set_quantity_after_add_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_set_quantity_after_add_077');
      let cart: Cart = new Cart();
      await addAsync(cart, 1, 100, 2);
      let updated: number = await Promise.resolve(cart.setQuantity(1, 7));
      expect(updated).assertEqual(7);
      expect(cart.quantityOf(1)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0780
     * @tc.name      concurrency_async_increase_after_add_078
     * @tc.desc      Verify concurrency async increase after add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_increase_after_add_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_increase_after_add_078');
      let cart: Cart = new Cart();
      await addAsync(cart, 1, 100, 2);
      let updated: number = await Promise.resolve(cart.increase(1, 3));
      expect(updated).assertEqual(5);
      expect(cart.totalQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0790
     * @tc.name      concurrency_async_decrease_after_add_079
     * @tc.desc      Verify concurrency async decrease after add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_decrease_after_add_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_decrease_after_add_079');
      let cart: Cart = new Cart();
      await addAsync(cart, 1, 100, 5);
      let updated: number = await Promise.resolve(cart.decrease(1, 2));
      expect(updated).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0800
     * @tc.name      concurrency_async_mixed_cart_totals_match_sync_080
     * @tc.desc      Verify concurrency async mixed cart totals match sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_mixed_cart_totals_match_sync_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_mixed_cart_totals_match_sync_080');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 1, 1000, 1),
        addAsync(cart, 2, 500, 2)
      ]);
      // 1000 x 1 + 500 x 2 = 2000 cents, split across two lines.
      expect(cart.allLinesSubtotal().cents()).assertEqual(2000);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0810
     * @tc.name      concurrency_async_cart_line_order_follows_adds_081
     * @tc.desc      Verify concurrency async cart line order follows adds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_cart_line_order_follows_adds_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_cart_line_order_follows_adds_081');
      let cart: Cart = new Cart();
      await Promise.all([
        addAsync(cart, 3, 300, 1),
        addAsync(cart, 1, 100, 1),
        addAsync(cart, 2, 200, 1)
      ]);
      expect(cart.allLines()[0].goodsId).assertEqual(3);
      expect(cart.allLines()[1].goodsId).assertEqual(1);
      expect(cart.allLines()[2].goodsId).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0820
     * @tc.name      concurrency_three_carts_stay_independent_082
     * @tc.desc      Verify concurrency three carts stay independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_three_carts_stay_independent_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_three_carts_stay_independent_082');
      let first: Cart = new Cart();
      let second: Cart = new Cart();
      let third: Cart = new Cart();
      await Promise.all([
        addAsync(first, 1, 100, 1),
        addAsync(second, 2, 200, 2),
        addAsync(third, 3, 300, 3)
      ]);
      expect(first.totalQuantity()).assertEqual(1);
      expect(second.totalQuantity()).assertEqual(2);
      expect(third.totalQuantity()).assertEqual(3);
      expect(first.subtotal().cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0830
     * @tc.name      concurrency_async_zero_quantity_leaves_cart_empty_083
     * @tc.desc      Verify concurrency async zero quantity leaves cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_zero_quantity_leaves_cart_empty_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_zero_quantity_leaves_cart_empty_083');
      let cart: Cart = new Cart();
      // Quantity 0 is a no-op rather than a failure: nothing is accepted and no line appears.
      let accepted: number = await addAsync(cart, 1, 100, 0);
      expect(accepted).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MODEL_CONCURRENCY_0840
     * @tc.name      concurrency_async_negative_quantity_leaves_cart_empty_084
     * @tc.desc      Verify concurrency async negative quantity leaves cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('concurrency_async_negative_quantity_leaves_cart_empty_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: concurrency_async_negative_quantity_leaves_cart_empty_084');
      let cart: Cart = new Cart();
      // A negative quantity is refused the same way, leaving goods 1 absent from the cart.
      let accepted: number = await addAsync(cart, 1, 100, -2);
      expect(accepted).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.contains(1)).assertFalse();
    });
  });
}
