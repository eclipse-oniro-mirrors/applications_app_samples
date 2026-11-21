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

export default function rsaGenReal1Test() {
  describe('RsaGenReal1', () => {

    /**
     * @tc.name   testRsaGenReal10001
     * @tc.number SUB_CryptoFramework_RSAGN1_0001
     * @tc.desc   key generation returns a non-empty JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json !== ''));
      expect(json !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 100));
      expect(json.length > 100).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('{') >= 0));
      expect(json.indexOf('{') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10001 end');
    });

    /**
     * @tc.name   testRsaGenReal10002
     * @tc.number SUB_CryptoFramework_RSAGN1_0002
     * @tc.desc   the generated JSON contains the priKey field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const parsed: RsaKeyJson = parseRsa(json);
      const actResult: RsaKeyJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('priKey') >= 0));
      expect(json.indexOf('priKey') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.priKey.length > 0));
      expect(parsed.priKey.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.priKey !== parsed.pubKey));
      expect(parsed.priKey !== parsed.pubKey).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10002 end');
    });

    /**
     * @tc.name   testRsaGenReal10003
     * @tc.number SUB_CryptoFramework_RSAGN1_0003
     * @tc.desc   the generated JSON contains the pubKey field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const parsed: RsaKeyJson = parseRsa(json);
      const actResult: RsaKeyJson = parsed;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.indexOf('pubKey') >= 0));
      expect(json.indexOf('pubKey') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.pubKey.length > 0));
      expect(parsed.pubKey.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parsed.priKey.length > parsed.pubKey.length));
      expect(parsed.priKey.length > parsed.pubKey.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10003 end');
    });

    /**
     * @tc.name   testRsaGenReal10004
     * @tc.number SUB_CryptoFramework_RSAGN1_0004
     * @tc.desc   two generations produce different JSON strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const jsonA: string = await op.generateRsaKey();
      const jsonB: string = await op.generateRsaKey();
      const actResult: string = jsonA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA === jsonB));
      expect(jsonA === jsonB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA.length === jsonB.length));
      expect(jsonA.length === jsonB.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA.indexOf('priKey') === jsonB.indexOf('priKey')));
      expect(jsonA.indexOf('priKey') === jsonB.indexOf('priKey')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10004 end');
    });

    /**
     * @tc.name   testRsaGenReal10005
     * @tc.number SUB_CryptoFramework_RSAGN1_0005
     * @tc.desc   a generated JSON converts into a non-null key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair === null));
      expect(pair === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.priKey.getEncoded().data.length > 0));
      expect(pair.priKey.getEncoded().data.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pair.pubKey.getEncoded().data.length > 0));
      expect(pair.pubKey.getEncoded().data.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10005 end');
    });

    /**
     * @tc.name   testRsaGenReal10006
     * @tc.number SUB_CryptoFramework_RSAGN1_0006
     * @tc.desc   a generated JSON signs a 768 char signature via the shortcut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const sig: string = await op.rsaConvertAndSign(json, 'generated sign probe');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig.indexOf(' ') < 0));
      expect(sig.indexOf(' ') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10006 end');
    });

    /**
     * @tc.name   testRsaGenReal10007
     * @tc.number SUB_CryptoFramework_RSAGN1_0007
     * @tc.desc   a generated JSON verifies its own shortcut signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const sig: string = await op.rsaConvertAndSign(json, 'generated verify probe');
      const vOk: Boolean = await op.rsaConvertAndVerify(json, 'generated verify probe', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig !== ''));
      expect(sig !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10007 end');
    });

    /**
     * @tc.name   testRsaGenReal10008
     * @tc.number SUB_CryptoFramework_RSAGN1_0008
     * @tc.desc   a generated JSON rejects a shortcut verify with a wrong text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const sig: string = await op.rsaConvertAndSign(json, 'right text');
      const vWrong: Boolean = await op.rsaConvertAndVerify(json, 'wrong text', sig);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaConvertAndVerify(json, 'right text', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length === 768).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10008 end');
    });

    /**
     * @tc.name   testRsaGenReal10009
     * @tc.number SUB_CryptoFramework_RSAGN1_0009
     * @tc.desc   an invalid JSON makes the sign shortcut return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const sig: string = await op.rsaConvertAndSign('broken json', 'probe text');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertTrue();
      const sigEmpty: string = await op.rsaConvertAndSign('', 'probe text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigEmpty === null));
      expect(sigEmpty === null).assertTrue();
      const json: string = await op.generateRsaKey();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 0));
      expect(json.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10009 end');
    });

    /**
     * @tc.name   testRsaGenReal10010
     * @tc.number SUB_CryptoFramework_RSAGN1_0010
     * @tc.desc   an invalid JSON makes the verify shortcut return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const vBad: Boolean = await op.rsaConvertAndVerify('broken json', 'probe text', '00');
      const actResult: Boolean = vBad;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vBad === null || !vBad.valueOf()));
      expect(vBad === null || !vBad.valueOf()).assertTrue();
      const json: string = await op.generateRsaKey();
      const sig: string = await op.rsaConvertAndSign(json, 'probe text');
      const vOk: Boolean = await op.rsaConvertAndVerify(json, 'probe text', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10010 end');
    });

    /**
     * @tc.name   testRsaGenReal10011
     * @tc.number SUB_CryptoFramework_RSAGN1_0011
     * @tc.desc   both keys of a generated pair encode into non-empty blobs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const priLen: number = pair.priKey.getEncoded().data.length;
      const pubLen: number = pair.pubKey.getEncoded().data.length;
      const actResult: cryptoFramework.KeyPair = pair;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > 0));
      expect(priLen > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pubLen > 0));
      expect(pubLen > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(priLen > pubLen));
      expect(priLen > pubLen).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10011 end');
    });

    /**
     * @tc.name   testRsaGenReal10012
     * @tc.number SUB_CryptoFramework_RSAGN1_0012
     * @tc.desc   a generated pair signs and verifies an empty text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const sig: string = await op.rsaSign(pair, '');
      const vOk: Boolean = await op.rsaVerify(pair, '', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      const vWrong: Boolean = await op.rsaVerify(pair, 'y', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10012 end');
    });

    /**
     * @tc.name   testRsaGenReal10013
     * @tc.number SUB_CryptoFramework_RSAGN1_0013
     * @tc.desc   a generated pair signs and verifies a 300 char text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const text: string = repeatChar('r', 300);
      const sig: string = await op.rsaSign(pair, text);
      const vOk: Boolean = await op.rsaVerify(pair, text, sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(text.length), String(300));
      expect(text.length).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10013 end');
    });

    /**
     * @tc.name   testRsaGenReal10014
     * @tc.number SUB_CryptoFramework_RSAGN1_0014
     * @tc.desc   three generated JSON strings are pairwise distinct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const jsonA: string = await op.generateRsaKey();
      const jsonB: string = await op.generateRsaKey();
      const jsonC: string = await op.generateRsaKey();
      const actResult: string = jsonA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA !== jsonB));
      expect(jsonA !== jsonB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonB !== jsonC));
      expect(jsonB !== jsonC).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(jsonA !== jsonC));
      expect(jsonA !== jsonC).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10014 end');
    });

    /**
     * @tc.name   testRsaGenReal10015
     * @tc.number SUB_CryptoFramework_RSAGN1_0015
     * @tc.desc   the public key of a generated pair encodes into a usable blob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const pair: cryptoFramework.KeyPair = await op.convertRsaKey(json);
      const pubData: Uint8Array = pair.pubKey.getEncoded().data;
      const actResult: Uint8Array = pubData;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pubData.length > 0));
      expect(pubData.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(pubData instanceof Uint8Array));
      expect(pubData instanceof Uint8Array).assertTrue();
      const sig: string = await op.rsaSign(pair, 'public blob probe');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10015 end');
    });

    /**
     * @tc.name   testRsaGenReal10016
     * @tc.number SUB_CryptoFramework_RSAGN1_0016
     * @tc.desc   a generated JSON is longer than one thousand chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaGenReal10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await op.generateRsaKey();
      const actResult: string = json;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(json.length > 1000));
      expect(json.length > 1000).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(json).priKey.length > 800));
      expect(parseRsa(json).priKey.length > 800).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(parseRsa(json).pubKey.length > 100));
      expect(parseRsa(json).pubKey.length > 100).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaGenReal10016 end');
    });

  });
}
