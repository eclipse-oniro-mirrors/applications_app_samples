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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_ErrorMatrix]';

function failureCodeOf(error: Object): number {
  return (error as BusinessError).code;
}

export default function bundleErrorCodeMatrixTest() {
  describe('bundleErrorCodeMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0101
     * @tc.name testErrorMatrix0001_not_exist_dotted
     * @tc.desc Verify unusable bundle name 'not_exist_dotted' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_not_exist_dotted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_not_exist_dotted begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_not_exist_dotted end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0201
     * @tc.name testErrorMatrix0002_not_exist_dotted
     * @tc.desc Verify rejection code for 'not_exist_dotted' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_not_exist_dotted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_not_exist_dotted begin');
      const result: ProbeFailure | undefined = await captureFailure(NON_EXIST_BUNDLE_NAME);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_not_exist_dotted end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0301
     * @tc.name testErrorMatrix0003_not_exist_dotted
     * @tc.desc Verify 'not_exist_dotted' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_not_exist_dotted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_not_exist_dotted begin');
      const result: ProbeFailure | undefined = await captureFailure(NON_EXIST_BUNDLE_NAME);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_not_exist_dotted end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0102
     * @tc.name testErrorMatrix0001_empty
     * @tc.desc Verify unusable bundle name 'empty' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_empty begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_empty end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0202
     * @tc.name testErrorMatrix0002_empty
     * @tc.desc Verify rejection code for 'empty' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_empty begin');
      const result: ProbeFailure | undefined = await captureFailure('');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_empty end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0302
     * @tc.name testErrorMatrix0003_empty
     * @tc.desc Verify 'empty' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_empty begin');
      const result: ProbeFailure | undefined = await captureFailure('');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_empty end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0103
     * @tc.name testErrorMatrix0001_single_char
     * @tc.desc Verify unusable bundle name 'single_char' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_single_char', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_single_char begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('a', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_single_char end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0203
     * @tc.name testErrorMatrix0002_single_char
     * @tc.desc Verify rejection code for 'single_char' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_single_char', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_single_char begin');
      const result: ProbeFailure | undefined = await captureFailure('a');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_single_char end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0303
     * @tc.name testErrorMatrix0003_single_char
     * @tc.desc Verify 'single_char' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_single_char', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_single_char begin');
      const result: ProbeFailure | undefined = await captureFailure('a');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_single_char end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0104
     * @tc.name testErrorMatrix0001_spaces
     * @tc.desc Verify unusable bundle name 'spaces' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_spaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_spaces begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('   ', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_spaces end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0204
     * @tc.name testErrorMatrix0002_spaces
     * @tc.desc Verify rejection code for 'spaces' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_spaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_spaces begin');
      const result: ProbeFailure | undefined = await captureFailure('   ');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_spaces end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0304
     * @tc.name testErrorMatrix0003_spaces
     * @tc.desc Verify 'spaces' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_spaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_spaces begin');
      const result: ProbeFailure | undefined = await captureFailure('   ');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_spaces end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0105
     * @tc.name testErrorMatrix0001_illegal_punctuation
     * @tc.desc Verify unusable bundle name 'illegal_punctuation' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_illegal_punctuation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_illegal_punctuation begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('bad@bundle#name', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_illegal_punctuation end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0205
     * @tc.name testErrorMatrix0002_illegal_punctuation
     * @tc.desc Verify rejection code for 'illegal_punctuation' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_illegal_punctuation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_illegal_punctuation begin');
      const result: ProbeFailure | undefined = await captureFailure('bad@bundle#name');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_illegal_punctuation end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0305
     * @tc.name testErrorMatrix0003_illegal_punctuation
     * @tc.desc Verify 'illegal_punctuation' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_illegal_punctuation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_illegal_punctuation begin');
      const result: ProbeFailure | undefined = await captureFailure('bad@bundle#name');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_illegal_punctuation end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0106
     * @tc.name testErrorMatrix0001_trailing_dot
     * @tc.desc Verify unusable bundle name 'trailing_dot' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_trailing_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_trailing_dot begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('ohos.app.hap.notexist.', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_trailing_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0206
     * @tc.name testErrorMatrix0002_trailing_dot
     * @tc.desc Verify rejection code for 'trailing_dot' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_trailing_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_trailing_dot begin');
      const result: ProbeFailure | undefined = await captureFailure('ohos.app.hap.notexist.');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_trailing_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0306
     * @tc.name testErrorMatrix0003_trailing_dot
     * @tc.desc Verify 'trailing_dot' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_trailing_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_trailing_dot begin');
      const result: ProbeFailure | undefined = await captureFailure('ohos.app.hap.notexist.');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_trailing_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0107
     * @tc.name testErrorMatrix0001_double_dot
     * @tc.desc Verify unusable bundle name 'double_dot' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_double_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_double_dot begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('ohos..app', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_double_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0207
     * @tc.name testErrorMatrix0002_double_dot
     * @tc.desc Verify rejection code for 'double_dot' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_double_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_double_dot begin');
      const result: ProbeFailure | undefined = await captureFailure('ohos..app');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_double_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0307
     * @tc.name testErrorMatrix0003_double_dot
     * @tc.desc Verify 'double_dot' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_double_dot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_double_dot begin');
      const result: ProbeFailure | undefined = await captureFailure('ohos..app');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_double_dot end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0108
     * @tc.name testErrorMatrix0001_numeric_only
     * @tc.desc Verify unusable bundle name 'numeric_only' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_numeric_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_numeric_only begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('12345', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_numeric_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0208
     * @tc.name testErrorMatrix0002_numeric_only
     * @tc.desc Verify rejection code for 'numeric_only' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_numeric_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_numeric_only begin');
      const result: ProbeFailure | undefined = await captureFailure('12345');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_numeric_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0308
     * @tc.name testErrorMatrix0003_numeric_only
     * @tc.desc Verify 'numeric_only' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_numeric_only', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_numeric_only begin');
      const result: ProbeFailure | undefined = await captureFailure('12345');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_numeric_only end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0109
     * @tc.name testErrorMatrix0001_very_long_1k
     * @tc.desc Verify unusable bundle name 'very_long_1k' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_very_long_1k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_very_long_1k begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('x'.repeat(1024), FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_very_long_1k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0209
     * @tc.name testErrorMatrix0002_very_long_1k
     * @tc.desc Verify rejection code for 'very_long_1k' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_very_long_1k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_very_long_1k begin');
      const result: ProbeFailure | undefined = await captureFailure('x'.repeat(1024));
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_very_long_1k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0309
     * @tc.name testErrorMatrix0003_very_long_1k
     * @tc.desc Verify 'very_long_1k' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_very_long_1k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_very_long_1k begin');
      const result: ProbeFailure | undefined = await captureFailure('x'.repeat(1024));
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_very_long_1k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0110
     * @tc.name testErrorMatrix0001_very_long_32k
     * @tc.desc Verify unusable bundle name 'very_long_32k' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_very_long_32k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_very_long_32k begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('y'.repeat(32768), FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_very_long_32k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0210
     * @tc.name testErrorMatrix0002_very_long_32k
     * @tc.desc Verify rejection code for 'very_long_32k' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_very_long_32k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_very_long_32k begin');
      const result: ProbeFailure | undefined = await captureFailure('y'.repeat(32768));
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_very_long_32k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0310
     * @tc.name testErrorMatrix0003_very_long_32k
     * @tc.desc Verify 'very_long_32k' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_very_long_32k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_very_long_32k begin');
      const result: ProbeFailure | undefined = await captureFailure('y'.repeat(32768));
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_very_long_32k end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0111
     * @tc.name testErrorMatrix0001_path_like
     * @tc.desc Verify unusable bundle name 'path_like' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_path_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_path_like begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('../../etc/passwd', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_path_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0211
     * @tc.name testErrorMatrix0002_path_like
     * @tc.desc Verify rejection code for 'path_like' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_path_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_path_like begin');
      const result: ProbeFailure | undefined = await captureFailure('../../etc/passwd');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_path_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0311
     * @tc.name testErrorMatrix0003_path_like
     * @tc.desc Verify 'path_like' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_path_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_path_like begin');
      const result: ProbeFailure | undefined = await captureFailure('../../etc/passwd');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_path_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0112
     * @tc.name testErrorMatrix0001_uri_like
     * @tc.desc Verify unusable bundle name 'uri_like' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_uri_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_uri_like begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('file:///data/app', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_uri_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0212
     * @tc.name testErrorMatrix0002_uri_like
     * @tc.desc Verify rejection code for 'uri_like' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_uri_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_uri_like begin');
      const result: ProbeFailure | undefined = await captureFailure('file:///data/app');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_uri_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0312
     * @tc.name testErrorMatrix0003_uri_like
     * @tc.desc Verify 'uri_like' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_uri_like', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_uri_like begin');
      const result: ProbeFailure | undefined = await captureFailure('file:///data/app');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_uri_like end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0113
     * @tc.name testErrorMatrix0001_case_mismatch
     * @tc.desc Verify unusable bundle name 'case_mismatch' rejects the promise entry point with a business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testErrorMatrix0001_case_mismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_case_mismatch begin');
      let rejected: boolean = false;
      let code: number = 0;
      try {
        const info: bundleManager.BundleInfo = await queryByNamePromise('OHOS.APP.HAP.NOTEXIST', FLAGS_FOR_SIGNATURE);
        code = info.name.length;
      } catch (error) {
        rejected = true;
        code = failureCodeOf(error as Object);
      }
      expect(rejected).assertTrue();
      expect(code !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0001_case_mismatch end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0213
     * @tc.name testErrorMatrix0002_case_mismatch
     * @tc.desc Verify rejection code for 'case_mismatch' is a documented bundle business code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0002_case_mismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_case_mismatch begin');
      const result: ProbeFailure | undefined = await captureFailure('OHOS.APP.HAP.NOTEXIST');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(isKnownBusinessCode(result.code) || result.code === ERR_PARAMETER).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0002_case_mismatch end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ERROR_MATRIX_0313
     * @tc.name testErrorMatrix0003_case_mismatch
     * @tc.desc Verify 'case_mismatch' failure carries a BusinessError with non-empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testErrorMatrix0003_case_mismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_case_mismatch begin');
      const result: ProbeFailure | undefined = await captureFailure('OHOS.APP.HAP.NOTEXIST');
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.isBusinessError).assertTrue();
        expect(result.message.length > 0).assertTrue();
        expect(describeFailure(result).startsWith('code=')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0003_case_mismatch end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0004 begin');
      const result: ProbeFailure | undefined = await captureFailure(NON_EXIST_BUNDLE_NAME);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.code === ERR_BUNDLE_NOT_FOUND || result.code === ERR_PERMISSION_DENIED).assertTrue();
        expect(isKnownBusinessCode(result.code)).assertTrue();
        expect(result.message.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0005 begin');
      const result = await querySelfSafely(FLAGS_FOR_SIGNATURE);
      expect(result.ok).assertTrue();
      expect(result.failure === undefined).assertTrue();
      expect(result.info?.name).assertEqual(SELF_BUNDLE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0006 begin');
      const ok: boolean = (await querySelfSafely(FLAGS_FOR_SIGNATURE)).ok;
      const failed: boolean = (await captureFailure(NON_EXIST_BUNDLE_NAME)) !== undefined;
      const okAgain: boolean = (await querySelfSafely(FLAGS_FOR_SIGNATURE)).ok;
      expect(ok).assertTrue();
      expect(failed).assertTrue();
      expect(okAgain).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0007 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0008 begin');
      const longName: string = 'z'.repeat(65536);
      const result: ProbeFailure | undefined = await captureFailure(longName);
      expect(result !== undefined).assertTrue();
      if (result !== undefined) {
        expect(result.code).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0009 begin');
      const flagsSet: number[] = [0, 1, 128, FLAGS_FOR_SIGNATURE];
      for (let i: number = 0; i < flagsSet.length; i++) {
        const result = querySelfSyncSafely(flagsSet[i]);
        expect(result.ok).assertTrue();
        expect(result.info?.name).assertEqual(SELF_BUNDLE_NAME);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorMatrix0009 end');
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
