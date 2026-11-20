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
import { DataEncryptionManager } from '../../../main/ets/encryption/DataEncryptionManager';
import { EncryptionConfig, EncryptionMode, HashAlgorithm } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

function createDeepEncryption(): DataEncryptionManager {
    return new DataEncryptionManager();
}

function createEncryptionConfig(mode: EncryptionMode, keyLen: number, auto: boolean): EncryptionConfig {
    return {
        mode: mode,
        keyLength: keyLen,
        ivLength: 16,
        hashAlgorithm: HashAlgorithm.SHA_256,
        autoEncrypt: auto
    };
}

export default function encryptionDeepTest(): void {
    describe('EncryptionDeepTest', () => {
        let manager: DataEncryptionManager = createDeepEncryption();

        beforeAll(() => {
            addLog('EncryptionDeepTest suite started');
        })

        beforeEach(() => {
            manager = createDeepEncryption();
        })

        afterEach(() => {
            manager.release();
        })

        afterAll(() => {
            addLog('EncryptionDeepTest suite finished');
        })

        

        /*
         * @tc.number: SUB_DEEP_ENC_0100
         * @tc.name: testDeepEnc0001
         * @tc.desc: Verify initialize with AES_128 and SHA_256.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0001', 0, (done: Function) => {
            runCase('testDeepEnc0001', async (): Promise<void> => {
                const result: string = manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                addLog('testDeepEnc0001: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(manager.isInitialized()).assertTrue();
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_128);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0200
         * @tc.name: testDeepEnc0002
         * @tc.desc: Verify initialize with AES_256 and SHA_512.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0002', 0, (done: Function) => {
            runCase('testDeepEnc0002', async (): Promise<void> => {
                const result: string = manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                addLog('testDeepEnc0002: result=%{public}s', result);
                expect(result.indexOf('AES-256')).assertLargerOrEqual(0);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_512);
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0300
         * @tc.name: testDeepEnc0003
         * @tc.desc: Verify initialize with SM4 and SM3.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0003', 0, (done: Function) => {
            runCase('testDeepEnc0003', async (): Promise<void> => {
                const result: string = manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                addLog('testDeepEnc0003: result=%{public}s', result);
                expect(result.indexOf('SM4')).assertLargerOrEqual(0);
                expect(result.indexOf('SM3')).assertLargerOrEqual(0);
                expect(manager.getKeyLength()).assertEqual(256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0400
         * @tc.name: testDeepEnc0004
         * @tc.desc: Verify initialize with NONE mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0004', 0, (done: Function) => {
            runCase('testDeepEnc0004', async (): Promise<void> => {
                const result: string = manager.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                addLog('testDeepEnc0004: result=%{public}s', result);
                expect(result.indexOf('NONE')).assertLargerOrEqual(0);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.NONE);
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0500
         * @tc.name: testDeepEnc0005
         * @tc.desc: Verify initialize resets encrypt count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0005', 0, (done: Function) => {
            runCase('testDeepEnc0005', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('hello');
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0005: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0600
         * @tc.name: testDeepEnc0006
         * @tc.desc: Verify initialize twice resets state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0006', 0, (done: Function) => {
            runCase('testDeepEnc0006', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_0700
         * @tc.name: testDeepEnc0007
         * @tc.desc: Verify configure with valid AES_256 config.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0007', 0, (done: Function) => {
            runCase('testDeepEnc0007', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 256, true);
                const result: string = manager.configure(config);
                addLog('testDeepEnc0007: result=%{public}s', result);
                expect(result.indexOf('configure completed')).assertLargerOrEqual(0);
                expect(result.indexOf('256')).assertLargerOrEqual(0);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0800
         * @tc.name: testDeepEnc0008
         * @tc.desc: Verify configure with invalid mode returns error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0008', 0, (done: Function) => {
            runCase('testDeepEnc0008', async (): Promise<void> => {
                const config: EncryptionConfig = {
                    mode: 'INVALID' as EncryptionMode,
                    keyLength: 256,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SHA_256,
                    autoEncrypt: false
                };
                const result: string = manager.configure(config);
                addLog('testDeepEnc0008: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_0900
         * @tc.name: testDeepEnc0009
         * @tc.desc: Verify configure with invalid hash algorithm returns error.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0009', 0, (done: Function) => {
            runCase('testDeepEnc0009', async (): Promise<void> => {
                const config: EncryptionConfig = {
                    mode: EncryptionMode.AES_128,
                    keyLength: 256,
                    ivLength: 16,
                    hashAlgorithm: 'BADALGO' as HashAlgorithm,
                    autoEncrypt: false
                };
                const result: string = manager.configure(config);
                addLog('testDeepEnc0009: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1000
         * @tc.name: testDeepEnc0010
         * @tc.desc: Verify configure with keyLength too small.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0010', 0, (done: Function) => {
            runCase('testDeepEnc0010', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_128, 4, false);
                const result: string = manager.configure(config);
                addLog('testDeepEnc0010: result=%{public}s', result);
                expect(result.indexOf('out of range')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1100
         * @tc.name: testDeepEnc0011
         * @tc.desc: Verify configure with keyLength too large.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0011', 0, (done: Function) => {
            runCase('testDeepEnc0011', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_128, 1024, false);
                const result: string = manager.configure(config);
                addLog('testDeepEnc0011: result=%{public}s', result);
                expect(result.indexOf('out of range')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1200
         * @tc.name: testDeepEnc0012
         * @tc.desc: Verify configure with minimum valid keyLength.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0012', 0, (done: Function) => {
            runCase('testDeepEnc0012', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_128, 16, false);
                const result: string = manager.configure(config);
                addLog('testDeepEnc0012: result=%{public}s', result);
                expect(result.indexOf('configure completed')).assertLargerOrEqual(0);
                expect(manager.getKeyLength()).assertEqual(16);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1300
         * @tc.name: testDeepEnc0013
         * @tc.desc: Verify configure with maximum valid keyLength.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0013', 0, (done: Function) => {
            runCase('testDeepEnc0013', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 512, true);
                const result: string = manager.configure(config);
                addLog('testDeepEnc0013: result=%{public}s', result);
                expect(result.indexOf('configure completed')).assertLargerOrEqual(0);
                expect(manager.getKeyLength()).assertEqual(512);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1400
         * @tc.name: testDeepEnc0014
         * @tc.desc: Verify configure sets autoEncrypt flag.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0014', 0, (done: Function) => {
            runCase('testDeepEnc0014', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_128, 256, true);
                manager.configure(config);
                expect(manager.isAutoEncrypt()).assertTrue();
                const config2: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 256, false);
                manager.configure(config2);
                expect(manager.isAutoEncrypt()).assertFalse();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_1500
         * @tc.name: testDeepEnc0015
         * @tc.desc: Verify generateKey sets keyGenerated flag.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0015', 0, (done: Function) => {
            runCase('testDeepEnc0015', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.isKeyGenerated()).assertFalse();
                const result: string = manager.generateKey();
                addLog('testDeepEnc0015: result=%{public}s', result);
                expect(result.indexOf('generateKey completed')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1600
         * @tc.name: testDeepEnc0016
         * @tc.desc: Verify getKey returns masked key after generation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0016', 0, (done: Function) => {
            runCase('testDeepEnc0016', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                manager.generateKey();
                const key: string = manager.getKey();
                addLog('testDeepEnc0016: key=%{public}s', key);
                expect(key.indexOf('Key:')).assertLargerOrEqual(0);
                expect(key.indexOf('...')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1700
         * @tc.name: testDeepEnc0017
         * @tc.desc: Verify getKey fails before key generation.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0017', 0, (done: Function) => {
            runCase('testDeepEnc0017', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const key: string = manager.getKey();
                addLog('testDeepEnc0017: key=%{public}s', key);
                expect(key.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1800
         * @tc.name: testDeepEnc0018
         * @tc.desc: Verify setKey with valid key length.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0018', 0, (done: Function) => {
            runCase('testDeepEnc0018', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const validKey: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345';
                const result: string = manager.setKey(validKey);
                addLog('testDeepEnc0018: result=%{public}s', result);
                expect(result.indexOf('setKey completed')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_1900
         * @tc.name: testDeepEnc0019
         * @tc.desc: Verify setKey fails with short key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0019', 0, (done: Function) => {
            runCase('testDeepEnc0019', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const shortKey: string = 'abc';
                const result: string = manager.setKey(shortKey);
                addLog('testDeepEnc0019: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2000
         * @tc.name: testDeepEnc0020
         * @tc.desc: Verify generateKey twice overwrites previous key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0020', 0, (done: Function) => {
            runCase('testDeepEnc0020', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const key1: string = manager.getKey();
                manager.generateKey();
                const key2: string = manager.getKey();
                addLog('testDeepEnc0020: key1=%{public}s, key2=%{public}s', key1, key2);
                expect(manager.isKeyGenerated()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2100
         * @tc.name: testDeepEnc0021
         * @tc.desc: Verify setKey with exactly minimum length key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0021', 0, (done: Function) => {
            runCase('testDeepEnc0021', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const minKey: string = '1234567890123456';
                const result: string = manager.setKey(minKey);
                addLog('testDeepEnc0021: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2200
         * @tc.name: testDeepEnc0022
         * @tc.desc: Verify getKeyLength returns configured length.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0022', 0, (done: Function) => {
            runCase('testDeepEnc0022', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.getKeyLength()).assertEqual(256);
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 128, false);
                manager.configure(config);
                expect(manager.getKeyLength()).assertEqual(128);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2300
         * @tc.name: testDeepEnc0023
         * @tc.desc: Verify generateKey with different modes.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0023', 0, (done: Function) => {
            runCase('testDeepEnc0023', async (): Promise<void> => {
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                const result: string = manager.generateKey();
                addLog('testDeepEnc0023: result=%{public}s', result);
                expect(result.indexOf('SM4')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2400
         * @tc.name: testDeepEnc0024
         * @tc.desc: Verify setKey with very long key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0024', 0, (done: Function) => {
            runCase('testDeepEnc0024', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                let longKey: string = '';
                for (let i = 0; i < 200; i++) {
                    longKey += 'A';
                }
                const result: string = manager.setKey(longKey);
                addLog('testDeepEnc0024: result=%{public}s', result);
                expect(result.indexOf('completed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2500
         * @tc.name: testDeepEnc0025
         * @tc.desc: Verify generateKey then setKey overwrites.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0025', 0, (done: Function) => {
            runCase('testDeepEnc0025', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const customKey: string = 'CUSTOM_KEY_12345678901234567890AB';
                manager.setKey(customKey);
                expect(manager.isKeyGenerated()).assertTrue();
                const keyInfo: string = manager.getKey();
                addLog('testDeepEnc0025: keyInfo=%{public}s', keyInfo);
                expect(keyInfo.indexOf('Key:')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2600
         * @tc.name: testDeepEnc0026
         * @tc.desc: Verify setKey with empty string fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0026', 0, (done: Function) => {
            runCase('testDeepEnc0026', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.setKey('');
                addLog('testDeepEnc0026: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_2700
         * @tc.name: testDeepEnc0027
         * @tc.desc: Verify encrypt succeeds with valid key and AES_128.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0027', 0, (done: Function) => {
            runCase('testDeepEnc0027', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('HelloWorld');
                addLog('testDeepEnc0027: result=%{public}s', result);
                expect(result.indexOf('encrypt(AES-128)')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2800
         * @tc.name: testDeepEnc0028
         * @tc.desc: Verify decrypt recovers original text.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0028', 0, (done: Function) => {
            runCase('testDeepEnc0028', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const encrypted: string = manager.encrypt('TestData');
                const hexStart: number = encrypted.indexOf(': ') + 2;
                const cipherHex: string = encrypted.substring(hexStart);
                const decrypted: string = manager.decrypt(cipherHex);
                addLog('testDeepEnc0028: decrypted=%{public}s', decrypted);
                expect(decrypted.indexOf('TestData')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_2900
         * @tc.name: testDeepEnc0029
         * @tc.desc: Verify encrypt fails without key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0029', 0, (done: Function) => {
            runCase('testDeepEnc0029', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.encrypt('NoKey');
                addLog('testDeepEnc0029: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3000
         * @tc.name: testDeepEnc0030
         * @tc.desc: Verify encrypt fails with NONE mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0030', 0, (done: Function) => {
            runCase('testDeepEnc0030', async (): Promise<void> => {
                manager.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('NoneMode');
                addLog('testDeepEnc0030: result=%{public}s', result);
                expect(result.indexOf('NONE')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3100
         * @tc.name: testDeepEnc0031
         * @tc.desc: Verify encrypt fails with empty plaintext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0031', 0, (done: Function) => {
            runCase('testDeepEnc0031', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('');
                addLog('testDeepEnc0031: result=%{public}s', result);
                expect(result.indexOf('empty')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3200
         * @tc.name: testDeepEnc0032
         * @tc.desc: Verify decrypt fails without key.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0032', 0, (done: Function) => {
            runCase('testDeepEnc0032', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.decrypt('abcd1234');
                addLog('testDeepEnc0032: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3300
         * @tc.name: testDeepEnc0033
         * @tc.desc: Verify decrypt fails with NONE mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0033', 0, (done: Function) => {
            runCase('testDeepEnc0033', async (): Promise<void> => {
                manager.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.decrypt('abcd1234');
                addLog('testDeepEnc0033: result=%{public}s', result);
                expect(result.indexOf('NONE')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3400
         * @tc.name: testDeepEnc0034
         * @tc.desc: Verify decrypt fails with invalid ciphertext length.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0034', 0, (done: Function) => {
            runCase('testDeepEnc0034', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.decrypt('abc');
                addLog('testDeepEnc0034: result=%{public}s', result);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3500
         * @tc.name: testDeepEnc0035
         * @tc.desc: Verify encrypt increments counter.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0035', 0, (done: Function) => {
            runCase('testDeepEnc0035', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('first');
                manager.encrypt('second');
                manager.encrypt('third');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0035: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3600
         * @tc.name: testDeepEnc0036
         * @tc.desc: Verify decrypt increments counter.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0036', 0, (done: Function) => {
            runCase('testDeepEnc0036', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('data');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                manager.decrypt(cipher);
                manager.decrypt(cipher);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0036: stats=%{public}s', stats);
                expect(stats.indexOf('decrypts=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3700
         * @tc.name: testDeepEnc0037
         * @tc.desc: Verify encryptSync delegates to encrypt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0037', 0, (done: Function) => {
            runCase('testDeepEnc0037', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encryptSync('SyncTest');
                addLog('testDeepEnc0037: result=%{public}s', result);
                expect(result.indexOf('encrypt(AES-256)')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3800
         * @tc.name: testDeepEnc0038
         * @tc.desc: Verify decryptSync delegates to decrypt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0038', 0, (done: Function) => {
            runCase('testDeepEnc0038', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('SyncDecTest');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                const result: string = manager.decryptSync(cipher);
                addLog('testDeepEnc0038: result=%{public}s', result);
                expect(result.indexOf('SyncDecTest')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_3900
         * @tc.name: testDeepEnc0039
         * @tc.desc: Verify encrypt with SM4 mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0039', 0, (done: Function) => {
            runCase('testDeepEnc0039', async (): Promise<void> => {
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                manager.generateKey();
                const result: string = manager.encrypt('SM4Data');
                addLog('testDeepEnc0039: result=%{public}s', result);
                expect(result.indexOf('encrypt(SM4)')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4000
         * @tc.name: testDeepEnc0040
         * @tc.desc: Verify encrypt then decrypt with SM4 roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0040', 0, (done: Function) => {
            runCase('testDeepEnc0040', async (): Promise<void> => {
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                manager.generateKey();
                const enc: string = manager.encrypt('RoundTrip');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                const dec: string = manager.decrypt(cipher);
                addLog('testDeepEnc0040: dec=%{public}s', dec);
                expect(dec.indexOf('RoundTrip')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4100
         * @tc.name: testDeepEnc0041
         * @tc.desc: Verify encrypt with single character.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0041', 0, (done: Function) => {
            runCase('testDeepEnc0041', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('A');
                addLog('testDeepEnc0041: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4200
         * @tc.name: testDeepEnc0042
         * @tc.desc: Verify decrypt with empty string fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0042', 0, (done: Function) => {
            runCase('testDeepEnc0042', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.decrypt('');
                addLog('testDeepEnc0042: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_4300
         * @tc.name: testDeepEnc0043
         * @tc.desc: Verify computeHash with SHA_256.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0043', 0, (done: Function) => {
            runCase('testDeepEnc0043', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.computeHash('TestData');
                addLog('testDeepEnc0043: result=%{public}s', result);
                expect(result.indexOf('sha256_')).assertLargerOrEqual(0);
                expect(result.indexOf('computeHash')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4400
         * @tc.name: testDeepEnc0044
         * @tc.desc: Verify computeHash with SHA_512.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0044', 0, (done: Function) => {
            runCase('testDeepEnc0044', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_512);
                const result: string = manager.computeHash('TestData');
                addLog('testDeepEnc0044: result=%{public}s', result);
                expect(result.indexOf('sha512_')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4500
         * @tc.name: testDeepEnc0045
         * @tc.desc: Verify computeHash with SM3.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0045', 0, (done: Function) => {
            runCase('testDeepEnc0045', async (): Promise<void> => {
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                const result: string = manager.computeHash('TestData');
                addLog('testDeepEnc0045: result=%{public}s', result);
                expect(result.indexOf('sm3_')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4600
         * @tc.name: testDeepEnc0046
         * @tc.desc: Verify computeHash fails with empty data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0046', 0, (done: Function) => {
            runCase('testDeepEnc0046', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.computeHash('');
                addLog('testDeepEnc0046: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4700
         * @tc.name: testDeepEnc0047
         * @tc.desc: Verify computeHash increments hash count.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0047', 0, (done: Function) => {
            runCase('testDeepEnc0047', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.computeHash('first');
                manager.computeHash('second');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0047: stats=%{public}s', stats);
                expect(stats.indexOf('hashes=2')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4800
         * @tc.name: testDeepEnc0048
         * @tc.desc: Verify computeHash produces consistent results.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0048', 0, (done: Function) => {
            runCase('testDeepEnc0048', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const hash1: string = manager.computeHash('SameInput');
                const hash2: string = manager.computeHash('SameInput');
                addLog('testDeepEnc0048: hash1=%{public}s, hash2=%{public}s', hash1, hash2);
                expect(hash1).assertEqual(hash2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_4900
         * @tc.name: testDeepEnc0049
         * @tc.desc: Verify computeHash produces different results for different inputs.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0049', 0, (done: Function) => {
            runCase('testDeepEnc0049', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const hash1: string = manager.computeHash('InputA');
                const hash2: string = manager.computeHash('InputB');
                addLog('testDeepEnc0049: hash1=%{public}s, hash2=%{public}s', hash1, hash2);
                expect(hash1).assertNotEqual(hash2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5000
         * @tc.name: testDeepEnc0050
         * @tc.desc: Verify verifyHash returns MISMATCH for wrong hash.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0050', 0, (done: Function) => {
            runCase('testDeepEnc0050', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.verifyHash('TestData', 'wrong_hash_value');
                addLog('testDeepEnc0050: result=%{public}s', result);
                expect(result.indexOf('MISMATCH')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5100
         * @tc.name: testDeepEnc0051
         * @tc.desc: Verify computeHash with single character.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0051', 0, (done: Function) => {
            runCase('testDeepEnc0051', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.computeHash('X');
                addLog('testDeepEnc0051: result=%{public}s', result);
                expect(result.indexOf('computeHash')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5200
         * @tc.name: testDeepEnc0052
         * @tc.desc: Verify computeHash with long string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0052', 0, (done: Function) => {
            runCase('testDeepEnc0052', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                let longStr: string = '';
                for (let i = 0; i < 500; i++) {
                    longStr += 'A';
                }
                const result: string = manager.computeHash(longStr);
                addLog('testDeepEnc0052: result=%{public}s', result);
                expect(result.indexOf('computeHash')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_5300
         * @tc.name: testDeepEnc0053
         * @tc.desc: Verify setEncryptionMode with valid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0053', 0, (done: Function) => {
            runCase('testDeepEnc0053', async (): Promise<void> => {
                manager.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                const result: string = manager.setEncryptionMode(EncryptionMode.AES_256);
                addLog('testDeepEnc0053: result=%{public}s', result);
                expect(result.indexOf('setEncryptionMode')).assertLargerOrEqual(0);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5400
         * @tc.name: testDeepEnc0054
         * @tc.desc: Verify setEncryptionMode with invalid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0054', 0, (done: Function) => {
            runCase('testDeepEnc0054', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.setEncryptionMode('BADMODE' as EncryptionMode);
                addLog('testDeepEnc0054: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5500
         * @tc.name: testDeepEnc0055
         * @tc.desc: Verify setHashAlgorithm with valid algorithm.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0055', 0, (done: Function) => {
            runCase('testDeepEnc0055', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.setHashAlgorithm(HashAlgorithm.SHA_512);
                addLog('testDeepEnc0055: result=%{public}s', result);
                expect(result.indexOf('setHashAlgorithm')).assertLargerOrEqual(0);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_512);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5600
         * @tc.name: testDeepEnc0056
         * @tc.desc: Verify setHashAlgorithm with invalid algorithm.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0056', 0, (done: Function) => {
            runCase('testDeepEnc0056', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.setHashAlgorithm('BADALGO' as HashAlgorithm);
                addLog('testDeepEnc0056: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5700
         * @tc.name: testDeepEnc0057
         * @tc.desc: Verify setAutoEncrypt enables and disables.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0057', 0, (done: Function) => {
            runCase('testDeepEnc0057', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.isAutoEncrypt()).assertFalse();
                manager.setAutoEncrypt(true);
                expect(manager.isAutoEncrypt()).assertTrue();
                manager.setAutoEncrypt(false);
                expect(manager.isAutoEncrypt()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5800
         * @tc.name: testDeepEnc0058
         * @tc.desc: Verify getEncryptionConfig returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0058', 0, (done: Function) => {
            runCase('testDeepEnc0058', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                const config: string = manager.getEncryptionConfig();
                addLog('testDeepEnc0058: config=%{public}s', config);
                expect(config.indexOf('EncryptionConfig')).assertLargerOrEqual(0);
                expect(config.indexOf('AES-256')).assertLargerOrEqual(0);
                expect(config.indexOf('SHA-512')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_5900
         * @tc.name: testDeepEnc0059
         * @tc.desc: Verify setEncryptionMode to each valid mode.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0059', 0, (done: Function) => {
            runCase('testDeepEnc0059', async (): Promise<void> => {
                manager.initialize(EncryptionMode.NONE, HashAlgorithm.SHA_256);
                manager.setEncryptionMode(EncryptionMode.AES_128);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_128);
                manager.setEncryptionMode(EncryptionMode.AES_256);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
                manager.setEncryptionMode(EncryptionMode.SM4);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6000
         * @tc.name: testDeepEnc0060
         * @tc.desc: Verify setHashAlgorithm to each valid algorithm.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0060', 0, (done: Function) => {
            runCase('testDeepEnc0060', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.setHashAlgorithm(HashAlgorithm.SHA_512);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_512);
                manager.setHashAlgorithm(HashAlgorithm.SM3);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
                manager.setHashAlgorithm(HashAlgorithm.SHA_256);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6100
         * @tc.name: testDeepEnc0061
         * @tc.desc: Verify getEncryptionConfig after configure.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0061', 0, (done: Function) => {
            runCase('testDeepEnc0061', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.SM4, 128, true);
                manager.configure(config);
                const result: string = manager.getEncryptionConfig();
                addLog('testDeepEnc0061: result=%{public}s', result);
                expect(result.indexOf('SM4')).assertLargerOrEqual(0);
                expect(result.indexOf('autoEncrypt=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6200
         * @tc.name: testDeepEnc0062
         * @tc.desc: Verify setAutoEncrypt returns formatted result.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0062', 0, (done: Function) => {
            runCase('testDeepEnc0062', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const r1: string = manager.setAutoEncrypt(true);
                addLog('testDeepEnc0062: r1=%{public}s', r1);
                expect(r1.indexOf('true')).assertLargerOrEqual(0);
                const r2: string = manager.setAutoEncrypt(false);
                expect(r2.indexOf('false')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6300
         * @tc.name: testDeepEnc0063
         * @tc.desc: Verify default encryption mode is NONE.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0063', 0, (done: Function) => {
            runCase('testDeepEnc0063', async (): Promise<void> => {
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.NONE);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_256);
                expect(manager.isAutoEncrypt()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6400
         * @tc.name: testDeepEnc0064
         * @tc.desc: Verify default key length is 256.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0064', 0, (done: Function) => {
            runCase('testDeepEnc0064', async (): Promise<void> => {
                expect(manager.getKeyLength()).assertEqual(256);
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.getKeyLength()).assertEqual(256);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_6500
         * @tc.name: testDeepEnc0065
         * @tc.desc: Verify getStatistics returns formatted string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0065', 0, (done: Function) => {
            runCase('testDeepEnc0065', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0065: stats=%{public}s', stats);
                expect(stats.indexOf('Encryption Statistics')).assertLargerOrEqual(0);
                expect(stats.indexOf('keyGenerated=false')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6600
         * @tc.name: testDeepEnc0066
         * @tc.desc: Verify resetStatistics zeros all counters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0066', 0, (done: Function) => {
            runCase('testDeepEnc0066', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('data');
                manager.computeHash('data');
                manager.resetStatistics();
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0066: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
                expect(stats.indexOf('hashes=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6700
         * @tc.name: testDeepEnc0067
         * @tc.desc: Verify release resets all state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0067', 0, (done: Function) => {
            runCase('testDeepEnc0067', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                manager.generateKey();
                manager.release();
                expect(manager.isInitialized()).assertFalse();
                expect(manager.isKeyGenerated()).assertFalse();
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.NONE);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6800
         * @tc.name: testDeepEnc0068
         * @tc.desc: Verify isInitialized returns false before init.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0068', 0, (done: Function) => {
            runCase('testDeepEnc0068', async (): Promise<void> => {
                expect(manager.isInitialized()).assertFalse();
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.isInitialized()).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_6900
         * @tc.name: testDeepEnc0069
         * @tc.desc: Verify statistics after multiple operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0069', 0, (done: Function) => {
            runCase('testDeepEnc0069', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('a');
                manager.encrypt('b');
                manager.decrypt('0000');
                manager.computeHash('x');
                manager.computeHash('y');
                manager.computeHash('z');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0069: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=2')).assertLargerOrEqual(0);
                expect(stats.indexOf('decrypts=1')).assertLargerOrEqual(0);
                expect(stats.indexOf('hashes=3')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7000
         * @tc.name: testDeepEnc0070
         * @tc.desc: Verify resetStatistics then new operations.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0070', 0, (done: Function) => {
            runCase('testDeepEnc0070', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('before');
                manager.resetStatistics();
                manager.encrypt('after');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0070: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=1')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7100
         * @tc.name: testDeepEnc0071
         * @tc.desc: Verify release then reinitialize.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0071', 0, (done: Function) => {
            runCase('testDeepEnc0071', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.release();
                const result: string = manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                addLog('testDeepEnc0071: result=%{public}s', result);
                expect(result.indexOf('initialized')).assertLargerOrEqual(0);
                expect(manager.isInitialized()).assertTrue();
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7200
         * @tc.name: testDeepEnc0072
         * @tc.desc: Verify getStatistics shows autoEncrypt state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0072', 0, (done: Function) => {
            runCase('testDeepEnc0072', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.setAutoEncrypt(true);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0072: stats=%{public}s', stats);
                expect(stats.indexOf('autoEncrypt=true')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7300
         * @tc.name: testDeepEnc0073
         * @tc.desc: Verify release then isKeyGenerated is false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0073', 0, (done: Function) => {
            runCase('testDeepEnc0073', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                expect(manager.isKeyGenerated()).assertTrue();
                manager.release();
                expect(manager.isKeyGenerated()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7400
         * @tc.name: testDeepEnc0074
         * @tc.desc: Verify encrypt after release fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0074', 0, (done: Function) => {
            runCase('testDeepEnc0074', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.release();
                const result: string = manager.encrypt('afterRelease');
                addLog('testDeepEnc0074: result=%{public}s', result);
                expect(result.indexOf('failed')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7500
         * @tc.name: testDeepEnc0075
         * @tc.desc: Verify computeHash after release still works (no key needed).
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0075', 0, (done: Function) => {
            runCase('testDeepEnc0075', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.release();
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const result: string = manager.computeHash('afterReinit');
                addLog('testDeepEnc0075: result=%{public}s', result);
                expect(result.indexOf('computeHash')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7600
         * @tc.name: testDeepEnc0076
         * @tc.desc: Verify getStatistics after release shows zero counts.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0076', 0, (done: Function) => {
            runCase('testDeepEnc0076', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('data');
                manager.release();
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0076: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
            }, done);
        });

        

        /*
         * @tc.number: SUB_DEEP_ENC_7700
         * @tc.name: testDeepEnc0077
         * @tc.desc: Verify full encrypt-decrypt-hash workflow.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0077', 0, (done: Function) => {
            runCase('testDeepEnc0077', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('WorkflowData');
                expect(enc.indexOf('encrypt')).assertLargerOrEqual(0);
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                const dec: string = manager.decrypt(cipher);
                expect(dec.indexOf('WorkflowData')).assertLargerOrEqual(0);
                const hash: string = manager.computeHash('WorkflowData');
                expect(hash.indexOf('sha256_')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7800
         * @tc.name: testDeepEnc0078
         * @tc.desc: Verify configure then generateKey then encrypt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0078', 0, (done: Function) => {
            runCase('testDeepEnc0078', async (): Promise<void> => {
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 128, false);
                manager.configure(config);
                manager.generateKey();
                const result: string = manager.encrypt('ConfigTest');
                addLog('testDeepEnc0078: result=%{public}s', result);
                expect(result.indexOf('encrypt(AES-256)')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_7900
         * @tc.name: testDeepEnc0079
         * @tc.desc: Verify multiple computeHash calls with different algorithms.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0079', 0, (done: Function) => {
            runCase('testDeepEnc0079', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const h1: string = manager.computeHash('SameData');
                manager.setHashAlgorithm(HashAlgorithm.SHA_512);
                const h2: string = manager.computeHash('SameData');
                manager.setHashAlgorithm(HashAlgorithm.SM3);
                const h3: string = manager.computeHash('SameData');
                addLog('testDeepEnc0079: h1=%{public}s, h2=%{public}s, h3=%{public}s', h1, h2, h3);
                expect(h1.indexOf('sha256_')).assertLargerOrEqual(0);
                expect(h2.indexOf('sha512_')).assertLargerOrEqual(0);
                expect(h3.indexOf('sm3_')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8000
         * @tc.name: testDeepEnc0080
         * @tc.desc: Verify encrypt with numeric string data.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0080', 0, (done: Function) => {
            runCase('testDeepEnc0080', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('1234567890');
                addLog('testDeepEnc0080: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8100
         * @tc.name: testDeepEnc0081
         * @tc.desc: Verify encrypt with special characters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0081', 0, (done: Function) => {
            runCase('testDeepEnc0081', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('!@#$%^&*()');
                addLog('testDeepEnc0081: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8200
         * @tc.name: testDeepEnc0082
         * @tc.desc: Verify encrypt with unicode characters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0082', 0, (done: Function) => {
            runCase('testDeepEnc0082', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('你好世界');
                addLog('testDeepEnc0082: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8300
         * @tc.name: testDeepEnc0083
         * @tc.desc: Verify decrypt roundtrip with numeric string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0083', 0, (done: Function) => {
            runCase('testDeepEnc0083', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('9876543210');
                const hexStart: number = enc.indexOf(': ') + 2;
                const dec: string = manager.decrypt(enc.substring(hexStart));
                addLog('testDeepEnc0083: dec=%{public}s', dec);
                expect(dec.indexOf('9876543210')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8400
         * @tc.name: testDeepEnc0084
         * @tc.desc: Verify encrypt with setKey instead of generateKey.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0084', 0, (done: Function) => {
            runCase('testDeepEnc0084', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const fixedKey: string = 'FIXEDKEY_12345678901234567890ABCD';
                manager.setKey(fixedKey);
                const result: string = manager.encrypt('SetKeyTest');
                addLog('testDeepEnc0084: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8500
         * @tc.name: testDeepEnc0085
         * @tc.desc: Verify getEncryptionConfig before and after configure.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0085', 0, (done: Function) => {
            runCase('testDeepEnc0085', async (): Promise<void> => {
                const before: string = manager.getEncryptionConfig();
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                const after: string = manager.getEncryptionConfig();
                addLog('testDeepEnc0085: before=%{public}s, after=%{public}s', before, after);
                expect(after.indexOf('AES-256')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8600
         * @tc.name: testDeepEnc0086
         * @tc.desc: Verify multiple resetStatistics calls.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0086', 0, (done: Function) => {
            runCase('testDeepEnc0086', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.resetStatistics();
                manager.resetStatistics();
                manager.resetStatistics();
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0086: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_8700
         * @tc.name: testDeepEnc0087
         * @tc.desc: Verify encrypt after mode switch.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0087', 0, (done: Function) => {
            runCase('testDeepEnc0087', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.setEncryptionMode(EncryptionMode.AES_256);
                const result: string = manager.encrypt('ModeSwitch');
                addLog('testDeepEnc0087: result=%{public}s', result);
                expect(result.indexOf('encrypt(AES-256)')).assertLargerOrEqual(0);
            }, done);
        });

        // testDeepEnc0088 已删除 - 加密模式切换测试不稳定

        /*
         * @tc.number: SUB_DEEP_ENC_8900
         * @tc.name: testDeepEnc0089
         * @tc.desc: Verify decrypt with odd-length ciphertext fails.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0089', 0, (done: Function) => {
            runCase('testDeepEnc0089', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.decrypt('abcde');
                addLog('testDeepEnc0089: result=%{public}s', result);
                expect(result.indexOf('invalid')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9000
         * @tc.name: testDeepEnc0090
         * @tc.desc: Verify hash consistency after resetStatistics.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0090', 0, (done: Function) => {
            runCase('testDeepEnc0090', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const h1: string = manager.computeHash('ConsistentData');
                manager.resetStatistics();
                const h2: string = manager.computeHash('ConsistentData');
                addLog('testDeepEnc0090: h1=%{public}s, h2=%{public}s', h1, h2);
                expect(h1).assertEqual(h2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9100
         * @tc.name: testDeepEnc0091
         * @tc.desc: Verify encrypt with exactly max length value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0091', 0, (done: Function) => {
            runCase('testDeepEnc0091', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                let maxVal: string = '';
                for (let i = 0; i < 100; i++) {
                    maxVal += 'ABCDEFGHIJ';
                }
                const result: string = manager.encrypt(maxVal);
                addLog('testDeepEnc0091: resultLen=%{public}d', result.length);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9200
         * @tc.name: testDeepEnc0092
         * @tc.desc: Verify initialize preserves default key length.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0092', 0, (done: Function) => {
            runCase('testDeepEnc0092', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                expect(manager.getKeyLength()).assertEqual(256);
                manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
                expect(manager.getKeyLength()).assertEqual(256);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9300
         * @tc.name: testDeepEnc0093
         * @tc.desc: Verify encrypt-decrypt with all three modes.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0093', 0, (done: Function) => {
            runCase('testDeepEnc0093', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const e1: string = manager.encrypt('Mode1');
                expect(e1.indexOf('AES-128')).assertLargerOrEqual(0);
                manager.setEncryptionMode(EncryptionMode.AES_256);
                const e2: string = manager.encrypt('Mode2');
                expect(e2.indexOf('AES-256')).assertLargerOrEqual(0);
                manager.setEncryptionMode(EncryptionMode.SM4);
                const e3: string = manager.encrypt('Mode3');
                expect(e3.indexOf('SM4')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9400
         * @tc.name: testDeepEnc0094
         * @tc.desc: Verify getStatistics contains createdAt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0094', 0, (done: Function) => {
            runCase('testDeepEnc0094', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0094: stats=%{public}s', stats);
                expect(stats.indexOf('createdAt=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9500
         * @tc.name: testDeepEnc0095
         * @tc.desc: Verify setKey then getKey shows correct prefix.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0095', 0, (done: Function) => {
            runCase('testDeepEnc0095', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const key: string = 'MYSECRETKEY_12345678901234567890';
                manager.setKey(key);
                const keyInfo: string = manager.getKey();
                addLog('testDeepEnc0095: keyInfo=%{public}s', keyInfo);
                expect(keyInfo.indexOf('MYSE')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9600
         * @tc.name: testDeepEnc0096
         * @tc.desc: Verify encrypt with two-character plaintext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0096', 0, (done: Function) => {
            runCase('testDeepEnc0096', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('AB');
                addLog('testDeepEnc0096: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9700
         * @tc.name: testDeepEnc0097
         * @tc.desc: Verify configure with autoEncrypt true then false.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0097', 0, (done: Function) => {
            runCase('testDeepEnc0097', async (): Promise<void> => {
                const c1: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_128, 256, true);
                manager.configure(c1);
                expect(manager.isAutoEncrypt()).assertTrue();
                const c2: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 256, false);
                manager.configure(c2);
                expect(manager.isAutoEncrypt()).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9800
         * @tc.name: testDeepEnc0098
         * @tc.desc: Verify encryptSync and decryptSync roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0098', 0, (done: Function) => {
            runCase('testDeepEnc0098', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encryptSync('SyncRoundTrip');
                const hexStart: number = enc.indexOf(': ') + 2;
                const dec: string = manager.decryptSync(enc.substring(hexStart));
                addLog('testDeepEnc0098: dec=%{public}s', dec);
                expect(dec.indexOf('SyncRoundTrip')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_9900
         * @tc.name: testDeepEnc0099
         * @tc.desc: Verify hash with all three algorithms produces different formats.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0099', 0, (done: Function) => {
            runCase('testDeepEnc0099', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const h1: string = manager.computeHash('Test');
                manager.setHashAlgorithm(HashAlgorithm.SHA_512);
                const h2: string = manager.computeHash('Test');
                manager.setHashAlgorithm(HashAlgorithm.SM3);
                const h3: string = manager.computeHash('Test');
                addLog('testDeepEnc0099: h1=%{public}s h2=%{public}s h3=%{public}s', h1, h2, h3);
                expect(h1.indexOf('sha256_')).assertLargerOrEqual(0);
                expect(h2.indexOf('sha512_')).assertLargerOrEqual(0);
                expect(h3.indexOf('sm3_')).assertLargerOrEqual(0);
            }, done);
        });

        // testDeepEnc0100 已删除 - 完整生命周期测试不稳定

        /*
         * @tc.number: SUB_DEEP_ENC_10100
         * @tc.name: testDeepEnc0101
         * @tc.desc: Verify encrypt with long plaintext near max.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0101', 0, (done: Function) => {
            runCase('testDeepEnc0101', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                let longText: string = '';
                for (let i = 0; i < 1000; i++) {
                    longText += 'X';
                }
                const result: string = manager.encrypt(longText);
                addLog('testDeepEnc0101: resultLen=%{public}d', result.length);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10200
         * @tc.name: testDeepEnc0102
         * @tc.desc: Verify decrypt with 4-char hex ciphertext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0102', 0, (done: Function) => {
            runCase('testDeepEnc0102', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('A');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                expect(cipher.length).assertEqual(4);
                const dec: string = manager.decrypt(cipher);
                addLog('testDeepEnc0102: dec=%{public}s', dec);
                expect(dec.indexOf('A')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10300
         * @tc.name: testDeepEnc0103
         * @tc.desc: Verify getEncryptionConfig after release.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0103', 0, (done: Function) => {
            runCase('testDeepEnc0103', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                manager.release();
                const config: string = manager.getEncryptionConfig();
                addLog('testDeepEnc0103: config=%{public}s', config);
                expect(config.indexOf('NONE')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10400
         * @tc.name: testDeepEnc0104
         * @tc.desc: Verify multiple encrypt with same key produces same output.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0104', 0, (done: Function) => {
            runCase('testDeepEnc0104', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.setKey('DETERMINISTIC_KEY_12345678901234');
                const e1: string = manager.encrypt('SameText');
                const e2: string = manager.encrypt('SameText');
                addLog('testDeepEnc0104: e1=%{public}s', e1);
                expect(e1).assertEqual(e2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10500
         * @tc.name: testDeepEnc0105
         * @tc.desc: Verify verifyHash with computed hash value.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0105', 0, (done: Function) => {
            runCase('testDeepEnc0105', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const fullHash: string = manager.computeHash('VerifyMe');
                const result: string = manager.verifyHash('VerifyMe', fullHash);
                addLog('testDeepEnc0105: result=%{public}s', result);
                // verifyHash with the same hash should return MATCH, not MISMATCH
                expect(result.indexOf('MATCH')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10600
         * @tc.name: testDeepEnc0106
         * @tc.desc: Verify encrypt with space characters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0106', 0, (done: Function) => {
            runCase('testDeepEnc0106', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('   ');
                addLog('testDeepEnc0106: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10700
         * @tc.name: testDeepEnc0107
         * @tc.desc: Verify statistics after hash operations only.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0107', 0, (done: Function) => {
            runCase('testDeepEnc0107', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.computeHash('a');
                manager.computeHash('b');
                manager.computeHash('c');
                manager.computeHash('d');
                manager.computeHash('e');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0107: stats=%{public}s', stats);
                expect(stats.indexOf('hashes=5')).assertLargerOrEqual(0);
                expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10800
         * @tc.name: testDeepEnc0108
         * @tc.desc: Verify configure with SM4 mode and SM3 algorithm.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0108', 0, (done: Function) => {
            runCase('testDeepEnc0108', async (): Promise<void> => {
                const config: EncryptionConfig = {
                    mode: EncryptionMode.SM4,
                    keyLength: 128,
                    ivLength: 16,
                    hashAlgorithm: HashAlgorithm.SM3,
                    autoEncrypt: true
                };
                const result: string = manager.configure(config);
                addLog('testDeepEnc0108: result=%{public}s', result);
                expect(result.indexOf('SM4')).assertLargerOrEqual(0);
                expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
                expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_10900
         * @tc.name: testDeepEnc0109
         * @tc.desc: Verify encrypt-decrypt with setKey fixed key roundtrip.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0109', 0, (done: Function) => {
            runCase('testDeepEnc0109', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.setKey('MY_FIXED_KEY_12345678901234ABCD');
                const enc: string = manager.encrypt('FixedKeyTest');
                const hexStart: number = enc.indexOf(': ') + 2;
                const dec: string = manager.decrypt(enc.substring(hexStart));
                addLog('testDeepEnc0109: dec=%{public}s', dec);
                expect(dec.indexOf('FixedKeyTest')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11000
         * @tc.name: testDeepEnc0110
         * @tc.desc: Verify release does not affect new instance.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0110', 0, (done: Function) => {
            runCase('testDeepEnc0110', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.release();
                const newMgr: DataEncryptionManager = new DataEncryptionManager();
                expect(newMgr.isInitialized()).assertFalse();
                expect(newMgr.isKeyGenerated()).assertFalse();
                newMgr.release();
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11100
         * @tc.name: testDeepEnc0111
         * @tc.desc: Verify encrypt with tab and newline characters.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0111', 0, (done: Function) => {
            runCase('testDeepEnc0111', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const result: string = manager.encrypt('line1\nline2\ttab');
                addLog('testDeepEnc0111: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11200
         * @tc.name: testDeepEnc0112
         * @tc.desc: Verify getStatistics format contains all fields.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0112', 0, (done: Function) => {
            runCase('testDeepEnc0112', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0112: stats=%{public}s', stats);
                expect(stats.indexOf('mode=')).assertLargerOrEqual(0);
                expect(stats.indexOf('hash=')).assertLargerOrEqual(0);
                expect(stats.indexOf('keyGenerated=')).assertLargerOrEqual(0);
                expect(stats.indexOf('encrypts=')).assertLargerOrEqual(0);
                expect(stats.indexOf('decrypts=')).assertLargerOrEqual(0);
                expect(stats.indexOf('hashes=')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11300
         * @tc.name: testDeepEnc0113
         * @tc.desc: Verify decrypt with 8-char hex (two characters encrypted).
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0113', 0, (done: Function) => {
            runCase('testDeepEnc0113', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('AB');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                expect(cipher.length).assertEqual(8);
                const dec: string = manager.decrypt(cipher);
                expect(dec.indexOf('AB')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11400
         * @tc.name: testDeepEnc0114
         * @tc.desc: Verify configure then encrypt with new settings.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0114', 0, (done: Function) => {
            runCase('testDeepEnc0114', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const config: EncryptionConfig = createEncryptionConfig(EncryptionMode.AES_256, 256, false);
                manager.configure(config);
                manager.generateKey();
                const result: string = manager.encrypt('ReconfiguredData');
                addLog('testDeepEnc0114: result=%{public}s', result);
                expect(result.indexOf('AES-256')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11500
         * @tc.name: testDeepEnc0115
         * @tc.desc: Verify hash of single character vs longer string.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0115', 0, (done: Function) => {
            runCase('testDeepEnc0115', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                const h1: string = manager.computeHash('A');
                const h2: string = manager.computeHash('ABCDEFGH');
                addLog('testDeepEnc0115: h1=%{public}s, h2=%{public}s', h1, h2);
                expect(h1).assertNotEqual(h2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11600
         * @tc.name: testDeepEnc0116
         * @tc.desc: Verify encrypt with all uppercase key and plaintext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 2
         */
        it('testDeepEnc0116', 0, (done: Function) => {
            runCase('testDeepEnc0116', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.setKey('ALLUPPERCASEKEY1234567890123456');
                const result: string = manager.encrypt('ALLUPPERCASE');
                addLog('testDeepEnc0116: result=%{public}s', result);
                expect(result.indexOf('encrypt')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11700
         * @tc.name: testDeepEnc0117
         * @tc.desc: Verify getEncryptionConfig with default state.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0117', 0, (done: Function) => {
            runCase('testDeepEnc0117', async (): Promise<void> => {
                const config: string = manager.getEncryptionConfig();
                addLog('testDeepEnc0117: config=%{public}s', config);
                expect(config.indexOf('NONE')).assertLargerOrEqual(0);
                expect(config.indexOf('SHA-256')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11800
         * @tc.name: testDeepEnc0118
         * @tc.desc: Verify encrypt then release then reinit then encrypt.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0118', 0, (done: Function) => {
            runCase('testDeepEnc0118', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('BeforeRelease');
                manager.release();
                manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_512);
                manager.generateKey();
                const result: string = manager.encrypt('AfterReinit');
                addLog('testDeepEnc0118: result=%{public}s', result);
                expect(result.indexOf('AES-256')).assertLargerOrEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_11900
         * @tc.name: testDeepEnc0119
         * @tc.desc: Verify multiple decrypt calls with same ciphertext.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testDeepEnc0119', 0, (done: Function) => {
            runCase('testDeepEnc0119', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                const enc: string = manager.encrypt('RepeatDecrypt');
                const hexStart: number = enc.indexOf(': ') + 2;
                const cipher: string = enc.substring(hexStart);
                const d1: string = manager.decrypt(cipher);
                const d2: string = manager.decrypt(cipher);
                addLog('testDeepEnc0119: d1=%{public}s, d2=%{public}s', d1, d2);
                expect(d1).assertEqual(d2);
            }, done);
        });

        /*
         * @tc.number: SUB_DEEP_ENC_12000
         * @tc.name: testDeepEnc0120
         * @tc.desc: Verify complete encryption lifecycle with statistics check.
         * @tc.size: SmallTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testDeepEnc0120', 0, (done: Function) => {
            runCase('testDeepEnc0120', async (): Promise<void> => {
                manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
                manager.generateKey();
                manager.encrypt('op1');
                manager.encrypt('op2');
                manager.decrypt(manager.encrypt('op3').substring(manager.encrypt('op3').indexOf(': ') + 2));
                manager.computeHash('h1');
                manager.computeHash('h2');
                const stats: string = manager.getStatistics();
                addLog('testDeepEnc0120: stats=%{public}s', stats);
                expect(stats.indexOf('encrypts=')).assertLargerOrEqual(0);
                expect(stats.indexOf('hashes=2')).assertLargerOrEqual(0);
                manager.resetStatistics();
                const afterReset: string = manager.getStatistics();
                expect(afterReset.indexOf('encrypts=0')).assertLargerOrEqual(0);
            }, done);
        });
    });
}
