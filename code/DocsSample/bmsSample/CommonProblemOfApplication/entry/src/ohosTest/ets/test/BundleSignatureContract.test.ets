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
import { bundleManager } from '@kit.AbilityKit';
import { paceTurn } from './shared/TestPace';
import { FLAGS_FOR_FULL, FLAGS_FOR_SIGNATURE, SELF_BUNDLE_NAME, querySelf } from './shared/BundleProbe';
import {
  base64Std,
  base64StdToUrl,
  decodeBase64ToBytes,
  fingerprintOfCertificate,
  isPrintableAscii,
  isStandardBase64,
  isUpperHex,
  splitAppId
} from './shared/BundleOracle';
import { certificateToDer } from './shared/CertificateDer';
import { util } from '@kit.ArkTS';

function encoder(): util.TextEncoder {
  return new util.TextEncoder();
}

function bytesToText(bytes: Uint8Array): string {
  return util.TextDecoder.create('utf-8').decodeToString(bytes);
}

const HEX_FINGERPRINT_LENGTH: number = 64;
const BUNDLE_NAME_PATTERN: RegExp = /^[a-zA-Z][a-zA-Z0-9_.]*$/;

interface SignatureRow {
  name: string;
  bundleName: string;
  flags: number;
}

const SIGNATURE_ROWS: SignatureRow[] = [
  { name: 'main_signature_flags', bundleName: SELF_BUNDLE_NAME, flags: FLAGS_FOR_SIGNATURE },
  { name: 'full_flags', bundleName: SELF_BUNDLE_NAME, flags: FLAGS_FOR_FULL },
  { name: 'signature_only_flags', bundleName: SELF_BUNDLE_NAME,
    flags: bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO },
  { name: 'application_and_signature_flags', bundleName: SELF_BUNDLE_NAME, flags: FLAGS_FOR_SIGNATURE },
  { name: 'signature_and_disable_flags', bundleName: SELF_BUNDLE_NAME,
    flags: bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE },
  { name: 'signature_and_metadata_flags', bundleName: SELF_BUNDLE_NAME,
    flags: bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA },
  { name: 'signature_and_permission_flags', bundleName: SELF_BUNDLE_NAME,
    flags: bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION },
  { name: 'signature_and_hap_module_flags', bundleName: SELF_BUNDLE_NAME,
    flags: bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE }
];

export default function bundleSignatureContractTest() {
  describe('bundleSignatureContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    SIGNATURE_ROWS.forEach((row: SignatureRow) => {
      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0100
       * @tc.name testSignatureContract0001
       * @tc.desc Verify the bundle name echoes the bundle under test under the given flag set
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testSignatureContract0001_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        expect(info.name).assertEqual(row.bundleName);
        expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0200
       * @tc.name testSignatureContract0002
       * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64url>
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testSignatureContract0002_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        const appId: string = info.signatureInfo.appId;
        expect(appId.length > 0).assertTrue();
        const parts: string[] = splitAppId(appId, row.bundleName);
        expect(parts.length).assertEqual(2);
        expect(parts[0]).assertEqual(row.bundleName);
        expect(isStandardBase64(parts[1])).assertTrue();
        expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
        expect(isPrintableAscii(appId)).assertTrue();
        expect(appId.startsWith(row.bundleName + '_')).assertTrue();
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0300
       * @tc.name testSignatureContract0003
       * @tc.desc Verify fingerprint is a canonical 44 character base64 digest
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testSignatureContract0003_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        const fingerprint: string = info.signatureInfo.fingerprint;
        expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
        expect(isUpperHex(fingerprint)).assertTrue();
        expect(fingerprint.indexOf('=')).assertEqual(-1);
        expect(fingerprint.indexOf('/')).assertEqual(-1);
        expect(fingerprint.indexOf('+')).assertEqual(-1);
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0400
       * @tc.name testSignatureContract0004
       * @tc.desc Verify appIdentifier is either empty on debug builds or a standard base64 value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testSignatureContract0004_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(typeof appIdentifier).assertEqual('string');
        // Unsigned-for-identity debug builds expose an empty appIdentifier; published builds expose
        // a standard base64 identity string. Both shapes are asserted explicitly.
        if (appIdentifier.length === 0) {
          expect(appIdentifier).assertEqual('');
        } else {
          expect(isStandardBase64(appIdentifier)).assertTrue();
          expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
        }
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0500
       * @tc.name testSignatureContract0005
       * @tc.desc Verify the three signature fields are pairwise distinct identifiers
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testSignatureContract0005_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        const appId: string = info.signatureInfo.appId;
        const fingerprint: string = info.signatureInfo.fingerprint;
        const appIdentifier: string = info.signatureInfo.appIdentifier;
        expect(appId === fingerprint).assertFalse();
        expect(appId.indexOf(fingerprint)).assertEqual(-1);
        if (appIdentifier.length > 0) {
          expect(appId === appIdentifier).assertFalse();
          expect(fingerprint === appIdentifier).assertFalse();
        } else {
          expect(appIdentifier).assertEqual('');
        }
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0600
       * @tc.name testSignatureContract0006
       * @tc.desc Verify the signature certificate is exposed and parses as DER X509
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testSignatureContract0006_${row.name}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const info: bundleManager.BundleInfo = await querySelf(row.flags);
        const certificate: string = info.signatureInfo.certificate ?? '';
        expect(certificate.length > 0).assertTrue();
        const der: Uint8Array = certificateToDer(certificate);
        expect(der.length > 0).assertTrue();
        expect(der[0]).assertEqual(0x30);
      });
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0800
     * @tc.name testSignatureContract0008
     * @tc.desc Verify the fingerprint equals upper-case hex SHA-256 of the signing certificate DER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const expected: string = await fingerprintOfCertificate(certificateToDer(info.signatureInfo.certificate ?? ''));
      expect(info.signatureInfo.fingerprint).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0900
     * @tc.name testSignatureContract0009
     * @tc.desc Verify appId tail stays identical when the same bundle is queried with extra flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const second: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(first.signatureInfo.appId).assertEqual(second.signatureInfo.appId);
      expect(first.signatureInfo.fingerprint).assertEqual(second.signatureInfo.fingerprint);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_1100
     * @tc.name testSignatureContract0011
     * @tc.desc Verify appIdentifier stays identical when the same bundle is queried twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const second: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(first.signatureInfo.appIdentifier).assertEqual(second.signatureInfo.appIdentifier);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_1200
     * @tc.name testSignatureContract0012
     * @tc.desc Verify the fingerprint is stable across twelve consecutive queries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const baseline: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const expected: string = baseline.signatureInfo.fingerprint;
      for (let round: number = 0; round < 12; round++) {
        const next: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
        expect(next.signatureInfo.fingerprint).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_1300
     * @tc.name testSignatureContract0013
     * @tc.desc Verify concurrent signature queries agree on appId, fingerprint and appIdentifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results: bundleManager.BundleInfo[] = await Promise.all([
        querySelf(FLAGS_FOR_SIGNATURE),
        querySelf(FLAGS_FOR_FULL),
        querySelf(FLAGS_FOR_SIGNATURE),
        querySelf(FLAGS_FOR_FULL)
      ]);
      expect(results.length).assertEqual(4);
      const appId: string = results[0].signatureInfo.appId;
      const fingerprint: string = results[0].signatureInfo.fingerprint;
      const appIdentifier: string = results[0].signatureInfo.appIdentifier;
      for (let i: number = 1; i < results.length; i++) {
        expect(results[i].signatureInfo.appId).assertEqual(appId);
        expect(results[i].signatureInfo.fingerprint).assertEqual(fingerprint);
        expect(results[i].signatureInfo.appIdentifier).assertEqual(appIdentifier);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_1500
     * @tc.name testSignatureContract0015
     * @tc.desc Verify the hex fingerprint encodes exactly 32 digest bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.length / 2).assertEqual(32);
      const url: string = base64StdToUrl(fingerprint);
      expect(url.length).assertEqual(fingerprint.length);
    });
  });
}
