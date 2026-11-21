/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CryptoFramework]';

class VerifyOutcome {
  public res: Boolean | null = null;
  public thrown: boolean = false;
}

async function verifySafely(op: CryptoOperation, pair: cryptoFramework.KeyPair, text: string,
  sig: string): Promise<VerifyOutcome> {
  const outcome: VerifyOutcome = new VerifyOutcome();
  try {
    outcome.res = await op.rsaVerify(pair, text, sig);
    outcome.thrown = false;
  } catch (e) {
    outcome.thrown = true;
    outcome.res = null;
  }
  return outcome;
}

function verifyOk(outcome: VerifyOutcome): boolean {
  return !outcome.thrown && outcome.res !== null && outcome.res.valueOf();
}

function verifyFailed(outcome: VerifyOutcome): boolean {
  return outcome.thrown || outcome.res === null || !outcome.res.valueOf();
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function rsaSignVerifyCore() {
  describe('RsaSignVerifyCore', () => {
    let op: CryptoOperation = new CryptoOperation();

    beforeEach(() => {
      op = new CryptoOperation();
    });

    afterEach(() => {
      op = new CryptoOperation();
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0001
     * @tc.name testRsaSv0001
     * @tc.desc 合法值：rsaSign 输出 768 位 hex 签名（RSA3072 签名长度）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0001 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const signature: string = await op.rsaSign(keyPair, 'signature length');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', signature === null ? -1 : signature.length, 768);
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      expect(signature.length % 2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0002
     * @tc.name testRsaSv0002
     * @tc.desc 合法值：原文加正确签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0002 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'verify me';
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(outcome.thrown).assertFalse();
      expect(outcome.res === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0003
     * @tc.name testRsaSv0003
     * @tc.desc 合法值：rsaConvertAndSign 输出 768 位 hex 签名
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0003 begin');
      const keyJson: string = await op.generateRsaKey();
      const signature: string = await op.rsaConvertAndSign(keyJson, 'convert and sign');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', signature === null ? -1 : signature.length, 768);
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      expect(signature === '').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0004
     * @tc.name testRsaSv0004
     * @tc.desc 合法值：rsaConvertAndVerify 对正确签名返回 true
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0004 begin');
      const keyJson: string = await op.generateRsaKey();
      const text: string = 'convert and verify';
      const signature: string = await op.rsaConvertAndSign(keyJson, text);
      const verifyRes: Boolean = await op.rsaConvertAndVerify(keyJson, text, signature);
      const ok: boolean = verifyRes !== null && verifyRes.valueOf();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(ok), 'true');
      expect(ok).assertTrue();
      expect(signature === null).assertFalse();
      expect(verifyRes === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0005
     * @tc.name testRsaSv0005
     * @tc.desc 合法值：英文数字符号三种文本各自签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0005 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const texts: string[] = ['alpha beta', '1234567890', 'a!@#b$%^c&*()'];
      let allOk: boolean = true;
      for (let i = 0; i < 3; i++) {
        const sig: string = await op.rsaSign(keyPair, texts[i]);
        const outcome: VerifyOutcome = await verifySafely(op, keyPair, texts[i], sig);
        if (!verifyOk(outcome)) {
          allOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allOk), 'true');
      expect(allOk).assertTrue();
      expect(texts.length).assertEqual(3);
      expect(texts[0] === texts[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0006
     * @tc.name testRsaSv0006
     * @tc.desc 合法值：同一密钥对不同文本的签名互不相同
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0006 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const sigA: string = await op.rsaSign(keyPair, 'message A');
      const sigB: string = await op.rsaSign(keyPair, 'message B');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', sigA === sigB ? 'same' : 'diff', 'diff');
      expect(sigA === sigB).assertFalse();
      expect(sigA.length).assertEqual(768);
      expect(sigB.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0007
     * @tc.name testRsaSv0007
     * @tc.desc 边界值：空字符串签名仍为 768 hex 且验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0007 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = '';
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      expect(verifyOk(outcome)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0008
     * @tc.name testRsaSv0008
     * @tc.desc 边界值：单字符文本签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0008 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'X';
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0009
     * @tc.name testRsaSv0009
     * @tc.desc 边界值：8192 字符长文本签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0009 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = repeatChar('r', 8192);
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0010
     * @tc.name testRsaSv0010
     * @tc.desc 边界值：签名串转大写后验签仍通过（hex 大小写不敏感）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaSv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0010 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'upper case signature';
      const signature: string = await op.rsaSign(keyPair, text);
      const upperSig: string = signature.toUpperCase();
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, upperSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(upperSig === signature).assertFalse();
      expect(upperSig.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0011
     * @tc.name testRsaSv0011
     * @tc.desc 非法值：篡改原文后验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0011 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'original text';
      const signature: string = await op.rsaSign(keyPair, text);
      const tamperedText: string = 'original text!';
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, tamperedText, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      expect(tamperedText === text).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0012
     * @tc.name testRsaSv0012
     * @tc.desc 非法值：篡改签名首字符后验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0012 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'signature tamper';
      const signature: string = await op.rsaSign(keyPair, text);
      const tamperedSig: string = (signature.charAt(0) === '0' ? '1' : '0') + signature.substring(1);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, tamperedSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      expect(tamperedSig === signature).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0013
     * @tc.name testRsaSv0013
     * @tc.desc 非法值：空签名串验签失败（抛异常或返回 null）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0013 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'empty signature';
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      const goodSig: string = await op.rsaSign(keyPair, text);
      const goodOutcome: VerifyOutcome = await verifySafely(op, keyPair, text, goodSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(goodOutcome)), 'true');
      expect(verifyOk(goodOutcome)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0014
     * @tc.name testRsaSv0014
     * @tc.desc 非法值：奇数长度签名串验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0014 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'odd signature';
      const oddSig: string = repeatChar('a', 767);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, oddSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      const evenSig: string = oddSig + 'a';
      const evenOutcome: VerifyOutcome = await verifySafely(op, keyPair, text, evenSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(evenOutcome)), 'true');
      expect(verifyFailed(evenOutcome)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0015
     * @tc.name testRsaSv0015
     * @tc.desc 非法值：全 0 的 768 hex 签名验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0015 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'zero signature';
      const zeroSig: string = repeatChar('0', 768);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, zeroSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      expect(zeroSig.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0016
     * @tc.name testRsaSv0016
     * @tc.desc 非法值：非法 RSA JSON 经 rsaConvertAndSign 返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0016 begin');
      const signature: string = await op.rsaConvertAndSign('not-json', 'bad key');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', signature === null ? 'null' : signature, 'null');
      expect(signature === null).assertTrue();
      expect(signature === '').assertFalse();
      expect('not-json'.indexOf('{') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0016 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0017
     * @tc.name testRsaSv0017
     * @tc.desc 非法值：用另一对密钥验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0017 begin');
      const pairA: cryptoFramework.KeyPair = await op.convertRsaKey(await op.generateRsaKey());
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(await op.generateRsaKey());
      const text: string = 'wrong key pair';
      const signature: string = await op.rsaSign(pairA, text);
      const outcome: VerifyOutcome = await verifySafely(op, pairB, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      expect(pairA === pairB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0017 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0018
     * @tc.name testRsaSv0018
     * @tc.desc 非法值：签名截断为 766 位后验签失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0018 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'truncated signature';
      const signature: string = await op.rsaSign(keyPair, text);
      const truncatedSig: string = signature.substring(0, 766);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, truncatedSig);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      expect(truncatedSig.length).assertEqual(766);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0018 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0019
     * @tc.name testRsaSv0019
     * @tc.desc 极值：10000 字符长文本签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0019 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = repeatChar('s', 10000);
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0019 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0020
     * @tc.name testRsaSv0020
     * @tc.desc 极值：Latin-1 高位字符文本签名验签通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaSv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0020 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'cr\u00e8me br\u00fbl\u00e9e';
      const signature: string = await op.rsaSign(keyPair, text);
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(outcome)), 'true');
      expect(verifyOk(outcome)).assertTrue();
      expect(signature === null).assertFalse();
      expect(text.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0020 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0021
     * @tc.name testRsaSv0021
     * @tc.desc 状态：同一密钥连续五次签名验签循环全部通过
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0021 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      let allOk: boolean = true;
      let okCount: number = 0;
      for (let i = 0; i < 5; i++) {
        const sig: string = await op.rsaSign(keyPair, 'loop ' + i);
        const outcome: VerifyOutcome = await verifySafely(op, keyPair, 'loop ' + i, sig);
        if (verifyOk(outcome)) {
          okCount++;
        } else {
          allOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allOk), 'true');
      expect(allOk).assertTrue();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(okCount), '5');
      expect(okCount).assertEqual(5);
      expect(keyPair === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0021 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0022
     * @tc.name testRsaSv0022
     * @tc.desc 状态：交替签名验签（签A→签B→验A→验B）顺序无关
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0022 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const sigA: string = await op.rsaSign(keyPair, 'alternate A');
      const sigB: string = await op.rsaSign(keyPair, 'alternate B');
      const outcomeA: VerifyOutcome = await verifySafely(op, keyPair, 'alternate A', sigA);
      const outcomeB: VerifyOutcome = await verifySafely(op, keyPair, 'alternate B', sigB);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(verifyOk(outcomeA) && verifyOk(outcomeB)), 'true');
      expect(verifyOk(outcomeA)).assertTrue();
      expect(verifyOk(outcomeB)).assertTrue();
      expect(sigA === sigB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0022 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0023
     * @tc.name testRsaSv0023
     * @tc.desc 状态：同一签名重复验签两次结果一致（幂等）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0023 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'idempotent verify';
      const signature: string = await op.rsaSign(keyPair, text);
      const first: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      const second: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      const consistent: boolean = verifyOk(first) && verifyOk(second);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(consistent), 'true');
      expect(consistent).assertTrue();
      expect(verifyOk(first)).assertEqual(verifyOk(second));
      expect(signature === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0023 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0024
     * @tc.name testRsaSv0024
     * @tc.desc 状态：签名后再篡改原文，验签失败（签名不随原文漂移）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0024 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'signed message';
      const signature: string = await op.rsaSign(keyPair, text);
      const beforeOutcome: VerifyOutcome = await verifySafely(op, keyPair, text, signature);
      const afterOutcome: VerifyOutcome = await verifySafely(op, keyPair, text + '!', signature);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', String(verifyOk(beforeOutcome) && verifyFailed(afterOutcome)), 'true');
      expect(verifyOk(beforeOutcome)).assertTrue();
      expect(verifyFailed(afterOutcome)).assertTrue();
      expect(text === text + '!').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0024 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0025
     * @tc.name testRsaSv0025
     * @tc.desc 组合：两对密钥各自签名验签通过（密钥隔离）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0025 begin');
      const pairA: cryptoFramework.KeyPair = await op.convertRsaKey(await op.generateRsaKey());
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(await op.generateRsaKey());
      const sigA: string = await op.rsaSign(pairA, 'isolation A');
      const sigB: string = await op.rsaSign(pairB, 'isolation B');
      const outcomeAA: VerifyOutcome = await verifySafely(op, pairA, 'isolation A', sigA);
      const outcomeBB: VerifyOutcome = await verifySafely(op, pairB, 'isolation B', sigB);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(verifyOk(outcomeAA) && verifyOk(outcomeBB)), 'true');
      expect(verifyOk(outcomeAA)).assertTrue();
      expect(verifyOk(outcomeBB)).assertTrue();
      expect(pairA === pairB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0025 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSASV_0026
     * @tc.name testRsaSv0026
     * @tc.desc 组合：keyA 的签名验证 keyB 的文本失败（签名与文本绑定）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaSv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0026 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const sigA: string = await op.rsaSign(keyPair, 'text A');
      const outcome: VerifyOutcome = await verifySafely(op, keyPair, 'text B', sigA);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyFailed(outcome)), 'true');
      expect(verifyFailed(outcome)).assertTrue();
      expect(verifyOk(outcome)).assertFalse();
      const textAOutcome: VerifyOutcome = await verifySafely(op, keyPair, 'text A', sigA);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(verifyOk(textAOutcome)), 'true');
      expect(verifyOk(textAOutcome)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaSv0026 end');
    });
  });
}
