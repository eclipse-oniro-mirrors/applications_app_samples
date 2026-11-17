/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { ErrorCategory, ErrorInfo, lookupError } from '../main/ets/core/ErrorCodeCore';
import { ErrorCenterModel, categoryLabel } from '../main/ets/feature/ErrorCenterModel';

function countCategory(key: string): number {
  return ErrorCenterModel.filter('', key).length;
}

export default function errorCenterMatrix2Test(): void {
  describe('ErrorCenterMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0001
     * @tc.name      testCategoryCounts0001
     * @tc.desc      every category has the expected entry count
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryCounts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(countCategory('none')).assertEqual(1);
      expect(countCategory('file_not_found')).assertEqual(1);
      expect(countCategory('permission_denied')).assertEqual(3);
      expect(countCategory('invalid_argument')).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0002
     * @tc.name      testCategoryCountsTail0002
     * @tc.desc      tail categories have the expected counts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryCountsTail0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(countCategory('internal')).assertEqual(5);
      expect(countCategory('network')).assertEqual(1);
      expect(countCategory('dlp_policy')).assertEqual(2);
      expect(countCategory('account')).assertEqual(1);
      expect(countCategory('storage_full')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0003
     * @tc.name      testDecimalPrefix0003
     * @tc.desc      decimal prefixes match system codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecimalPrefix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('139', 'all').length).assertEqual(14);
      expect(ErrorCenterModel.filter('191', 'all').length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0004
     * @tc.name      testHexPrefix0004
     * @tc.desc      the hex prefix matches every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexPrefix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('0x', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0005
     * @tc.name      testMessageKeyword0005
     * @tc.desc      message keywords filter entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMessageKeyword0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('空间', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0006
     * @tc.name      testHintKeyword0006
     * @tc.desc      hint keywords filter entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintKeyword0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('清理', 'all').length).assertEqual(1);
      expect(ErrorCenterModel.filter('账号', 'all').length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0007
     * @tc.name      testCombinedFilter0007
     * @tc.desc      category and keyword filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCombinedFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('13900012', 'permission_denied').length).assertEqual(1);
      expect(ErrorCenterModel.filter('13900002', 'permission_denied').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0008
     * @tc.name      testCaseInsensitive0008
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCaseInsensitive0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('d418e2', 'all').length).assertEqual(1);
      expect(ErrorCenterModel.filter('D418E2', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0009
     * @tc.name      testBlankKeyword0009
     * @tc.desc      blank keywords match every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBlankKeyword0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('   ', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0010
     * @tc.name      testNoResult0010
     * @tc.desc      unmatched keywords and categories return empty lists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNoResult0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('zzz', 'all').length).assertEqual(0);
      expect(ErrorCenterModel.filter('', 'unknown').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0011
     * @tc.name      testCategoryKeys0011
     * @tc.desc      category keys keep their order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryKeys0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const keys: string[] = ErrorCenterModel.categoryKeys();
      expect(keys.join('|')).assertEqual('all|file_not_found|permission_denied|dlp_policy|storage_full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0012
     * @tc.name      testCategoryLabels0012
     * @tc.desc      category labels cover the main groups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryLabels0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(categoryLabel(ErrorCategory.NONE)).assertEqual('成功');
      expect(categoryLabel(ErrorCategory.STORAGE_FULL)).assertEqual('存储空间');
      expect(categoryLabel(ErrorCategory.ACCOUNT)).assertEqual('账号');
      expect(categoryLabel(ErrorCategory.INTERNAL)).assertEqual('内部错误');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0013
     * @tc.name      testRetryableCount0013
     * @tc.desc      retryable totals match the core flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableCount0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.retryableCount(ErrorCenterModel.entries())).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0014
     * @tc.name      testRetryableLabels0014
     * @tc.desc      retryable labels follow the flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableLabels0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.retryableLabel(lookupError(13900004))).assertEqual('可重试');
      expect(ErrorCenterModel.retryableLabel(lookupError(13900002))).assertEqual('不可重试');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0015
     * @tc.name      testFormattedCodes0015
     * @tc.desc      formatted codes are zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormattedCodes0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.formattedCode(lookupError(0))).assertEqual('0x00000000');
      expect(ErrorCenterModel.formattedCode(lookupError(13900001))).assertEqual('0x00D418E1');
      expect(ErrorCenterModel.formattedCode(lookupError(13900012))).assertEqual('0x00D418EC');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0016
     * @tc.name      testEntriesCopy0016
     * @tc.desc      entries returns a defensive copy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntriesCopy0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: ErrorInfo[] = ErrorCenterModel.entries();
      first.pop();
      expect(ErrorCenterModel.entries().length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0017
     * @tc.name      testKnownCodesCopy0017
     * @tc.desc      known code lists are defensive copies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKnownCodesCopy0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: number[] = ErrorCenterModel.knownCodes();
      first.push(1);
      expect(ErrorCenterModel.knownCodes().length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0018
     * @tc.name      testCategorySweep0018
     * @tc.desc      category filters only contain their own category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategorySweep0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const keys: string[] = ['file_not_found', 'permission_denied', 'dlp_policy', 'storage_full'];
      for (let index = 0; index < keys.length; index++) {
        const result: ErrorInfo[] = ErrorCenterModel.filter('', keys[index]);
        for (let item = 0; item < result.length; item++) {
          expect(result[item].category.toString()).assertEqual(keys[index]);
        }
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0019
     * @tc.name      testFirstEntry00019
     * @tc.desc      the success entry is first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFirstEntry00019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: ErrorInfo[] = ErrorCenterModel.entries();
      expect(entries[0].code).assertEqual(0);
      expect(entries[0].category).assertEqual(ErrorCategory.NONE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0020
     * @tc.name      testHintSearchChinese0020
     * @tc.desc      chinese keywords match hints
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintSearchChinese0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('重试', 'all').length > 0).assertTrue();
      expect(ErrorCenterModel.filter('文件', 'all').length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0021
     * @tc.name      testFilterHexFull0021
     * @tc.desc      full formatted codes match single entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHexFull0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('0x00D418E2', 'all').length).assertEqual(1);
      expect(ErrorCenterModel.filter('0x00D418F9', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0022
     * @tc.name      testDecimalSingle0022
     * @tc.desc      decimal searches match single entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecimalSingle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const result: ErrorInfo[] = ErrorCenterModel.filter('13900025', 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].message).assertEqual('存储空间不足');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0023
     * @tc.name      testCategoryWithKeywordOther0023
     * @tc.desc      keywords outside a category return nothing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryWithKeywordOther0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('13900012', 'dlp_policy').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER2_0024
     * @tc.name      testFilterCountStability0024
     * @tc.desc      repeated filters return consistent counts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterCountStability0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('', 'all').length).assertEqual(19);
      expect(ErrorCenterModel.filter('', 'all').length).assertEqual(19);
    })
  });
}
