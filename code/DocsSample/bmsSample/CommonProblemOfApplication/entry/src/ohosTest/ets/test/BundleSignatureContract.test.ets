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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_SignatureContract]';

function encoder(): util.TextEncoder {
  return new util.TextEncoder();
}

function bytesToText(bytes: Uint8Array): string {
  return util.TextDecoder.create('utf-8').decodeToString(bytes);
}

const HEX_FINGERPRINT_LENGTH: number = 64;
const BUNDLE_NAME_PATTERN: RegExp = /^[a-zA-Z][a-zA-Z0-9_.]*$/;

export default function bundleSignatureContractTest() {
  describe('bundleSignatureContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0101
     * @tc.name testSignatureContract0001_main_signature_flags
     * @tc.desc Verify bundle name echoes the bundle under test for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0201
     * @tc.name testSignatureContract0002_main_signature_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0301
     * @tc.name testSignatureContract0003_main_signature_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0401
     * @tc.name testSignatureContract0004_main_signature_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0501
     * @tc.name testSignatureContract0005_main_signature_flags
     * @tc.desc Verify signature fields are pairwise distinct for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0601
     * @tc.name testSignatureContract0006_main_signature_flags
     * @tc.desc Verify signature certificate parses as DER X509 for main_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_main_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_main_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_main_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0102
     * @tc.name testSignatureContract0001_full_flags
     * @tc.desc Verify bundle name echoes the bundle under test for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0202
     * @tc.name testSignatureContract0002_full_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0302
     * @tc.name testSignatureContract0003_full_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0402
     * @tc.name testSignatureContract0004_full_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0502
     * @tc.name testSignatureContract0005_full_flags
     * @tc.desc Verify signature fields are pairwise distinct for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0602
     * @tc.name testSignatureContract0006_full_flags
     * @tc.desc Verify signature certificate parses as DER X509 for full_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_full_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_full_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_full_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0103
     * @tc.name testSignatureContract0001_signature_only_flags
     * @tc.desc Verify bundle name echoes the bundle under test for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0203
     * @tc.name testSignatureContract0002_signature_only_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0303
     * @tc.name testSignatureContract0003_signature_only_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0403
     * @tc.name testSignatureContract0004_signature_only_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0503
     * @tc.name testSignatureContract0005_signature_only_flags
     * @tc.desc Verify signature fields are pairwise distinct for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0603
     * @tc.name testSignatureContract0006_signature_only_flags
     * @tc.desc Verify signature certificate parses as DER X509 for signature_only_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_signature_only_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_only_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_only_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0104
     * @tc.name testSignatureContract0001_application_and_signature_flags
     * @tc.desc Verify bundle name echoes the bundle under test for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0204
     * @tc.name testSignatureContract0002_application_and_signature_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0304
     * @tc.name testSignatureContract0003_application_and_signature_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0404
     * @tc.name testSignatureContract0004_application_and_signature_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0504
     * @tc.name testSignatureContract0005_application_and_signature_flags
     * @tc.desc Verify signature fields are pairwise distinct for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0604
     * @tc.name testSignatureContract0006_application_and_signature_flags
     * @tc.desc Verify signature certificate parses as DER X509 for application_and_signature_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_application_and_signature_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_application_and_signature_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_application_and_signature_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0105
     * @tc.name testSignatureContract0001_signature_and_disable_flags
     * @tc.desc Verify bundle name echoes the bundle under test for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0205
     * @tc.name testSignatureContract0002_signature_and_disable_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0305
     * @tc.name testSignatureContract0003_signature_and_disable_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0405
     * @tc.name testSignatureContract0004_signature_and_disable_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0505
     * @tc.name testSignatureContract0005_signature_and_disable_flags
     * @tc.desc Verify signature fields are pairwise distinct for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0605
     * @tc.name testSignatureContract0006_signature_and_disable_flags
     * @tc.desc Verify signature certificate parses as DER X509 for signature_and_disable_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_signature_and_disable_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_disable_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_disable_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0106
     * @tc.name testSignatureContract0001_signature_and_metadata_flags
     * @tc.desc Verify bundle name echoes the bundle under test for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0206
     * @tc.name testSignatureContract0002_signature_and_metadata_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0306
     * @tc.name testSignatureContract0003_signature_and_metadata_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0406
     * @tc.name testSignatureContract0004_signature_and_metadata_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0506
     * @tc.name testSignatureContract0005_signature_and_metadata_flags
     * @tc.desc Verify signature fields are pairwise distinct for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0606
     * @tc.name testSignatureContract0006_signature_and_metadata_flags
     * @tc.desc Verify signature certificate parses as DER X509 for signature_and_metadata_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_signature_and_metadata_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_metadata_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_metadata_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0107
     * @tc.name testSignatureContract0001_signature_and_permission_flags
     * @tc.desc Verify bundle name echoes the bundle under test for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0207
     * @tc.name testSignatureContract0002_signature_and_permission_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0307
     * @tc.name testSignatureContract0003_signature_and_permission_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0407
     * @tc.name testSignatureContract0004_signature_and_permission_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0507
     * @tc.name testSignatureContract0005_signature_and_permission_flags
     * @tc.desc Verify signature fields are pairwise distinct for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0607
     * @tc.name testSignatureContract0006_signature_and_permission_flags
     * @tc.desc Verify signature certificate parses as DER X509 for signature_and_permission_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_signature_and_permission_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_permission_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_permission_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0108
     * @tc.name testSignatureContract0001_signature_and_hap_module_flags
     * @tc.desc Verify bundle name echoes the bundle under test for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0001_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      expect(info.name).assertEqual(SELF_BUNDLE_NAME);
      expect(BUNDLE_NAME_PATTERN.test(info.name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0001_signature_and_hap_module_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0208
     * @tc.name testSignatureContract0002_signature_and_hap_module_flags
     * @tc.desc Verify appId is non-empty and shaped as bundleName_<base64> for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0002_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      const appId: string = info.signatureInfo.appId;
      expect(appId.length > 0).assertTrue();
      const parts: string[] = splitAppId(appId, SELF_BUNDLE_NAME);
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual(SELF_BUNDLE_NAME);
      expect(isStandardBase64(parts[1])).assertTrue();
      expect(decodeBase64ToBytes(parts[1]).length > 0).assertTrue();
      expect(isPrintableAscii(appId)).assertTrue();
      expect(appId.startsWith(SELF_BUNDLE_NAME + '_')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0002_signature_and_hap_module_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0308
     * @tc.name testSignatureContract0003_signature_and_hap_module_flags
     * @tc.desc Verify fingerprint is a canonical 64-char upper hex digest for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0003_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(fingerprint.length).assertEqual(HEX_FINGERPRINT_LENGTH);
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.indexOf('=')).assertEqual(-1);
      expect(fingerprint.indexOf('/')).assertEqual(-1);
      expect(fingerprint.indexOf('+')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0003_signature_and_hap_module_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0408
     * @tc.name testSignatureContract0004_signature_and_hap_module_flags
     * @tc.desc Verify appIdentifier is empty or standard base64 for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSignatureContract0004_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      const appIdentifier: string = info.signatureInfo.appIdentifier;
      expect(typeof appIdentifier).assertEqual('string');
      if (appIdentifier.length === 0) {
        expect(appIdentifier).assertEqual('');
      } else {
        expect(isStandardBase64(appIdentifier)).assertTrue();
        expect(decodeBase64ToBytes(appIdentifier).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0004_signature_and_hap_module_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0508
     * @tc.name testSignatureContract0005_signature_and_hap_module_flags
     * @tc.desc Verify signature fields are pairwise distinct for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0005_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0005_signature_and_hap_module_flags end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_SIGNATURE_CONTRACT_0608
     * @tc.name testSignatureContract0006_signature_and_hap_module_flags
     * @tc.desc Verify signature certificate parses as DER X509 for signature_and_hap_module_flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSignatureContract0006_signature_and_hap_module_flags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_hap_module_flags begin');
      const info: bundleManager.BundleInfo = await querySelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      const certificate: string = info.signatureInfo.certificate ?? '';
      expect(certificate.length > 0).assertTrue();
      const der: Uint8Array = certificateToDer(certificate);
      expect(der.length > 0).assertTrue();
      expect(der[0]).assertEqual(0x30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0006_signature_and_hap_module_flags end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0008 begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const expected: string = await fingerprintOfCertificate(certificateToDer(info.signatureInfo.certificate ?? ''));
      expect(info.signatureInfo.fingerprint).assertEqual(expected);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0009 begin');
      const first: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const second: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(first.signatureInfo.appId).assertEqual(second.signatureInfo.appId);
      expect(first.signatureInfo.fingerprint).assertEqual(second.signatureInfo.fingerprint);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0011 begin');
      const first: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const second: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      expect(first.signatureInfo.appIdentifier).assertEqual(second.signatureInfo.appIdentifier);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0012 begin');
      const baseline: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
      const expected: string = baseline.signatureInfo.fingerprint;
      for (let round: number = 0; round < 12; round++) {
        const next: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_SIGNATURE);
        expect(next.signatureInfo.fingerprint).assertEqual(expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0012 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0013 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0013 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0015 begin');
      const info: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_FULL);
      const fingerprint: string = info.signatureInfo.fingerprint;
      expect(isUpperHex(fingerprint)).assertTrue();
      expect(fingerprint.length / 2).assertEqual(32);
      const url: string = base64StdToUrl(fingerprint);
      expect(url.length).assertEqual(fingerprint.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSignatureContract0015 end');
    });
  });
}
