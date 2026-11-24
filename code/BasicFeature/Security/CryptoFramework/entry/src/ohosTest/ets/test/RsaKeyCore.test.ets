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
const HEX_CHARS: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  'a', 'b', 'c', 'd', 'e', 'f', 'A', 'B', 'C', 'D', 'E', 'F'];

function isHexEven(str: string): boolean {
  if (str.length === 0 || str.length % 2 !== 0) {
    return false;
  }
  for (let i = 0; i < str.length; i++) {
    if (HEX_CHARS.indexOf(str.charAt(i)) < 0) {
      return false;
    }
  }
  return true;
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

class RsaConvertOutcome {
  public converted: boolean = false;
  public thrown: boolean = false;
}

async function convertRsaSafely(op: CryptoOperation, json: string): Promise<RsaConvertOutcome> {
  const outcome: RsaConvertOutcome = new RsaConvertOutcome();
  try {
    const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
    outcome.converted = keyPair === null ? false : true;
    outcome.thrown = false;
  } catch (e) {
    outcome.thrown = true;
    outcome.converted = false;
  }
  return outcome;
}

export default function rsaKeyCore() {
  describe('RsaKeyCore', () => {
    let op: CryptoOperation = new CryptoOperation();

    beforeEach(() => {
      op = new CryptoOperation();
    });

    afterEach(() => {
      op = new CryptoOperation();
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0001
     * @tc.name testRsaKey0001
     * @tc.desc 合法值：generateRsaKey 返回同时含 priKey 与 pubKey 字段的 JSON
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0001 begin');
      const keyJson: string = await op.generateRsaKey();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyJson === null ? 'null' : 'json', 'json');
      expect(keyJson === null).assertFalse();
      expect(keyJson.indexOf('priKey') >= 0).assertTrue();
      expect(keyJson.indexOf('pubKey') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0002
     * @tc.name testRsaKey0002
     * @tc.desc 合法值：priKey 为偶数长度 hex 且超过 2000 字符（RSA3072 私钥编码）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaKey0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0002 begin');
      const keyJson: string = await op.generateRsaKey();
      const priStart: number = keyJson.indexOf('priKey') + 9;
      const priEnd: number = keyJson.indexOf('"', priStart);
      const priKey: string = keyJson.substring(priStart, priEnd);
      const valid: boolean = isHexEven(priKey) && priKey.length > 2000;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}s', priKey.length, '>2000');
      expect(valid).assertTrue();
      expect(priKey.length > 2000).assertTrue();
      expect(priKey.length % 2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0003
     * @tc.name testRsaKey0003
     * @tc.desc 合法值：pubKey 为偶数长度 hex 且长度在 500~1500 之间（RSA3072 公钥编码）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaKey0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0003 begin');
      const keyJson: string = await op.generateRsaKey();
      const pubStart: number = keyJson.indexOf('pubKey') + 9;
      const pubEnd: number = keyJson.indexOf('"', pubStart);
      const pubKey: string = keyJson.substring(pubStart, pubEnd);
      const inRange: boolean = pubKey.length >= 500 && pubKey.length <= 1500;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}s', pubKey.length, '500..1500');
      expect(inRange).assertTrue();
      expect(isHexEven(pubKey)).assertTrue();
      expect(pubKey.length % 2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0004
     * @tc.name testRsaKey0004
     * @tc.desc 合法值：两次随机生成的 RSA 密钥对不同
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaKey0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0004 begin');
      const keyJsonA: string = await op.generateRsaKey();
      const keyJsonB: string = await op.generateRsaKey();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyJsonA === keyJsonB ? 'same' : 'diff', 'diff');
      expect(keyJsonA === keyJsonB).assertFalse();
      expect(keyJsonA === null).assertFalse();
      expect(keyJsonB === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0005
     * @tc.name testRsaKey0005
     * @tc.desc 合法值：生成的密钥 JSON 可被 convertRsaKey 还原为 KeyPair
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testRsaKey0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0005 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'keypair');
      expect(keyPair === null).assertFalse();
      expect(keyPair.priKey === null).assertFalse();
      expect(keyPair.pubKey === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0006
     * @tc.name testRsaKey0006
     * @tc.desc 边界值：空对象 JSON 转换失败（不产出可用 KeyPair）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0006 begin');
      const outcome: RsaConvertOutcome = await convertRsaSafely(op, '{}');
      const failed: boolean = outcome.thrown || !outcome.converted;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.converted).assertFalse();
      expect('{}'.indexOf('priKey') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0007
     * @tc.name testRsaKey0007
     * @tc.desc 边界值：空字符串转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0007 begin');
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      const goodKey: string = await op.generateRsaKey();
      const goodPair: cryptoFramework.KeyPair = await op.convertRsaKey(goodKey);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', goodPair === null ? 'null' : 'keypair', 'keypair');
      expect(goodPair === null).assertFalse();
      expect(keyPair === goodPair).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0008
     * @tc.name testRsaKey0008
     * @tc.desc 边界值：缺 pubKey 字段的 JSON 转换失败（不产出可用 KeyPair）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0008 begin');
      const keyJson: string = await op.generateRsaKey();
      const priStart: number = keyJson.indexOf('priKey') + 9;
      const priEnd: number = keyJson.indexOf('"', priStart);
      const noPub: string = '{"priKey":"' + keyJson.substring(priStart, priEnd) + '"}';
      const outcome: RsaConvertOutcome = await convertRsaSafely(op, noPub);
      const failed: boolean = outcome.thrown || !outcome.converted;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.converted).assertFalse();
      expect(noPub.indexOf('pubKey') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0009
     * @tc.name testRsaKey0009
     * @tc.desc 非法值：非 JSON 字符串转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0009 begin');
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey('not-json');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      const outcome: RsaConvertOutcome = await convertRsaSafely(op, 'not-json');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(outcome.converted), 'false');
      expect(outcome.converted).assertFalse();
      const goodKey: string = await op.generateRsaKey();
      const goodPair: cryptoFramework.KeyPair = await op.convertRsaKey(goodKey);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', goodPair === null ? 'null' : 'keypair', 'keypair');
      expect(goodPair === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0010
     * @tc.name testRsaKey0010
     * @tc.desc 非法值：priKey 含非 hex 字符转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0010 begin');
      const badPri: string = '{"priKey":"' + repeatChar('z', 100) + '","pubKey":"' + repeatChar('a', 100) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(badPri);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      expect(isHexEven(repeatChar('z', 100))).assertFalse();
      expect(badPri.indexOf('z') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0011
     * @tc.name testRsaKey0011
     * @tc.desc 非法值：pubKey 含非 hex 字符转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0011 begin');
      const keyJson: string = await op.generateRsaKey();
      const priStart: number = keyJson.indexOf('priKey') + 9;
      const priEnd: number = keyJson.indexOf('"', priStart);
      const badPub: string =
        '{"priKey":"' + keyJson.substring(priStart, priEnd) + '","pubKey":"' + repeatChar('g', 100) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(badPub);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      expect(isHexEven(repeatChar('g', 100))).assertFalse();
      expect(badPub.indexOf('g') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0012
     * @tc.name testRsaKey0012
     * @tc.desc 非法值：字段名拼错（privateKey/publicKey）转换失败
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0012 begin');
      const misspelled: string =
        '{"privateKey":"' + repeatChar('a', 100) + '","publicKey":"' + repeatChar('b', 100) + '"}';
      const outcome: RsaConvertOutcome = await convertRsaSafely(op, misspelled);
      const failed: boolean = outcome.thrown || !outcome.converted;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(failed), 'true');
      expect(failed).assertTrue();
      expect(outcome.converted).assertFalse();
      expect(misspelled.indexOf('priKey') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0013
     * @tc.name testRsaKey0013
     * @tc.desc 非法值：priKey 奇数长度 hex 转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0013 begin');
      const oddPri: string = '{"priKey":"' + repeatChar('a', 101) + '","pubKey":"' + repeatChar('b', 100) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(oddPri);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      const retry: cryptoFramework.KeyPair = await op.convertRsaKey(oddPri);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', retry === null ? 'null' : 'keypair', 'null');
      expect(retry === null).assertTrue();
      expect(retry === keyPair).assertTrue();
      expect(isHexEven(repeatChar('a', 101))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0014
     * @tc.name testRsaKey0014
     * @tc.desc 非法值：pubKey 奇数长度 hex 转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0014 begin');
      const oddPub: string = '{"priKey":"' + repeatChar('a', 100) + '","pubKey":"' + repeatChar('b', 99) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(oddPub);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      const evenPub: string =
        oddPub.replace('"pubKey":"' + repeatChar('b', 99) + '"', '"pubKey":"' + repeatChar('b', 100) + '"');
      const evenPair: cryptoFramework.KeyPair = await op.convertRsaKey(evenPub);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', evenPair === null ? 'null' : 'keypair', 'null');
      expect(evenPair === null).assertTrue();
      expect(isHexEven(repeatChar('b', 99))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0015
     * @tc.name testRsaKey0015
     * @tc.desc 极值：priKey 截断为 100 hex 转换返回 null
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0015 begin');
      const truncated: string = '{"priKey":"' + repeatChar('a', 100) + '","pubKey":"' + repeatChar('b', 800) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(truncated);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', keyPair === null ? 'null' : 'keypair', 'null');
      expect(keyPair === null).assertTrue();
      expect(repeatChar('a', 100).length < 2000).assertTrue();
      expect(isHexEven(repeatChar('a', 100))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0016
     * @tc.name testRsaKey0016
     * @tc.desc 极值：priKey 中间篡改一个字符后设备宽容接受，转换仍成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testRsaKey0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0016 begin');
      const keyJson: string = await op.generateRsaKey();
      const priStart: number = keyJson.indexOf('priKey') + 9;
      const priEnd: number = keyJson.indexOf('"', priStart);
      const priKey: string = keyJson.substring(priStart, priEnd);
      const mid: number = Math.floor(priKey.length / 2);
      const tamperedPri: string =
        priKey.substring(0, mid) + (priKey.charAt(mid) === '0' ? '1' : '0') + priKey.substring(mid + 1);
      const tamperedJson: string =
        '{"priKey":"' + tamperedPri + '","pubKey":"' +
        keyJson.substring(keyJson.indexOf('pubKey') + 9, keyJson.indexOf('"', keyJson.indexOf('pubKey') + 9)) + '"}';
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(tamperedJson);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        keyPair === null ? 'null' : 'keypair', 'keypair');
      expect(keyPair === null).assertFalse();
      expect(tamperedPri === priKey).assertFalse();
      expect(isHexEven(tamperedPri)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0016 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0017
     * @tc.name testRsaKey0017
     * @tc.desc 状态：同一 JSON 两次 convert 均成功且得到独立 KeyPair
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaKey0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0017 begin');
      const keyJson: string = await op.generateRsaKey();
      const pairA: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', pairA === null || pairB === null ? 'null' : 'ok', 'ok');
      expect(pairA === null).assertFalse();
      expect(pairB === null).assertFalse();
      expect(pairA === pairB).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0017 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0018
     * @tc.name testRsaKey0018
     * @tc.desc 状态：convert 出的 KeyPair 可立即用于签名（输出 768 hex）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaKey0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0018 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const signature: string = await op.rsaSign(keyPair, 'sign via converted key');
      const valid: boolean = signature !== null && isHexEven(signature) && signature.length === 768;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', signature === null ? -1 : signature.length, 768);
      expect(valid).assertTrue();
      expect(signature === null).assertFalse();
      expect(signature.length).assertEqual(768);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0018 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0019
     * @tc.name testRsaKey0019
     * @tc.desc 状态：convert 出的 KeyPair 可立即用于验签（原文+签名验证通过）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaKey0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0019 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'verify via converted key';
      const signature: string = await op.rsaSign(keyPair, text);
      const verifyRes: Boolean = await op.rsaVerify(keyPair, text, signature);
      const ok: boolean = verifyRes !== null && verifyRes.valueOf();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(ok), 'true');
      expect(ok).assertTrue();
      expect(signature === null).assertFalse();
      expect(verifyRes === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0019 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_RSAKEY_0020
     * @tc.name testRsaKey0020
     * @tc.desc 组合：生成→convert→签名→验签全链路一次打通
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testRsaKey0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0020 begin');
      const keyJson: string = await op.generateRsaKey();
      const keyPair: cryptoFramework.KeyPair = await op.convertRsaKey(keyJson);
      const text: string = 'full pipeline message';
      const signature: string = await op.rsaSign(keyPair, text);
      const verifyRes: Boolean = await op.rsaVerify(keyPair, text, signature);
      const ok: boolean = verifyRes !== null && verifyRes.valueOf();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(ok), 'true');
      expect(keyJson === null).assertFalse();
      expect(keyPair === null).assertFalse();
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRsaKey0020 end');
    });
  });
}
