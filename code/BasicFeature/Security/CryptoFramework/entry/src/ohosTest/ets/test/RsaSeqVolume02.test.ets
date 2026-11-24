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

export default function rsaSeq2Test() {
  describe('RsaSeq2', () => {

    /**
     * @tc.name   testRsaSeq0027
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0027
     * @tc.desc   sign verify sequence variant 27
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0027 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'sssssssssssssss');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'sssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0027 end');
    });

    /**
     * @tc.name   testRsaSeq0028
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0028
     * @tc.desc   sign verify sequence variant 28
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0028 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'ssssssssssssssss');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'ssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0028 end');
    });

    /**
     * @tc.name   testRsaSeq0029
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0029
     * @tc.desc   sign verify sequence variant 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0029 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'sssssssssssssssss');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'sssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0029 end');
    });

    /**
     * @tc.name   testRsaSeq0030
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0030
     * @tc.desc   sign verify sequence variant 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0030 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      const verifyRes: Boolean =
        await op.rsaVerify(keyPair, 'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0030 end');
    });

    /**
     * @tc.name   testRsaSeq0031
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0031
     * @tc.desc   sign verify sequence variant 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0031 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string =
        await op.rsaSign(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      const verifyRes: Boolean =
        await op.rsaVerify(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0031 end');
    });

    /**
     * @tc.name   testRsaSeq0032
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0032
     * @tc.desc   sign verify sequence variant 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0032 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string =
        await op.rsaSign(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      const verifyRes: Boolean =
        await op.rsaVerify(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0032 end');
    });

    /**
     * @tc.name   testRsaSeq0033
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0033
     * @tc.desc   sign verify sequence variant 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0033 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string =
        await op.rsaSign(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                    'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      const verifyRes: Boolean =
        await op.rsaVerify(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                    'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0033 end');
    });

    /**
     * @tc.name   testRsaSeq0034
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0034
     * @tc.desc   sign verify sequence variant 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0034 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string =
        await op.rsaSign(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                    'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
      const verifyRes: Boolean =
        await op.rsaVerify(keyPair, 'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
        'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
            'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                  'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss' +
                    'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0034 end');
    });

    /**
     * @tc.name   testRsaSeq0035
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0035
     * @tc.desc   sign verify sequence variant 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0035 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'café signé');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'café signé', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0035 end');
    });

    /**
     * @tc.name   testRsaSeq0036
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0036
     * @tc.desc   sign verify sequence variant 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0036 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'naïve vérification');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'naïve vérification', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0036 end');
    });

    /**
     * @tc.name   testRsaSeq0037
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0037
     * @tc.desc   sign verify sequence variant 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0037 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'A\u0000BÿC sign');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'A\u0000BÿC sign', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0037 end');
    });

    /**
     * @tc.name   testRsaSeq0038
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0038
     * @tc.desc   sign verify sequence variant 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0038 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'The quick brown fox signs the lazy dog');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'The quick brown fox signs the lazy dog', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0038 end');
    });

    /**
     * @tc.name   testRsaSeq0039
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0039
     * @tc.desc   sign verify sequence variant 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0039 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'asymmetric signature roundtrip');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'asymmetric signature roundtrip', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0039 end');
    });

    /**
     * @tc.name   testRsaSeq0040
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0040
     * @tc.desc   sign verify sequence variant 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0040 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'PKCS1 padding probe');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'PKCS1 padding probe', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0040 end');
    });

    /**
     * @tc.name   testRsaSeq0041
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0041
     * @tc.desc   sign verify sequence variant 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0041 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'SHA256 digest probe');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'SHA256 digest probe', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0041 end');
    });

    /**
     * @tc.name   testRsaSeq0042
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0042
     * @tc.desc   sign verify sequence variant 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0042 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'RSA3072 modulus probe');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'RSA3072 modulus probe', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0042 end');
    });

    /**
     * @tc.name   testRsaSeq0043
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0043
     * @tc.desc   sign verify sequence variant 43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0043 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'mixed digits 2468 and 1357');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'mixed digits 2468 and 1357', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0043 end');
    });

    /**
     * @tc.name   testRsaSeq0044
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0044
     * @tc.desc   sign verify sequence variant 44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0044 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'symbols < > & " \'');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'symbols < > & " \'', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0044 end');
    });

    /**
     * @tc.name   testRsaSeq0045
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0045
     * @tc.desc   sign verify sequence variant 45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0045 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'unusual    spacing');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'unusual    spacing', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0045 end');
    });

    /**
     * @tc.name   testRsaSeq0046
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0046
     * @tc.desc   sign verify sequence variant 46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0046 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'trailing whitespace ');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'trailing whitespace ', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0046 end');
    });

    /**
     * @tc.name   testRsaSeq0047
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0047
     * @tc.desc   sign verify sequence variant 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0047 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, ' leading whitespace');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, ' leading whitespace', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0047 end');
    });

    /**
     * @tc.name   testRsaSeq0048
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0048
     * @tc.desc   sign verify sequence variant 48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0048 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'middle-dash-text');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'middle-dash-text', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0048 end');
    });

    /**
     * @tc.name   testRsaSeq0049
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0049
     * @tc.desc   sign verify sequence variant 49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0049 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'under_score_text');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'under_score_text', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0049 end');
    });

    /**
     * @tc.name   testRsaSeq0050
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0050
     * @tc.desc   sign verify sequence variant 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0050 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, 'sign filler 49');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, 'sign filler 49', sig);
      const actResult: boolean = verifyRes !== null && verifyRes.valueOf();
      const result: boolean = actResult;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(actResult));
      expect(actResult).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(sig === null));
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(sig.length), String(768));
      expect(sig.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0050 end');
    });

    /**
     * @tc.name   testRsaSeq0051
     * @tc.number SUB_CryptoFramework_RSASEQ_01_0051
     * @tc.desc   空消息签名验签：签名长度 768 且验签通过（下界边界）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRsaSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0051 begin');
      const op: CryptoOperation = new CryptoOperation();
      const keyPair: cryptoFramework.KeyPair = await getCachedRsaPair(op);
      const sig: string = await op.rsaSign(keyPair, '');
      const verifyRes: Boolean = await op.rsaVerify(keyPair, '', sig);
      const passed: boolean = verifyRes !== null && verifyRes.valueOf();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(passed), 'true');
      expect(passed).assertTrue();
      expect(sig.length).assertEqual(768);
      expect(sig === null).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRsaSeq0051 end');
    });

  });
}
