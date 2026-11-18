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

function createHelper(): SendablePreferencesHelper {
    const context = getTestContext();
    return new SendablePreferencesHelper(context, (message: string): void => {
        addLog('PreferencesCallback: %{public}s', message);
    });
}

export default function sendablePreferencesTest(): void {
    describe('SendablePreferencesTest', () => {
        let helper: SendablePreferencesHelper = createHelper();

        beforeAll(() => {
            addLog('SendablePreferencesTest suite started');
        })

        beforeEach(() => {
            helper = createHelper();
        })

        afterEach(() => {
            helper.release();
        })

        afterAll(() => {
            addLog('SendablePreferencesTest suite finished');
        })

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0100
         * @tc.name: testSendablePreferences0001
         * @tc.desc: Verify initialize succeeds and sets initialized state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0001', 0, (done: Function) => {
            runCase('testSendablePreferences0001', async (): Promise<void> => {
                const result: string = await helper.initialize();
                addLog('testSendablePreferences0001: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0200
         * @tc.name: testSendablePreferences0002
         * @tc.desc: Verify initializeSync succeeds.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0002', 0, (done: Function) => {
            runCase('testSendablePreferences0002', async (): Promise<void> => {
                const result: string = helper.initializeSync();
                addLog('testSendablePreferences0002: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0300
         * @tc.name: testSendablePreferences0003
         * @tc.desc: Verify reinitialize resets state and re-initializes.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0003', 0, (done: Function) => {
            runCase('testSendablePreferences0003', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.reinitialize();
                addLog('testSendablePreferences0003: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0400
         * @tc.name: testSendablePreferences0004
         * @tc.desc: Verify reinitializeSync resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0004', 0, (done: Function) => {
            runCase('testSendablePreferences0004', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.reinitializeSync();
                addLog('testSendablePreferences0004: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0500
         * @tc.name: testSendablePreferences0005
         * @tc.desc: Verify isInitialized returns false before init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0005', 0, (done: Function) => {
            runCase('testSendablePreferences0005', async (): Promise<void> => {
                const freshHelper = createHelper();
                expect(freshHelper.isInitialized()).assertFalse();
                expect(freshHelper.getReadCount()).assertEqual(0);
                expect(freshHelper.getWriteCount()).assertEqual(0);
                freshHelper.release();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0600
         * @tc.name: testSendablePreferences0006
         * @tc.desc: Verify release clears initialized state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0006', 0, (done: Function) => {
            runCase('testSendablePreferences0006', async (): Promise<void> => {
                await helper.initialize();
                expect(helper.isInitialized()).assertTrue();
                helper.release();
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0700
         * @tc.name: testSendablePreferences0007
         * @tc.desc: Verify getLimits returns key and value length limits.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0007', 0, (done: Function) => {
            runCase('testSendablePreferences0007', async (): Promise<void> => {
                const result: string = helper.getLimits();
                addLog('testSendablePreferences0007: result=%{public}s', result);
                expect(result.indexOf('MAX_KEY_LENGTH')).assertLargerOrEqual(0);
                expect(result.indexOf('MAX_VALUE_LENGTH')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0800
         * @tc.name: testSendablePreferences0008
         * @tc.desc: Verify putValue stores a value successfully.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0008', 0, (done: Function) => {
            runCase('testSendablePreferences0008', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.putValue();
                addLog('testSendablePreferences0008: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getWriteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_0900
         * @tc.name: testSendablePreferences0009
         * @tc.desc: Verify putValueSync stores a value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0009', 0, (done: Function) => {
            runCase('testSendablePreferences0009', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putValueSync();
                addLog('testSendablePreferences0009: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1000
         * @tc.name: testSendablePreferences0010
         * @tc.desc: Verify getValue retrieves stored value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0010', 0, (done: Function) => {
            runCase('testSendablePreferences0010', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getValue();
                addLog('testSendablePreferences0010: result=%{public}s', result);
                expect(result.indexOf('get:')).assertLargerOrEqual(0);
                expect(result.indexOf('Sendable')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1100
         * @tc.name: testSendablePreferences0011
         * @tc.desc: Verify getValueSync retrieves stored value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0011', 0, (done: Function) => {
            runCase('testSendablePreferences0011', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getValueSync();
                addLog('testSendablePreferences0011: result=%{public}s', result);
                expect(result.indexOf('getSync:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1200
         * @tc.name: testSendablePreferences0012
         * @tc.desc: Verify getAllValues returns all stored data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0012', 0, (done: Function) => {
            runCase('testSendablePreferences0012', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getAllValues();
                addLog('testSendablePreferences0012: result=%{public}s', result);
                expect(result.indexOf('getAll:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1300
         * @tc.name: testSendablePreferences0013
         * @tc.desc: Verify getAllValuesSync returns all stored data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0013', 0, (done: Function) => {
            runCase('testSendablePreferences0013', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getAllValuesSync();
                addLog('testSendablePreferences0013: result=%{public}s', result);
                expect(result.indexOf('getAllSync:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1400
         * @tc.name: testSendablePreferences0014
         * @tc.desc: Verify hasValue returns true for existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0014', 0, (done: Function) => {
            runCase('testSendablePreferences0014', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.hasValue();
                addLog('testSendablePreferences0014: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1500
         * @tc.name: testSendablePreferences0015
         * @tc.desc: Verify hasValueSync returns true for existing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0015', 0, (done: Function) => {
            runCase('testSendablePreferences0015', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.hasValueSync();
                addLog('testSendablePreferences0015: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1600
         * @tc.name: testSendablePreferences0016
         * @tc.desc: Verify deleteValue removes the key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0016', 0, (done: Function) => {
            runCase('testSendablePreferences0016', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.deleteValue();
                addLog('testSendablePreferences0016: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getDeleteCount()).assertEqual(1);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1700
         * @tc.name: testSendablePreferences0017
         * @tc.desc: Verify deleteValueSync removes the key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0017', 0, (done: Function) => {
            runCase('testSendablePreferences0017', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.deleteValueSync();
                addLog('testSendablePreferences0017: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getDeleteCount()).assertEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1800
         * @tc.name: testSendablePreferences0018
         * @tc.desc: Verify flushValues persists data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0018', 0, (done: Function) => {
            runCase('testSendablePreferences0018', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.flushValues();
                addLog('testSendablePreferences0018: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_1900
         * @tc.name: testSendablePreferences0019
         * @tc.desc: Verify flushValuesSync persists data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0019', 0, (done: Function) => {
            runCase('testSendablePreferences0019', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.flushValuesSync();
                addLog('testSendablePreferences0019: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2000
         * @tc.name: testSendablePreferences0020
         * @tc.desc: Verify clearValues removes all data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0020', 0, (done: Function) => {
            runCase('testSendablePreferences0020', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.clearValues();
                addLog('testSendablePreferences0020: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2100
         * @tc.name: testSendablePreferences0021
         * @tc.desc: Verify clearValuesSync removes all data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0021', 0, (done: Function) => {
            runCase('testSendablePreferences0021', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.clearValuesSync();
                addLog('testSendablePreferences0021: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2200
         * @tc.name: testSendablePreferences0022
         * @tc.desc: Verify subscribeChange registers listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0022', 0, (done: Function) => {
            runCase('testSendablePreferences0022', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeChange();
                addLog('testSendablePreferences0022: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2300
         * @tc.name: testSendablePreferences0023
         * @tc.desc: Verify unsubscribeChange removes listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0023', 0, (done: Function) => {
            runCase('testSendablePreferences0023', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeChange();
                const result: string = helper.unsubscribeChange();
                addLog('testSendablePreferences0023: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2400
         * @tc.name: testSendablePreferences0024
         * @tc.desc: Verify subscribeMultiProcessChange registers listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0024', 0, (done: Function) => {
            runCase('testSendablePreferences0024', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeMultiProcessChange();
                addLog('testSendablePreferences0024: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2500
         * @tc.name: testSendablePreferences0025
         * @tc.desc: Verify unsubscribeMultiProcessChange removes listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0025', 0, (done: Function) => {
            runCase('testSendablePreferences0025', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeMultiProcessChange();
                const result: string = helper.unsubscribeMultiProcessChange();
                addLog('testSendablePreferences0025: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2600
         * @tc.name: testSendablePreferences0026
         * @tc.desc: Verify subscribeDataChange registers listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0026', 0, (done: Function) => {
            runCase('testSendablePreferences0026', async (): Promise<void> => {
                await helper.initialize();
                const result: string = helper.subscribeDataChange();
                addLog('testSendablePreferences0026: result=%{public}s', result);
                expect(result.indexOf('Subscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2700
         * @tc.name: testSendablePreferences0027
         * @tc.desc: Verify unsubscribeDataChange removes listener.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testSendablePreferences0027', 0, (done: Function) => {
            runCase('testSendablePreferences0027', async (): Promise<void> => {
                await helper.initialize();
                helper.subscribeDataChange();
                const result: string = helper.unsubscribeDataChange();
                addLog('testSendablePreferences0027: result=%{public}s', result);
                expect(result.indexOf('Unsubscribed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2800
         * @tc.name: testSendablePreferences0028
         * @tc.desc: Verify removeFromCache clears cached instance.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0028', 0, (done: Function) => {
            runCase('testSendablePreferences0028', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.removeFromCache();
                addLog('testSendablePreferences0028: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_2900
         * @tc.name: testSendablePreferences0029
         * @tc.desc: Verify removeFromCacheSync clears cached instance.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0029', 0, (done: Function) => {
            runCase('testSendablePreferences0029', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.removeFromCacheSync();
                addLog('testSendablePreferences0029: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(helper.getReadCount()).assertEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3000
         * @tc.name: testSendablePreferences0030
         * @tc.desc: Verify deleteStore removes the preferences file.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0030', 0, (done: Function) => {
            runCase('testSendablePreferences0030', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.deleteStore();
                addLog('testSendablePreferences0030: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertFalse();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3100
         * @tc.name: testSendablePreferences0031
         * @tc.desc: Verify putMultiple stores multiple key-value pairs.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0031', 0, (done: Function) => {
            runCase('testSendablePreferences0031', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['key1', 'key2', 'key3'];
                const values: string[] = ['value1', 'value2', 'value3'];
                const result: string = await helper.putMultiple(keys, values);
                addLog('testSendablePreferences0031: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('3/3')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3200
         * @tc.name: testSendablePreferences0032
         * @tc.desc: Verify getMultiple retrieves multiple values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0032', 0, (done: Function) => {
            runCase('testSendablePreferences0032', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['key1', 'key2'];
                const values: string[] = ['value1', 'value2'];
                await helper.putMultiple(keys, values);
                const result: string = await helper.getMultiple(keys);
                addLog('testSendablePreferences0032: result=%{public}s', result);
                expect(result.indexOf('getMultiple:')).assertLargerOrEqual(0);
                expect(result.indexOf('key1')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3300
         * @tc.name: testSendablePreferences0033
         * @tc.desc: Verify deleteMultiple removes multiple keys.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0033', 0, (done: Function) => {
            runCase('testSendablePreferences0033', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['key1', 'key2'];
                const values: string[] = ['value1', 'value2'];
                await helper.putMultiple(keys, values);
                const result: string = await helper.deleteMultiple(keys);
                addLog('testSendablePreferences0033: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getDeleteCount()).assertLargerOrEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3400
         * @tc.name: testSendablePreferences0034
         * @tc.desc: Verify hasMultiple checks multiple keys existence.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0034', 0, (done: Function) => {
            runCase('testSendablePreferences0034', async (): Promise<void> => {
                await helper.initialize();
                const keys: string[] = ['key1', 'key2'];
                const values: string[] = ['value1', 'value2'];
                await helper.putMultiple(keys, values);
                const result: string = await helper.hasMultiple(keys);
                addLog('testSendablePreferences0034: result=%{public}s', result);
                expect(result.indexOf('hasMultiple:')).assertLargerOrEqual(0);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3500
         * @tc.name: testSendablePreferences0035
         * @tc.desc: Verify putMultipleSync stores multiple pairs synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0035', 0, (done: Function) => {
            runCase('testSendablePreferences0035', async (): Promise<void> => {
                helper.initializeSync();
                const keys: string[] = ['key1', 'key2'];
                const values: string[] = ['value1', 'value2'];
                const result: string = helper.putMultipleSync(keys, values);
                addLog('testSendablePreferences0035: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3600
         * @tc.name: testSendablePreferences0036
         * @tc.desc: Verify getMultipleSync retrieves multiple values synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0036', 0, (done: Function) => {
            runCase('testSendablePreferences0036', async (): Promise<void> => {
                helper.initializeSync();
                const keys: string[] = ['key1', 'key2'];
                const values: string[] = ['value1', 'value2'];
                helper.putMultipleSync(keys, values);
                const result: string = helper.getMultipleSync(keys);
                addLog('testSendablePreferences0036: result=%{public}s', result);
                expect(result.indexOf('getMultipleSync:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3700
         * @tc.name: testSendablePreferences0037
         * @tc.desc: Verify putNumber stores a number value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0037', 0, (done: Function) => {
            runCase('testSendablePreferences0037', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.putNumber('numKey', 42);
                addLog('testSendablePreferences0037: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('42')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3800
         * @tc.name: testSendablePreferences0038
         * @tc.desc: Verify getNumber retrieves number value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0038', 0, (done: Function) => {
            runCase('testSendablePreferences0038', async (): Promise<void> => {
                await helper.initialize();
                await helper.putNumber('numKey', 42);
                const result: string = await helper.getNumber('numKey', 0);
                addLog('testSendablePreferences0038: result=%{public}s', result);
                expect(result.indexOf('42')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_3900
         * @tc.name: testSendablePreferences0039
         * @tc.desc: Verify putNumberSync stores number synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0039', 0, (done: Function) => {
            runCase('testSendablePreferences0039', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putNumberSync('numKey', 100);
                addLog('testSendablePreferences0039: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4000
         * @tc.name: testSendablePreferences0040
         * @tc.desc: Verify getNumberSync retrieves number synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0040', 0, (done: Function) => {
            runCase('testSendablePreferences0040', async (): Promise<void> => {
                helper.initializeSync();
                helper.putNumberSync('numKey', 100);
                const result: string = helper.getNumberSync('numKey', 0);
                addLog('testSendablePreferences0040: result=%{public}s', result);
                expect(result.indexOf('100')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4100
         * @tc.name: testSendablePreferences0041
         * @tc.desc: Verify putBoolean stores a boolean value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0041', 0, (done: Function) => {
            runCase('testSendablePreferences0041', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.putBoolean('boolKey', true);
                addLog('testSendablePreferences0041: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4200
         * @tc.name: testSendablePreferences0042
         * @tc.desc: Verify getBoolean retrieves boolean value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0042', 0, (done: Function) => {
            runCase('testSendablePreferences0042', async (): Promise<void> => {
                await helper.initialize();
                await helper.putBoolean('boolKey', true);
                const result: string = await helper.getBoolean('boolKey', false);
                addLog('testSendablePreferences0042: result=%{public}s', result);
                expect(result.indexOf('true')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4300
         * @tc.name: testSendablePreferences0043
         * @tc.desc: Verify putBooleanSync stores boolean synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0043', 0, (done: Function) => {
            runCase('testSendablePreferences0043', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putBooleanSync('boolKey', false);
                addLog('testSendablePreferences0043: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4400
         * @tc.name: testSendablePreferences0044
         * @tc.desc: Verify getBooleanSync retrieves boolean synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0044', 0, (done: Function) => {
            runCase('testSendablePreferences0044', async (): Promise<void> => {
                helper.initializeSync();
                helper.putBooleanSync('boolKey', false);
                const result: string = helper.getBooleanSync('boolKey', true);
                addLog('testSendablePreferences0044: result=%{public}s', result);
                expect(result.indexOf('false')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4500
         * @tc.name: testSendablePreferences0045
         * @tc.desc: Verify getKeysByPrefix returns keys with matching prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0045', 0, (done: Function) => {
            runCase('testSendablePreferences0045', async (): Promise<void> => {
                await helper.initialize();
                await helper.putNumber('prefix_key1', 1);
                await helper.putNumber('prefix_key2', 2);
                await helper.putNumber('other_key', 3);
                const result: string = await helper.getKeysByPrefix('prefix_');
                addLog('testSendablePreferences0045: result=%{public}s', result);
                expect(result.indexOf('prefix_key1')).assertLargerOrEqual(0);
                expect(result.indexOf('prefix_key2')).assertLargerOrEqual(0);
                expect(result.indexOf('2 keys')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4600
         * @tc.name: testSendablePreferences0046
         * @tc.desc: Verify deleteByPrefix removes keys with matching prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0046', 0, (done: Function) => {
            runCase('testSendablePreferences0046', async (): Promise<void> => {
                await helper.initialize();
                await helper.putNumber('prefix_key1', 1);
                await helper.putNumber('prefix_key2', 2);
                const result: string = await helper.deleteByPrefix('prefix_');
                addLog('testSendablePreferences0046: result=%{public}s', result);
                expect(result.indexOf('2 keys deleted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getDeleteCount()).assertLargerOrEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4700
         * @tc.name: testSendablePreferences0047
         * @tc.desc: Verify countByPrefix counts keys with matching prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0047', 0, (done: Function) => {
            runCase('testSendablePreferences0047', async (): Promise<void> => {
                await helper.initialize();
                await helper.putNumber('prefix_key1', 1);
                await helper.putNumber('prefix_key2', 2);
                const result: string = await helper.countByPrefix('prefix_');
                addLog('testSendablePreferences0047: result=%{public}s', result);
                expect(result.indexOf('2')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4800
         * @tc.name: testSendablePreferences0048
         * @tc.desc: Verify getKeysByPrefixSync returns keys synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0048', 0, (done: Function) => {
            runCase('testSendablePreferences0048', async (): Promise<void> => {
                helper.initializeSync();
                helper.putNumberSync('prefix_key1', 1);
                helper.putNumberSync('prefix_key2', 2);
                const result: string = helper.getKeysByPrefixSync('prefix_');
                addLog('testSendablePreferences0048: result=%{public}s', result);
                expect(result.indexOf('prefix_key')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_4900
         * @tc.name: testSendablePreferences0049
         * @tc.desc: Verify deleteByPrefixSync removes keys synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0049', 0, (done: Function) => {
            runCase('testSendablePreferences0049', async (): Promise<void> => {
                helper.initializeSync();
                helper.putNumberSync('prefix_key1', 1);
                const result: string = helper.deleteByPrefixSync('prefix_');
                addLog('testSendablePreferences0049: result=%{public}s', result);
                expect(result.indexOf('deleted')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getDeleteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5000
         * @tc.name: testSendablePreferences0050
         * @tc.desc: Verify countByPrefixSync counts keys synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0050', 0, (done: Function) => {
            runCase('testSendablePreferences0050', async (): Promise<void> => {
                helper.initializeSync();
                helper.putNumberSync('prefix_key1', 1);
                helper.putNumberSync('prefix_key2', 2);
                const result: string = helper.countByPrefixSync('prefix_');
                addLog('testSendablePreferences0050: result=%{public}s', result);
                expect(result.indexOf('2')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5100
         * @tc.name: testSendablePreferences0051
         * @tc.desc: Verify getStoreVersion returns current version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0051', 0, (done: Function) => {
            runCase('testSendablePreferences0051', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.getStoreVersion();
                addLog('testSendablePreferences0051: result=%{public}s', result);
                expect(result.indexOf('getStoreVersion:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5200
         * @tc.name: testSendablePreferences0052
         * @tc.desc: Verify setStoreVersion updates version.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0052', 0, (done: Function) => {
            runCase('testSendablePreferences0052', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.setStoreVersion(2);
                addLog('testSendablePreferences0052: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.getCurrentVersion()).assertEqual(2);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5300
         * @tc.name: testSendablePreferences0053
         * @tc.desc: Verify getStoreVersionSync returns version synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0053', 0, (done: Function) => {
            runCase('testSendablePreferences0053', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.getStoreVersionSync();
                addLog('testSendablePreferences0053: result=%{public}s', result);
                expect(result.indexOf('getStoreVersionSync:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5400
         * @tc.name: testSendablePreferences0054
         * @tc.desc: Verify setStoreVersionSync updates version synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0054', 0, (done: Function) => {
            runCase('testSendablePreferences0054', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.setStoreVersionSync(3);
                addLog('testSendablePreferences0054: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getCurrentVersion()).assertEqual(3);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5500
         * @tc.name: testSendablePreferences0055
         * @tc.desc: Verify getStatistics returns operation counts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0055', 0, (done: Function) => {
            runCase('testSendablePreferences0055', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                await helper.getValue();
                const result: string = helper.getStatistics();
                addLog('testSendablePreferences0055: result=%{public}s', result);
                expect(result.indexOf('Statistics:')).assertLargerOrEqual(0);
                expect(result.indexOf('reads=')).assertLargerOrEqual(0);
                expect(result.indexOf('writes=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5600
         * @tc.name: testSendablePreferences0056
         * @tc.desc: Verify resetStatistics clears all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0056', 0, (done: Function) => {
            runCase('testSendablePreferences0056', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                helper.resetStatistics();
                expect(helper.getReadCount()).assertEqual(0);
                expect(helper.getWriteCount()).assertEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5700
         * @tc.name: testSendablePreferences0057
         * @tc.desc: Verify getStoreInfo returns store metadata.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0057', 0, (done: Function) => {
            runCase('testSendablePreferences0057', async (): Promise<void> => {
                await helper.initialize();
                await helper.putValue();
                const result: string = await helper.getStoreInfo();
                addLog('testSendablePreferences0057: result=%{public}s', result);
                expect(result.indexOf('StoreInfo:')).assertLargerOrEqual(0);
                expect(result.indexOf('keys=')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5800
         * @tc.name: testSendablePreferences0058
         * @tc.desc: Verify getStoreInfoSync returns store metadata synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0058', 0, (done: Function) => {
            runCase('testSendablePreferences0058', async (): Promise<void> => {
                helper.initializeSync();
                helper.putValueSync();
                const result: string = helper.getStoreInfoSync();
                addLog('testSendablePreferences0058: result=%{public}s', result);
                expect(result.indexOf('StoreInfoSync:')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_5900
         * @tc.name: testSendablePreferences0059
         * @tc.desc: Verify putString stores a string value asynchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0059', 0, (done: Function) => {
            runCase('testSendablePreferences0059', async (): Promise<void> => {
                await helper.initialize();
                const result: string = await helper.putString('strKey', 'hello_world');
                addLog('testSendablePreferences0059: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(result.indexOf('strKey')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6000
         * @tc.name: testSendablePreferences0060
         * @tc.desc: Verify getString retrieves a string value asynchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0060', 0, (done: Function) => {
            runCase('testSendablePreferences0060', async (): Promise<void> => {
                await helper.initialize();
                await helper.putString('strKey', 'test_value');
                const result: string = await helper.getString('strKey', 'default');
                addLog('testSendablePreferences0060: result=%{public}s', result);
                expect(result.indexOf('getString:')).assertLargerOrEqual(0);
                expect(result.indexOf('strKey')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6100
         * @tc.name: testSendablePreferences0061
         * @tc.desc: Verify putStringSync stores a string value synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0061', 0, (done: Function) => {
            runCase('testSendablePreferences0061', async (): Promise<void> => {
                helper.initializeSync();
                const result: string = helper.putStringSync('syncStrKey', 'sync_value');
                addLog('testSendablePreferences0061: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6200
         * @tc.name: testSendablePreferences0062
         * @tc.desc: Verify getStringSync retrieves a string value synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0062', 0, (done: Function) => {
            runCase('testSendablePreferences0062', async (): Promise<void> => {
                helper.initializeSync();
                helper.putStringSync('syncStrKey', 'sync_value');
                const result: string = helper.getStringSync('syncStrKey', 'default');
                addLog('testSendablePreferences0062: result=%{public}s', result);
                expect(result.indexOf('getStringSync:')).assertLargerOrEqual(0);
                expect(result.indexOf('syncStrKey')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6300
         * @tc.name: testSendablePreferences0063
         * @tc.desc: Verify putObject stores an object value asynchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0063', 0, (done: Function) => {
            runCase('testSendablePreferences0063', async (): Promise<void> => {
                await helper.initialize();
                const objStr: string = JSON.stringify({ name: 'test', value: 42 });
                const result: string = await helper.putObject('objKey', objStr);
                addLog('testSendablePreferences0063: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6400
         * @tc.name: testSendablePreferences0064
         * @tc.desc: Verify getObject retrieves an object value asynchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0064', 0, (done: Function) => {
            runCase('testSendablePreferences0064', async (): Promise<void> => {
                await helper.initialize();
                const objStr: string = JSON.stringify({ name: 'test', value: 42 });
                await helper.putObject('objKey', objStr);
                const result: string = await helper.getObject('objKey', '{}');
                addLog('testSendablePreferences0064: result=%{public}s', result);
                expect(result.indexOf('getObject:')).assertLargerOrEqual(0);
                expect(result.indexOf('objKey')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6500
         * @tc.name: testSendablePreferences0065
         * @tc.desc: Verify putObjectSync stores an object value synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0065', 0, (done: Function) => {
            runCase('testSendablePreferences0065', async (): Promise<void> => {
                helper.initializeSync();
                const objStr: string = JSON.stringify({ key: 'val' });
                const result: string = helper.putObjectSync('syncObjKey', objStr);
                addLog('testSendablePreferences0065: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6600
         * @tc.name: testSendablePreferences0066
         * @tc.desc: Verify getObjectSync retrieves an object value synchronously.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0066', 0, (done: Function) => {
            runCase('testSendablePreferences0066', async (): Promise<void> => {
                helper.initializeSync();
                const objStr: string = JSON.stringify({ key: 'val' });
                helper.putObjectSync('syncObjKey', objStr);
                const result: string = helper.getObjectSync('syncObjKey', '{}');
                addLog('testSendablePreferences0066: result=%{public}s', result);
                expect(result.indexOf('getObjectSync:')).assertLargerOrEqual(0);
                expect(result.indexOf('syncObjKey')).assertLargerOrEqual(0);
                expect(helper.isInitialized()).assertTrue();
                expect(result.length > 0).assertTrue();
            }, done);
        });

        

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6700
         * @tc.name: testSendablePreferences0067
         * @tc.desc: Verify getLastAccessTime returns timestamp after read operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0067', 0, (done: Function) => {
            runCase('testSendablePreferences0067', async (): Promise<void> => {
                await helper.initialize();
                await helper.putString('timeKey', 'timeVal');
                await helper.getString('timeKey', 'default');
                const accessTime: number = helper.getLastAccessTime();
                addLog('testSendablePreferences0067: accessTime=%{public}d', String(accessTime));
                expect(accessTime).assertLarger(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getReadCount()).assertLargerOrEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_SENDABLE_PREFS_6800
         * @tc.name: testSendablePreferences0068
         * @tc.desc: Verify getLastWriteTime returns timestamp after write operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testSendablePreferences0068', 0, (done: Function) => {
            runCase('testSendablePreferences0068', async (): Promise<void> => {
                await helper.initialize();
                await helper.putString('writeKey', 'writeVal');
                const writeTime: number = helper.getLastWriteTime();
                addLog('testSendablePreferences0068: writeTime=%{public}d', String(writeTime));
                expect(writeTime).assertLarger(0);
                expect(helper.isInitialized()).assertTrue();
                expect(helper.getWriteCount()).assertLargerOrEqual(1);
            }, done);
        });
    });
}
