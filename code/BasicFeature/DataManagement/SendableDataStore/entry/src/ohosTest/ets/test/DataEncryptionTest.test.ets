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
import { DataEncryptionManager } from '../../../main/ets/encryption/DataEncryptionManager';
import { EncryptionMode, HashAlgorithm, EncryptionConfig } from '../../../main/ets/models/DataModels';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function dataEncryptionTest(): void {
  describe('DataEncryptionTest', () => {
    let manager: DataEncryptionManager = new DataEncryptionManager();

    beforeAll(() => {
      addLog('DataEncryptionTest suite started');
    })

    beforeEach(() => {
      manager = new DataEncryptionManager();
    })

    afterEach(() => {
      manager.release();
    })

    afterAll(() => {
      addLog('DataEncryptionTest suite finished');
    })



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0100
     * @tc.name: testDataEncryption0001
     * @tc.desc: Verify initialize sets mode and algorithm correctly.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0001', 0, (done: Function) => {
      runCase('testDataEncryption0001', async (): Promise<void> => {
        const result: string = manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        addLog('testDataEncryption0001: result=%{public}s', result);
        expect(result.indexOf('initialized')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
        expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_256);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0200
     * @tc.name: testDataEncryption0002
     * @tc.desc: Verify initialize with SM4 and SM3.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0002', 0, (done: Function) => {
      runCase('testDataEncryption0002', async (): Promise<void> => {
        const result: string = manager.initialize(EncryptionMode.SM4, HashAlgorithm.SM3);
        addLog('testDataEncryption0002: result=%{public}s', result);
        expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
        expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0300
     * @tc.name: testDataEncryption0003
     * @tc.desc: Verify generateKey creates a key successfully.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0003', 0, (done: Function) => {
      runCase('testDataEncryption0003', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.generateKey();
        addLog('testDataEncryption0003: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertTrue();
        expect(result.indexOf('length=')).assertLargerOrEqual(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0400
     * @tc.name: testDataEncryption0004
     * @tc.desc: Verify getKey returns masked key after generation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0004', 0, (done: Function) => {
      runCase('testDataEncryption0004', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
        manager.generateKey();
        const key: string = manager.getKey();
        addLog('testDataEncryption0004: key=%{public}s', key);
        expect(key.indexOf('Key:')).assertLargerOrEqual(0);
        expect(key.indexOf('...')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0500
     * @tc.name: testDataEncryption0005
     * @tc.desc: Verify getKey fails before key generation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0005', 0, (done: Function) => {
      runCase('testDataEncryption0005', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const key: string = manager.getKey();
        addLog('testDataEncryption0005: key=%{public}s', key);
        expect(key.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0600
     * @tc.name: testDataEncryption0006
     * @tc.desc: Verify encrypt produces ciphertext from plaintext.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0006', 0, (done: Function) => {
      runCase('testDataEncryption0006', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        const encrypted: string = manager.encrypt('HelloWorld');
        addLog('testDataEncryption0006: encrypted=%{public}s', encrypted);
        expect(encrypted.indexOf('encrypt')).assertLargerOrEqual(0);
        expect(encrypted.indexOf('HelloWorld')).assertLess(0);
        expect(encrypted.length).assertLarger(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0700
     * @tc.name: testDataEncryption0007
     * @tc.desc: Verify decrypt recovers original plaintext.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0007', 0, (done: Function) => {
      runCase('testDataEncryption0007', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        const encrypted: string = manager.encrypt('TestData');
        const cipherHex: string = encrypted.substring(encrypted.indexOf(': ') + 2);
        const decrypted: string = manager.decrypt(cipherHex);
        addLog('testDataEncryption0007: decrypted=%{public}s', decrypted);
        expect(decrypted.indexOf('TestData')).assertLargerOrEqual(0);
        expect(decrypted.indexOf('decrypt')).assertLargerOrEqual(0);
        expect(decrypted.length).assertLarger(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0800
     * @tc.name: testDataEncryption0008
     * @tc.desc: Verify encrypt fails without key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0008', 0, (done: Function) => {
      runCase('testDataEncryption0008', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.encrypt('NoKey');
        addLog('testDataEncryption0008: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_0900
     * @tc.name: testDataEncryption0009
     * @tc.desc: Verify encrypt fails with empty plaintext.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0009', 0, (done: Function) => {
      runCase('testDataEncryption0009', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        const result: string = manager.encrypt('');
        addLog('testDataEncryption0009: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1000
     * @tc.name: testDataEncryption0010
     * @tc.desc: Verify computeHash returns hash with algorithm prefix.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0010', 0, (done: Function) => {
      runCase('testDataEncryption0010', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const hash: string = manager.computeHash('test data');
        addLog('testDataEncryption0010: hash=%{public}s', hash);
        expect(hash.indexOf('sha256_')).assertLargerOrEqual(0);
        expect(hash.indexOf('computeHash')).assertLargerOrEqual(0);
        expect(hash.length).assertLarger(10);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1100
     * @tc.name: testDataEncryption0011
     * @tc.desc: Verify computeHash fails with empty data.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0011', 0, (done: Function) => {
      runCase('testDataEncryption0011', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const hash: string = manager.computeHash('');
        addLog('testDataEncryption0011: hash=%{public}s', hash);
        expect(hash.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isInitialized()).assertTrue();
        expect(hash.length).assertLarger(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1200
     * @tc.name: testDataEncryption0012
     * @tc.desc: Verify setKey with valid key string.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0012', 0, (done: Function) => {
      runCase('testDataEncryption0012', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        let longKey: string = '';
        for (let i = 0; i < 20; i++) {
          longKey += 'A';
        }
        const result: string = manager.setKey(longKey);
        addLog('testDataEncryption0012: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertTrue();
        expect(result.indexOf('length=20')).assertLargerOrEqual(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1300
     * @tc.name: testDataEncryption0013
     * @tc.desc: Verify setKey fails with too short key.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0013', 0, (done: Function) => {
      runCase('testDataEncryption0013', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.setKey('short');
        addLog('testDataEncryption0013: result=%{public}s', result);
        expect(result.indexOf('failed')).assertLargerOrEqual(0);
        expect(manager.isKeyGenerated()).assertFalse();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1400
     * @tc.name: testDataEncryption0014
     * @tc.desc: Verify setAutoEncrypt enables auto-encryption.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0014', 0, (done: Function) => {
      runCase('testDataEncryption0014', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.setAutoEncrypt(true);
        addLog('testDataEncryption0014: result=%{public}s', result);
        expect(result.indexOf('true')).assertLargerOrEqual(0);
        expect(manager.isAutoEncrypt()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1500
     * @tc.name: testDataEncryption0015
     * @tc.desc: Verify getStatistics returns encryption statistics.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0015', 0, (done: Function) => {
      runCase('testDataEncryption0015', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        manager.encrypt('test');
        const stats: string = manager.getStatistics();
        addLog('testDataEncryption0015: stats=%{public}s', stats);
        expect(stats.indexOf('encrypts=1')).assertLargerOrEqual(0);
        expect(stats.indexOf('Statistics')).assertLargerOrEqual(0);
        expect(stats.length).assertLarger(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1600
     * @tc.name: testDataEncryption0016
     * @tc.desc: Verify getEncryptionConfig returns configuration details.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0016', 0, (done: Function) => {
      runCase('testDataEncryption0016', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_512);
        const config: string = manager.getEncryptionConfig();
        addLog('testDataEncryption0016: config=%{public}s', config);
        expect(config.indexOf('AES-128')).assertLargerOrEqual(0);
        expect(config.indexOf('SHA-512')).assertLargerOrEqual(0);
        expect(config.indexOf('EncryptionConfig')).assertLargerOrEqual(0);
      }, done);
    });



    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1700
     * @tc.name: testDataEncryption0017
     * @tc.desc: Verify configure sets encryption parameters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0017', 0, (done: Function) => {
      runCase('testDataEncryption0017', async (): Promise<void> => {
        const config: EncryptionConfig = {
          mode: EncryptionMode.AES_256,
          keyLength: 256,
          ivLength: 16,
          hashAlgorithm: HashAlgorithm.SHA_256,
          autoEncrypt: true
        };
        const result: string = manager.configure(config);
        addLog('testDataEncryption0017: result=%{public}s', result);
        expect(result.indexOf('completed')).assertLargerOrEqual(0);
        expect(manager.getKeyLength()).assertEqual(256);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1800
     * @tc.name: testDataEncryption0018
     * @tc.desc: Verify getKeyLength returns default 256.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0018', 0, (done: Function) => {
      runCase('testDataEncryption0018', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const len: number = manager.getKeyLength();
        addLog('testDataEncryption0018: keyLength=%{public}d', String(len));
        expect(len).assertEqual(256);
        expect(manager.isInitialized()).assertTrue();
        expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_256);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_1900
     * @tc.name: testDataEncryption0019
     * @tc.desc: Verify encryptSync produces ciphertext.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0019', 0, (done: Function) => {
      runCase('testDataEncryption0019', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        const encrypted: string = manager.encryptSync('SyncTest');
        addLog('testDataEncryption0019: encrypted=%{public}s', encrypted);
        expect(encrypted.indexOf('encrypt')).assertLargerOrEqual(0);
        expect(encrypted.indexOf('SyncTest')).assertLess(0);
        expect(encrypted.length).assertLarger(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2000
     * @tc.name: testDataEncryption0020
     * @tc.desc: Verify decryptSync recovers plaintext.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0020', 0, (done: Function) => {
      runCase('testDataEncryption0020', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        const encrypted: string = manager.encrypt('DecSync');
        const cipherHex: string = encrypted.substring(encrypted.indexOf(': ') + 2);
        const decrypted: string = manager.decryptSync(cipherHex);
        addLog('testDataEncryption0020: decrypted=%{public}s', decrypted);
        expect(decrypted.indexOf('DecSync')).assertLargerOrEqual(0);
        expect(decrypted.indexOf('decrypt')).assertLargerOrEqual(0);
        expect(decrypted.length).assertLarger(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2100
     * @tc.name: testDataEncryption0021
     * @tc.desc: Verify verifyHash returns MATCH for correct hash.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0021', 0, (done: Function) => {
      runCase('testDataEncryption0021', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const hash: string = manager.computeHash('verify_data');
        const result: string = manager.verifyHash('verify_data', hash);
        addLog('testDataEncryption0021: result=%{public}s', result);
        expect(result.indexOf('MATCH')).assertLargerOrEqual(0);
        expect(result.indexOf('MISMATCH')).assertLess(0);
        expect(result.indexOf('verifyHash')).assertLargerOrEqual(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2200
     * @tc.name: testDataEncryption0022
     * @tc.desc: Verify verifyHash returns MISMATCH for wrong hash.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0022', 0, (done: Function) => {
      runCase('testDataEncryption0022', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.verifyHash('data', 'wrong_hash');
        addLog('testDataEncryption0022: result=%{public}s', result);
        expect(result.indexOf('MISMATCH')).assertLargerOrEqual(0);
        expect(result).assertEqual('verifyHash: MISMATCH');
        expect(result.indexOf('verifyHash')).assertLargerOrEqual(0);
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2300
     * @tc.name: testDataEncryption0023
     * @tc.desc: Verify setEncryptionMode changes mode.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0023', 0, (done: Function) => {
      runCase('testDataEncryption0023', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_256);
        const result: string = manager.setEncryptionMode(EncryptionMode.SM4);
        addLog('testDataEncryption0023: result=%{public}s', result);
        expect(result.indexOf('SM4')).assertLargerOrEqual(0);
        expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.SM4);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2400
     * @tc.name: testDataEncryption0024
     * @tc.desc: Verify setHashAlgorithm changes algorithm.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0024', 0, (done: Function) => {
      runCase('testDataEncryption0024', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        const result: string = manager.setHashAlgorithm(HashAlgorithm.SM3);
        addLog('testDataEncryption0024: result=%{public}s', result);
        expect(result.indexOf('SM3')).assertLargerOrEqual(0);
        expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SM3);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    })

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2500
     * @tc.name: testDataEncryption0025
     * @tc.desc: Verify resetStatistics zeroes encrypt/decrypt/hash counters.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0025', 0, (done: Function) => {
      runCase('testDataEncryption0025', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        manager.generateKey();
        manager.encrypt('test');
        const result: string = manager.resetStatistics();
        addLog('testDataEncryption0025: result=%{public}s', result);
        expect(result.indexOf('reset')).assertLargerOrEqual(0);
        const stats: string = manager.getStatistics();
        expect(stats.indexOf('encrypts=0')).assertLargerOrEqual(0);
        expect(stats.indexOf('decrypts=0')).assertLargerOrEqual(0);
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2600
     * @tc.name: testDataEncryption0026
     * @tc.desc: Verify isKeyGenerated returns false before generation.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0026', 0, (done: Function) => {
      runCase('testDataEncryption0026', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_256, HashAlgorithm.SHA_256);
        expect(manager.isKeyGenerated()).assertFalse();
        manager.generateKey();
        expect(manager.isKeyGenerated()).assertTrue();
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_DATA_ENCRYPTION_2700
     * @tc.name: testDataEncryption0027
     * @tc.desc: Verify getEncryptionMode returns current mode.
     * @tc.size: SmallTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDataEncryption0027', 0, (done: Function) => {
      runCase('testDataEncryption0027', async (): Promise<void> => {
        manager.initialize(EncryptionMode.AES_128, HashAlgorithm.SHA_512);
        expect(manager.getEncryptionMode()).assertEqual(EncryptionMode.AES_128);
        expect(manager.getHashAlgorithm()).assertEqual(HashAlgorithm.SHA_512);
        expect(manager.isInitialized()).assertTrue();
      }, done);
    });
  });
}
