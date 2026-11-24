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

function allHex(s: string): boolean {
  const hexChars: string = '0123456789abcdefABCDEF';
  for (let i = 0; i < s.length; i++) {
    if (hexChars.indexOf(s.charAt(i)) < 0) {
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

export default function rsaSignReal2Test() {
  describe('RsaSignReal2', () => {

    /**
     * @tc.name   testRsaSignReal20001
     * @tc.number SUB_CryptoFramework_RSASV2_0001
     * @tc.desc   a signature is exactly 768 hex characters long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20001 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'length probe');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig !== ''));
      expect(sig !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20001 end');
    });

    /**
     * @tc.name   testRsaSignReal20002
     * @tc.number SUB_CryptoFramework_RSASV2_0002
     * @tc.desc   every signature character is a hex digit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20002 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'hex probe');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(sig)));
      expect(allHex(sig)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(allHex(sig.toLowerCase())));
      expect(allHex(sig.toLowerCase())).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig.indexOf(' ') < 0));
      expect(sig.indexOf(' ') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20002 end');
    });

    /**
     * @tc.name   testRsaSignReal20003
     * @tc.number SUB_CryptoFramework_RSASV2_0003
     * @tc.desc   signatures of two different texts differ from each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20003 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(pair, 'first text');
      const sigB: string = await op.rsaSign(pair, 'second text');
      const actResult: string = sigA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigB.length), String(768));
      expect(sigB.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20003 end');
    });

    /**
     * @tc.name   testRsaSignReal20004
     * @tc.number SUB_CryptoFramework_RSASV2_0004
     * @tc.desc   signatures from two different pairs differ for the same text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20004 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pairA: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const jsonB: string = await op.generateRsaKey();
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(jsonB);
      const sigA: string = await op.rsaSign(pairA, 'shared probe text');
      const sigB: string = await op.rsaSign(pairB, 'shared probe text');
      const actResult: string = sigA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === null || sigB === null));
      expect(sigA === null || sigB === null).assertFalse();
      const priA: number = pairA.priKey.getEncoded().data.length;
      const priB: number = pairB.priKey.getEncoded().data.length;
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s', String(Math.abs(priA - priB)), '<=32');
      expect(Math.abs(priA - priB) <= 32).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20004 end');
    });

    /**
     * @tc.name   testRsaSignReal20005
     * @tc.number SUB_CryptoFramework_RSASV2_0005
     * @tc.desc   a signature verifies as true against its own text and key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20005 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'verify true probe');
      const vOk: Boolean = await op.rsaVerify(pair, 'verify true probe', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk === null));
      expect(vOk === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20005 end');
    });

    /**
     * @tc.name   testRsaSignReal20006
     * @tc.number SUB_CryptoFramework_RSASV2_0006
     * @tc.desc   a signature verifies as false against a different text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20006 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'signed text here');
      const vWrong: Boolean = await op.rsaVerify(pair, 'signed text elsewhere', sig);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pair, 'signed text here', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length === 768).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20006 end');
    });

    /**
     * @tc.name   testRsaSignReal20007
     * @tc.number SUB_CryptoFramework_RSASV2_0007
     * @tc.desc   a signature verifies as false under a different key pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20007 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pairA: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const jsonB: string = await op.generateRsaKey();
      const pairB: cryptoFramework.KeyPair = await op.convertRsaKey(jsonB);
      const sig: string = await op.rsaSign(pairA, 'cross pair probe');
      const vWrong: Boolean = await op.rsaVerify(pairB, 'cross pair probe', sig);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pairA, 'cross pair probe', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20007 end');
    });

    /**
     * @tc.name   testRsaSignReal20008
     * @tc.number SUB_CryptoFramework_RSASV2_0008
     * @tc.desc   the convertAndSign and convertAndVerify shortcuts pair up
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20008 begin');
      const op: CryptoOperation = new CryptoOperation();
      const json: string = await getCachedRsaJson(op);
      const sig: string = await op.rsaConvertAndSign(json, 'shortcut pair probe');
      const vOk: Boolean = await op.rsaConvertAndVerify(json, 'shortcut pair probe', sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20008 end');
    });

    /**
     * @tc.name   testRsaSignReal20009
     * @tc.number SUB_CryptoFramework_RSASV2_0009
     * @tc.desc   flipping the first signature hex char makes verification fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20009 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'tamper head probe');
      const flippedChar: string = sig.charAt(0) === '0' ? '1' : '0';
      const tampered: string = flippedChar + sig.slice(1);
      const vWrong: Boolean = await op.rsaVerify(pair, 'tamper head probe', tampered);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pair, 'tamper head probe', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tampered.length), String(768));
      expect(tampered.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20009 end');
    });

    /**
     * @tc.name   testRsaSignReal20010
     * @tc.number SUB_CryptoFramework_RSASV2_0010
     * @tc.desc   flipping the last signature hex char makes verification fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20010 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'tamper tail probe');
      const flippedChar: string = sig.charAt(767) === '0' ? '1' : '0';
      const tampered: string = sig.slice(0, 767) + flippedChar;
      const vWrong: Boolean = await op.rsaVerify(pair, 'tamper tail probe', tampered);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pair, 'tamper tail probe', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tampered !== sig));
      expect(tampered !== sig).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20010 end');
    });

    /**
     * @tc.name   testRsaSignReal20011
     * @tc.number SUB_CryptoFramework_RSASV2_0011
     * @tc.desc   an empty text signs and verifies correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20011 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, '');
      const actResult: string = sig;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      const vOk: Boolean = await op.rsaVerify(pair, '', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      const vWrong: Boolean = await op.rsaVerify(pair, 'x', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20011 end');
    });

    /**
     * @tc.name   testRsaSignReal20012
     * @tc.number SUB_CryptoFramework_RSASV2_0012
     * @tc.desc   a 500 char text signs and verifies correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20012 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const text: string = repeatChar('m', 500);
      const sig: string = await op.rsaSign(pair, text);
      const vOk: Boolean = await op.rsaVerify(pair, text, sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(text.length), String(500));
      expect(text.length).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20012 end');
    });

    /**
     * @tc.name   testRsaSignReal20013
     * @tc.number SUB_CryptoFramework_RSASV2_0013
     * @tc.desc   a text with non-ascii letters verifies after the same byte folding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20013 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const text: string = '\u4e2d\u6587 content';
      const sig: string = await op.rsaSign(pair, text);
      const vOk: Boolean = await op.rsaVerify(pair, text, sig);
      const actResult: Boolean = vOk;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(text.length > 2));
      expect(text.length > 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20013 end');
    });

    /**
     * @tc.name   testRsaSignReal20014
     * @tc.number SUB_CryptoFramework_RSASV2_0014
     * @tc.desc   signing the same text twice yields the identical signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20014 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigA: string = await op.rsaSign(pair, 'deterministic probe');
      const sigB: string = await op.rsaSign(pair, 'deterministic probe');
      const actResult: string = sigA;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigA === sigB));
      expect(sigA === sigB).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigA.length), String(768));
      expect(sigA.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigB.length), String(768));
      expect(sigB.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20014 end');
    });

    /**
     * @tc.name   testRsaSignReal20015
     * @tc.number SUB_CryptoFramework_RSASV2_0015
     * @tc.desc   an empty signature makes verification throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20015 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      let thrown: boolean = false;
      try {
        await op.rsaVerify(pair, 'probe text', '');
      } catch (e) {
        thrown = true;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(thrown));
      expect(thrown).assertTrue();
      const sig: string = await op.rsaSign(pair, 'probe text');
      const vOk: Boolean = await op.rsaVerify(pair, 'probe text', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20015 end');
    });

    /**
     * @tc.name   testRsaSignReal20016
     * @tc.number SUB_CryptoFramework_RSASV2_0016
     * @tc.desc   a tiny garbage signature does not verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20016 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const vBad: Boolean = await op.rsaVerify(pair, 'probe text', '00');
      const actResult: Boolean = vBad;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vBad === null || !vBad.valueOf()));
      expect(vBad === null || !vBad.valueOf()).assertTrue();
      const sig: string = await op.rsaSign(pair, 'probe text');
      const vOk: Boolean = await op.rsaVerify(pair, 'probe text', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig.indexOf(' ') < 0));
      expect(sig.indexOf(' ') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20016 end');
    });

    /**
     * @tc.name   testRsaSignReal20017
     * @tc.number SUB_CryptoFramework_RSASV2_0017
     * @tc.desc   short and long texts both produce 768 char signatures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20017 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sigShort: string = await op.rsaSign(pair, 's');
      const sigLong: string = await op.rsaSign(pair, repeatChar('L', 300));
      const actResult: string = sigShort;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigShort.length), String(768));
      expect(sigShort.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sigLong.length), String(768));
      expect(sigLong.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sigShort !== sigLong));
      expect(sigShort !== sigLong).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20017 end');
    });

    /**
     * @tc.name   testRsaSignReal20018
     * @tc.number SUB_CryptoFramework_RSASV2_0018
     * @tc.desc   flipping a middle signature hex char makes verification fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSignReal20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20018 begin');
      const op: CryptoOperation = new CryptoOperation();
      const pair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(pair, 'middle tamper probe');
      const mid: number = 384;
      const flippedChar: string = sig.charAt(mid) === '0' ? '1' : '0';
      const tampered: string = sig.slice(0, mid) + flippedChar + sig.slice(mid + 1);
      const vWrong: Boolean = await op.rsaVerify(pair, 'middle tamper probe', tampered);
      const actResult: Boolean = vWrong;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vWrong === null || !vWrong.valueOf()));
      expect(vWrong === null || !vWrong.valueOf()).assertTrue();
      const vOk: Boolean = await op.rsaVerify(pair, 'middle tamper probe', sig);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(vOk !== null && vOk.valueOf()));
      expect(vOk !== null && vOk.valueOf()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tampered.length), String(768));
      expect(tampered.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSignReal20018 end');
    });

  });
}
