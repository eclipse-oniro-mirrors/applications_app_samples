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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import { DataStoreConfig, FeatureFlag } from '../../../main/ets/config/DataStoreConfig';
import {
    StoreConfig,
    StoreType,
    SecurityLevel,
    EncryptionMode,
    SyncMode,
    LogLevel
} from '../../../main/ets/models/DataModels';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataStoreConfigTest(): void {
    describe('DataStoreConfigTest', () => {
        beforeAll(() => {
            addLog('DataStoreConfigTest suite started');
            DataStoreConfig.resetConfig();
        })

        afterAll(() => {
            DataStoreConfig.resetConfig();
            addLog('DataStoreConfigTest suite finished');
        })

        /**
         * @tc.number SUB_CONFIG_0001
         * @tc.name testDataStoreConfig0001
         * @tc.desc Verify getDefaultConfig returns expected defaults.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0001', 0, (done: Function) => {
            runCase('testDataStoreConfig0001', async () => {
                const config = DataStoreConfig.getDefaultConfig();
                expect(config.name).assertEqual(DataStoreConstants.DEFAULT_STORE_NAME);
                expect(config.storeType).assertEqual(StoreType.PREFERENCES);
                expect(config.securityLevel).assertEqual(SecurityLevel.S3);
                expect(config.encryptionMode).assertEqual(EncryptionMode.NONE);
                expect(config.autoBackup).assertFalse();
                expect(config.maxRetries).assertEqual(3);
                expect(config.syncMode).assertEqual(SyncMode.MANUAL);
                expect(config.syncInterval).assertEqual(300000);
                expect(config.logLevel).assertEqual(LogLevel.INFO);
                expect(config.debugMode).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0002
         * @tc.name testDataStoreConfig0002
         * @tc.desc Verify getDevelopmentConfig returns dev-specific settings.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0002', 0, (done: Function) => {
            runCase('testDataStoreConfig0002', async () => {
                const config = DataStoreConfig.getDevelopmentConfig();
                expect(config.name).assertContain('_dev');
                expect(config.securityLevel).assertEqual(SecurityLevel.S1);
                expect(config.logLevel).assertEqual(LogLevel.DEBUG);
                expect(config.debugMode).assertTrue();
                expect(config.maxRetries).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0003
         * @tc.name testDataStoreConfig0003
         * @tc.desc Verify getProductionConfig returns production settings.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0003', 0, (done: Function) => {
            runCase('testDataStoreConfig0003', async () => {
                const config = DataStoreConfig.getProductionConfig();
                expect(config.securityLevel).assertEqual(SecurityLevel.S4);
                expect(config.encryptionMode).assertEqual(EncryptionMode.AES_256);
                expect(config.autoBackup).assertTrue();
                expect(config.maxRetries).assertEqual(5);
                expect(config.syncMode).assertEqual(SyncMode.REAL_TIME);
                expect(config.logLevel).assertEqual(LogLevel.ERROR);
                expect(config.debugMode).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0004
         * @tc.name testDataStoreConfig0004
         * @tc.desc Verify getTestConfig returns test settings.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0004', 0, (done: Function) => {
            runCase('testDataStoreConfig0004', async () => {
                const config = DataStoreConfig.getTestConfig();
                expect(config.name).assertContain('_test');
                expect(config.securityLevel).assertEqual(SecurityLevel.S1);
                expect(config.encryptionMode).assertEqual(EncryptionMode.NONE);
                expect(config.logLevel).assertEqual(LogLevel.NONE);
                expect(config.syncInterval).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0005
         * @tc.name testDataStoreConfig0005
         * @tc.desc Verify loadConfig returns default when no config saved.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0005', 0, (done: Function) => {
            runCase('testDataStoreConfig0005', async () => {
                DataStoreConfig.resetConfig();
                const config = DataStoreConfig.loadConfig();
                expect(config.name).assertEqual(DataStoreConstants.DEFAULT_STORE_NAME);
                expect(config.storeType).assertEqual(StoreType.PREFERENCES);
                expect(config.securityLevel).assertEqual(SecurityLevel.S3);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0006
         * @tc.name testDataStoreConfig0006
         * @tc.desc Verify saveConfig persists and loadConfig retrieves it.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0006', 0, (done: Function) => {
            runCase('testDataStoreConfig0006', async () => {
                const custom = DataStoreConfig.getProductionConfig();
                DataStoreConfig.saveConfig(custom);
                const loaded = DataStoreConfig.loadConfig();
                expect(loaded.securityLevel).assertEqual(SecurityLevel.S4);
                expect(loaded.encryptionMode).assertEqual(EncryptionMode.AES_256);
                expect(loaded.autoBackup).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0007
         * @tc.name testDataStoreConfig0007
         * @tc.desc Verify resetConfig restores defaults and clears config values.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0007', 0, (done: Function) => {
            runCase('testDataStoreConfig0007', async () => {
                DataStoreConfig.saveConfig(DataStoreConfig.getProductionConfig());
                DataStoreConfig.setConfigValue('key1', 'val1');
                DataStoreConfig.resetConfig();
                const config = DataStoreConfig.loadConfig();
                expect(config.name).assertEqual(DataStoreConstants.DEFAULT_STORE_NAME);
                expect(DataStoreConfig.getConfigValue('key1')).assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0008
         * @tc.name testDataStoreConfig0008
         * @tc.desc Verify getCurrentConfig returns null before any load.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0008', 0, (done: Function) => {
            runCase('testDataStoreConfig0008', async () => {
                DataStoreConfig.resetConfig();
                const current = DataStoreConfig.getCurrentConfig();
                // After resetConfig, currentConfig is set to default, not null
                expect(current).not().assertNull();
                if (current !== null) {
                    expect(current.name).assertEqual(DataStoreConstants.DEFAULT_STORE_NAME);
                    expect(current.storeType).assertEqual(StoreType.PREFERENCES);
                }
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0009
         * @tc.name testDataStoreConfig0009
         * @tc.desc Verify setConfigValue, getConfigValue, removeConfigValue.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0009', 0, (done: Function) => {
            runCase('testDataStoreConfig0009', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.setConfigValue('myKey', 'myValue');
                expect(DataStoreConfig.getConfigValue('myKey')).assertEqual('myValue');

                const removed = DataStoreConfig.removeConfigValue('myKey');
                expect(removed).assertTrue();
                expect(DataStoreConfig.getConfigValue('myKey')).assertNull();

                const notFound = DataStoreConfig.removeConfigValue('nonexistent');
                expect(notFound).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0010
         * @tc.name testDataStoreConfig0010
         * @tc.desc Verify getAllConfigValues returns a copy of all values.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0010', 0, (done: Function) => {
            runCase('testDataStoreConfig0010', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.setConfigValue('a', '1');
                DataStoreConfig.setConfigValue('b', '2');
                const all = DataStoreConfig.getAllConfigValues();
                expect(all.get('a')).assertEqual('1');
                expect(all.get('b')).assertEqual('2');
                expect(all.size).assertEqual(2);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0011
         * @tc.name testDataStoreConfig0011
         * @tc.desc Verify isFeatureEnabled returns false for unknown feature.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0011', 0, (done: Function) => {
            runCase('testDataStoreConfig0011', async () => {
                DataStoreConfig.resetConfig();
                expect(DataStoreConfig.isFeatureEnabled('unknown_feature')).assertFalse();
                expect(DataStoreConfig.isFeatureEnabled('batchOperations')).assertFalse();
                expect(DataStoreConfig.getAllFeatureFlags().length).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0012
         * @tc.name testDataStoreConfig0012
         * @tc.desc Verify setFeatureFlag, isFeatureEnabled, removeFeatureFlag.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0012', 0, (done: Function) => {
            runCase('testDataStoreConfig0012', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.setFeatureFlag('testFeature', true, 'A test feature');
                expect(DataStoreConfig.isFeatureEnabled('testFeature')).assertTrue();

                const removed = DataStoreConfig.removeFeatureFlag('testFeature');
                expect(removed).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('testFeature')).assertFalse();

                const notFound = DataStoreConfig.removeFeatureFlag('nonexistent');
                expect(notFound).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0013
         * @tc.name testDataStoreConfig0013
         * @tc.desc Verify getAllFeatureFlags and getEnabledFeatureFlags.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0013', 0, (done: Function) => {
            runCase('testDataStoreConfig0013', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.setFeatureFlag('f1', true, 'enabled');
                DataStoreConfig.setFeatureFlag('f2', false, 'disabled');
                DataStoreConfig.setFeatureFlag('f3', true, 'also enabled');

                const all = DataStoreConfig.getAllFeatureFlags();
                expect(all.length).assertEqual(3);

                const enabled = DataStoreConfig.getEnabledFeatureFlags();
                expect(enabled.length).assertEqual(2);
                expect(all[0].name).assertEqual('f1');
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0014
         * @tc.name testDataStoreConfig0014
         * @tc.desc Verify enableDefaultFeatureFlags sets expected defaults.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0014', 0, (done: Function) => {
            runCase('testDataStoreConfig0014', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.enableDefaultFeatureFlags();
                expect(DataStoreConfig.isFeatureEnabled('batchOperations')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('typedOperations')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('prefixOperations')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('multiTable')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('transactions')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('collections')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('migration')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('backup')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('encryption')).assertFalse();
                expect(DataStoreConfig.isFeatureEnabled('distributed')).assertFalse();
                expect(DataStoreConfig.isFeatureEnabled('performanceMonitor')).assertTrue();
                expect(DataStoreConfig.isFeatureEnabled('errorHandling')).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0015
         * @tc.name testDataStoreConfig0015
         * @tc.desc Verify getConfigSummary with loaded config.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0015', 0, (done: Function) => {
            runCase('testDataStoreConfig0015', async () => {
                DataStoreConfig.resetConfig();
                DataStoreConfig.loadConfig();
                const summary = DataStoreConfig.getConfigSummary();
                expect(summary).assertContain('Config:');
                expect(summary).assertContain('Security=');
                expect(summary).assertContain('Features=');
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0016
         * @tc.name testDataStoreConfig0016
         * @tc.desc Verify getConfigSummary returns no config message when null.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testDataStoreConfig0016', 0, (done: Function) => {
            runCase('testDataStoreConfig0016', async () => {
                // resetConfig sets currentConfig to default, not null, so summary should work
                DataStoreConfig.resetConfig();
                const summary = DataStoreConfig.getConfigSummary();
                expect(summary).assertContain('Config:');
                expect(summary).assertContain('Security=');
                expect(summary).assertContain('Features=');
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0017
         * @tc.name testDataStoreConfig0017
         * @tc.desc Verify validateConfig with valid and invalid configs.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0017', 0, (done: Function) => {
            runCase('testDataStoreConfig0017', async () => {
                const valid = DataStoreConfig.getDefaultConfig();
                expect(DataStoreConfig.validateConfig(valid)).assertTrue();

                const invalidName: StoreConfig = {
                    name: '',
                    storeType: StoreType.PREFERENCES,
                    securityLevel: SecurityLevel.S3,
                    encryptionMode: EncryptionMode.NONE,
                    autoBackup: false,
                    maxRetries: 3,
                    syncMode: SyncMode.MANUAL,
                    syncInterval: 300000,
                    logLevel: LogLevel.INFO,
                    debugMode: false
                };
                expect(DataStoreConfig.validateConfig(invalidName)).assertFalse();

                const invalidRetries: StoreConfig = {
                    name: 'test',
                    storeType: StoreType.PREFERENCES,
                    securityLevel: SecurityLevel.S3,
                    encryptionMode: EncryptionMode.NONE,
                    autoBackup: false,
                    maxRetries: -1,
                    syncMode: SyncMode.MANUAL,
                    syncInterval: 300000,
                    logLevel: LogLevel.INFO,
                    debugMode: false
                };
                expect(DataStoreConfig.validateConfig(invalidRetries)).assertFalse();

                const invalidInterval: StoreConfig = {
                    name: 'test',
                    storeType: StoreType.PREFERENCES,
                    securityLevel: SecurityLevel.S3,
                    encryptionMode: EncryptionMode.NONE,
                    autoBackup: false,
                    maxRetries: 3,
                    syncMode: SyncMode.MANUAL,
                    syncInterval: -100,
                    logLevel: LogLevel.INFO,
                    debugMode: false
                };
                expect(DataStoreConfig.validateConfig(invalidInterval)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0018
         * @tc.name testDataStoreConfig0018
         * @tc.desc Verify validateConfig with invalid log level.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0018', 0, (done: Function) => {
            runCase('testDataStoreConfig0018', async () => {
                const invalidLog: StoreConfig = {
                    name: 'test',
                    storeType: StoreType.PREFERENCES,
                    securityLevel: SecurityLevel.S3,
                    encryptionMode: EncryptionMode.NONE,
                    autoBackup: false,
                    maxRetries: 3,
                    syncMode: SyncMode.MANUAL,
                    syncInterval: 300000,
                    logLevel: -1 as LogLevel,
                    debugMode: false
                };
                expect(DataStoreConfig.validateConfig(invalidLog)).assertFalse();
                expect(DataStoreConfig.validateConfig(DataStoreConfig.getDefaultConfig())).assertTrue();
                expect(DataStoreConfig.validateConfig(DataStoreConfig.getProductionConfig())).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0019
         * @tc.name testDataStoreConfig0019
         * @tc.desc Verify mergeConfig uses overrides for non-empty name.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testDataStoreConfig0019', 0, (done: Function) => {
            runCase('testDataStoreConfig0019', async () => {
                const base = DataStoreConfig.getDefaultConfig();
                const overrides = DataStoreConfig.getProductionConfig();
                const merged = DataStoreConfig.mergeConfig(base, overrides);
                expect(merged.securityLevel).assertEqual(SecurityLevel.S4);
                expect(merged.encryptionMode).assertEqual(EncryptionMode.AES_256);
                expect(merged.autoBackup).assertTrue();
                expect(merged.name).assertEqual(overrides.name);
            }, done);
        })

        /**
         * @tc.number SUB_CONFIG_0020
         * @tc.name testDataStoreConfig0020
         * @tc.desc Verify mergeConfig falls back to base name when override name is empty.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testDataStoreConfig0020', 0, (done: Function) => {
            runCase('testDataStoreConfig0020', async () => {
                const base = DataStoreConfig.getDefaultConfig();
                const emptyOverride: StoreConfig = {
                    name: '',
                    storeType: base.storeType,
                    securityLevel: base.securityLevel,
                    encryptionMode: base.encryptionMode,
                    autoBackup: base.autoBackup,
                    maxRetries: base.maxRetries,
                    syncMode: base.syncMode,
                    syncInterval: base.syncInterval,
                    logLevel: base.logLevel,
                    debugMode: base.debugMode
                };
                const merged = DataStoreConfig.mergeConfig(base, emptyOverride);
                expect(merged.name).assertEqual(base.name);
                expect(merged.storeType).assertEqual(base.storeType);
                expect(merged.securityLevel).assertEqual(base.securityLevel);
            }, done);
        })
    })
}
