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

// State/sequence suite (hand-written): chained round-trips, model reuse stability,
// interleaved calls, and failure recovery. Expectations come from state derivation
// (round-trip composition) and the frozen AES baseline.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CipherModel } from '../../../main/ets/model/CipherModel';
import { aesEncryptAsync, aesDecryptAsync, rsaEncryptAsync, rsaDecryptAsync } from '../utils/CipherAsync';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Cipher]';
const AES_BASELINE: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';
const SENTINEL: string = 'Error!';

function buildInput(cls: string, n: number): string {
  let out: string = '';
  for (let i: number = 0; i < n; i++) {
    out += cls;
  }
  return out;
}

export default function stateSequenceTest() {
  describe('StateSequenceTest', () => {
    /**
     * @tc.name   testState0001
     * @tc.number SUB_CIPHER_STATE_0001
     * @tc.desc   AES chain: encrypt-decrypt-encrypt-decrypt restores the original text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0001 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'chain-a';
      const c1: string = (await aesEncryptAsync(model, M)).text;
      const p1: string = (await aesDecryptAsync(model, c1)).text;
      const c2: string = (await aesEncryptAsync(model, p1)).text;
      const p2: string = (await aesDecryptAsync(model, c2)).text;
      expect(p1).assertEqual(M);
      expect(p2).assertEqual(M);
      expect(c1).assertEqual(c2);
      expect(c1 === M).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0001 end');
    })

    /**
     * @tc.name   testState0002
     * @tc.number SUB_CIPHER_STATE_0002
     * @tc.desc   RSA chain: two round-trips restore the same text while ciphertexts differ
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0002 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'chain-rsa';
      const c1: string = (await rsaEncryptAsync(model, M)).text;
      const p1: string = (await rsaDecryptAsync(model, c1)).text;
      const c2: string = (await rsaEncryptAsync(model, p1)).text;
      const p2: string = (await rsaDecryptAsync(model, c2)).text;
      expect(p1).assertEqual(M);
      expect(p2).assertEqual(M);
      expect(c1.length === 172).assertTrue();
      expect(c1 === c2).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0002 end');
    })

    /**
     * @tc.name   testState0003
     * @tc.number SUB_CIPHER_STATE_0003
     * @tc.desc   Cross-algorithm chain: AES ciphertext through RSA round-trip then AES restores the text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0003 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'cross';
      const aesCipher: string = (await aesEncryptAsync(model, M)).text;
      const rsaCipher: string = (await rsaEncryptAsync(model, aesCipher)).text;
      const aesBack: string = (await rsaDecryptAsync(model, rsaCipher)).text;
      const final: string = (await aesDecryptAsync(model, aesBack)).text;
      expect(rsaCipher.length === 172).assertTrue();
      expect(aesBack).assertEqual(aesCipher);
      expect(final).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0003 end');
    })

    /**
     * @tc.name   testState0004
     * @tc.number SUB_CIPHER_STATE_0004
     * @tc.desc   Model reuse: twenty consecutive encryptions of the same input are stable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0004 begin');
      const model: CipherModel = new CipherModel();
      const results: string[] = [];
      for (let i: number = 0; i < 20; i++) {
        results.push((await aesEncryptAsync(model, 'a')).text);
      }
      let allEqual: boolean = true;
      for (let i: number = 0; i < results.length; i++) {
        if (results[i] !== AES_BASELINE) {
          allEqual = false;
        }
      }
      expect(results.length === 20).assertTrue();
      expect(allEqual).assertTrue();
      expect(results[0]).assertEqual(AES_BASELINE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0004 end');
    })

    /**
     * @tc.name   testState0005
     * @tc.number SUB_CIPHER_STATE_0005
     * @tc.desc   Interleaved AES and RSA calls on one model do not disturb each other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0005 begin');
      const model: CipherModel = new CipherModel();
      const aes1: string = (await aesEncryptAsync(model, 'a')).text;
      const rsaCipher: string = (await rsaEncryptAsync(model, 'a')).text;
      const aes2: string = (await aesEncryptAsync(model, 'a')).text;
      const rsaBack: string = (await rsaDecryptAsync(model, rsaCipher)).text;
      const aesBack: string = (await aesDecryptAsync(model, aes2)).text;
      expect(aes1).assertEqual(aes2);
      expect(rsaBack).assertEqual('a');
      expect(aesBack).assertEqual('a');
      expect(rsaCipher === aes1).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0005 end');
    })

    /**
     * @tc.name   testState0006
     * @tc.number SUB_CIPHER_STATE_0006
     * @tc.desc   Failure recovery: a failed decrypt leaves the model usable for the next call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0006 begin');
      const model: CipherModel = new CipherModel();
      const failed: string = (await aesDecryptAsync(model, 'zzz')).text;
      const recovered: string = (await aesDecryptAsync(model, AES_BASELINE)).text;
      const again: string = (await aesDecryptAsync(model, AES_BASELINE)).text;
      expect(failed).assertEqual(SENTINEL);
      expect(recovered).assertEqual('a');
      expect(again).assertEqual(recovered);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0006 end');
    })

    /**
     * @tc.name   testState0007
     * @tc.number SUB_CIPHER_STATE_0007
     * @tc.desc   Sentinel text as plaintext round-trips while the sentinel as ciphertext fails
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0007 begin');
      const model: CipherModel = new CipherModel();
      const cipher: string = (await aesEncryptAsync(model, SENTINEL)).text;
      const plain: string = (await aesDecryptAsync(model, cipher)).text;
      const sentinelAsInput: string = (await aesDecryptAsync(model, SENTINEL)).text;
      expect(plain).assertEqual(SENTINEL);
      expect(sentinelAsInput).assertEqual(SENTINEL);
      expect(cipher === SENTINEL).assertFalse();
      expect(cipher.length === 24).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0007 end');
    })

    /**
     * @tc.name   testState0008
     * @tc.number SUB_CIPHER_STATE_0008
     * @tc.desc   Parallel encryptions resolve consistently with sequential results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0008 begin');
      const model: CipherModel = new CipherModel();
      const inputs: string[] = ['p1', 'p2', 'p3', 'p4', 'p5'];
      const parallel: string[] = await Promise.all(inputs.map((v: string): Promise<string> => {
        return aesEncryptAsync(model, v).then((r) => {
          return r.text;
        });
      }));
      const sequential: string[] = [];
      for (const v of inputs) {
        sequential.push((await aesEncryptAsync(model, v)).text);
      }
      let allMatch: boolean = true;
      for (let i: number = 0; i < inputs.length; i++) {
        if (parallel[i] !== sequential[i]) {
          allMatch = false;
        }
      }
      expect(parallel.length === 5).assertTrue();
      expect(allMatch).assertTrue();
      expect(parallel.some((v: string): boolean => v === SENTINEL)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0008 end');
    })

    /**
     * @tc.name   testState0009
     * @tc.number SUB_CIPHER_STATE_0009
     * @tc.desc   RSA boundary plaintext stays stable across chained round-trips
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0009 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 62);
      const c1: string = (await rsaEncryptAsync(model, M)).text;
      const p1: string = (await rsaDecryptAsync(model, c1)).text;
      const c2: string = (await rsaEncryptAsync(model, p1)).text;
      const p2: string = (await rsaDecryptAsync(model, c2)).text;
      expect(c1.length === 172).assertTrue();
      expect(c2.length === 172).assertTrue();
      expect(p1).assertEqual(M);
      expect(p2).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0009 end');
    })

    /**
     * @tc.name   testState0010
     * @tc.number SUB_CIPHER_STATE_0010
     * @tc.desc   AES ciphertext as RSA payload round-trips and decrypts back to the text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0010 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'wrap';
      const aesCipher: string = (await aesEncryptAsync(model, M)).text;
      const rsaCipher: string = (await rsaEncryptAsync(model, aesCipher)).text;
      const aesBack: string = (await rsaDecryptAsync(model, rsaCipher)).text;
      const final: string = (await aesDecryptAsync(model, aesBack)).text;
      expect(aesCipher.length === 24).assertTrue();
      expect(rsaCipher.length === 172).assertTrue();
      expect(aesBack).assertEqual(aesCipher);
      expect(final).assertEqual(M);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0010 end');
    })

    /**
     * @tc.name   testState0011
     * @tc.number SUB_CIPHER_STATE_0011
     * @tc.desc   Long input stays deterministic across repeated encryptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0011 begin');
      const model: CipherModel = new CipherModel();
      const M: string = buildInput('a', 1023);
      const c1: string = (await aesEncryptAsync(model, M)).text;
      const c2: string = (await aesEncryptAsync(model, M)).text;
      const back: string = (await aesDecryptAsync(model, c1)).text;
      expect(c1).assertEqual(c2);
      expect(back).assertEqual(M);
      expect(c1.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0011 end');
    })

    /**
     * @tc.name   testState0012
     * @tc.number SUB_CIPHER_STATE_0012
     * @tc.desc   Empty string state: encrypt fails with the Error! sentinel on device
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0012 begin');
      const model: CipherModel = new CipherModel();
      const c1: string = (await aesEncryptAsync(model, '')).text;
      const c2: string = (await aesEncryptAsync(model, '')).text;
      const back: string = (await aesDecryptAsync(model, c1)).text;
      expect(c1.length).assertEqual(6);
      expect(c1).assertEqual('Error!');
      expect(c1).assertEqual(c2);
      expect(back).assertEqual('Error!');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0012 end');
    })

    /**
     * @tc.name   testState0013
     * @tc.number SUB_CIPHER_STATE_0013
     * @tc.desc   Repeated decryptions of the baseline ciphertext are stable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0013 begin');
      const model: CipherModel = new CipherModel();
      const p1: string = (await aesDecryptAsync(model, AES_BASELINE)).text;
      const p2: string = (await aesDecryptAsync(model, AES_BASELINE)).text;
      const p3: string = (await aesDecryptAsync(model, AES_BASELINE)).text;
      expect(p1).assertEqual('a');
      expect(p2).assertEqual(p1);
      expect(p3).assertEqual(p1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0013 end');
    })

    /**
     * @tc.name   testState0014
     * @tc.number SUB_CIPHER_STATE_0014
     * @tc.desc   RSA failure recovery: a junk decrypt is followed by a successful one
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0014 begin');
      const model: CipherModel = new CipherModel();
      const failed: string = (await rsaDecryptAsync(model, 'zzz')).text;
      const cipher: string = (await rsaEncryptAsync(model, 'ok')).text;
      const recovered: string = (await rsaDecryptAsync(model, cipher)).text;
      expect(failed).assertEqual(SENTINEL);
      expect(recovered).assertEqual('ok');
      expect(cipher.length === 172).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0014 end');
    })

    /**
     * @tc.name   testState0015
     * @tc.number SUB_CIPHER_STATE_0015
     * @tc.desc   Sequence independence: five different inputs round-trip with distinct ciphertexts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0015 begin');
      const model: CipherModel = new CipherModel();
      const inputs: string[] = ['a', '密', '5', '!', ' '];
      const ciphers: string[] = [];
      const plains: string[] = [];
      for (const v of inputs) {
        const cipher: string = (await aesEncryptAsync(model, v)).text;
        ciphers.push(cipher);
        plains.push((await aesDecryptAsync(model, cipher)).text);
      }
      let allDistinct: boolean = true;
      for (let i: number = 0; i < ciphers.length; i++) {
        for (let j: number = i + 1; j < ciphers.length; j++) {
          if (ciphers[i] === ciphers[j]) {
            allDistinct = false;
          }
        }
      }
      let allRestored: boolean = true;
      for (let i: number = 0; i < inputs.length; i++) {
        if (plains[i] !== inputs[i]) {
          allRestored = false;
        }
      }
      expect(allDistinct).assertTrue();
      expect(allRestored).assertTrue();
      expect(ciphers.length === 5).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0015 end');
    })

    /**
     * @tc.name   testState0016
     * @tc.number SUB_CIPHER_STATE_0016
     * @tc.desc   Retry after failure: the same ciphertext decrypts correctly after a junk call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0016 begin');
      const model: CipherModel = new CipherModel();
      const cipher: string = (await aesEncryptAsync(model, 'b')).text;
      const failed: string = (await aesDecryptAsync(model, '###')).text;
      const retried: string = (await aesDecryptAsync(model, cipher)).text;
      expect(failed).assertEqual(SENTINEL);
      expect(retried).assertEqual('b');
      expect(cipher.length === 24).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0016 end');
    })

    /**
     * @tc.name   testState0017
     * @tc.number SUB_CIPHER_STATE_0017
     * @tc.desc   Cross-algorithm rejection in chains while each side decrypts its own
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0017 begin');
      const model: CipherModel = new CipherModel();
      const aesCipher: string = (await aesEncryptAsync(model, 'a')).text;
      const rsaCipher: string = (await rsaEncryptAsync(model, 'a')).text;
      const rsaReject: string = (await rsaDecryptAsync(model, aesCipher)).text;
      const aesReject: string = (await aesDecryptAsync(model, rsaCipher)).text;
      const rsaOwn: string = (await rsaDecryptAsync(model, rsaCipher)).text;
      const aesOwn: string = (await aesDecryptAsync(model, aesCipher)).text;
      expect(rsaReject).assertEqual(SENTINEL);
      expect(aesReject).assertEqual(SENTINEL);
      expect(rsaOwn).assertEqual('a');
      expect(aesOwn).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0017 end');
    })

    /**
     * @tc.name   testState0018
     * @tc.number SUB_CIPHER_STATE_0018
     * @tc.desc   Whole-chain consistency: re-encrypting the decrypted text repeats the ciphertext
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0018 begin');
      const model: CipherModel = new CipherModel();
      const M: string = 'stable';
      const c1: string = (await aesEncryptAsync(model, M)).text;
      const p1: string = (await aesDecryptAsync(model, c1)).text;
      const c2: string = (await aesEncryptAsync(model, p1)).text;
      expect(p1).assertEqual(M);
      expect(c1).assertEqual(c2);
      expect(c1.length > M.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testState0018 end');
    })
  })
}
