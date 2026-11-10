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
import { SendableArrayManager } from '../../../main/ets/sendablearray/SendableArrayManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function sendableArrayTest(): void {
  describe('SendableArrayTest', () => {
    let manager: SendableArrayManager = new SendableArrayManager();

    beforeAll(() => {
      addLog('SendableArrayTest suite started');
    })

    beforeEach(() => {
      manager = new SendableArrayManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('SendableArrayTest suite finished');
    })



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0100
     * @tc.name: testSendableArray0001
     * @tc.desc: Verify createNumberArray succeeds with valid capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0001', 0, (done: Function) => {
      runCase('testSendableArray0001', async (): Promise<void> => {
        const result: string = manager.createNumberArray(10);
        addLog('testSendableArray0001: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCapacity()).assertEqual(10);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0200
     * @tc.name: testSendableArray0002
     * @tc.desc: Verify createNumberArray fails with zero capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0002', 0, (done: Function) => {
      runCase('testSendableArray0002', async (): Promise<void> => {
        const result: string = manager.createNumberArray(0);
        addLog('testSendableArray0002: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    })

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0300
     * @tc.name: testSendableArray0003
     * @tc.desc: Verify createNumberArray fails with negative capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0003', 0, (done: Function) => {
      runCase('testSendableArray0003', async (): Promise<void> => {
        const result: string = manager.createNumberArray(-5);
        addLog('testSendableArray0003: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0400
     * @tc.name: testSendableArray0004
     * @tc.desc: Verify createStringArray succeeds with valid capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0004', 0, (done: Function) => {
      runCase('testSendableArray0004', async (): Promise<void> => {
        const result: string = manager.createStringArray(8);
        addLog('testSendableArray0004: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getCapacity()).assertEqual(8);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0500
     * @tc.name: testSendableArray0005
     * @tc.desc: Verify createStringArray fails with exceeding max capacity.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableArray0005', 0, (done: Function) => {
      runCase('testSendableArray0005', async (): Promise<void> => {
        const result: string = manager.createStringArray(200000);
        addLog('testSendableArray0005: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0600
     * @tc.name: testSendableArray0006
     * @tc.desc: Verify createFromArray succeeds with valid values.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0006', 0, (done: Function) => {
      runCase('testSendableArray0006', async (): Promise<void> => {
        const values: number[] = [1, 2, 3, 4, 5];
        const result: string = manager.createFromArray(values);
        addLog('testSendableArray0006: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getCapacity()).assertEqual(5);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0700
     * @tc.name: testSendableArray0007
     * @tc.desc: Verify createFromArray fails with empty input.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0007', 0, (done: Function) => {
      runCase('testSendableArray0007', async (): Promise<void> => {
        const values: number[] = [];
        const result: string = manager.createFromArray(values);
        addLog('testSendableArray0007: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0800
     * @tc.name: testSendableArray0008
     * @tc.desc: Verify setNumberElement and getNumberElement work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0008', 0, (done: Function) => {
      runCase('testSendableArray0008', async (): Promise<void> => {
        manager.createNumberArray(5);
        const setResult: string = manager.setNumberElement(2, 42);
        const getResult: string = manager.getNumberElement(2);
        addLog('testSendableArray0008: set=%{public}s, get=%{public}s', setResult, getResult);
        expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('42')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_0900
     * @tc.name: testSendableArray0009
     * @tc.desc: Verify setNumberElement fails with out-of-bounds index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0009', 0, (done: Function) => {
      runCase('testSendableArray0009', async (): Promise<void> => {
        manager.createNumberArray(5);
        const result: string = manager.setNumberElement(10, 42);
        addLog('testSendableArray0009: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCapacity()).assertEqual(5);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1000
     * @tc.name: testSendableArray0010
     * @tc.desc: Verify setNumberElement fails on string type array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0010', 0, (done: Function) => {
      runCase('testSendableArray0010', async (): Promise<void> => {
        manager.createStringArray(5);
        const result: string = manager.setNumberElement(0, 42);
        addLog('testSendableArray0010: result=%{public}s', result);
        expect(result.indexOf('not number type')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getDataType()).assertEqual('string');
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1100
     * @tc.name: testSendableArray0011
     * @tc.desc: Verify getNumberElement fails with negative index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0011', 0, (done: Function) => {
      runCase('testSendableArray0011', async (): Promise<void> => {
        manager.createNumberArray(5);
        const result: string = manager.getNumberElement(-1);
        addLog('testSendableArray0011: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCapacity()).assertEqual(5);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1200
     * @tc.name: testSendableArray0012
     * @tc.desc: Verify setStringElement and getStringElement work correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0012', 0, (done: Function) => {
      runCase('testSendableArray0012', async (): Promise<void> => {
        manager.createStringArray(5);
        const setResult: string = manager.setStringElement(1, 'hello');
        const getResult: string = manager.getStringElement(1);
        addLog('testSendableArray0012: set=%{public}s, get=%{public}s', setResult, getResult);
        expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
        expect(getResult.indexOf('hello')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1300
     * @tc.name: testSendableArray0013
     * @tc.desc: Verify setStringElement fails on number type array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0013', 0, (done: Function) => {
      runCase('testSendableArray0013', async (): Promise<void> => {
        manager.createNumberArray(5);
        const result: string = manager.setStringElement(0, 'test');
        addLog('testSendableArray0013: result=%{public}s', result);
        expect(result.indexOf('not string type')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getDataType()).assertEqual('number');
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1400
     * @tc.name: testSendableArray0014
     * @tc.desc: Verify swapElements works for number array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0014', 0, (done: Function) => {
      runCase('testSendableArray0014', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30]);
        manager.setNumberElement(0, 10);
        manager.setNumberElement(1, 20);
        const result: string = manager.swapElements(0, 2);
        addLog('testSendableArray0014: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const getFirst: string = manager.getNumberElement(0);
        expect(getFirst.indexOf('30')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1500
     * @tc.name: testSendableArray0015
     * @tc.desc: Verify swapElements fails with invalid index.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0015', 0, (done: Function) => {
      runCase('testSendableArray0015', async (): Promise<void> => {
        manager.createNumberArray(5);
        const result: string = manager.swapElements(0, 10);
        addLog('testSendableArray0015: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCapacity()).assertEqual(5);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1600
     * @tc.name: testSendableArray0016
     * @tc.desc: Verify fillNumberArray fills all elements with given value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0016', 0, (done: Function) => {
      runCase('testSendableArray0016', async (): Promise<void> => {
        manager.createNumberArray(5);
        const result: string = manager.fillNumberArray(99);
        addLog('testSendableArray0016: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const sum: string = manager.sumNumberArray();
        expect(sum.indexOf('495')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1700
     * @tc.name: testSendableArray0017
     * @tc.desc: Verify fillStringArray fills all elements with given value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0017', 0, (done: Function) => {
      runCase('testSendableArray0017', async (): Promise<void> => {
        manager.createStringArray(3);
        const result: string = manager.fillStringArray('test');
        addLog('testSendableArray0017: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const get: string = manager.getStringElement(1);
        expect(get.indexOf('test')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1800
     * @tc.name: testSendableArray0018
     * @tc.desc: Verify sortNumberArray sorts elements in ascending order.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0018', 0, (done: Function) => {
      runCase('testSendableArray0018', async (): Promise<void> => {
        manager.createFromArray([3, 1, 4, 1, 5]);
        const result: string = manager.sortNumberArray();
        addLog('testSendableArray0018: result=%{public}s', result);
        expect(result.indexOf('1,1,3,4,5')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_1900
     * @tc.name: testSendableArray0019
     * @tc.desc: Verify reverseArray reverses number array elements.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0019', 0, (done: Function) => {
      runCase('testSendableArray0019', async (): Promise<void> => {
        manager.createFromArray([1, 2, 3, 4, 5]);
        const result: string = manager.reverseArray();
        addLog('testSendableArray0019: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        const first: string = manager.getNumberElement(0);
        expect(first.indexOf('5')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2000
     * @tc.name: testSendableArray0020
     * @tc.desc: Verify sliceNumberArray returns correct sub-array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0020', 0, (done: Function) => {
      runCase('testSendableArray0020', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30, 40, 50]);
        const result: string = manager.sliceNumberArray(1, 4);
        addLog('testSendableArray0020: result=%{public}s', result);
        expect(result.indexOf('20,30,40')).assertLargerOrEqual(0);
        expect(result.indexOf('3 elements')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2100
     * @tc.name: testSendableArray0021
     * @tc.desc: Verify sliceNumberArray fails with invalid range.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0021', 0, (done: Function) => {
      runCase('testSendableArray0021', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30]);
        const result: string = manager.sliceNumberArray(-1, 5);
        addLog('testSendableArray0021: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getCapacity()).assertEqual(3);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2200
     * @tc.name: testSendableArray0022
     * @tc.desc: Verify findNumberIndex returns correct index for existing value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0022', 0, (done: Function) => {
      runCase('testSendableArray0022', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30, 40]);
        const result: string = manager.findNumberIndex(30);
        addLog('testSendableArray0022: result=%{public}s', result);
        expect(result.indexOf('2')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('findNumberIndex')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2300
     * @tc.name: testSendableArray0023
     * @tc.desc: Verify findNumberIndex returns -1 for non-existing value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0023', 0, (done: Function) => {
      runCase('testSendableArray0023', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30]);
        const result: string = manager.findNumberIndex(99);
        addLog('testSendableArray0023: result=%{public}s', result);
        expect(result.indexOf('-1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('findNumberIndex')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2400
     * @tc.name: testSendableArray0024
     * @tc.desc: Verify filterNumberGreaterThan returns correct filtered results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0024', 0, (done: Function) => {
      runCase('testSendableArray0024', async (): Promise<void> => {
        manager.createFromArray([5, 10, 15, 20, 25]);
        const result: string = manager.filterNumberGreaterThan(12);
        addLog('testSendableArray0024: result=%{public}s', result);
        expect(result.indexOf('15,20,25')).assertLargerOrEqual(0);
        expect(result.indexOf('3 matches')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2500
     * @tc.name: testSendableArray0025
     * @tc.desc: Verify filterNumberLessThan returns correct filtered results.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0025', 0, (done: Function) => {
      runCase('testSendableArray0025', async (): Promise<void> => {
        manager.createFromArray([5, 10, 15, 20, 25]);
        const result: string = manager.filterNumberLessThan(15);
        addLog('testSendableArray0025: result=%{public}s', result);
        expect(result.indexOf('5,10')).assertLargerOrEqual(0);
        expect(result.indexOf('2 matches')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2600
     * @tc.name: testSendableArray0026
     * @tc.desc: Verify containsNumber returns true for existing value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0026', 0, (done: Function) => {
      runCase('testSendableArray0026', async (): Promise<void> => {
        manager.createFromArray([1, 2, 3]);
        const result: string = manager.containsNumber(2);
        addLog('testSendableArray0026: result=%{public}s', result);
        expect(result.indexOf('true')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('containsNumber')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2700
     * @tc.name: testSendableArray0027
     * @tc.desc: Verify containsString returns false for non-existing value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0027', 0, (done: Function) => {
      runCase('testSendableArray0027', async (): Promise<void> => {
        manager.createFromStringArray(['apple', 'banana', 'cherry']);
        const result: string = manager.containsString('grape');
        addLog('testSendableArray0027: result=%{public}s', result);
        expect(result.indexOf('false')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('containsString')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2800
     * @tc.name: testSendableArray0028
     * @tc.desc: Verify sumNumberArray returns correct sum.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0028', 0, (done: Function) => {
      runCase('testSendableArray0028', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30]);
        const result: string = manager.sumNumberArray();
        addLog('testSendableArray0028: result=%{public}s', result);
        expect(result.indexOf('60')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('sumNumberArray')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_2900
     * @tc.name: testSendableArray0029
     * @tc.desc: Verify minNumber returns the minimum value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0029', 0, (done: Function) => {
      runCase('testSendableArray0029', async (): Promise<void> => {
        manager.createFromArray([30, 10, 20]);
        const result: string = manager.minNumber();
        addLog('testSendableArray0029: result=%{public}s', result);
        expect(result.indexOf('10')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('minNumber')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3000
     * @tc.name: testSendableArray0030
     * @tc.desc: Verify maxNumber returns the maximum value.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0030', 0, (done: Function) => {
      runCase('testSendableArray0030', async (): Promise<void> => {
        manager.createFromArray([30, 10, 20]);
        const result: string = manager.maxNumber();
        addLog('testSendableArray0030: result=%{public}s', result);
        expect(result.indexOf('30')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('maxNumber')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3100
     * @tc.name: testSendableArray0031
     * @tc.desc: Verify averageNumber returns correct average.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0031', 0, (done: Function) => {
      runCase('testSendableArray0031', async (): Promise<void> => {
        manager.createFromArray([10, 20, 30]);
        const result: string = manager.averageNumber();
        addLog('testSendableArray0031: result=%{public}s', result);
        expect(result.indexOf('20')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(result.indexOf('averageNumber')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3200
     * @tc.name: testSendableArray0032
     * @tc.desc: Verify toNumberJSON returns correct JSON string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0032', 0, (done: Function) => {
      runCase('testSendableArray0032', async (): Promise<void> => {
        manager.createFromArray([1, 2, 3]);
        const json: string = manager.toNumberJSON();
        addLog('testSendableArray0032: json=%{public}s', json);
        expect(json.indexOf('[')).assertLargerOrEqual(0);
        expect(json.indexOf('1')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3300
     * @tc.name: testSendableArray0033
     * @tc.desc: Verify toJSON returns correct representation for uninitialized array.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSendableArray0033', 0, (done: Function) => {
      runCase('testSendableArray0033', async (): Promise<void> => {
        const json: string = manager.toJSON();
        addLog('testSendableArray0033: json=%{public}s', json);
        expect(json).assertEqual('[]');
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3400
     * @tc.name: testSendableArray0034
     * @tc.desc: Verify getMetadata returns correct capacity and type info.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0034', 0, (done: Function) => {
      runCase('testSendableArray0034', async (): Promise<void> => {
        manager.createNumberArray(10);
        const meta: string = manager.getMetadata();
        addLog('testSendableArray0034: meta=%{public}s', meta);
        expect(meta.indexOf('capacity=10')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(meta.indexOf('type=')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3500
     * @tc.name: testSendableArray0035
     * @tc.desc: Verify resetStatistics clears read/write/search counters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0035', 0, (done: Function) => {
      runCase('testSendableArray0035', async (): Promise<void> => {
        manager.createFromArray([1, 2, 3]);
        manager.getNumberElement(0);
        manager.setNumberElement(0, 10);
        const resetResult: string = manager.resetStatistics();
        addLog('testSendableArray0035: reset=%{public}s', resetResult);
        expect(resetResult.indexOf('reset')).assertLargerOrEqual(0);
        const stats: string = manager.getStatistics();
        expect(stats.indexOf('reads=0')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(stats.indexOf('writes=0')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_SENDABLE_ARRAY_3600
     * @tc.name: testSendableArray0036
     * @tc.desc: Verify clearArray resets all state.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSendableArray0036', 0, (done: Function) => {
      runCase('testSendableArray0036', async (): Promise<void> => {
        manager.createNumberArray(10);
        manager.setNumberElement(0, 42);
        const result: string = manager.clearArray();
        addLog('testSendableArray0036: result=%{public}s', result);
        expect(result.indexOf('cleared')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertFalse();
        expect(manager.getCapacity()).assertEqual(0);
      }, done);
    });
  });
}
