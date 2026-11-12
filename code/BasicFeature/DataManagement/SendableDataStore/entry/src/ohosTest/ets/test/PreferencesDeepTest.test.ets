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
import { runCase, addLog, getTestContext } from '../testkit/SharedDriver';
import { common } from '@kit.AbilityKit';
import { SendablePreferencesHelper } from '../../../main/ets/sendablepreferences/SendablePreferencesHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function createDeepHelper(): SendablePreferencesHelper {
    const context = getTestContext();
    return new SendablePreferencesHelper(context, (message: string): void => {
        addLog('DeepPrefCallback: %{public}s', message);
    });
}

export default function preferencesDeepTest(): void {
    describe('PreferencesDeepTest', () => {
        let helper: SendablePreferencesHelper = createDeepHelper();

        beforeAll(() => {
            addLog('PreferencesDeepTest suite started');
        })

        beforeEach(async () => {
            // Clean up persistent data before each test
            const context = getTestContext();
            const tempHelper = new SendablePreferencesHelper(context, (msg: string): void => {});
            await tempHelper.initialize();
            await tempHelper.clearValues();
            await tempHelper.deleteStore();
            helper = createDeepHelper();
        })

        afterEach(() => {
            helper.release();
        })

        afterAll(() => {
            addLog('PreferencesDeepTest suite finished');
        })

        

        /*
         * @tc.number: SUB_DEEP_PREF_0100
         * @tc.name: testDeepPref0001
         * @tc.desc: Verify initialize succeeds and read count is zero.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0001', 0, (done: Function) => {
            runCase('testDeepPref0001', async (): Promise<void> => {
                const result: string = await helper.initialize();
                addLog('testDeepPref0001: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0200
         * @tc.name: testDeepPref0002
         * @tc.desc: Verify initialize twice does not throw.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0002', 0, (done: Function) => {
            runCase('testDeepPref0002', async (): Promise<void> => {
                await helper.initialize();
                const result2: string = await helper.initialize();
                addLog('testDeepPref0002: result2=%{public}s', result2);
                expect(result2.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0300
         * @tc.name: testDeepPref0003
         * @tc.desc: Verify initializeSync succeeds and returns completed.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0003', 0, (done: Function) => {
            runCase('testDeepPref0003', async (): Promise<void> => {
                const result: string = helper.initializeSync();
                addLog('testDeepPref0003: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0400
         * @tc.name: testDeepPref0004
         * @tc.desc: Verify reinitialize resets counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0004', 0, (done: Function) => {
            runCase('testDeepPref0004', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                const result: string = await helper.reinitialize();
                addLog('testDeepPref0004: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0500
         * @tc.name: testDeepPref0005
         * @tc.desc: Verify reinitializeSync resets write count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0005', 0, (done: Function) => {
            runCase('testDeepPref0005', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.reinitializeSync();
                addLog('testDeepPref0005: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0600
         * @tc.name: testDeepPref0006
         * @tc.desc: Verify release sets isInitialized to false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0006', 0, (done: Function) => {
            runCase('testDeepPref0006', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.isInitialized()).assertTrue();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getDeleteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_0700
         * @tc.name: testDeepPref0007
         * @tc.desc: Verify putValue then getValue returns stored value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0007', 0, (done: Function) => {
            runCase('testDeepPref0007', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getValue();
                addLog('testDeepPref0007: result=%{public}s', result);
                expect(result.indexOf('Sendable preferences value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0800
         * @tc.name: testDeepPref0008
         * @tc.desc: Verify putValueSync then getValueSync returns stored value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0008', 0, (done: Function) => {
            runCase('testDeepPref0008', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getValueSync();
                addLog('testDeepPref0008: result=%{public}s', result);
                expect(result.indexOf('Sendable preferences value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_0900
         * @tc.name: testDeepPref0009
         * @tc.desc: Verify getValue returns default when key absent.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0009', 0, (done: Function) => {
            runCase('testDeepPref0009', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.getValue();
                addLog('testDeepPref0009: result=%{public}s', result);
                expect(result.indexOf('Default value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1000
         * @tc.name: testDeepPref0010
         * @tc.desc: Verify putValue increments write count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0010', 0, (done: Function) => {
            runCase('testDeepPref0010', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.putValue();
                await helper.putValue();
                expect(helper.getWriteCount()).assertEqual(3);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_1100
         * @tc.name: testDeepPref0011
         * @tc.desc: Verify hasValue returns false before put.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0011', 0, (done: Function) => {
            runCase('testDeepPref0011', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.hasValue();
                addLog('testDeepPref0011: result=%{public}s', result);
                expect(result.indexOf('false')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1200
         * @tc.name: testDeepPref0012
         * @tc.desc: Verify hasValue returns true after put.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0012', 0, (done: Function) => {
            runCase('testDeepPref0012', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.hasValue();
                addLog('testDeepPref0012: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1300
         * @tc.name: testDeepPref0013
         * @tc.desc: Verify hasValueSync returns false before put.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0013', 0, (done: Function) => {
            runCase('testDeepPref0013', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.hasValueSync();
                addLog('testDeepPref0013: result=%{public}s', result);
                expect(result.indexOf('false')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1400
         * @tc.name: testDeepPref0014
         * @tc.desc: Verify hasValueSync returns true after putSync.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0014', 0, (done: Function) => {
            runCase('testDeepPref0014', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.hasValueSync();
                addLog('testDeepPref0014: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_1500
         * @tc.name: testDeepPref0015
         * @tc.desc: Verify deleteValue removes stored key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0015', 0, (done: Function) => {
            runCase('testDeepPref0015', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const delResult: string = await helper.deleteValue();
                addLog('testDeepPref0015: delResult=%{public}s', delResult);
                expect(delResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1600
         * @tc.name: testDeepPref0016
         * @tc.desc: Verify deleteValueSync removes stored key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0016', 0, (done: Function) => {
            runCase('testDeepPref0016', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const delResult: string = helper.deleteValueSync();
                addLog('testDeepPref0016: delResult=%{public}s', delResult);
                expect(delResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1700
         * @tc.name: testDeepPref0017
         * @tc.desc: Verify delete then hasValue returns false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0017', 0, (done: Function) => {
            runCase('testDeepPref0017', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.deleteValue();
                const hasResult: string = await helper.hasValue();
                addLog('testDeepPref0017: hasResult=%{public}s', hasResult);
                expect(hasResult.indexOf('false')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1800
         * @tc.name: testDeepPref0018
         * @tc.desc: Verify delete on absent key does not crash.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0018', 0, (done: Function) => {
            runCase('testDeepPref0018', async (): Promise<void> => {
                await helper.initialize();
                const delResult: string = await helper.deleteValue();
                addLog('testDeepPref0018: delResult=%{public}s', delResult);
                expect(delResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_1900
         * @tc.name: testDeepPref0019
         * @tc.desc: Verify flushValue succeeds after put.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0019', 0, (done: Function) => {
            runCase('testDeepPref0019', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const flushResult: string = await helper.flushValues();
                addLog('testDeepPref0019: flushResult=%{public}s', flushResult);
                expect(flushResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2000
         * @tc.name: testDeepPref0020
         * @tc.desc: Verify flushValuesSync succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0020', 0, (done: Function) => {
            runCase('testDeepPref0020', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const flushResult: string = helper.flushValuesSync();
                addLog('testDeepPref0020: flushResult=%{public}s', flushResult);
                expect(flushResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_2100
         * @tc.name: testDeepPref0021
         * @tc.desc: Verify clearValues removes all data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0021', 0, (done: Function) => {
            runCase('testDeepPref0021', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const clearResult: string = await helper.clearValues();
                addLog('testDeepPref0021: clearResult=%{public}s', clearResult);
                expect(clearResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2200
         * @tc.name: testDeepPref0022
         * @tc.desc: Verify clearValuesSync removes all data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0022', 0, (done: Function) => {
            runCase('testDeepPref0022', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const clearResult: string = helper.clearValuesSync();
                addLog('testDeepPref0022: clearResult=%{public}s', clearResult);
                expect(clearResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2300
         * @tc.name: testDeepPref0023
         * @tc.desc: Verify clear then getValue returns default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0023', 0, (done: Function) => {
            runCase('testDeepPref0023', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.clearValues();
                const val: string = await helper.getValue();
                addLog('testDeepPref0023: val=%{public}s', val);
                expect(val.indexOf('Default value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2400
         * @tc.name: testDeepPref0024
         * @tc.desc: Verify clear on empty store does not crash.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0024', 0, (done: Function) => {
            runCase('testDeepPref0024', async (): Promise<void> => {
                await helper.initialize();
                const clearResult: string = await helper.clearValues();
                addLog('testDeepPref0024: clearResult=%{public}s', clearResult);
                expect(clearResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_2500
         * @tc.name: testDeepPref0025
         * @tc.desc: Verify getAllValues returns stored data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0025', 0, (done: Function) => {
            runCase('testDeepPref0025', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getAllValues();
                addLog('testDeepPref0025: result=%{public}s', result);
                expect(result.indexOf('sampleKey')).assertLargerOrEqual(0);
                expect(result.indexOf('Sendable preferences value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2600
         * @tc.name: testDeepPref0026
         * @tc.desc: Verify getAllValuesSync returns stored data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0026', 0, (done: Function) => {
            runCase('testDeepPref0026', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getAllValuesSync();
                addLog('testDeepPref0026: result=%{public}s', result);
                expect(result.indexOf('sampleKey')).assertLargerOrEqual(0);
                expect(result.indexOf('Sendable preferences value')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2700
         * @tc.name: testDeepPref0027
         * @tc.desc: Verify getAllValues on empty store returns empty object.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0027', 0, (done: Function) => {
            runCase('testDeepPref0027', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.getAllValues();
                addLog('testDeepPref0027: result=%{public}s', result);
                expect(result.indexOf('getAll')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_2800
         * @tc.name: testDeepPref0028
         * @tc.desc: Verify subscribeChange succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0028', 0, (done: Function) => {
            runCase('testDeepPref0028', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeChange();
                addLog('testDeepPref0028: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_2900
         * @tc.name: testDeepPref0029
         * @tc.desc: Verify unsubscribeChange succeeds after subscribe.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0029', 0, (done: Function) => {
            runCase('testDeepPref0029', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeChange();
                const result: string = helper.unsubscribeChange();
                addLog('testDeepPref0029: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3000
         * @tc.name: testDeepPref0030
         * @tc.desc: Verify subscribeMultiProcessChange succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0030', 0, (done: Function) => {
            runCase('testDeepPref0030', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeMultiProcessChange();
                addLog('testDeepPref0030: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3100
         * @tc.name: testDeepPref0031
         * @tc.desc: Verify unsubscribeMultiProcessChange succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0031', 0, (done: Function) => {
            runCase('testDeepPref0031', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeMultiProcessChange();
                const result: string = helper.unsubscribeMultiProcessChange();
                addLog('testDeepPref0031: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3200
         * @tc.name: testDeepPref0032
         * @tc.desc: Verify subscribeDataChange succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0032', 0, (done: Function) => {
            runCase('testDeepPref0032', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeDataChange();
                addLog('testDeepPref0032: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3300
         * @tc.name: testDeepPref0033
         * @tc.desc: Verify unsubscribeDataChange succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0033', 0, (done: Function) => {
            runCase('testDeepPref0033', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeDataChange();
                const result: string = helper.unsubscribeDataChange();
                addLog('testDeepPref0033: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3400
         * @tc.name: testDeepPref0034
         * @tc.desc: Verify release after subscribe cleans up.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0034', 0, (done: Function) => {
            runCase('testDeepPref0034', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeChange();
                helper.subscribeDataChange();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_3500
         * @tc.name: testDeepPref0035
         * @tc.desc: Verify putString and getString roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0035', 0, (done: Function) => {
            runCase('testDeepPref0035', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putString('deepKey1', 'helloWorld');
                addLog('testDeepPref0035: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getString('deepKey1', 'def');
                expect(getResult.indexOf('helloWorld')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3600
         * @tc.name: testDeepPref0036
         * @tc.desc: Verify putStringSync and getStringSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0036', 0, (done: Function) => {
            runCase('testDeepPref0036', async (): Promise<void> => {
                helper.initializeSync();
                const putResult: string = helper.putStringSync('deepKey2', 'syncValue');
                addLog('testDeepPref0036: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = helper.getStringSync('deepKey2', 'def');
                expect(getResult.indexOf('syncValue')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3700
         * @tc.name: testDeepPref0037
         * @tc.desc: Verify putString with empty key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0037', 0, (done: Function) => {
            runCase('testDeepPref0037', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putString('', 'value');
                addLog('testDeepPref0037: putResult=%{public}s', putResult);
                expect(putResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(putResult.indexOf('invalid key')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3800
         * @tc.name: testDeepPref0038
         * @tc.desc: Verify getString with nonexistent key returns default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0038', 0, (done: Function) => {
            runCase('testDeepPref0038', async (): Promise<void> => {
                await helper.initialize();
                const getResult: string = await helper.getString('noKey', 'fallback');
                addLog('testDeepPref0038: getResult=%{public}s', getResult);
                expect(getResult.indexOf('fallback')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_3900
         * @tc.name: testDeepPref0039
         * @tc.desc: Verify putString with empty value fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0039', 0, (done: Function) => {
            runCase('testDeepPref0039', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putString('key1', '');
                addLog('testDeepPref0039: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4000
         * @tc.name: testDeepPref0040
         * @tc.desc: Verify putString overwrites existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0040', 0, (done: Function) => {
            runCase('testDeepPref0040', async (): Promise<void> => {
                await helper.initialize();
                await helper.putString('owKey', 'first');
                await helper.putString('owKey', 'second');
                const getResult: string = await helper.getString('owKey', 'def');
                addLog('testDeepPref0040: getResult=%{public}s', getResult);
                expect(getResult.indexOf('second')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(2);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_4100
         * @tc.name: testDeepPref0041
         * @tc.desc: Verify putNumber and getNumber roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0041', 0, (done: Function) => {
            runCase('testDeepPref0041', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putNumber('numKey1', 42);
                addLog('testDeepPref0041: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getNumber('numKey1', 0);
                expect(getResult.indexOf('42')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4200
         * @tc.name: testDeepPref0042
         * @tc.desc: Verify putNumberSync and getNumberSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0042', 0, (done: Function) => {
            runCase('testDeepPref0042', async (): Promise<void> => {
                helper.initializeSync();
                helper.putNumberSync('numKey2', 99);
                const getResult: string = helper.getNumberSync('numKey2', 0);
                addLog('testDeepPref0042: getResult=%{public}s', getResult);
                expect(getResult.indexOf('99')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4300
         * @tc.name: testDeepPref0043
         * @tc.desc: Verify putNumber with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0043', 0, (done: Function) => {
            runCase('testDeepPref0043', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putNumber('', 10);
                addLog('testDeepPref0043: putResult=%{public}s', putResult);
                expect(putResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4400
         * @tc.name: testDeepPref0044
         * @tc.desc: Verify getNumber with missing key returns default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0044', 0, (done: Function) => {
            runCase('testDeepPref0044', async (): Promise<void> => {
                await helper.initialize();
                const getResult: string = await helper.getNumber('missing', 77);
                addLog('testDeepPref0044: getResult=%{public}s', getResult);
                expect(getResult.indexOf('77')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4500
         * @tc.name: testDeepPref0045
         * @tc.desc: Verify putNumber with zero value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0045', 0, (done: Function) => {
            runCase('testDeepPref0045', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putNumber('zeroKey', 0);
                addLog('testDeepPref0045: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getNumber('zeroKey', -1);
                expect(getResult.indexOf('0')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4600
         * @tc.name: testDeepPref0046
         * @tc.desc: Verify putNumber with negative value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0046', 0, (done: Function) => {
            runCase('testDeepPref0046', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putNumber('negKey', -100);
                addLog('testDeepPref0046: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getNumber('negKey', 0);
                expect(getResult.indexOf('-100')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_4700
         * @tc.name: testDeepPref0047
         * @tc.desc: Verify putBoolean true and getBoolean roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0047', 0, (done: Function) => {
            runCase('testDeepPref0047', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putBoolean('boolKey1', true);
                addLog('testDeepPref0047: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getBoolean('boolKey1', false);
                expect(getResult.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4800
         * @tc.name: testDeepPref0048
         * @tc.desc: Verify putBooleanSync false and getBooleanSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0048', 0, (done: Function) => {
            runCase('testDeepPref0048', async (): Promise<void> => {
                helper.initializeSync();
                helper.putBooleanSync('boolKey2', false);
                const getResult: string = helper.getBooleanSync('boolKey2', true);
                addLog('testDeepPref0048: getResult=%{public}s', getResult);
                expect(getResult.indexOf('false')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_4900
         * @tc.name: testDeepPref0049
         * @tc.desc: Verify putBoolean with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0049', 0, (done: Function) => {
            runCase('testDeepPref0049', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putBoolean('', true);
                addLog('testDeepPref0049: putResult=%{public}s', putResult);
                expect(putResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5000
         * @tc.name: testDeepPref0050
         * @tc.desc: Verify getBoolean with missing key returns default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0050', 0, (done: Function) => {
            runCase('testDeepPref0050', async (): Promise<void> => {
                await helper.initialize();
                const getResult: string = await helper.getBoolean('noBool', true);
                addLog('testDeepPref0050: getResult=%{public}s', getResult);
                expect(getResult.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_5100
         * @tc.name: testDeepPref0051
         * @tc.desc: Verify putObject and getObject roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0051', 0, (done: Function) => {
            runCase('testDeepPref0051', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putObject('objKey', '{"a":1}');
                addLog('testDeepPref0051: putResult=%{public}s', putResult);
                expect(putResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getObject('objKey', '{}');
                expect(getResult.indexOf('a')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5200
         * @tc.name: testDeepPref0052
         * @tc.desc: Verify putObjectSync and getObjectSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0052', 0, (done: Function) => {
            runCase('testDeepPref0052', async (): Promise<void> => {
                helper.initializeSync();
                helper.putObjectSync('objKey2', '{"b":2}');
                const getResult: string = helper.getObjectSync('objKey2', '{}');
                addLog('testDeepPref0052: getResult=%{public}s', getResult);
                expect(getResult.indexOf('b')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5300
         * @tc.name: testDeepPref0053
         * @tc.desc: Verify putObject with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0053', 0, (done: Function) => {
            runCase('testDeepPref0053', async (): Promise<void> => {
                await helper.initialize();
                const putResult: string = await helper.putObject('', 'val');
                addLog('testDeepPref0053: putResult=%{public}s', putResult);
                expect(putResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5400
         * @tc.name: testDeepPref0054
         * @tc.desc: Verify getObject with missing key returns default.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0054', 0, (done: Function) => {
            runCase('testDeepPref0054', async (): Promise<void> => {
                await helper.initialize();
                const getResult: string = await helper.getObject('missObj', 'fallback');
                addLog('testDeepPref0054: getResult=%{public}s', getResult);
                expect(getResult.indexOf('fallback')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_5500
         * @tc.name: testDeepPref0055
         * @tc.desc: Verify putMultiple with matching keys and values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0055', 0, (done: Function) => {
            runCase('testDeepPref0055', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['mk1', 'mk2', 'mk3'];
                const vals: string[] = ['v1', 'v2', 'v3'];
                const result: string = await helper.putMultiple(keys, vals);
                addLog('testDeepPref0055: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('3/3')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5600
         * @tc.name: testDeepPref0056
         * @tc.desc: Verify putMultiple with mismatched lengths fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0056', 0, (done: Function) => {
            runCase('testDeepPref0056', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['mk1', 'mk2'];
                const vals: string[] = ['v1'];
                const result: string = await helper.putMultiple(keys, vals);
                addLog('testDeepPref0056: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('mismatch')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5700
         * @tc.name: testDeepPref0057
         * @tc.desc: Verify getMultiple retrieves stored values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0057', 0, (done: Function) => {
            runCase('testDeepPref0057', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['gk1', 'gk2'];
                const vals: string[] = ['gv1', 'gv2'];
                await helper.putMultiple(keys, vals);
                const result: string = await helper.getMultiple(keys);
                addLog('testDeepPref0057: result=%{public}s', result);
                expect(result.indexOf('gv1')).assertLargerOrEqual(0);
                expect(result.indexOf('gv2')).assertLargerOrEqual(0);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5800
         * @tc.name: testDeepPref0058
         * @tc.desc: Verify putMultipleSync with matching keys and values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0058', 0, (done: Function) => {
            runCase('testDeepPref0058', async (): Promise<void> => {
                helper.initializeSync();
                const keys: string[] = ['sk1', 'sk2'];
                const vals: string[] = ['sv1', 'sv2'];
                const result: string = helper.putMultipleSync(keys, vals);
                addLog('testDeepPref0058: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_5900
         * @tc.name: testDeepPref0059
         * @tc.desc: Verify putMultipleSync with mismatched lengths fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0059', 0, (done: Function) => {
            runCase('testDeepPref0059', async (): Promise<void> => {
                helper.initializeSync();
                const keys: string[] = ['ak1', 'ak2', 'ak3'];
                const vals: string[] = ['av1', 'av2'];
                const result: string = helper.putMultipleSync(keys, vals);
                addLog('testDeepPref0059: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(result.indexOf('mismatch')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6000
         * @tc.name: testDeepPref0060
         * @tc.desc: Verify getMultipleSync retrieves stored values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0060', 0, (done: Function) => {
            runCase('testDeepPref0060', async (): Promise<void> => {
                helper.initializeSync();
                helper.putMultipleSync(['rk1', 'rk2'], ['rv1', 'rv2']);
                const result: string = helper.getMultipleSync(['rk1', 'rk2']);
                addLog('testDeepPref0060: result=%{public}s', result);
                expect(result.indexOf('rv1')).assertLargerOrEqual(0);
                expect(result.indexOf('rv2')).assertLargerOrEqual(0);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_6100
         * @tc.name: testDeepPref0061
         * @tc.desc: Verify deleteMultiple removes specified keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0061', 0, (done: Function) => {
            runCase('testDeepPref0061', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['dk1', 'dk2', 'dk3'], ['dv1', 'dv2', 'dv3']);
                const delResult: string = await helper.deleteMultiple(['dk1', 'dk3']);
                addLog('testDeepPref0061: delResult=%{public}s', delResult);
                expect(delResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(delResult.indexOf('2/2')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6200
         * @tc.name: testDeepPref0062
         * @tc.desc: Verify hasMultiple checks existence of keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0062', 0, (done: Function) => {
            runCase('testDeepPref0062', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['hk1', 'hk2'], ['hv1', 'hv2']);
                const result: string = await helper.hasMultiple(['hk1', 'hk2', 'hk3']);
                addLog('testDeepPref0062: result=%{public}s', result);
                expect(result.indexOf('hk1=true')).assertLargerOrEqual(0);
                expect(result.indexOf('hk3=false')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6300
         * @tc.name: testDeepPref0063
         * @tc.desc: Verify deleteMultiple with empty array does nothing.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0063', 0, (done: Function) => {
            runCase('testDeepPref0063', async (): Promise<void> => {
                await helper.initialize();
                const emptyKeys: string[] = [];
                const delResult: string = await helper.deleteMultiple(emptyKeys);
                addLog('testDeepPref0063: delResult=%{public}s', delResult);
                expect(delResult.indexOf('0/0')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_6400
         * @tc.name: testDeepPref0064
         * @tc.desc: Verify getKeysByPrefix returns matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0064', 0, (done: Function) => {
            runCase('testDeepPref0064', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['pre_a', 'pre_b', 'oth_c'], ['1', '2', '3']);
                const result: string = await helper.getKeysByPrefix('pre_');
                addLog('testDeepPref0064: result=%{public}s', result);
                expect(result.indexOf('pre_a')).assertLargerOrEqual(0);
                expect(result.indexOf('pre_b')).assertLargerOrEqual(0);
                expect(result.indexOf('2 keys')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6500
         * @tc.name: testDeepPref0065
         * @tc.desc: Verify getKeysByPrefixSync returns matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0065', 0, (done: Function) => {
            runCase('testDeepPref0065', async (): Promise<void> => {
                helper.initializeSync();
                helper.putMultipleSync(['sp_a', 'sp_b', 'ot_c'], ['1', '2', '3']);
                const result: string = helper.getKeysByPrefixSync('sp_');
                addLog('testDeepPref0065: result=%{public}s', result);
                expect(result.indexOf('sp_a')).assertLargerOrEqual(0);
                expect(result.indexOf('sp_b')).assertLargerOrEqual(0);
                expect(result.indexOf('2 keys')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6600
         * @tc.name: testDeepPref0066
         * @tc.desc: Verify countByPrefix counts matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0066', 0, (done: Function) => {
            runCase('testDeepPref0066', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['cp_a', 'cp_b', 'cp_c', 'od_d'], ['1', '2', '3', '4']);
                const result: string = await helper.countByPrefix('cp_');
                addLog('testDeepPref0066: result=%{public}s', result);
                expect(result.indexOf('3')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(4);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6700
         * @tc.name: testDeepPref0067
         * @tc.desc: Verify countByPrefixSync counts matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0067', 0, (done: Function) => {
            runCase('testDeepPref0067', async (): Promise<void> => {
                helper.initializeSync();
                helper.putMultipleSync(['sc_a', 'sc_b', 'od_c'], ['1', '2', '3']);
                const result: string = helper.countByPrefixSync('sc_');
                addLog('testDeepPref0067: result=%{public}s', result);
                expect(result.indexOf('2')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6800
         * @tc.name: testDeepPref0068
         * @tc.desc: Verify deleteByPrefix removes matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0068', 0, (done: Function) => {
            runCase('testDeepPref0068', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['dp_a', 'dp_b', 'od_c'], ['1', '2', '3']);
                const result: string = await helper.deleteByPrefix('dp_');
                addLog('testDeepPref0068: result=%{public}s', result);
                expect(result.indexOf('2 keys deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(2);
                expect(helper.getWriteCount()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_6900
         * @tc.name: testDeepPref0069
         * @tc.desc: Verify deleteByPrefixSync removes matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0069', 0, (done: Function) => {
            runCase('testDeepPref0069', async (): Promise<void> => {
                helper.initializeSync();
                helper.putMultipleSync(['sd_a', 'sd_b', 'od_c'], ['1', '2', '3']);
                const result: string = helper.deleteByPrefixSync('sd_');
                addLog('testDeepPref0069: result=%{public}s', result);
                expect(result.indexOf('2 keys deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(2);
                expect(helper.getWriteCount()).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7000
         * @tc.name: testDeepPref0070
         * @tc.desc: Verify getKeysByPrefix with empty prefix returns all keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0070', 0, (done: Function) => {
            runCase('testDeepPref0070', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['ep_a', 'ep_b'], ['1', '2']);
                const result: string = await helper.getKeysByPrefix('');
                addLog('testDeepPref0070: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_7100
         * @tc.name: testDeepPref0071
         * @tc.desc: Verify setStoreVersion and getStoreVersion roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0071', 0, (done: Function) => {
            runCase('testDeepPref0071', async (): Promise<void> => {
                await helper.initialize();
                const setResult: string = await helper.setStoreVersion(5);
                addLog('testDeepPref0071: setResult=%{public}s', setResult);
                expect(setResult.indexOf('completed')).assertLargerOrEqual(0);
                const getResult: string = await helper.getStoreVersion();
                expect(getResult.indexOf('5')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7200
         * @tc.name: testDeepPref0072
         * @tc.desc: Verify setStoreVersionSync and getStoreVersionSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0072', 0, (done: Function) => {
            runCase('testDeepPref0072', async (): Promise<void> => {
                helper.initializeSync();
                helper.setStoreVersionSync(10);
                const getResult: string = helper.getStoreVersionSync();
                addLog('testDeepPref0072: getResult=%{public}s', getResult);
                expect(getResult.indexOf('10')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7300
         * @tc.name: testDeepPref0073
         * @tc.desc: Verify setStoreVersion with invalid version fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0073', 0, (done: Function) => {
            runCase('testDeepPref0073', async (): Promise<void> => {
                await helper.initialize();
                const setResult: string = await helper.setStoreVersion(-1);
                addLog('testDeepPref0073: setResult=%{public}s', setResult);
                expect(setResult.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7400
         * @tc.name: testDeepPref0074
         * @tc.desc: Verify getCurrentVersion returns initial version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0074', 0, (done: Function) => {
            runCase('testDeepPref0074', async (): Promise<void> => {
                await helper.initialize();
                const version: number = helper.getCurrentVersion();
                addLog('testDeepPref0074: version=%{public}d', version);
                expect(version).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7500
         * @tc.name: testDeepPref0075
         * @tc.desc: Verify getCurrentVersion after setStoreVersion.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0075', 0, (done: Function) => {
            runCase('testDeepPref0075', async (): Promise<void> => {
                await helper.initialize();
                await helper.setStoreVersion(7);
                const version: number = helper.getCurrentVersion();
                addLog('testDeepPref0075: version=%{public}d', version);
                expect(version).assertEqual(7);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_7600
         * @tc.name: testDeepPref0076
         * @tc.desc: Verify getStoreInfo returns store metadata.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0076', 0, (done: Function) => {
            runCase('testDeepPref0076', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getStoreInfo();
                addLog('testDeepPref0076: result=%{public}s', result);
                expect(result.indexOf('StoreInfo')).assertLargerOrEqual(0);
                expect(result.indexOf('sendable_data_store')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7700
         * @tc.name: testDeepPref0077
         * @tc.desc: Verify getStoreInfoSync returns store metadata.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0077', 0, (done: Function) => {
            runCase('testDeepPref0077', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getStoreInfoSync();
                addLog('testDeepPref0077: result=%{public}s', result);
                expect(result.indexOf('StoreInfoSync')).assertLargerOrEqual(0);
                expect(result.indexOf('sendable_data_store')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_7800
         * @tc.name: testDeepPref0078
         * @tc.desc: Verify getStoreInfo on empty store.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0078', 0, (done: Function) => {
            runCase('testDeepPref0078', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.getStoreInfo();
                addLog('testDeepPref0078: result=%{public}s', result);
                expect(result.indexOf('StoreInfo')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(2);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_7900
         * @tc.name: testDeepPref0079
         * @tc.desc: Verify getStatistics returns read/write/delete counts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0079', 0, (done: Function) => {
            runCase('testDeepPref0079', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                const stats: string = helper.getStatistics();
                addLog('testDeepPref0079: stats=%{public}s', stats);
                expect(stats.indexOf('reads=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('writes=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('deletes=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8000
         * @tc.name: testDeepPref0080
         * @tc.desc: Verify resetStatistics zeroes all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0080', 0, (done: Function) => {
            runCase('testDeepPref0080', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                const resetResult: string = helper.resetStatistics();
                addLog('testDeepPref0080: resetResult=%{public}s', resetResult);
                expect(resetResult.indexOf('reset')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8100
         * @tc.name: testDeepPref0081
         * @tc.desc: Verify getStatistics after reset shows zero.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0081', 0, (done: Function) => {
            runCase('testDeepPref0081', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                helper.resetStatistics();
                const stats: string = helper.getStatistics();
                addLog('testDeepPref0081: stats=%{public}s', stats);
                expect(stats.indexOf('reads=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('writes=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('initialized=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8200
         * @tc.name: testDeepPref0082
         * @tc.desc: Verify getLastAccessTime updates after read.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0082', 0, (done: Function) => {
            runCase('testDeepPref0082', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getLastAccessTime()).assertEqual(0);
                await helper.getValue();
                expect(helper.getLastAccessTime()).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8300
         * @tc.name: testDeepPref0083
         * @tc.desc: Verify getLastWriteTime updates after write.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0083', 0, (done: Function) => {
            runCase('testDeepPref0083', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.getLastWriteTime()).assertEqual(0);
                await helper.putValue();
                expect(helper.getLastWriteTime()).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8400
         * @tc.name: testDeepPref0084
         * @tc.desc: Verify getDeleteCount increments after delete.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0084', 0, (done: Function) => {
            runCase('testDeepPref0084', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.deleteValue();
                expect(helper.getDeleteCount()).assertEqual(1);
                await helper.deleteValue();
                expect(helper.getDeleteCount()).assertEqual(2);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_8500
         * @tc.name: testDeepPref0085
         * @tc.desc: Verify removeFromCache clears preferences.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0085', 0, (done: Function) => {
            runCase('testDeepPref0085', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.removeFromCache();
                addLog('testDeepPref0085: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8600
         * @tc.name: testDeepPref0086
         * @tc.desc: Verify removeFromCacheSync clears preferences.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0086', 0, (done: Function) => {
            runCase('testDeepPref0086', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.removeFromCacheSync();
                addLog('testDeepPref0086: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8700
         * @tc.name: testDeepPref0087
         * @tc.desc: Verify deleteStore removes store entirely.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0087', 0, (done: Function) => {
            runCase('testDeepPref0087', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.deleteStore();
                addLog('testDeepPref0087: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_8800
         * @tc.name: testDeepPref0088
         * @tc.desc: Verify release after operations resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0088', 0, (done: Function) => {
            runCase('testDeepPref0088', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                // release() does not reset counters
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_8900
         * @tc.name: testDeepPref0089
         * @tc.desc: Verify getLimits returns key and value length limits.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0089', 0, (done: Function) => {
            runCase('testDeepPref0089', async (): Promise<void> => {
                const result: string = helper.getLimits();
                addLog('testDeepPref0089: result=%{public}s', result);
                expect(result.indexOf('MAX_KEY_LENGTH')).assertLargerOrEqual(0);
                expect(result.indexOf('MAX_VALUE_LENGTH')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9000
         * @tc.name: testDeepPref0090
         * @tc.desc: Verify getLimits does not require initialization.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0090', 0, (done: Function) => {
            runCase('testDeepPref0090', async (): Promise<void> => {
                const freshHelper = createDeepHelper();
                const result: string = freshHelper.getLimits();
                addLog('testDeepPref0090: result=%{public}s', result);
                expect(result.indexOf('MAX_KEY_LENGTH')).assertLargerOrEqual(0);
                expect(result.indexOf('MAX_VALUE_LENGTH')).assertLargerOrEqual(0);
                expect(freshHelper.isInitialized()).assertFalse();
                freshHelper.release();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_PREF_9100
         * @tc.name: testDeepPref0091
         * @tc.desc: Verify put-delete-put cycle works correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0091', 0, (done: Function) => {
            runCase('testDeepPref0091', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.deleteValue();
                await helper.putValue();
                const result: string = await helper.getValue();
                addLog('testDeepPref0091: result=%{public}s', result);
                expect(result.indexOf('Sendable preferences value')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(2);
                expect(helper.getDeleteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9200
         * @tc.name: testDeepPref0092
         * @tc.desc: Verify multiple putValue calls then clearValues.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0092', 0, (done: Function) => {
            runCase('testDeepPref0092', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.putString('extra1', 'val1');
                await helper.putNumber('extra2', 42);
                await helper.clearValues();
                const result: string = await helper.getAllValues();
                addLog('testDeepPref0092: result=%{public}s', result);
                expect(result.indexOf('{}')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(3);
                expect(helper.getReadCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9300
         * @tc.name: testDeepPref0093
         * @tc.desc: Verify reinitialize after multiple operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0093', 0, (done: Function) => {
            runCase('testDeepPref0093', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.putString('rk', 'rv');
                await helper.putNumber('nk', 10);
                const result: string = await helper.reinitialize();
                addLog('testDeepPref0093: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9400
         * @tc.name: testDeepPref0094
         * @tc.desc: Verify subscribe then putValue triggers change.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0094', 0, (done: Function) => {
            runCase('testDeepPref0094', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeChange();
                await helper.putValue();
                helper.unsubscribeChange();
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9500
         * @tc.name: testDeepPref0095
         * @tc.desc: Verify putMultiple then getMultiple with partial keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0095', 0, (done: Function) => {
            runCase('testDeepPref0095', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['pk1', 'pk2', 'pk3'], ['pv1', 'pv2', 'pv3']);
                const result: string = await helper.getMultiple(['pk1', 'pk3']);
                addLog('testDeepPref0095: result=%{public}s', result);
                expect(result.indexOf('pv1')).assertLargerOrEqual(0);
                expect(result.indexOf('pv3')).assertLargerOrEqual(0);
                expect(result.indexOf('2/2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9600
         * @tc.name: testDeepPref0096
         * @tc.desc: Verify setStoreVersion then getStoreInfo includes version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0096', 0, (done: Function) => {
            runCase('testDeepPref0096', async (): Promise<void> => {
                await helper.initialize();
                await helper.setStoreVersion(3);
                const info: string = await helper.getStoreInfo();
                addLog('testDeepPref0096: info=%{public}s', info);
                expect(info.indexOf('StoreInfo')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.getReadCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9700
         * @tc.name: testDeepPref0097
         * @tc.desc: Verify flush after multiple puts succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0097', 0, (done: Function) => {
            runCase('testDeepPref0097', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.putString('fk1', 'fv1');
                await helper.putNumber('fk2', 55);
                const flushResult: string = await helper.flushValues();
                addLog('testDeepPref0097: flushResult=%{public}s', flushResult);
                expect(flushResult.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(3);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9800
         * @tc.name: testDeepPref0098
         * @tc.desc: Verify deleteByPrefix with no matching keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0098', 0, (done: Function) => {
            runCase('testDeepPref0098', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['xa', 'xb'], ['1', '2']);
                const result: string = await helper.deleteByPrefix('zz_');
                addLog('testDeepPref0098: result=%{public}s', result);
                expect(result.indexOf('0 keys deleted')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_9900
         * @tc.name: testDeepPref0099
         * @tc.desc: Verify countByPrefix with no matching keys returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0099', 0, (done: Function) => {
            runCase('testDeepPref0099', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['ma', 'mb'], ['1', '2']);
                const result: string = await helper.countByPrefix('nope_');
                addLog('testDeepPref0099: result=%{public}s', result);
                expect(result.indexOf('0')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1000
         * @tc.name: testDeepPref0100
         * @tc.desc: Verify full lifecycle: init-put-get-flush-delete-clear-release.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0100', 0, (done: Function) => {
            runCase('testDeepPref0100', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                await helper.flushValues();
                await helper.deleteValue();
                await helper.clearValues();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                // release() does not reset counters; putValue=1 write, getValue=1 read
                expect(helper.getReadCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1010
         * @tc.name: testDeepPref0101
         * @tc.desc: Verify putMultiple with empty keys array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0101', 0, (done: Function) => {
            runCase('testDeepPref0101', async (): Promise<void> => {
                await helper.initialize();
                const emptyKeys: string[] = [];
                const emptyVals: string[] = [];
                const result: string = await helper.putMultiple(emptyKeys, emptyVals);
                addLog('testDeepPref0101: result=%{public}s', result);
                expect(result.indexOf('0/0')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1020
         * @tc.name: testDeepPref0102
         * @tc.desc: Verify getMultiple with empty keys array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0102', 0, (done: Function) => {
            runCase('testDeepPref0102', async (): Promise<void> => {
                await helper.initialize();
                const emptyKeys: string[] = [];
                const result: string = await helper.getMultiple(emptyKeys);
                addLog('testDeepPref0102: result=%{public}s', result);
                expect(result.indexOf('0/0')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1030
         * @tc.name: testDeepPref0103
         * @tc.desc: Verify setStoreVersionSync with invalid version 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0103', 0, (done: Function) => {
            runCase('testDeepPref0103', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.setStoreVersionSync(0);
                addLog('testDeepPref0103: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.getCurrentVersion()).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1040
         * @tc.name: testDeepPref0104
         * @tc.desc: Verify putNumber with NaN fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0104', 0, (done: Function) => {
            runCase('testDeepPref0104', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.putNumber('nanKey', NaN);
                addLog('testDeepPref0104: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1050
         * @tc.name: testDeepPref0105
         * @tc.desc: Verify putStringSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0105', 0, (done: Function) => {
            runCase('testDeepPref0105', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putStringSync('', 'value');
                addLog('testDeepPref0105: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1060
         * @tc.name: testDeepPref0106
         * @tc.desc: Verify getNumberSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0106', 0, (done: Function) => {
            runCase('testDeepPref0106', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.getNumberSync('', 0);
                addLog('testDeepPref0106: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1070
         * @tc.name: testDeepPref0107
         * @tc.desc: Verify getBooleanSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0107', 0, (done: Function) => {
            runCase('testDeepPref0107', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.getBooleanSync('', false);
                addLog('testDeepPref0107: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1080
         * @tc.name: testDeepPref0108
         * @tc.desc: Verify getStringSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0108', 0, (done: Function) => {
            runCase('testDeepPref0108', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.getStringSync('', 'def');
                addLog('testDeepPref0108: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1090
         * @tc.name: testDeepPref0109
         * @tc.desc: Verify putObjectSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0109', 0, (done: Function) => {
            runCase('testDeepPref0109', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putObjectSync('', 'val');
                addLog('testDeepPref0109: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1100
         * @tc.name: testDeepPref0110
         * @tc.desc: Verify getObjectSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0110', 0, (done: Function) => {
            runCase('testDeepPref0110', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.getObjectSync('', 'def');
                addLog('testDeepPref0110: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1110
         * @tc.name: testDeepPref0111
         * @tc.desc: Verify deleteMultiple with invalid key in array skips it.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0111', 0, (done: Function) => {
            runCase('testDeepPref0111', async (): Promise<void> => {
                await helper.initialize();
                await helper.putMultiple(['ok1', 'ok2'], ['v1', 'v2']);
                const result: string = await helper.deleteMultiple(['ok1', '']);
                addLog('testDeepPref0111: result=%{public}s', result);
                expect(result.indexOf('1/2')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.getWriteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1120
         * @tc.name: testDeepPref0112
         * @tc.desc: Verify hasMultiple with empty array returns empty result.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0112', 0, (done: Function) => {
            runCase('testDeepPref0112', async (): Promise<void> => {
                await helper.initialize();
                const emptyKeys: string[] = [];
                const result: string = await helper.hasMultiple(emptyKeys);
                addLog('testDeepPref0112: result=%{public}s', result);
                // hasMultiple returns 'hasMultiple: []' for empty keys, not '0/0'
                expect(result.indexOf('[]')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1130
         * @tc.name: testDeepPref0113
         * @tc.desc: Verify getKeysByPrefixSync with empty prefix fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0113', 0, (done: Function) => {
            runCase('testDeepPref0113', async (): Promise<void> => {
                helper.initializeSync();
                helper.putMultipleSync(['sa', 'sb'], ['1', '2']);
                const result: string = helper.getKeysByPrefixSync('');
                addLog('testDeepPref0113: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1140
         * @tc.name: testDeepPref0114
         * @tc.desc: Verify deleteByPrefixSync with empty prefix fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0114', 0, (done: Function) => {
            runCase('testDeepPref0114', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.deleteByPrefixSync('');
                addLog('testDeepPref0114: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1150
         * @tc.name: testDeepPref0115
         * @tc.desc: Verify countByPrefixSync with empty prefix fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0115', 0, (done: Function) => {
            runCase('testDeepPref0115', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.countByPrefixSync('');
                addLog('testDeepPref0115: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1160
         * @tc.name: testDeepPref0116
         * @tc.desc: Verify putMultipleSync with empty arrays.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0116', 0, (done: Function) => {
            runCase('testDeepPref0116', async (): Promise<void> => {
                helper.initializeSync();
                const emptyKeys: string[] = [];
                const emptyVals: string[] = [];
                const result: string = helper.putMultipleSync(emptyKeys, emptyVals);
                addLog('testDeepPref0116: result=%{public}s', result);
                expect(result.indexOf('0/0')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1170
         * @tc.name: testDeepPref0117
         * @tc.desc: Verify getMultipleSync with empty keys array.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0117', 0, (done: Function) => {
            runCase('testDeepPref0117', async (): Promise<void> => {
                helper.initializeSync();
                const emptyKeys: string[] = [];
                const result: string = helper.getMultipleSync(emptyKeys);
                addLog('testDeepPref0117: result=%{public}s', result);
                expect(result.indexOf('0/0')).assertLargerOrEqual(0);
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1180
         * @tc.name: testDeepPref0118
         * @tc.desc: Verify putBooleanSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0118', 0, (done: Function) => {
            runCase('testDeepPref0118', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putBooleanSync('', true);
                addLog('testDeepPref0118: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1190
         * @tc.name: testDeepPref0119
         * @tc.desc: Verify putNumberSync with invalid key fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepPref0119', 0, (done: Function) => {
            runCase('testDeepPref0119', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putNumberSync('', 42);
                addLog('testDeepPref0119: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_PREF_1200
         * @tc.name: testDeepPref0120
         * @tc.desc: Verify complete lifecycle with all typed operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepPref0120', 0, (done: Function) => {
            runCase('testDeepPref0120', async (): Promise<void> => {
                await helper.initialize();
                await helper.putString('ts', 'hello');
                await helper.putNumber('tn', 100);
                await helper.putBoolean('tb', true);
                await helper.putObject('to', '{"x":1}');
                const sv: string = await helper.getString('ts', '');
                const nv: string = await helper.getNumber('tn', 0);
                const bv: string = await helper.getBoolean('tb', false);
                const ov: string = await helper.getObject('to', '{}');
                addLog('testDeepPref0120: sv=%{public}s nv=%{public}s bv=%{public}s ov=%{public}s', sv, nv, bv, ov);
                expect(sv.indexOf('hello')).assertLargerOrEqual(0);
                expect(nv.indexOf('100')).assertLargerOrEqual(0);
                expect(bv.indexOf('true')).assertLargerOrEqual(0);
            }, done);
        });
    });
}
