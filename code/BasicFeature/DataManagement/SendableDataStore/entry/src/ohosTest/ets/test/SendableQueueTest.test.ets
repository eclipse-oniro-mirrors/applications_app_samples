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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import { SendableQueueManager } from '../../../main/ets/sendablequeue/SendableQueueManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function sendableQueueTest(): void {
  describe('SendableQueueTest', () => {
    let manager: SendableQueueManager = new SendableQueueManager();

    beforeAll(() => {
      addLog('SendableQueueTest suite started');
    })

    beforeEach(() => {
      manager = new SendableQueueManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('SendableQueueTest suite finished');
    })



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0100
     * @tc.name: testSendableQueue0001
     * @tc.desc: Verify initializeFIFO succeeds with valid capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0001', 0, (done: Function) => {
      runCase('testSendableQueue0001', async (): Promise<void> => {
        const result: string = manager.initializeFIFO(100);
        addLog('testSendableQueue0001: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getQueueType()).assertEqual('FIFO');
        expect(manager.getCapacity()).assertEqual(100);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0200
     * @tc.name: testSendableQueue0002
     * @tc.desc: Verify initializeLIFO sets queue type to LIFO.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0002', 0, (done: Function) => {
      runCase('testSendableQueue0002', async (): Promise<void> => {
        const result: string = manager.initializeLIFO(50);
        addLog('testSendableQueue0002: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.getQueueType()).assertEqual('LIFO');
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0300
     * @tc.name: testSendableQueue0003
     * @tc.desc: Verify initializePriority sets queue type to PRIORITY.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0003', 0, (done: Function) => {
      runCase('testSendableQueue0003', async (): Promise<void> => {
        const result: string = manager.initializePriority(30);
        addLog('testSendableQueue0003: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.getQueueType()).assertEqual('PRIORITY');
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0400
     * @tc.name: testSendableQueue0004
     * @tc.desc: Verify initializeFIFO fails with zero capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0004', 0, (done: Function) => {
      runCase('testSendableQueue0004', async (): Promise<void> => {
        const result: string = manager.initializeFIFO(0);
        addLog('testSendableQueue0004: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(10000);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0500
     * @tc.name: testSendableQueue0005
     * @tc.desc: Verify enqueueString and dequeue work in FIFO order.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0005', 0, (done: Function) => {
      runCase('testSendableQueue0005', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('first', 5);
        manager.enqueueString('second', 5);
        const d1: string = manager.dequeue();
        addLog('testSendableQueue0005: dequeue=%{public}s', d1);
        expect(d1.indexOf('first')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0600
     * @tc.name: testSendableQueue0006
     * @tc.desc: Verify dequeue fails on empty queue.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0006', 0, (done: Function) => {
      runCase('testSendableQueue0006', async (): Promise<void> => {
        manager.initializeFIFO(10);
        const result: string = manager.dequeue();
        addLog('testSendableQueue0006: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isEmpty()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0700
     * @tc.name: testSendableQueue0007
     * @tc.desc: Verify enqueueString fails when queue is full.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0007', 0, (done: Function) => {
      runCase('testSendableQueue0007', async (): Promise<void> => {
        manager.initializeFIFO(2);
        manager.enqueueString('a', 5);
        manager.enqueueString('b', 5);
        const result: string = manager.enqueueString('c', 5);
        addLog('testSendableQueue0007: result=%{public}s', result);
        expect(result.indexOf('full')).assertLargerOrEqual(0);
        expect(manager.isFull()).assertTrue();
        expect(manager.size()).assertEqual(2);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0800
     * @tc.name: testSendableQueue0008
     * @tc.desc: Verify enqueueString fails with invalid priority.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0008', 0, (done: Function) => {
      runCase('testSendableQueue0008', async (): Promise<void> => {
        manager.initializeFIFO(10);
        const result: string = manager.enqueueString('data', -1);
        addLog('testSendableQueue0008: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isEmpty()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_0900
     * @tc.name: testSendableQueue0009
     * @tc.desc: Verify enqueueNumber stores number data correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0009', 0, (done: Function) => {
      runCase('testSendableQueue0009', async (): Promise<void> => {
        manager.initializeFIFO(10);
        const result: string = manager.enqueueNumber(42, 5);
        addLog('testSendableQueue0009: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1000
     * @tc.name: testSendableQueue0010
     * @tc.desc: Verify enqueueBoolean stores boolean data correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0010', 0, (done: Function) => {
      runCase('testSendableQueue0010', async (): Promise<void> => {
        manager.initializeFIFO(10);
        const result: string = manager.enqueueBoolean(true, 3);
        addLog('testSendableQueue0010: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1100
     * @tc.name: testSendableQueue0011
     * @tc.desc: Verify LIFO dequeue returns last enqueued item first.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0011', 0, (done: Function) => {
      runCase('testSendableQueue0011', async (): Promise<void> => {
        manager.initializeLIFO(10);
        manager.enqueueString('first', 5);
        manager.enqueueString('second', 5);
        manager.enqueueString('third', 5);
        const result: string = manager.dequeue();
        addLog('testSendableQueue0011: dequeue=%{public}s', result);
        expect(result.indexOf('third')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(2);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1200
     * @tc.name: testSendableQueue0012
     * @tc.desc: Verify priority dequeue returns highest priority item first.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0012', 0, (done: Function) => {
      runCase('testSendableQueue0012', async (): Promise<void> => {
        manager.initializePriority(10);
        manager.enqueueString('low', 1);
        manager.enqueueString('high', 9);
        manager.enqueueString('mid', 5);
        const result: string = manager.dequeue();
        addLog('testSendableQueue0012: dequeue=%{public}s', result);
        expect(result.indexOf('high')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(2);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1300
     * @tc.name: testSendableQueue0013
     * @tc.desc: Verify peek returns front item without removing it.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0013', 0, (done: Function) => {
      runCase('testSendableQueue0013', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('item1', 5);
        const peekResult: string = manager.peek();
        addLog('testSendableQueue0013: peek=%{public}s, size=%{public}d', peekResult, String(manager.size()));
        expect(peekResult.indexOf('item1')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1400
     * @tc.name: testSendableQueue0014
     * @tc.desc: Verify peekAt returns item at specified position.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0014', 0, (done: Function) => {
      runCase('testSendableQueue0014', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        manager.enqueueString('b', 2);
        manager.enqueueString('c', 3);
        const result: string = manager.peekAt(1);
        addLog('testSendableQueue0014: result=%{public}s', result);
        expect(result.indexOf('b')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(3);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1500
     * @tc.name: testSendableQueue0015
     * @tc.desc: Verify peekAt fails with out-of-bounds position.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0015', 0, (done: Function) => {
      runCase('testSendableQueue0015', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        const result: string = manager.peekAt(5);
        addLog('testSendableQueue0015: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1600
     * @tc.name: testSendableQueue0016
     * @tc.desc: Verify drain removes specified number of items from queue.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0016', 0, (done: Function) => {
      runCase('testSendableQueue0016', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        manager.enqueueString('b', 2);
        manager.enqueueString('c', 3);
        const result: string = manager.drain(2);
        addLog('testSendableQueue0016: result=%{public}s, size=%{public}d', result, String(manager.size()));
        expect(result.indexOf('drain(2)')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(1);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1700
     * @tc.name: testSendableQueue0017
     * @tc.desc: Verify drain with count exceeding size drains all items.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableQueue0017', 0, (done: Function) => {
      runCase('testSendableQueue0017', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('x', 1);
        const result: string = manager.drain(100);
        addLog('testSendableQueue0017: result=%{public}s, size=%{public}d', result, String(manager.size()));
        expect(manager.size()).assertEqual(0);
        expect(manager.isEmpty()).assertTrue();
        expect(result.indexOf('drain(1)')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1800
     * @tc.name: testSendableQueue0018
     * @tc.desc: Verify batchEnqueueString adds multiple string items at once.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0018', 0, (done: Function) => {
      runCase('testSendableQueue0018', async (): Promise<void> => {
        manager.initializeFIFO(100);
        const items: string[] = ['alpha', 'beta', 'gamma'];
        const result: string = manager.batchEnqueueString(items, 5);
        addLog('testSendableQueue0018: result=%{public}s', result);
        expect(result.indexOf('3/3')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(3);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_1900
     * @tc.name: testSendableQueue0019
     * @tc.desc: Verify batchEnqueueNumber adds multiple number items at once.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0019', 0, (done: Function) => {
      runCase('testSendableQueue0019', async (): Promise<void> => {
        manager.initializeFIFO(100);
        const items: number[] = [1, 2, 3, 4];
        const result: string = manager.batchEnqueueNumber(items, 3);
        addLog('testSendableQueue0019: result=%{public}s', result);
        expect(result.indexOf('4/4')).assertLargerOrEqual(0);
        expect(manager.size()).assertEqual(4);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2000
     * @tc.name: testSendableQueue0020
     * @tc.desc: Verify clear removes all items from queue.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0020', 0, (done: Function) => {
      runCase('testSendableQueue0020', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        manager.enqueueString('b', 2);
        const result: string = manager.clear();
        addLog('testSendableQueue0020: result=%{public}s', result);
        expect(result.indexOf('cleared')).assertLargerOrEqual(0);
        expect(manager.isEmpty()).assertTrue();
        expect(manager.size()).assertEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2100
     * @tc.name: testSendableQueue0021
     * @tc.desc: Verify isEmpty returns true for newly initialized queue.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0021', 0, (done: Function) => {
      runCase('testSendableQueue0021', async (): Promise<void> => {
        manager.initializeFIFO(10);
        const empty: boolean = manager.isEmpty();
        addLog('testSendableQueue0021: isEmpty=%{public}s', String(empty));
        expect(empty).assertTrue();
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getQueueType()).assertEqual('FIFO');
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2200
     * @tc.name: testSendableQueue0022
     * @tc.desc: Verify isFull returns true when queue reaches capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0022', 0, (done: Function) => {
      runCase('testSendableQueue0022', async (): Promise<void> => {
        manager.initializeFIFO(2);
        manager.enqueueString('a', 1);
        manager.enqueueString('b', 2);
        const full: boolean = manager.isFull();
        addLog('testSendableQueue0022: isFull=%{public}s', String(full));
        expect(full).assertTrue();
        expect(manager.isInitialized()).assertTrue();
        expect(manager.size()).assertEqual(2);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2300
     * @tc.name: testSendableQueue0023
     * @tc.desc: Verify toArray returns correct string representation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0023', 0, (done: Function) => {
      runCase('testSendableQueue0023', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('item1', 5);
        const arr: string = manager.toArray();
        addLog('testSendableQueue0023: arr=%{public}s', arr);
        expect(arr.indexOf('item1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(arr.indexOf('[')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2400
     * @tc.name: testSendableQueue0024
     * @tc.desc: Verify getStatistics returns correct queue statistics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0024', 0, (done: Function) => {
      runCase('testSendableQueue0024', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        manager.dequeue();
        const stats: string = manager.getStatistics();
        addLog('testSendableQueue0024: stats=%{public}s', stats);
        expect(stats.indexOf('enqueues=')).assertLargerOrEqual(0);
        expect(stats.indexOf('dequeues=')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2500
     * @tc.name: testSendableQueue0025
     * @tc.desc: Verify resetStatistics clears all counters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableQueue0025', 0, (done: Function) => {
      runCase('testSendableQueue0025', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('a', 1);
        const result: string = manager.resetStatistics();
        addLog('testSendableQueue0025: result=%{public}s', result);
        expect(result.indexOf('reset')).assertLargerOrEqual(0);
        const stats: string = manager.getStatistics();
        expect(stats.indexOf('enqueues=0')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(stats.indexOf('dequeues=0')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_QUEUE_2600
     * @tc.name: testSendableQueue0026
     * @tc.desc: Verify toSendableArray returns string array of JSON items.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableQueue0026', 0, (done: Function) => {
      runCase('testSendableQueue0026', async (): Promise<void> => {
        manager.initializeFIFO(10);
        manager.enqueueString('test_data', 5);
        const arr: string[] = manager.toSendableArray();
        addLog('testSendableQueue0026: arrLen=%{public}d', String(arr.length));
        expect(arr.length).assertEqual(1);
        expect(arr[0].indexOf('test_data')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });
  });
}
