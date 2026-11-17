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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bundleManager } from '@kit.AbilityKit';
import { paceTurn } from './shared/TestPace';
import {
  FLAGS_FOR_FULL,
  FLAGS_FOR_SIGNATURE,
  NON_EXIST_BUNDLE_NAME,
  SELF_BUNDLE_NAME,
  queryByNamePromise,
  querySelf,
  querySelfSafely,
  querySelfSync,
  querySelfSyncSafely
} from './shared/BundleProbe';
import {
  BASE64_STD,
  base64Std,
  base64StdToUrl,
  countBits,
  decodeBase64ToBytes,
  fingerprintFromAppId,
  publicKeyDerFromEncoded,
  toBase64Url,
  toHexLower
} from './shared/BundleOracle';
import { certificateToDer } from './shared/CertificateDer';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { toHexUpper } from './shared/BundleOracle';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_Contract]';

export default function probeSmokeTest() {
  describe('probeSmokeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SMOKE_0100
     * @tc.name testProbeSmoke0001
     * @tc.desc Verify getBundleInfoForSelf returns the name of the bundle under test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testProbeSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0001 begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0001 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SMOKE_0200
     * @tc.name testProbeSmoke0002
     * @tc.desc Verify the sync and async entry points agree on the name field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testProbeSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0002 begin');
      const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_SIGNATURE);
      expect(syncInfo.name).assertEqual(asyncInfo.name);
      expect(syncInfo.signatureInfo.appId).assertEqual(asyncInfo.signatureInfo.appId);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0002 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SMOKE_0300
     * @tc.name testProbeSmoke0003
     * @tc.desc Verify a missing bundle rejects through the promise entry point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProbeSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0003 begin');
      const self: boolean = (await querySelfSafely(FLAGS_FOR_SIGNATURE)).ok;
      expect(self).assertTrue();
      let threw: boolean = false;
      try {
        await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_SIGNATURE);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(querySelfSyncSafely(FLAGS_FOR_SIGNATURE).ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0003 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SMOKE_0400
     * @tc.name testProbeSmoke0004
     * @tc.desc Verify the fingerprint equals upper-case hex SHA-256 of the signing certificate DER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testProbeSmoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0004 begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
      await md.update({ data: certificateToDer(certificate) });
      const certDigest: cryptoFramework.DataBlob = await md.digest();
      const certHex: string = toHexUpper(new Uint8Array(certDigest.data));
      expect(certHex).assertEqual(info.signatureInfo.fingerprint);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0004 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SMOKE_0500
     * @tc.name testProbeSmoke0005
     * @tc.desc Verify the base64 oracle helpers agree on canonical values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testProbeSmoke0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0005 begin');
      expect(BASE64_STD.length).assertEqual(64);
      expect(base64Std(new Uint8Array([0x66]))).assertEqual('Zg==');
      expect(base64Std(new Uint8Array([0x66, 0x6F]))).assertEqual('Zm8=');
      expect(base64Std(new Uint8Array([0x66, 0x6F, 0x6F]))).assertEqual('Zm9v');
      expect(base64StdToUrl('ab+/cd==')).assertEqual('ab-_cd');
      expect(toBase64Url('a+b/c=')).assertEqual('a-b_c');
      expect(countBits(0)).assertEqual(0);
      expect(countBits(0xFF)).assertEqual(8);
      expect(toHexLower(new Uint8Array([0x0F, 0xA0]))).assertEqual('0fa0');
      expect(decodeBase64ToBytes('Zm9v').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProbeSmoke0005 end');
    });
  });
}
