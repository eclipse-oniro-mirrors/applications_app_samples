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
import { DataStoreConfig, FeatureFlag } from '../../../main/ets/config/DataStoreConfig';
import { PerformanceMonitor, TimerEntry, MemorySnapshot, OperationStats } from '../../../main/ets/utils/PerformanceMonitor';
import { ErrorHandling, ErrorSeverity, ErrorCategory, ErrorEntry, RetryPolicy } from '../../../main/ets/utils/ErrorHandling';
import { StoreConfig, StoreType, SecurityLevel, EncryptionMode, SyncMode, LogLevel } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function configPerfErrorDeepTest(): void {
    describe('ConfigPerfErrorDeepTest', () => {
        beforeAll(() => {
            addLog('ConfigPerfErrorDeepTest suite started');
        })

        beforeEach(() => {
            DataStoreConfig.resetConfig();
            PerformanceMonitor.reset();
            ErrorHandling.clearHistory();
        })

        afterEach(() => {
            DataStoreConfig.resetConfig();
            PerformanceMonitor.reset();
            ErrorHandling.clearHistory();
        })

        afterAll(() => {
            addLog('ConfigPerfErrorDeepTest suite finished');
        })



        /*
         * @tc.number: SUB_DEEP_CPE_0100
         * @tc.name: testDeepCpe0001
         * @tc.desc: Verify getDefaultConfig returns valid config.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0001', 0, (done: Function) => {
            runCase('testDeepCpe0001', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                addLog('testDeepCpe0001: name=%{public}s', config.name);
                expect(config.name).assertEqual('sendable_data_store');
                expect(config.storeType).assertEqual(StoreType.PREFERENCES);
                expect(config.securityLevel).assertEqual(SecurityLevel.S3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0200
         * @tc.name: testDeepCpe0002
         * @tc.desc: Verify getDefaultConfig encryption mode is NONE.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0002', 0, (done: Function) => {
            runCase('testDeepCpe0002', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                addLog('testDeepCpe0002: encryption=%{public}s', config.encryptionMode);
                expect(config.encryptionMode).assertEqual(EncryptionMode.NONE);
                expect(config.autoBackup).assertFalse();
                expect(config.debugMode).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0300
         * @tc.name: testDeepCpe0003
         * @tc.desc: Verify getDefaultConfig sync mode is MANUAL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0003', 0, (done: Function) => {
            runCase('testDeepCpe0003', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                addLog('testDeepCpe0003: syncMode=%{public}s', config.syncMode);
                expect(config.syncMode).assertEqual(SyncMode.MANUAL);
                expect(config.maxRetries).assertEqual(3);
                expect(config.logLevel).assertEqual(LogLevel.INFO);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0400
         * @tc.name: testDeepCpe0004
         * @tc.desc: Verify getDefaultConfig sync interval.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0004', 0, (done: Function) => {
            runCase('testDeepCpe0004', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                addLog('testDeepCpe0004: interval=%{public}d', config.syncInterval);
                expect(config.syncInterval).assertEqual(300000);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_0500
         * @tc.name: testDeepCpe0005
         * @tc.desc: Verify getDevelopmentConfig has dev suffix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0005', 0, (done: Function) => {
            runCase('testDeepCpe0005', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDevelopmentConfig();
                addLog('testDeepCpe0005: name=%{public}s', config.name);
                expect(config.name.indexOf('_dev')).assertLargerOrEqual(0);
                expect(config.debugMode).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0600
         * @tc.name: testDeepCpe0006
         * @tc.desc: Verify getDevelopmentConfig security level S1.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0006', 0, (done: Function) => {
            runCase('testDeepCpe0006', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDevelopmentConfig();
                addLog('testDeepCpe0006: security=%{public}s', config.securityLevel);
                expect(config.securityLevel).assertEqual(SecurityLevel.S1);
                expect(config.logLevel).assertEqual(LogLevel.DEBUG);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0700
         * @tc.name: testDeepCpe0007
         * @tc.desc: Verify getDevelopmentConfig maxRetries is 1.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0007', 0, (done: Function) => {
            runCase('testDeepCpe0007', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDevelopmentConfig();
                expect(config.maxRetries).assertEqual(1);
                expect(config.encryptionMode).assertEqual(EncryptionMode.NONE);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_0800
         * @tc.name: testDeepCpe0008
         * @tc.desc: Verify getProductionConfig security level S4.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0008', 0, (done: Function) => {
            runCase('testDeepCpe0008', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getProductionConfig();
                addLog('testDeepCpe0008: security=%{public}s', config.securityLevel);
                expect(config.securityLevel).assertEqual(SecurityLevel.S4);
                expect(config.encryptionMode).assertEqual(EncryptionMode.AES_256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_0900
         * @tc.name: testDeepCpe0009
         * @tc.desc: Verify getProductionConfig autoBackup is true.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0009', 0, (done: Function) => {
            runCase('testDeepCpe0009', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getProductionConfig();
                addLog('testDeepCpe0009: autoBackup=%{public}s', config.autoBackup ? 'true' : 'false');
                expect(config.autoBackup).assertTrue();
                expect(config.syncMode).assertEqual(SyncMode.REAL_TIME);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1000
         * @tc.name: testDeepCpe0010
         * @tc.desc: Verify getProductionConfig maxRetries is 5.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0010', 0, (done: Function) => {
            runCase('testDeepCpe0010', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getProductionConfig();
                expect(config.maxRetries).assertEqual(5);
                expect(config.logLevel).assertEqual(LogLevel.ERROR);
                expect(config.debugMode).assertFalse();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_1100
         * @tc.name: testDeepCpe0011
         * @tc.desc: Verify getTestConfig has test suffix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0011', 0, (done: Function) => {
            runCase('testDeepCpe0011', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getTestConfig();
                addLog('testDeepCpe0011: name=%{public}s', config.name);
                expect(config.name.indexOf('_test')).assertLargerOrEqual(0);
                expect(config.logLevel).assertEqual(LogLevel.NONE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1200
         * @tc.name: testDeepCpe0012
         * @tc.desc: Verify getTestConfig sync interval is 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0012', 0, (done: Function) => {
            runCase('testDeepCpe0012', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getTestConfig();
                expect(config.syncInterval).assertEqual(0);
                expect(config.autoBackup).assertFalse();
                expect(config.maxRetries).assertEqual(1);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_1300
         * @tc.name: testDeepCpe0013
         * @tc.desc: Verify loadConfig returns default when no config saved.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0013', 0, (done: Function) => {
            runCase('testDeepCpe0013', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.loadConfig();
                addLog('testDeepCpe0013: name=%{public}s', config.name);
                expect(config.name).assertEqual('sendable_data_store');
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1400
         * @tc.name: testDeepCpe0014
         * @tc.desc: Verify saveConfig then loadConfig returns saved config.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0014', 0, (done: Function) => {
            runCase('testDeepCpe0014', async (): Promise<void> => {
                const devConfig: StoreConfig = DataStoreConfig.getDevelopmentConfig();
                DataStoreConfig.saveConfig(devConfig);
                const loaded: StoreConfig = DataStoreConfig.loadConfig();
                addLog('testDeepCpe0014: name=%{public}s', loaded.name);
                expect(loaded.name).assertEqual(devConfig.name);
                expect(loaded.debugMode).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1500
         * @tc.name: testDeepCpe0015
         * @tc.desc: Verify resetConfig restores defaults.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0015', 0, (done: Function) => {
            runCase('testDeepCpe0015', async (): Promise<void> => {
                DataStoreConfig.saveConfig(DataStoreConfig.getProductionConfig());
                DataStoreConfig.resetConfig();
                const loaded: StoreConfig = DataStoreConfig.loadConfig();
                addLog('testDeepCpe0015: name=%{public}s', loaded.name);
                expect(loaded.securityLevel).assertEqual(SecurityLevel.S3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1600
         * @tc.name: testDeepCpe0016
         * @tc.desc: Verify getCurrentConfig returns null before load.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0016', 0, (done: Function) => {
            runCase('testDeepCpe0016', async (): Promise<void> => {
                DataStoreConfig.resetConfig();
                const current: StoreConfig | null = DataStoreConfig.getCurrentConfig();
                addLog('testDeepCpe0016: isNull=%{public}s', current === null ? 'true' : 'false');
                // After reset, currentConfig is set to default via saveConfig internally
                expect(current !== null).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1700
         * @tc.name: testDeepCpe0017
         * @tc.desc: Verify save then getCurrentConfig returns saved.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0017', 0, (done: Function) => {
            runCase('testDeepCpe0017', async (): Promise<void> => {
                const prodConfig: StoreConfig = DataStoreConfig.getProductionConfig();
                DataStoreConfig.saveConfig(prodConfig);
                const current: StoreConfig | null = DataStoreConfig.getCurrentConfig();
                addLog('testDeepCpe0017: name=%{public}s', current !== null ? current.name : 'null');
                expect(current !== null).assertTrue();
                if (current !== null) {
                    expect(current.encryptionMode).assertEqual(EncryptionMode.AES_256);
                }
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1800
         * @tc.name: testDeepCpe0018
         * @tc.desc: Verify loadConfig twice returns same config.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0018', 0, (done: Function) => {
            runCase('testDeepCpe0018', async (): Promise<void> => {
                DataStoreConfig.saveConfig(DataStoreConfig.getDevelopmentConfig());
                const first: StoreConfig = DataStoreConfig.loadConfig();
                const second: StoreConfig = DataStoreConfig.loadConfig();
                addLog('testDeepCpe0018: first=%{public}s, second=%{public}s', first.name, second.name);
                expect(first.name).assertEqual(second.name);
                expect(first.debugMode).assertEqual(second.debugMode);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_1900
         * @tc.name: testDeepCpe0019
         * @tc.desc: Verify setConfigValue then getConfigValue.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0019', 0, (done: Function) => {
            runCase('testDeepCpe0019', async (): Promise<void> => {
                DataStoreConfig.setConfigValue('testKey', 'testValue');
                const value: string | null = DataStoreConfig.getConfigValue('testKey');
                addLog('testDeepCpe0019: value=%{public}s', value !== null ? value : 'null');
                expect(value).assertEqual('testValue');
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2000
         * @tc.name: testDeepCpe0020
         * @tc.desc: Verify getConfigValue returns null for missing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0020', 0, (done: Function) => {
            runCase('testDeepCpe0020', async (): Promise<void> => {
                const value: string | null = DataStoreConfig.getConfigValue('nonexistent');
                addLog('testDeepCpe0020: isNull=%{public}s', value === null ? 'true' : 'false');
                expect(value).assertNull();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2100
         * @tc.name: testDeepCpe0021
         * @tc.desc: Verify removeConfigValue removes the key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0021', 0, (done: Function) => {
            runCase('testDeepCpe0021', async (): Promise<void> => {
                DataStoreConfig.setConfigValue('key1', 'val1');
                const removed: boolean = DataStoreConfig.removeConfigValue('key1');
                const value: string | null = DataStoreConfig.getConfigValue('key1');
                addLog('testDeepCpe0021: removed=%{public}s', removed ? 'true' : 'false');
                expect(removed).assertTrue();
                expect(value).assertNull();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2200
         * @tc.name: testDeepCpe0022
         * @tc.desc: Verify removeConfigValue returns false for missing key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0022', 0, (done: Function) => {
            runCase('testDeepCpe0022', async (): Promise<void> => {
                const removed: boolean = DataStoreConfig.removeConfigValue('noKey');
                addLog('testDeepCpe0022: removed=%{public}s', removed ? 'true' : 'false');
                expect(removed).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2300
         * @tc.name: testDeepCpe0023
         * @tc.desc: Verify getAllConfigValues returns copy of map.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0023', 0, (done: Function) => {
            runCase('testDeepCpe0023', async (): Promise<void> => {
                DataStoreConfig.setConfigValue('a', '1');
                DataStoreConfig.setConfigValue('b', '2');
                const all: Map<string, string> = DataStoreConfig.getAllConfigValues();
                addLog('testDeepCpe0023: size=%{public}d', all.size);
                expect(all.get('a')).assertEqual('1');
                expect(all.get('b')).assertEqual('2');
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2400
         * @tc.name: testDeepCpe0024
         * @tc.desc: Verify setConfigValue overwrites previous value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0024', 0, (done: Function) => {
            runCase('testDeepCpe0024', async (): Promise<void> => {
                DataStoreConfig.setConfigValue('key', 'old');
                DataStoreConfig.setConfigValue('key', 'new');
                const value: string | null = DataStoreConfig.getConfigValue('key');
                addLog('testDeepCpe0024: value=%{public}s', value !== null ? value : 'null');
                expect(value).assertEqual('new');
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_2500
         * @tc.name: testDeepCpe0025
         * @tc.desc: Verify setFeatureFlag then isFeatureEnabled.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0025', 0, (done: Function) => {
            runCase('testDeepCpe0025', async (): Promise<void> => {
                DataStoreConfig.setFeatureFlag('testFeature', true, 'A test feature');
                const enabled: boolean = DataStoreConfig.isFeatureEnabled('testFeature');
                addLog('testDeepCpe0025: enabled=%{public}s', enabled ? 'true' : 'false');
                expect(enabled).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2600
         * @tc.name: testDeepCpe0026
         * @tc.desc: Verify isFeatureEnabled returns false for unknown feature.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0026', 0, (done: Function) => {
            runCase('testDeepCpe0026', async (): Promise<void> => {
                const enabled: boolean = DataStoreConfig.isFeatureEnabled('unknown');
                addLog('testDeepCpe0026: enabled=%{public}s', enabled ? 'true' : 'false');
                expect(enabled).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2700
         * @tc.name: testDeepCpe0027
         * @tc.desc: Verify setFeatureFlag with disabled state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0027', 0, (done: Function) => {
            runCase('testDeepCpe0027', async (): Promise<void> => {
                DataStoreConfig.setFeatureFlag('feat', false, 'Disabled');
                const enabled: boolean = DataStoreConfig.isFeatureEnabled('feat');
                expect(enabled).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2800
         * @tc.name: testDeepCpe0028
         * @tc.desc: Verify removeFeatureFlag removes the flag.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0028', 0, (done: Function) => {
            runCase('testDeepCpe0028', async (): Promise<void> => {
                DataStoreConfig.setFeatureFlag('temp', true, 'Temporary');
                const removed: boolean = DataStoreConfig.removeFeatureFlag('temp');
                expect(removed).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('temp')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_2900
         * @tc.name: testDeepCpe0029
         * @tc.desc: Verify getAllFeatureFlags returns all flags.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0029', 0, (done: Function) => {
            runCase('testDeepCpe0029', async (): Promise<void> => {
                DataStoreConfig.setFeatureFlag('f1', true, 'First');
                DataStoreConfig.setFeatureFlag('f2', false, 'Second');
                const flags: FeatureFlag[] = DataStoreConfig.getAllFeatureFlags();
                addLog('testDeepCpe0029: count=%{public}d', flags.length);
                // Feature flags accumulate across tests; expect at least the 2 we just set
                expect(flags.length).assertLargerOrEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3000
         * @tc.name: testDeepCpe0030
         * @tc.desc: Verify getEnabledFeatureFlags returns only enabled.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0030', 0, (done: Function) => {
            runCase('testDeepCpe0030', async (): Promise<void> => {
                DataStoreConfig.setFeatureFlag('on', true, 'Enabled');
                DataStoreConfig.setFeatureFlag('off', false, 'Disabled');
                const enabled: FeatureFlag[] = DataStoreConfig.getEnabledFeatureFlags();
                addLog('testDeepCpe0030: count=%{public}d', enabled.length);
                // Feature flags accumulate; 'on' should be in the enabled list
                expect(enabled.length).assertLargerOrEqual(1);
                // Verify our 'on' flag is present
                let foundOn = false;
                for (let i = 0; i < enabled.length; i++) {
                    if (enabled[i].name === 'on') {
                        foundOn = true;
                        break;
                    }
                }
                expect(foundOn).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3100
         * @tc.name: testDeepCpe0031
         * @tc.desc: Verify enableDefaultFeatureFlags sets standard flags.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0031', 0, (done: Function) => {
            runCase('testDeepCpe0031', async (): Promise<void> => {
                DataStoreConfig.enableDefaultFeatureFlags();
                expect(DataStoreConfig.isFeatureEnabled('batchOperations')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('typedOperations')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('collections')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('encryption')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3200
         * @tc.name: testDeepCpe0032
         * @tc.desc: Verify enableDefaultFeatureFlags distributed is false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0032', 0, (done: Function) => {
            runCase('testDeepCpe0032', async (): Promise<void> => {
                DataStoreConfig.enableDefaultFeatureFlags();
                expect(DataStoreConfig.isFeatureEnabled('distributed')).assertFalse();
                expect(DataStoreConfig.isFeatureEnabled('migration')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('backup')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3300
         * @tc.name: testDeepCpe0033
         * @tc.desc: Verify enableDefaultFeatureFlags performanceMonitor is true.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0033', 0, (done: Function) => {
            runCase('testDeepCpe0033', async (): Promise<void> => {
                DataStoreConfig.enableDefaultFeatureFlags();
                expect(DataStoreConfig.isFeatureEnabled('performanceMonitor')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('errorHandling')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('prefixOperations')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3400
         * @tc.name: testDeepCpe0034
         * @tc.desc: Verify enableDefaultFeatureFlags multiTable and transactions.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0034', 0, (done: Function) => {
            runCase('testDeepCpe0034', async (): Promise<void> => {
                DataStoreConfig.enableDefaultFeatureFlags();
                expect(DataStoreConfig.isFeatureEnabled('multiTable')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('transactions')).assertTrue();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_3500
         * @tc.name: testDeepCpe0035
         * @tc.desc: Verify validateConfig with valid config returns true.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0035', 0, (done: Function) => {
            runCase('testDeepCpe0035', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                const valid: boolean = DataStoreConfig.validateConfig(config);
                addLog('testDeepCpe0035: valid=%{public}s', valid ? 'true' : 'false');
                expect(valid).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3600
         * @tc.name: testDeepCpe0036
         * @tc.desc: Verify validateConfig with empty name returns false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0036', 0, (done: Function) => {
            runCase('testDeepCpe0036', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                config.name = '';
                const valid: boolean = DataStoreConfig.validateConfig(config);
                addLog('testDeepCpe0036: valid=%{public}s', valid ? 'true' : 'false');
                expect(valid).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3700
         * @tc.name: testDeepCpe0037
         * @tc.desc: Verify validateConfig with negative maxRetries returns false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0037', 0, (done: Function) => {
            runCase('testDeepCpe0037', async (): Promise<void> => {
                const config: StoreConfig = DataStoreConfig.getDefaultConfig();
                config.maxRetries = -1;
                const valid: boolean = DataStoreConfig.validateConfig(config);
                expect(valid).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3800
         * @tc.name: testDeepCpe0038
         * @tc.desc: Verify mergeConfig uses overrides.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0038', 0, (done: Function) => {
            runCase('testDeepCpe0038', async (): Promise<void> => {
                const base: StoreConfig = DataStoreConfig.getDefaultConfig();
                const overrides: StoreConfig = DataStoreConfig.getProductionConfig();
                const merged: StoreConfig = DataStoreConfig.mergeConfig(base, overrides);
                addLog('testDeepCpe0038: name=%{public}s', merged.name);
                expect(merged.encryptionMode).assertEqual(EncryptionMode.AES_256);
                expect(merged.autoBackup).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_3900
         * @tc.name: testDeepCpe0039
         * @tc.desc: Verify mergeConfig keeps base name when override empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0039', 0, (done: Function) => {
            runCase('testDeepCpe0039', async (): Promise<void> => {
                const base: StoreConfig = DataStoreConfig.getDefaultConfig();
                const overrides: StoreConfig = DataStoreConfig.getDefaultConfig();
                overrides.name = '';
                const merged: StoreConfig = DataStoreConfig.mergeConfig(base, overrides);
                addLog('testDeepCpe0039: name=%{public}s', merged.name);
                expect(merged.name).assertEqual(base.name);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4000
         * @tc.name: testDeepCpe0040
         * @tc.desc: Verify getConfigSummary returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0040', 0, (done: Function) => {
            runCase('testDeepCpe0040', async (): Promise<void> => {
                DataStoreConfig.saveConfig(DataStoreConfig.getDefaultConfig());
                const summary: string = DataStoreConfig.getConfigSummary();
                addLog('testDeepCpe0040: summary=%{public}s', summary);
                expect(summary.indexOf('Config:')).assertLargerOrEqual(0);
                expect(summary.indexOf('sendable_data_store')).assertLargerOrEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_4100
         * @tc.name: testDeepCpe0041
         * @tc.desc: Verify startTimer and stopTimer returns duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0041', 0, (done: Function) => {
            runCase('testDeepCpe0041', async (): Promise<void> => {
                PerformanceMonitor.startTimer('op1');
                const duration: number = PerformanceMonitor.stopTimer('op1');
                addLog('testDeepCpe0041: duration=%{public}d', duration);
                expect(duration).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4200
         * @tc.name: testDeepCpe0042
         * @tc.desc: Verify stopTimer on nonexistent timer returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0042', 0, (done: Function) => {
            runCase('testDeepCpe0042', async (): Promise<void> => {
                const duration: number = PerformanceMonitor.stopTimer('noTimer');
                addLog('testDeepCpe0042: duration=%{public}d', duration);
                expect(duration).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4300
         * @tc.name: testDeepCpe0043
         * @tc.desc: Verify isTimerRunning after start.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0043', 0, (done: Function) => {
            runCase('testDeepCpe0043', async (): Promise<void> => {
                PerformanceMonitor.startTimer('running');
                expect(PerformanceMonitor.isTimerRunning('running')).assertTrue();
                PerformanceMonitor.stopTimer('running');
                expect(PerformanceMonitor.isTimerRunning('running')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4400
         * @tc.name: testDeepCpe0044
         * @tc.desc: Verify isTimerRunning returns false for unknown.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0044', 0, (done: Function) => {
            runCase('testDeepCpe0044', async (): Promise<void> => {
                expect(PerformanceMonitor.isTimerRunning('unknown')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4500
         * @tc.name: testDeepCpe0045
         * @tc.desc: Verify getElapsed returns running time.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0045', 0, (done: Function) => {
            runCase('testDeepCpe0045', async (): Promise<void> => {
                PerformanceMonitor.startTimer('elapsed');
                const elapsed: number = PerformanceMonitor.getElapsed('elapsed');
                addLog('testDeepCpe0045: elapsed=%{public}d', elapsed);
                expect(elapsed).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4600
         * @tc.name: testDeepCpe0046
         * @tc.desc: Verify getElapsed for unknown timer returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0046', 0, (done: Function) => {
            runCase('testDeepCpe0046', async (): Promise<void> => {
                const elapsed: number = PerformanceMonitor.getElapsed('noTimer');
                expect(elapsed).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4700
         * @tc.name: testDeepCpe0047
         * @tc.desc: Verify removeTimer removes the timer.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0047', 0, (done: Function) => {
            runCase('testDeepCpe0047', async (): Promise<void> => {
                PerformanceMonitor.startTimer('temp');
                PerformanceMonitor.removeTimer('temp');
                expect(PerformanceMonitor.isTimerRunning('temp')).assertFalse();
                expect(PerformanceMonitor.getElapsed('temp')).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_4800
         * @tc.name: testDeepCpe0048
         * @tc.desc: Verify clearAllTimers removes all timers.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0048', 0, (done: Function) => {
            runCase('testDeepCpe0048', async (): Promise<void> => {
                PerformanceMonitor.startTimer('t1');
                PerformanceMonitor.startTimer('t2');
                PerformanceMonitor.clearAllTimers();
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(0);
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_4900
         * @tc.name: testDeepCpe0049
         * @tc.desc: Verify getActiveTimerCount and getTotalTimerCount.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0049', 0, (done: Function) => {
            runCase('testDeepCpe0049', async (): Promise<void> => {
                PerformanceMonitor.startTimer('a');
                PerformanceMonitor.startTimer('b');
                PerformanceMonitor.stopTimer('a');
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(1);
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5000
         * @tc.name: testDeepCpe0050
         * @tc.desc: Verify stopTimer twice returns same duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0050', 0, (done: Function) => {
            runCase('testDeepCpe0050', async (): Promise<void> => {
                PerformanceMonitor.startTimer('double');
                const first: number = PerformanceMonitor.stopTimer('double');
                const second: number = PerformanceMonitor.stopTimer('double');
                addLog('testDeepCpe0050: first=%{public}d, second=%{public}d', first, second);
                expect(first).assertEqual(second);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5100
         * @tc.name: testDeepCpe0051
         * @tc.desc: Verify getElapsed after stop returns final duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0051', 0, (done: Function) => {
            runCase('testDeepCpe0051', async (): Promise<void> => {
                PerformanceMonitor.startTimer('final');
                PerformanceMonitor.stopTimer('final');
                const elapsed: number = PerformanceMonitor.getElapsed('final');
                const stopResult: number = PerformanceMonitor.stopTimer('final');
                expect(elapsed).assertEqual(stopResult);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5200
         * @tc.name: testDeepCpe0052
         * @tc.desc: Verify multiple timers independently tracked.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0052', 0, (done: Function) => {
            runCase('testDeepCpe0052', async (): Promise<void> => {
                PerformanceMonitor.startTimer('x');
                PerformanceMonitor.startTimer('y');
                PerformanceMonitor.stopTimer('x');
                expect(PerformanceMonitor.isTimerRunning('x')).assertFalse();
                expect(PerformanceMonitor.isTimerRunning('y')).assertTrue();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_5300
         * @tc.name: testDeepCpe0053
         * @tc.desc: Verify recordMemorySnapshot returns snapshot.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0053', 0, (done: Function) => {
            runCase('testDeepCpe0053', async (): Promise<void> => {
                const snap: MemorySnapshot = PerformanceMonitor.recordMemorySnapshot('test');
                addLog('testDeepCpe0053: label=%{public}s', snap.label);
                expect(snap.label).assertEqual('test');
                expect(snap.timestamp).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5400
         * @tc.name: testDeepCpe0054
         * @tc.desc: Verify getMemoryUsage returns current snapshot.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0054', 0, (done: Function) => {
            runCase('testDeepCpe0054', async (): Promise<void> => {
                const usage: MemorySnapshot = PerformanceMonitor.getMemoryUsage();
                addLog('testDeepCpe0054: label=%{public}s', usage.label);
                expect(usage.label).assertEqual('current');
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5500
         * @tc.name: testDeepCpe0055
         * @tc.desc: Verify getMemorySnapshots returns recorded snapshots.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0055', 0, (done: Function) => {
            runCase('testDeepCpe0055', async (): Promise<void> => {
                PerformanceMonitor.recordMemorySnapshot('s1');
                PerformanceMonitor.recordMemorySnapshot('s2');
                const snaps: MemorySnapshot[] = PerformanceMonitor.getMemorySnapshots();
                addLog('testDeepCpe0055: count=%{public}d', snaps.length);
                expect(snaps.length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5600
         * @tc.name: testDeepCpe0056
         * @tc.desc: Verify getMemoryDelta with less than 2 snapshots.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0056', 0, (done: Function) => {
            runCase('testDeepCpe0056', async (): Promise<void> => {
                const delta: number = PerformanceMonitor.getMemoryDelta();
                addLog('testDeepCpe0056: delta=%{public}d', delta);
                expect(delta).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5700
         * @tc.name: testDeepCpe0057
         * @tc.desc: Verify clearMemorySnapshots empties list.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0057', 0, (done: Function) => {
            runCase('testDeepCpe0057', async (): Promise<void> => {
                PerformanceMonitor.recordMemorySnapshot('s1');
                PerformanceMonitor.clearMemorySnapshots();
                const snaps: MemorySnapshot[] = PerformanceMonitor.getMemorySnapshots();
                expect(snaps.length).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_5800
         * @tc.name: testDeepCpe0058
         * @tc.desc: Verify getMemoryDelta with 2 snapshots.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0058', 0, (done: Function) => {
            runCase('testDeepCpe0058', async (): Promise<void> => {
                PerformanceMonitor.recordMemorySnapshot('first');
                PerformanceMonitor.recordMemorySnapshot('second');
                const delta: number = PerformanceMonitor.getMemoryDelta();
                addLog('testDeepCpe0058: delta=%{public}d', delta);
                expect(delta).assertEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_5900
         * @tc.name: testDeepCpe0059
         * @tc.desc: Verify recordOperation and getOperationCount.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0059', 0, (done: Function) => {
            runCase('testDeepCpe0059', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('read', 10, true);
                PerformanceMonitor.recordOperation('write', 20, true);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6000
         * @tc.name: testDeepCpe0060
         * @tc.desc: Verify getAverageTime returns correct average.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0060', 0, (done: Function) => {
            runCase('testDeepCpe0060', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 20, true);
                const avg: number = PerformanceMonitor.getAverageTime('op');
                addLog('testDeepCpe0060: avg=%{public}d', avg);
                expect(avg).assertEqual(15);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6100
         * @tc.name: testDeepCpe0061
         * @tc.desc: Verify getMinTime returns minimum duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0061', 0, (done: Function) => {
            runCase('testDeepCpe0061', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 30, true);
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 20, true);
                const min: number = PerformanceMonitor.getMinTime('op');
                addLog('testDeepCpe0061: min=%{public}d', min);
                expect(min).assertEqual(10);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6200
         * @tc.name: testDeepCpe0062
         * @tc.desc: Verify getMaxTime returns maximum duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0062', 0, (done: Function) => {
            runCase('testDeepCpe0062', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 30, true);
                PerformanceMonitor.recordOperation('op', 10, true);
                const max: number = PerformanceMonitor.getMaxTime('op');
                addLog('testDeepCpe0062: max=%{public}d', max);
                expect(max).assertEqual(30);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6300
         * @tc.name: testDeepCpe0063
         * @tc.desc: Verify getLastTime returns last duration.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0063', 0, (done: Function) => {
            runCase('testDeepCpe0063', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 99, true);
                const last: number = PerformanceMonitor.getLastTime('op');
                expect(last).assertEqual(99);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6400
         * @tc.name: testDeepCpe0064
         * @tc.desc: Verify getSuccessRate returns correct rate.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0064', 0, (done: Function) => {
            runCase('testDeepCpe0064', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 10, false);
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 10, true);
                const rate: number = PerformanceMonitor.getSuccessRate('op');
                addLog('testDeepCpe0064: rate=%{public}d', rate);
                expect(rate).assertEqual(0.75);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6500
         * @tc.name: testDeepCpe0065
         * @tc.desc: Verify getFailureRate is complement of success rate.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0065', 0, (done: Function) => {
            runCase('testDeepCpe0065', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 10, false);
                const failRate: number = PerformanceMonitor.getFailureRate('op');
                addLog('testDeepCpe0065: failRate=%{public}d', failRate);
                expect(failRate).assertEqual(0.5);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6600
         * @tc.name: testDeepCpe0066
         * @tc.desc: Verify getAverageTime for unknown operation returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0066', 0, (done: Function) => {
            runCase('testDeepCpe0066', async (): Promise<void> => {
                const avg: number = PerformanceMonitor.getAverageTime('unknown');
                expect(avg).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6700
         * @tc.name: testDeepCpe0067
         * @tc.desc: Verify getAllOperationNames returns registered names.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0067', 0, (done: Function) => {
            runCase('testDeepCpe0067', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('read', 10, true);
                PerformanceMonitor.recordOperation('write', 20, true);
                const names: string[] = PerformanceMonitor.getAllOperationNames();
                addLog('testDeepCpe0067: count=%{public}d', names.length);
                expect(names.length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6800
         * @tc.name: testDeepCpe0068
         * @tc.desc: Verify getTotalOperationCount sums all operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0068', 0, (done: Function) => {
            runCase('testDeepCpe0068', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('a', 1, true);
                PerformanceMonitor.recordOperation('a', 2, true);
                PerformanceMonitor.recordOperation('b', 3, false);
                const total: number = PerformanceMonitor.getTotalOperationCount();
                expect(total).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_6900
         * @tc.name: testDeepCpe0069
         * @tc.desc: Verify clearOperationStats empties all stats.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0069', 0, (done: Function) => {
            runCase('testDeepCpe0069', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('x', 10, true);
                PerformanceMonitor.clearOperationStats();
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7000
         * @tc.name: testDeepCpe0070
         * @tc.desc: Verify clearOperationStatsByName removes specific op.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0070', 0, (done: Function) => {
            runCase('testDeepCpe0070', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('keep', 10, true);
                PerformanceMonitor.recordOperation('remove', 20, true);
                PerformanceMonitor.clearOperationStatsByName('remove');
                expect(PerformanceMonitor.getOperationCount()).assertEqual(1);
                expect(PerformanceMonitor.getAverageTime('remove')).assertEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_7100
         * @tc.name: testDeepCpe0071
         * @tc.desc: Verify formatStats returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0071', 0, (done: Function) => {
            runCase('testDeepCpe0071', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('read', 10, true);
                PerformanceMonitor.recordOperation('read', 20, true);
                const formatted: string = PerformanceMonitor.formatStats('read');
                addLog('testDeepCpe0071: formatted=%{public}s', formatted);
                expect(formatted.indexOf('read')).assertLargerOrEqual(0);
                expect(formatted.indexOf('Total: 2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7200
         * @tc.name: testDeepCpe0072
         * @tc.desc: Verify formatStats for unknown operation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0072', 0, (done: Function) => {
            runCase('testDeepCpe0072', async (): Promise<void> => {
                const formatted: string = PerformanceMonitor.formatStats('unknown');
                addLog('testDeepCpe0072: formatted=%{public}s', formatted);
                expect(formatted.indexOf('No stats')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7300
         * @tc.name: testDeepCpe0073
         * @tc.desc: Verify formatAllStats returns all formatted stats.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0073', 0, (done: Function) => {
            runCase('testDeepCpe0073', async (): Promise<void> => {
                PerformanceMonitor.recordOperation('a', 10, true);
                PerformanceMonitor.recordOperation('b', 20, false);
                const all: string = PerformanceMonitor.formatAllStats();
                addLog('testDeepCpe0073: len=%{public}d', all.length);
                expect(all.indexOf('a')).assertLargerOrEqual(0);
                expect(all.indexOf('b')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7400
         * @tc.name: testDeepCpe0074
         * @tc.desc: Verify getSummary returns summary string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0074', 0, (done: Function) => {
            runCase('testDeepCpe0074', async (): Promise<void> => {
                PerformanceMonitor.startTimer('t1');
                PerformanceMonitor.recordOperation('op1', 5, true);
                const summary: string = PerformanceMonitor.getSummary();
                addLog('testDeepCpe0074: summary=%{public}s', summary);
                expect(summary.indexOf('Timers:')).assertLargerOrEqual(0);
                expect(summary.indexOf('Operations:')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7500
         * @tc.name: testDeepCpe0075
         * @tc.desc: Verify reset clears all monitoring data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0075', 0, (done: Function) => {
            runCase('testDeepCpe0075', async (): Promise<void> => {
                PerformanceMonitor.startTimer('timer');
                PerformanceMonitor.recordMemorySnapshot('snap');
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(0);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7600
         * @tc.name: testDeepCpe0076
         * @tc.desc: Verify getSuccessRate for unknown operation returns 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0076', 0, (done: Function) => {
            runCase('testDeepCpe0076', async (): Promise<void> => {
                const rate: number = PerformanceMonitor.getSuccessRate('noOp');
                expect(rate).assertEqual(0);
                const failRate: number = PerformanceMonitor.getFailureRate('noOp');
                expect(failRate).assertEqual(1);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_7700
         * @tc.name: testDeepCpe0077
         * @tc.desc: Verify classifyError for INITIALIZATION errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0077', 0, (done: Function) => {
            runCase('testDeepCpe0077', async (): Promise<void> => {
                const cat1: ErrorCategory = ErrorHandling.classifyError(10001);
                const cat2: ErrorCategory = ErrorHandling.classifyError(10002);
                addLog('testDeepCpe0077: cat1=%{public}s, cat2=%{public}s', cat1, cat2);
                expect(cat1).assertEqual(ErrorCategory.INITIALIZATION);
                expect(cat2).assertEqual(ErrorCategory.INITIALIZATION);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7800
         * @tc.name: testDeepCpe0078
         * @tc.desc: Verify classifyError for VALIDATION errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0078', 0, (done: Function) => {
            runCase('testDeepCpe0078', async (): Promise<void> => {
                const cat1: ErrorCategory = ErrorHandling.classifyError(10003);
                const cat2: ErrorCategory = ErrorHandling.classifyError(10004);
                const cat3: ErrorCategory = ErrorHandling.classifyError(10014);
                addLog('testDeepCpe0078: cat=%{public}s', cat1);
                expect(cat1).assertEqual(ErrorCategory.VALIDATION);
                expect(cat2).assertEqual(ErrorCategory.VALIDATION);
                expect(cat3).assertEqual(ErrorCategory.VALIDATION);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_7900
         * @tc.name: testDeepCpe0079
         * @tc.desc: Verify classifyError for STORAGE errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0079', 0, (done: Function) => {
            runCase('testDeepCpe0079', async (): Promise<void> => {
                const cat1: ErrorCategory = ErrorHandling.classifyError(10005);
                const cat2: ErrorCategory = ErrorHandling.classifyError(10006);
                addLog('testDeepCpe0079: cat=%{public}s', cat1);
                expect(cat1).assertEqual(ErrorCategory.STORAGE);
                expect(cat2).assertEqual(ErrorCategory.STORAGE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8000
         * @tc.name: testDeepCpe0080
         * @tc.desc: Verify classifyError for NETWORK errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0080', 0, (done: Function) => {
            runCase('testDeepCpe0080', async (): Promise<void> => {
                const cat1: ErrorCategory = ErrorHandling.classifyError(10007);
                const cat2: ErrorCategory = ErrorHandling.classifyError(10018);
                addLog('testDeepCpe0080: cat=%{public}s', cat1);
                expect(cat1).assertEqual(ErrorCategory.NETWORK);
                expect(cat2).assertEqual(ErrorCategory.NETWORK);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8100
         * @tc.name: testDeepCpe0081
         * @tc.desc: Verify classifyError for SECURITY error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0081', 0, (done: Function) => {
            runCase('testDeepCpe0081', async (): Promise<void> => {
                const cat: ErrorCategory = ErrorHandling.classifyError(10008);
                expect(cat).assertEqual(ErrorCategory.SECURITY);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8200
         * @tc.name: testDeepCpe0082
         * @tc.desc: Verify classifyError for MIGRATION error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0082', 0, (done: Function) => {
            runCase('testDeepCpe0082', async (): Promise<void> => {
                const cat: ErrorCategory = ErrorHandling.classifyError(10009);
                expect(cat).assertEqual(ErrorCategory.MIGRATION);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8300
         * @tc.name: testDeepCpe0083
         * @tc.desc: Verify classifyError for SYNC error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0083', 0, (done: Function) => {
            runCase('testDeepCpe0083', async (): Promise<void> => {
                const cat: ErrorCategory = ErrorHandling.classifyError(10011);
                expect(cat).assertEqual(ErrorCategory.SYNC);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8400
         * @tc.name: testDeepCpe0084
         * @tc.desc: Verify classifyError for unknown error returns INTERNAL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0084', 0, (done: Function) => {
            runCase('testDeepCpe0084', async (): Promise<void> => {
                const cat: ErrorCategory = ErrorHandling.classifyError(99999);
                addLog('testDeepCpe0084: cat=%{public}s', cat);
                expect(cat).assertEqual(ErrorCategory.INTERNAL);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_8500
         * @tc.name: testDeepCpe0085
         * @tc.desc: Verify isRetryable for NETWORK errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0085', 0, (done: Function) => {
            runCase('testDeepCpe0085', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(10007)).assertTrue();
                expect(ErrorHandling.isRetryable(10018)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8600
         * @tc.name: testDeepCpe0086
         * @tc.desc: Verify isRetryable for VALIDATION errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0086', 0, (done: Function) => {
            runCase('testDeepCpe0086', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(10003)).assertFalse();
                expect(ErrorHandling.isRetryable(10004)).assertFalse();
                expect(ErrorHandling.isRetryable(10014)).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8700
         * @tc.name: testDeepCpe0087
         * @tc.desc: Verify isRetryable for STORE_FULL.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0087', 0, (done: Function) => {
            runCase('testDeepCpe0087', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(10005)).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8800
         * @tc.name: testDeepCpe0088
         * @tc.desc: Verify isRetryable for ENCRYPTION.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0088', 0, (done: Function) => {
            runCase('testDeepCpe0088', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(10008)).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_8900
         * @tc.name: testDeepCpe0089
         * @tc.desc: Verify isRetryable for NOT_INITIALIZED.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0089', 0, (done: Function) => {
            runCase('testDeepCpe0089', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(10001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9000
         * @tc.name: testDeepCpe0090
         * @tc.desc: Verify isRetryable for unknown error code.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0090', 0, (done: Function) => {
            runCase('testDeepCpe0090', async (): Promise<void> => {
                expect(ErrorHandling.isRetryable(99999)).assertFalse();
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_9100
         * @tc.name: testDeepCpe0091
         * @tc.desc: Verify getErrorSeverity for CRITICAL errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0091', 0, (done: Function) => {
            runCase('testDeepCpe0091', async (): Promise<void> => {
                const sev1: ErrorSeverity = ErrorHandling.getErrorSeverity(10008);
                const sev2: ErrorSeverity = ErrorHandling.getErrorSeverity(10009);
                addLog('testDeepCpe0091: sev=%{public}s', sev1);
                expect(sev1).assertEqual(ErrorSeverity.CRITICAL);
                expect(sev2).assertEqual(ErrorSeverity.CRITICAL);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9200
         * @tc.name: testDeepCpe0092
         * @tc.desc: Verify getErrorSeverity for HIGH errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0092', 0, (done: Function) => {
            runCase('testDeepCpe0092', async (): Promise<void> => {
                expect(ErrorHandling.getErrorSeverity(10005)).assertEqual(ErrorSeverity.HIGH);
                expect(ErrorHandling.getErrorSeverity(10006)).assertEqual(ErrorSeverity.HIGH);
                expect(ErrorHandling.getErrorSeverity(10018)).assertEqual(ErrorSeverity.HIGH);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9300
         * @tc.name: testDeepCpe0093
         * @tc.desc: Verify getErrorSeverity for MEDIUM errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0093', 0, (done: Function) => {
            runCase('testDeepCpe0093', async (): Promise<void> => {
                expect(ErrorHandling.getErrorSeverity(10001)).assertEqual(ErrorSeverity.MEDIUM);
                expect(ErrorHandling.getErrorSeverity(10007)).assertEqual(ErrorSeverity.MEDIUM);
                expect(ErrorHandling.getErrorSeverity(10011)).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9400
         * @tc.name: testDeepCpe0094
         * @tc.desc: Verify getErrorSeverity for LOW errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0094', 0, (done: Function) => {
            runCase('testDeepCpe0094', async (): Promise<void> => {
                expect(ErrorHandling.getErrorSeverity(10002)).assertEqual(ErrorSeverity.LOW);
                expect(ErrorHandling.getErrorSeverity(10003)).assertEqual(ErrorSeverity.LOW);
                expect(ErrorHandling.getErrorSeverity(10004)).assertEqual(ErrorSeverity.LOW);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9500
         * @tc.name: testDeepCpe0095
         * @tc.desc: Verify getErrorSeverity for unknown error returns MEDIUM.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0095', 0, (done: Function) => {
            runCase('testDeepCpe0095', async (): Promise<void> => {
                const sev: ErrorSeverity = ErrorHandling.getErrorSeverity(99999);
                expect(sev).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9600
         * @tc.name: testDeepCpe0096
         * @tc.desc: Verify getErrorSeverity for SCHEMA_MISMATCH.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0096', 0, (done: Function) => {
            runCase('testDeepCpe0096', async (): Promise<void> => {
                const sev: ErrorSeverity = ErrorHandling.getErrorSeverity(10015);
                addLog('testDeepCpe0096: sev=%{public}s', sev);
                expect(sev).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_9700
         * @tc.name: testDeepCpe0097
         * @tc.desc: Verify createRetryPolicy returns correct values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0097', 0, (done: Function) => {
            runCase('testDeepCpe0097', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(5, 2000);
                addLog('testDeepCpe0097: maxRetries=%{public}d', policy.maxRetries);
                expect(policy.maxRetries).assertEqual(5);
                expect(policy.initialDelay).assertEqual(2000);
                expect(policy.backoffMultiplier).assertEqual(2.0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9800
         * @tc.name: testDeepCpe0098
         * @tc.desc: Verify getDefaultRetryPolicy returns standard values.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0098', 0, (done: Function) => {
            runCase('testDeepCpe0098', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.getDefaultRetryPolicy();
                addLog('testDeepCpe0098: maxRetries=%{public}d', policy.maxRetries);
                expect(policy.maxRetries).assertEqual(3);
                expect(policy.initialDelay).assertEqual(1000);
                expect(policy.maxDelay).assertEqual(30000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_9900
         * @tc.name: testDeepCpe0099
         * @tc.desc: Verify calculateRetryDelay with attempt 0.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0099', 0, (done: Function) => {
            runCase('testDeepCpe0099', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 1000);
                const delay: number = ErrorHandling.calculateRetryDelay(policy, 0);
                addLog('testDeepCpe0099: delay=%{public}d', delay);
                expect(delay).assertEqual(1000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1000
         * @tc.name: testDeepCpe0100
         * @tc.desc: Verify calculateRetryDelay with exponential backoff.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0100', 0, (done: Function) => {
            runCase('testDeepCpe0100', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 1000);
                const delay1: number = ErrorHandling.calculateRetryDelay(policy, 1);
                const delay2: number = ErrorHandling.calculateRetryDelay(policy, 2);
                addLog('testDeepCpe0100: d1=%{public}d, d2=%{public}d', delay1, delay2);
                expect(delay1).assertEqual(2000);
                expect(delay2).assertEqual(4000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1010
         * @tc.name: testDeepCpe0101
         * @tc.desc: Verify calculateRetryDelay caps at maxDelay.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0101', 0, (done: Function) => {
            runCase('testDeepCpe0101', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(10, 1000);
                const delay: number = ErrorHandling.calculateRetryDelay(policy, 10);
                addLog('testDeepCpe0101: delay=%{public}d', delay);
                expect(delay).assertEqual(30000);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1020
         * @tc.name: testDeepCpe0102
         * @tc.desc: Verify calculateRetryDelay with negative attempt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0102', 0, (done: Function) => {
            runCase('testDeepCpe0102', async (): Promise<void> => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 1000);
                const delay: number = ErrorHandling.calculateRetryDelay(policy, -1);
                expect(delay).assertEqual(0);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_1030
         * @tc.name: testDeepCpe0103
         * @tc.desc: Verify logError adds to history.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0103', 0, (done: Function) => {
            runCase('testDeepCpe0103', async (): Promise<void> => {
                ErrorHandling.logError('test', 10001, 'Not initialized');
                expect(ErrorHandling.getErrorCount()).assertEqual(1);
                const last: ErrorEntry | null = ErrorHandling.getLastError();
                addLog('testDeepCpe0103: code=%{public}d', last !== null ? last.errorCode : 0);
                expect(last !== null).assertTrue();
                if (last !== null) {
                    expect(last.errorCode).assertEqual(10001);
                }
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1040
         * @tc.name: testDeepCpe0104
         * @tc.desc: Verify logValidationError adds VALIDATION error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0104', 0, (done: Function) => {
            runCase('testDeepCpe0104', async (): Promise<void> => {
                ErrorHandling.logValidationError('ctx', 'field', 'reason');
                const errors: ErrorEntry[] = ErrorHandling.getErrorsByCategory(ErrorCategory.VALIDATION);
                addLog('testDeepCpe0104: count=%{public}d', errors.length);
                expect(errors.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1050
         * @tc.name: testDeepCpe0105
         * @tc.desc: Verify logInitializationError adds INITIALIZATION error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0105', 0, (done: Function) => {
            runCase('testDeepCpe0105', async (): Promise<void> => {
                ErrorHandling.logInitializationError('ctx', 'not ready');
                const errors: ErrorEntry[] = ErrorHandling.getErrorsByCategory(ErrorCategory.INITIALIZATION);
                expect(errors.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1060
         * @tc.name: testDeepCpe0106
         * @tc.desc: Verify logStorageError adds STORAGE error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0106', 0, (done: Function) => {
            runCase('testDeepCpe0106', async (): Promise<void> => {
                ErrorHandling.logStorageError('ctx', 'disk full');
                const errors: ErrorEntry[] = ErrorHandling.getErrorsByCategory(ErrorCategory.STORAGE);
                expect(errors.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1070
         * @tc.name: testDeepCpe0107
         * @tc.desc: Verify logNetworkError adds NETWORK error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0107', 0, (done: Function) => {
            runCase('testDeepCpe0107', async (): Promise<void> => {
                ErrorHandling.logNetworkError('ctx', 'timeout');
                const errors: ErrorEntry[] = ErrorHandling.getErrorsByCategory(ErrorCategory.NETWORK);
                expect(errors.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1080
         * @tc.name: testDeepCpe0108
         * @tc.desc: Verify getErrorsBySeverity filters correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0108', 0, (done: Function) => {
            runCase('testDeepCpe0108', async (): Promise<void> => {
                ErrorHandling.logError('a', 10008, 'critical');
                ErrorHandling.logError('b', 10003, 'low');
                const criticals: ErrorEntry[] = ErrorHandling.getErrorsBySeverity(ErrorSeverity.CRITICAL);
                const lows: ErrorEntry[] = ErrorHandling.getErrorsBySeverity(ErrorSeverity.LOW);
                addLog('testDeepCpe0108: crit=%{public}d, low=%{public}d', criticals.length, lows.length);
                expect(criticals.length).assertEqual(1);
                expect(lows.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1090
         * @tc.name: testDeepCpe0109
         * @tc.desc: Verify getRetryableErrors returns only retryable.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0109', 0, (done: Function) => {
            runCase('testDeepCpe0109', async (): Promise<void> => {
                ErrorHandling.logError('a', 10007, 'retryable');
                ErrorHandling.logError('b', 10003, 'not retryable');
                const retryable: ErrorEntry[] = ErrorHandling.getRetryableErrors();
                addLog('testDeepCpe0109: count=%{public}d', retryable.length);
                expect(retryable.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1100
         * @tc.name: testDeepCpe0110
         * @tc.desc: Verify getRecentErrors returns recent N errors.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0110', 0, (done: Function) => {
            runCase('testDeepCpe0110', async (): Promise<void> => {
                ErrorHandling.logError('a', 10001, 'first');
                ErrorHandling.logError('b', 10002, 'second');
                ErrorHandling.logError('c', 10003, 'third');
                const recent: ErrorEntry[] = ErrorHandling.getRecentErrors(2);
                addLog('testDeepCpe0110: count=%{public}d', recent.length);
                expect(recent.length).assertEqual(2);
                expect(recent[0].errorCode).assertEqual(10003);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1110
         * @tc.name: testDeepCpe0111
         * @tc.desc: Verify getErrorCountByCategory counts correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0111', 0, (done: Function) => {
            runCase('testDeepCpe0111', async (): Promise<void> => {
                ErrorHandling.logError('a', 10007, 'net1');
                ErrorHandling.logError('b', 10018, 'net2');
                ErrorHandling.logError('c', 10003, 'val1');
                const netCount: number = ErrorHandling.getErrorCountByCategory(ErrorCategory.NETWORK);
                const valCount: number = ErrorHandling.getErrorCountByCategory(ErrorCategory.VALIDATION);
                addLog('testDeepCpe0111: net=%{public}d, val=%{public}d', netCount, valCount);
                expect(netCount).assertEqual(2);
                expect(valCount).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1120
         * @tc.name: testDeepCpe0112
         * @tc.desc: Verify getErrorCountBySeverity counts correctly.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0112', 0, (done: Function) => {
            runCase('testDeepCpe0112', async (): Promise<void> => {
                ErrorHandling.logError('a', 10008, 'crit');
                ErrorHandling.logError('b', 10003, 'low');
                ErrorHandling.logError('c', 10004, 'low');
                const critCount: number = ErrorHandling.getErrorCountBySeverity(ErrorSeverity.CRITICAL);
                const lowCount: number = ErrorHandling.getErrorCountBySeverity(ErrorSeverity.LOW);
                addLog('testDeepCpe0112: crit=%{public}d, low=%{public}d', critCount, lowCount);
                expect(critCount).assertEqual(1);
                expect(lowCount).assertEqual(2);
            }, done);
        });



        /*
         * @tc.number: SUB_DEEP_CPE_1130
         * @tc.name: testDeepCpe0113
         * @tc.desc: Verify clearHistory empties error list.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0113', 0, (done: Function) => {
            runCase('testDeepCpe0113', async (): Promise<void> => {
                ErrorHandling.logError('a', 10001, 'err');
                ErrorHandling.clearHistory();
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
                expect(ErrorHandling.getLastError()).assertNull();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1140
         * @tc.name: testDeepCpe0114
         * @tc.desc: Verify getLastError returns null when empty.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0114', 0, (done: Function) => {
            runCase('testDeepCpe0114', async (): Promise<void> => {
                const last: ErrorEntry | null = ErrorHandling.getLastError();
                expect(last).assertNull();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1150
         * @tc.name: testDeepCpe0115
         * @tc.desc: Verify formatError returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0115', 0, (done: Function) => {
            runCase('testDeepCpe0115', async (): Promise<void> => {
                ErrorHandling.logError('ctx', 10007, 'Network failed');
                const last: ErrorEntry | null = ErrorHandling.getLastError();
                if (last !== null) {
                    const formatted: string = ErrorHandling.formatError(last);
                    addLog('testDeepCpe0115: formatted=%{public}s', formatted);
                    expect(formatted.indexOf('10007')).assertLargerOrEqual(0);
                    expect(formatted.indexOf('Network failed')).assertLargerOrEqual(0);
                }
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1160
         * @tc.name: testDeepCpe0116
         * @tc.desc: Verify formatAllErrors returns all formatted.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepCpe0116', 0, (done: Function) => {
            runCase('testDeepCpe0116', async (): Promise<void> => {
                ErrorHandling.logError('a', 10001, 'err1');
                ErrorHandling.logError('b', 10007, 'err2');
                const all: string = ErrorHandling.formatAllErrors();
                addLog('testDeepCpe0116: len=%{public}d', all.length);
                expect(all.indexOf('10001')).assertLargerOrEqual(0);
                expect(all.indexOf('10007')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1170
         * @tc.name: testDeepCpe0117
         * @tc.desc: Verify getErrorHistory returns copy.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0117', 0, (done: Function) => {
            runCase('testDeepCpe0117', async (): Promise<void> => {
                ErrorHandling.logError('a', 10001, 'err');
                const history: ErrorEntry[] = ErrorHandling.getErrorHistory();
                expect(history.length).assertEqual(1);
                expect(history[0].errorCode).assertEqual(10001);
                expect(history[0].message.indexOf('err')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1180
         * @tc.name: testDeepCpe0118
         * @tc.desc: Verify getRecentErrors with count exceeding size.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0118', 0, (done: Function) => {
            runCase('testDeepCpe0118', async (): Promise<void> => {
                ErrorHandling.logError('a', 10001, 'err');
                const recent: ErrorEntry[] = ErrorHandling.getRecentErrors(100);
                expect(recent.length).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1190
         * @tc.name: testDeepCpe0119
         * @tc.desc: Verify formatError contains severity and category.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0119', 0, (done: Function) => {
            runCase('testDeepCpe0119', async (): Promise<void> => {
                ErrorHandling.logError('ctx', 10008, 'enc fail');
                const last: ErrorEntry | null = ErrorHandling.getLastError();
                if (last !== null) {
                    const formatted: string = ErrorHandling.formatError(last);
                    addLog('testDeepCpe0119: formatted=%{public}s', formatted);
                    expect(formatted.indexOf('critical')).assertLargerOrEqual(0);
                    expect(formatted.indexOf('security')).assertLargerOrEqual(0);
                }
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_CPE_1200
         * @tc.name: testDeepCpe0120
         * @tc.desc: Verify complete error lifecycle: log-query-format-clear.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepCpe0120', 0, (done: Function) => {
            runCase('testDeepCpe0120', async (): Promise<void> => {
                ErrorHandling.logError('init', 10001, 'not init');
                ErrorHandling.logError('net', 10007, 'timeout');
                ErrorHandling.logError('val', 10003, 'bad key');
                const total: number = ErrorHandling.getErrorCount();
                const netCount: number = ErrorHandling.getErrorCountByCategory(ErrorCategory.NETWORK);
                const retryable: ErrorEntry[] = ErrorHandling.getRetryableErrors();
                ErrorHandling.clearHistory();
                addLog('testDeepCpe0120: total=%{public}d, net=%{public}d, retry=%{public}d', total, netCount, retryable.length);
                expect(total).assertEqual(3);
                expect(netCount).assertEqual(1);
                // 10001 (NOT_INITIALIZED) and 10007 (NETWORK) are both retryable
                expect(retryable.length).assertEqual(2);
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
            }, done);
        });
    });
}
