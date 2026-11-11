/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';
import { paceTurn } from './shared/TestPace';
import {
  ERR_BUNDLE_NOT_FOUND,
  ERR_PARAMETER,
  ERR_PERMISSION_DENIED,
  FLAGS_FOR_SIGNATURE,
  NON_EXIST_BUNDLE_NAME,
  ProbeFailure,
  SELF_BUNDLE_NAME,
  describeFailure,
  isKnownBusinessCode,
  queryByNamePromise,
  querySelfSafely,
  querySelfSyncSafely
} from './shared/BundleProbe';

interface BadNameRow {
  label: string;
  bundleName: string;
  expectThrown: boolean;
}

const BAD_NAME_ROWS: BadNameRow[] = [
  { label: 'not_exist_dotted', bundleName: NON_EXIST_BUNDLE_NAME, expectThrown: true },
  { label: 'empty', bundleName: '', expectThrown: true },
  { label: 'single_char', bundleName: 'a', expectThrown: true },
  { label: 'spaces', bundleName: '   ', expectThrown: true },
  { label: 'illegal_punctuation', bundleName: 'bad@bundle#name', expectThrown: true },
  { label: 'trailing_dot', bundleName: 'ohos.app.hap.notexist.', expectThrown: true },
  { label: 'double_dot', bundleName: 'ohos..app', expectThrown: true },
  { label: 'numeric_only', bundleName: '12345', expectThrown: true },
  { label: 'very_long_1k', bundleName: 'x'.repeat(1024), expectThrown: true },
  { label: 'very_long_32k', bundleName: 'y'.repeat(32768), expectThrown: true },
  { label: 'path_like', bundleName: '../../etc/passwd', expectThrown: true },
  { label: 'uri_like', bundleName: 'file:///data/app', expectThrown: true },
  { label: 'case_mismatch', bundleName: 'OHOS.APP.HAP.NOTEXIST', expectThrown: true }
];

function failureCodeOf(error: Object): number {
  return (error as BusinessError).code;
}

export default function bundleErrorCodeMatrixTest() {
  describe('bundleErrorCodeMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    BAD_NAME_ROWS.forEach((row: BadNameRow) => {
      /**
       * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0100
       * @tc.name testErrorMatrix0001
       * @tc.desc Verify an unusable bundle name rejects the promise entry point with a business code
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL1
       */
      it(`testErrorMatrix0001_${row.label}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let rejected: boolean = false;
        let code: number = 0;
        try {
          const info: bundleManager.BundleInfo = await queryByNamePromise(row.bundleName, FLAGS_FOR_SIGNATURE);
          code = info.name.length;
        } catch (error) {
          rejected = true;
          code = failureCodeOf(error as Object);
        }
        expect(rejected).assertTrue();
        expect(code !== 0).assertTrue();
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0200
       * @tc.name testErrorMatrix0002
       * @tc.desc Verify the rejection code is one of the documented bundle business codes
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testErrorMatrix0002_${row.label}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: ProbeFailure | undefined = await captureFailure(row.bundleName);
        expect(result !== undefined).assertTrue();
        if (result !== undefined) {
          expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
          expect(result.message.length > 0).assertTrue();
        }
      });

      /**
       * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0300
       * @tc.name testErrorMatrix0003
       * @tc.desc Verify the failure carries a BusinessError instance with a non-empty message
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it(`testErrorMatrix0003_${row.label}`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        const result: ProbeFailure | undefined = await captureFailure(row.bundleName);
        expect(result !== undefined).assertTrue();
        if (result !== undefined) {
          expect(result.isBusinessError).assertTrue();
          expect(result.message.length > 0).assertTrue();
          expect(describeFailure(result).startsWith('code=')).assertTrue();
        }
      });
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0400
     * @tc.name testErrorMatrix0004
     * @tc.desc Verify a well-formed but uninstalled name rejects with a documented bundle error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testErrorMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: ProbeFailure | undefined = await captureFailure(NON_EXIST_BUNDLE_NAME);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        // The SDK documents 17700001 for a missing bundle, but callers behind different
        // permission gates also return 201 on some builds; both are non-success outcomes.
        expect(result.code === ERR_BUNDLE_NOT_FOUND || result.code === ERR_PERMISSION_DENIED).assertTrue();
        expect(isKnownBusinessCode(result.code)).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0500
     * @tc.name testErrorMatrix0005
     * @tc.desc Verify the self bundle name resolves successfully with no failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testErrorMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await querySelfSafely(FLAGS_FOR_SIGNATURE);
      expect(result.ok).assertTrue();
      expect(result.failure === undefined).assertTrue();
      expect(result.info?.name).assertEqual(SELF_BUNDLE_NAME);
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0600
     * @tc.name testErrorMatrix0006
     * @tc.desc Verify a rejected call after a successful call leaves no sticky failure state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ok: boolean = (await querySelfSafely(FLAGS_FOR_SIGNATURE)).ok;
      const failed: boolean = (await captureFailure(NON_EXIST_BUNDLE_NAME)) !== undefined;
      const okAgain: boolean = (await querySelfSafely(FLAGS_FOR_SIGNATURE)).ok;
      expect(ok).assertTrue();
      expect(failed).assertTrue();
      expect(okAgain).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0700
     * @tc.name testErrorMatrix0007
     * @tc.desc Verify mixed concurrent queries resolve the good one and reject the bad one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const outcomes: boolean[] = await Promise.all([
        queryByNamePromise(SELF_BUNDLE_NAME, FLAGS_FOR_SIGNATURE)
          .then((info: bundleManager.BundleInfo) => info.name === SELF_BUNDLE_NAME)
          .catch(() => false),
        queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_SIGNATURE)
          .then(() => false)
          .catch((error: BusinessError) => isKnownBusinessCode(error.code)),
        queryByNamePromise(SELF_BUNDLE_NAME, FLAGS_FOR_SIGNATURE)
          .then((info: bundleManager.BundleInfo) => info.signatureInfo.appId.length > 0)
          .catch(() => false)
      ]);
      expect(outcomes[0]).assertTrue();
      expect(outcomes[1]).assertTrue();
      expect(outcomes[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0800
     * @tc.name testErrorMatrix0008
     * @tc.desc Verify a very long illegal name rejects rather than returns an empty info object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const longName: string = 'z'.repeat(65536);
      const result: ProbeFailure | undefined = await captureFailure(longName);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.code).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0900
     * @tc.name testErrorMatrix0009
     * @tc.desc Verify the sync self probe never throws under the signature flag subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flagsSet: number[] = [0, 1, 128, FLAGS_FOR_SIGNATURE];
      for (let i: number = 0; i < flagsSet.length; i++) {
        const result = querySelfSyncSafely(flagsSet[i]);
        expect(result.ok).assertTrue();
        expect(result.info?.name).assertEqual(SELF_BUNDLE_NAME);
      }
    });
  });
}

async function captureFailure(bundleName: string): Promise<ProbeFailure | undefined> {
  try {
    await queryByNamePromise(bundleName, FLAGS_FOR_SIGNATURE);
    return undefined;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    return new ProbeFailure(err.code, err.message, err instanceof Error);
  }
}
