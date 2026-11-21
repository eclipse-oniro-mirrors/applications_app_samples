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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CryptoOperation } from '../../../main/ets/cryptoframework/CryptoOperation';
import cryptoFramework from '@ohos.security.cryptoFramework';
import { getCachedRsaJson, getCachedRsaPair } from './CryptoVolumeHelper';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CryptoFramework]';

interface RsaKeyJson {
  priKey: string;
  pubKey: string;
}

function parseRsa(json: string): RsaKeyJson {
  return JSON.parse(json) as RsaKeyJson;
}

function repeatChar(ch: string, count: number): string {
  let ret: string = '';
  for (let i = 0; i < count; i++) {
    ret += ch;
  }
  return ret;
}

export default function rsaKeyReal2Test() {
  describe('RsaKeyReal2', () => {

    /**
     * @tc.name   testRsaKeyReal20001
     * @tc.number SUB_CryptoFramework_RSAKR2_0001
     * @tc.desc   generated JSON carries both the private and public key fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('priKey') >= 0));
      expect(json.indexOf('priKey') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('pubKey') >= 0));
      expect(json.indexOf('pubKey') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(json).priKey.length > 0));
      expect(parseRsa(json).priKey.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20001 end');
    });

    /**
     * @tc.name   testRsaKeyReal20002
     * @tc.number SUB_CryptoFramework_RSAKR2_0002
     * @tc.desc   two generations produce different key JSON strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const jsonA: string = await op.generateRsaKey();
      const jsonB: string = await op.generateRsaKey();
      const actResult: string = jsonA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA === jsonB));
      expect(jsonA === jsonB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(jsonA).priKey === parseRsa(jsonB).priKey));
      expect(parseRsa(jsonA).priKey === parseRsa(jsonB).priKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(jsonA).pubKey === parseRsa(jsonB).pubKey));
      expect(parseRsa(jsonA).pubKey === parseRsa(jsonB).pubKey).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20002 end');
    });

    /**
     * @tc.name   testRsaKeyReal20003
     * @tc.number SUB_CryptoFramework_RSAKR2_0003
     * @tc.desc   a generated JSON converts into a non-null key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair === null));
      expect(pair === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.priKey !== null));
      expect(pair.priKey !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.pubKey !== null));
      expect(pair.pubKey !== null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20003 end');
    });

    /**
     * @tc.name   testRsaKeyReal20004
     * @tc.number SUB_CryptoFramework_RSAKR2_0004
     * @tc.desc   the private key encodes into a non-empty DER blob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const priLen: number = pair.priKey.getEncoded().data.length;
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > 0));
      expect(priLen > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.priKey.getEncoded().data instanceof Uint8Array));
      expect(pair.priKey.getEncoded().data instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(pair.priKey.getEncoded().data.byteLength > 0), String(true));
      expect(pair.priKey.getEncoded().data.byteLength > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20004 end');
    });

    /**
     * @tc.name   testRsaKeyReal20005
     * @tc.number SUB_CryptoFramework_RSAKR2_0005
     * @tc.desc   the public key encodes into a non-empty DER blob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const pubLen: number = pair.pubKey.getEncoded().data.length;
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pubLen > 0));
      expect(pubLen > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.pubKey.getEncoded().data instanceof Uint8Array));
      expect(pair.pubKey.getEncoded().data instanceof Uint8Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(pair.pubKey.getEncoded().data.byteLength > 0), String(true));
      expect(pair.pubKey.getEncoded().data.byteLength > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20005 end');
    });

    /**
     * @tc.name   testRsaKeyReal20006
     * @tc.number SUB_CryptoFramework_RSAKR2_0006
     * @tc.desc   converting the same JSON twice yields two non-null pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const pairA: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const actResult: cryptoFramework.KeyPair = pairA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pairA === null || pairB === null));
      expect(pairA === null || pairB === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'value=%{public}s', String(pairA.priKey.getEncoded().data.length === pairB.priKey.getEncoded().data.length));
      expect(pairA.priKey.getEncoded().data.length === pairB.priKey.getEncoded().data.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'value=%{public}s', String(pairA.pubKey.getEncoded().data.length === pairB.pubKey.getEncoded().data.length));
      expect(pairA.pubKey.getEncoded().data.length === pairB.pubKey.getEncoded().data.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20006 end');
    });

    /**
     * @tc.name   testRsaKeyReal20007
     * @tc.number SUB_CryptoFramework_RSAKR2_0007
     * @tc.desc   a converted pair signs a 384 byte signature as 768 hex chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'signature probe');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig !== ''));
      expect(sig !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20007 end');
    });

    /**
     * @tc.name   testRsaKeyReal20008
     * @tc.number SUB_CryptoFramework_RSAKR2_0008
     * @tc.desc   a signature from a converted pair verifies against its own key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'verify probe');
      const vOk: Boolean = await op.rsaVerify(pair, 'verify probe', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig !== ''));
      expect(sig !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20008 end');
    });

    /**
     * @tc.name   testRsaKeyReal20009
     * @tc.number SUB_CryptoFramework_RSAKR2_0009
     * @tc.desc   a signature fails to verify against a different text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'original text');
      const vWrong: Boolean = await op.rsaVerify(pair, 'different text', sig);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pair, 'original text', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length === 768).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20009 end');
    });

    /**
     * @tc.name   testRsaKeyReal20010
     * @tc.number SUB_CryptoFramework_RSAKR2_0010
     * @tc.desc   the convertAndSign shortcut returns a 768 char signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(json, 'shortcut sign');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig.indexOf(' ') < 0));
      expect(sig.indexOf(' ') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20010 end');
    });

    /**
     * @tc.name   testRsaKeyReal20011
     * @tc.number SUB_CryptoFramework_RSAKR2_0011
     * @tc.desc   the convertAndVerify shortcut accepts a shortcut signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(json, 'shortcut verify');
      const vOk: Boolean = await op.rsaConvertAndVerify(json, 'shortcut verify', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig !== ''));
      expect(sig !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20011 end');
    });

    /**
     * @tc.name   testRsaKeyReal20012
     * @tc.number SUB_CryptoFramework_RSAKR2_0012
     * @tc.desc   a corrupted private key header makes conversion return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const parsed: RsaKeyJson = parseRsa(json);
      const mutJson: string = '{"priKey":"!!' + parsed.priKey.slice(2) + '","pubKey":"' + parsed.pubKey + '"}';
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair === null));
      expect(pair === null).assertTrue();
      const pairOk: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pairOk === null));
      expect(pairOk === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.priKey.length > 2));
      expect(parsed.priKey.length > 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20012 end');
    });

    /**
     * @tc.name   testRsaKeyReal20013
     * @tc.number SUB_CryptoFramework_RSAKR2_0013
     * @tc.desc   a corrupted public key header makes conversion return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const parsed: RsaKeyJson = parseRsa(json);
      const mutJson: string = '{"priKey":"' + parsed.priKey + '","pubKey":"!!' + parsed.pubKey.slice(2) + '"}';
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(mutJson);
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair === null));
      expect(pair === null).assertTrue();
      const pairOk: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pairOk === null));
      expect(pairOk === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.pubKey.length > 2));
      expect(parsed.pubKey.length > 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20013 end');
    });

    /**
     * @tc.name   testRsaKeyReal20014
     * @tc.number SUB_CryptoFramework_RSAKR2_0014
     * @tc.desc   an empty private key field makes conversion throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const parsed: RsaKeyJson = parseRsa(json);
      const mutJson: string = '{"priKey":"","pubKey":"' + parsed.pubKey + '"}';
      let thrown: boolean = false;
      try {
        await op.convertRsaKey(mutJson);
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const pairOk: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pairOk === null));
      expect(pairOk === null).assertFalse();
      const embedsPub: boolean = mutJson.indexOf(parsed.pubKey) >= 0;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mutCarriesPubKey=%{public}s', String(embedsPub));
      expect(embedsPub).assertTrue();
      const embedsEmptyPri: boolean = mutJson.indexOf('"priKey":""') >= 0;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mutHasEmptyPriKey=%{public}s', String(embedsEmptyPri));
      expect(embedsEmptyPri).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20014 end');
    });

    /**
     * @tc.name   testRsaKeyReal20015
     * @tc.number SUB_CryptoFramework_RSAKR2_0015
     * @tc.desc   a non-JSON input makes conversion return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey('not a json string');
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair === null));
      expect(pair === null).assertTrue();
      const pairEmpty: cryptoFramework.KeyPair = await op.convertRsaKey('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pairEmpty === null));
      expect(pairEmpty === null).assertTrue();
      const json: string = await getCachedRsaJson(op);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 0));
      expect(json.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20015 end');
    });

    /**
     * @tc.name   testRsaKeyReal20016
     * @tc.number SUB_CryptoFramework_RSAKR2_0016
     * @tc.desc   the private key DER blob is longer than the public one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const priLen: number = pair.priKey.getEncoded().data.length;
      const pubLen: number = pair.pubKey.getEncoded().data.length;
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > pubLen));
      expect(priLen > pubLen).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > 0 && pubLen > 0));
      expect(priLen > 0 && pubLen > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen !== pubLen));
      expect(priLen !== pubLen).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20016 end');
    });

    /**
     * @tc.name   testRsaKeyReal20017
     * @tc.number SUB_CryptoFramework_RSAKR2_0017
     * @tc.desc   signatures from two different pairs differ for the same text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pairA: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const jsonB: string = await op.generateRsaKey();
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(jsonB);
      const sigA: string = await op.rsaSign(pairA, 'same probe text');
      const sigB: string = await op.rsaSign(pairB, 'same probe text');
      const actResult: string = sigA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigB.length), String(768));
      expect(sigB.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20017 end');
    });

    /**
     * @tc.name   testRsaKeyReal20018
     * @tc.number SUB_CryptoFramework_RSAKR2_0018
     * @tc.desc   both encoded keys exceed 200 bytes and differ in length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaKeyReal20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const priLen: number = pair.priKey.getEncoded().data.length;
      const pubLen: number = pair.pubKey.getEncoded().data.length;
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > 200));
      expect(priLen > 200).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pubLen > 200));
      expect(pubLen > 200).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen !== pubLen));
      expect(priLen !== pubLen).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaKeyReal20018 end');
    });

  });
}
