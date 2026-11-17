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

function joinTexts(values: Array<string>): string {
  return values.join('|');
}

function countCategory(key: string): number {
  return ErrorCenterModel.filter('', key).length;
}

export default function errorCenterMatrixTest(): void {
  describe('ErrorCenterMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0001
     * @tc.name      testKnownCodes0001
     * @tc.desc      the code list starts and ends with the expected values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKnownCodes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKnownCodes0001 begin');
      const codes: Array<number> = ErrorCenterModel.knownCodes();
      expect(codes.length).assertEqual(19);
      expect(codes[0]).assertEqual(0);
      expect(codes[18]).assertEqual(19100004);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0002
     * @tc.name      testEntries0002
     * @tc.desc      entries follow the code order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntries0002 begin');
      const entries: Array<ErrorInfo> = ErrorCenterModel.entries();
      expect(entries.length).assertEqual(19);
      expect(entries[0].message).assertEqual('操作成功');
      expect(entries[19 - 1].code).assertEqual(19100004);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0003
     * @tc.name      testCategoryNone0003
     * @tc.desc      the success entry is the only none category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryNone0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryNone0003 begin');
      expect(countCategory('none')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0004
     * @tc.name      testCategoryFile0004
     * @tc.desc      one missing file entry is present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryFile0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryFile0004 begin');
      expect(countCategory('file_not_found')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0005
     * @tc.name      testCategoryPermission0005
     * @tc.desc      three permission entries are present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryPermission0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryPermission0005 begin');
      expect(countCategory('permission_denied')).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0006
     * @tc.name      testCategoryInvalid0006
     * @tc.desc      four invalid argument entries are present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryInvalid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryInvalid0006 begin');
      expect(countCategory('invalid_argument')).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0007
     * @tc.name      testCategoryInternal0007
     * @tc.desc      five internal entries are present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryInternal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryInternal0007 begin');
      expect(countCategory('internal')).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0008
     * @tc.name      testCategoryNetwork0008
     * @tc.desc      one network entry is present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryNetwork0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryNetwork0008 begin');
      expect(countCategory('network')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0009
     * @tc.name      testCategoryDlp0009
     * @tc.desc      two dlp policy entries are present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryDlp0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryDlp0009 begin');
      expect(countCategory('dlp_policy')).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0010
     * @tc.name      testCategoryAccount0010
     * @tc.desc      one account entry is present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryAccount0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryAccount0010 begin');
      expect(countCategory('account')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0011
     * @tc.name      testCategoryStorage0011
     * @tc.desc      one storage entry is present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryStorage0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryStorage0011 begin');
      expect(countCategory('storage_full')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0012
     * @tc.name      testFilterDecimalPrefix0012
     * @tc.desc      decimal prefixes match the system codes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterDecimalPrefix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterDecimalPrefix0012 begin');
      expect(ErrorCenterModel.filter('139', 'all').length).assertEqual(14);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0013
     * @tc.name      testFilterHexPrefix0013
     * @tc.desc      the hex prefix matches every formatted code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHexPrefix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterHexPrefix0013 begin');
      expect(ErrorCenterModel.filter('0x', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0014
     * @tc.name      testFilterHexValue0014
     * @tc.desc      hex fragments match the right entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHexValue0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterHexValue0014 begin');
      const result: Array<ErrorInfo> = ErrorCenterModel.filter('D418F9', 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual(13900025);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0015
     * @tc.name      testFilterMessage0015
     * @tc.desc      message keywords match entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterMessage0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterMessage0015 begin');
      const result: Array<ErrorInfo> = ErrorCenterModel.filter('空间', 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual(13900025);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0016
     * @tc.name      testFilterHint0016
     * @tc.desc      hint keywords match entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHint0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterHint0016 begin');
      expect(ErrorCenterModel.filter('重试', 'all').length > 0).assertTrue();
      expect(ErrorCenterModel.filter('权限', 'all').length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0017
     * @tc.name      testFilterNoResult0017
     * @tc.desc      unmatched keywords return empty lists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNoResult0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterNoResult0017 begin');
      expect(ErrorCenterModel.filter('zzz', 'all').length).assertEqual(0);
      expect(ErrorCenterModel.filter('', 'unknown').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0018
     * @tc.name      testFilterCombined0018
     * @tc.desc      category and keyword filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterCombined0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterCombined0018 begin');
      expect(ErrorCenterModel.filter('13900002', 'permission_denied').length).assertEqual(0);
      expect(ErrorCenterModel.filter('13900012', 'permission_denied').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0019
     * @tc.name      testCategoryKeys0019
     * @tc.desc      category chips are listed in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryKeys0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryKeys0019 begin');
      expect(joinTexts(ErrorCenterModel.categoryKeys()))
        .assertEqual('all|file_not_found|permission_denied|dlp_policy|storage_full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0020
     * @tc.name      testCategoryLabels0020
     * @tc.desc      every category has a chinese label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryLabels0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryLabels0020 begin');
      expect(categoryLabel(ErrorCategory.NONE)).assertEqual('成功');
      expect(categoryLabel(ErrorCategory.FILE_NOT_FOUND)).assertEqual('文件不存在');
      expect(categoryLabel(ErrorCategory.PERMISSION_DENIED)).assertEqual('权限不足');
      expect(categoryLabel(ErrorCategory.INVALID_ARGUMENT)).assertEqual('参数错误');
      expect(categoryLabel(ErrorCategory.NETWORK)).assertEqual('网络');
      expect(categoryLabel(ErrorCategory.STORAGE_FULL)).assertEqual('存储空间');
      expect(categoryLabel(ErrorCategory.OUT_OF_MEMORY)).assertEqual('内存');
      expect(categoryLabel(ErrorCategory.DLP_POLICY)).assertEqual('DLP 策略');
      expect(categoryLabel(ErrorCategory.ACCOUNT)).assertEqual('账号');
      expect(categoryLabel(ErrorCategory.INTERNAL)).assertEqual('内部错误');
      expect(categoryLabel(ErrorCategory.UNKNOWN)).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0021
     * @tc.name      testRetryableCount0021
     * @tc.desc      retryable entries are counted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableCount0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableCount0021 begin');
      expect(ErrorCenterModel.retryableCount(ErrorCenterModel.entries())).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0022
     * @tc.name      testRetryableLabels0022
     * @tc.desc      retryable labels reflect the flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableLabels0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableLabels0022 begin');
      expect(ErrorCenterModel.retryableLabel(lookupError(13900004))).assertEqual('可重试');
      expect(ErrorCenterModel.retryableLabel(lookupError(13900002))).assertEqual('不可重试');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0023
     * @tc.name      testFormattedCodes0023
     * @tc.desc      formatted codes are zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormattedCodes0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormattedCodes0023 begin');
      expect(ErrorCenterModel.formattedCode(lookupError(0))).assertEqual('0x00000000');
      expect(ErrorCenterModel.formattedCode(lookupError(13900001))).assertEqual('0x00D418E1');
      expect(ErrorCenterModel.formattedCode(lookupError(13900002))).assertEqual('0x00D418E2');
      expect(ErrorCenterModel.formattedCode(lookupError(13900025))).assertEqual('0x00D418F9');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0024
     * @tc.name      testEntriesCopy0024
     * @tc.desc      entries returns a new collection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntriesCopy0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntriesCopy0024 begin');
      const first: Array<ErrorInfo> = ErrorCenterModel.entries();
      first.pop();
      expect(ErrorCenterModel.entries().length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0025
     * @tc.name      testKnownCodesCopy0025
     * @tc.desc      known code lists are defensive copies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKnownCodesCopy0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKnownCodesCopy0025 begin');
      const first: Array<number> = ErrorCenterModel.knownCodes();
      first.push(1);
      expect(ErrorCenterModel.knownCodes().length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0026
     * @tc.name      testCategorySweep0026
     * @tc.desc      every listed category only contains its own kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategorySweep0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategorySweep0026 begin');
      const keys: Array<string> = ['file_not_found', 'permission_denied', 'dlp_policy', 'storage_full',
        'invalid_argument', 'internal', 'network', 'account'];
      for (let index = 0; index < keys.length; index++) {
        const result: Array<ErrorInfo> = ErrorCenterModel.filter('', keys[index]);
        for (let item = 0; item < result.length; item++) {
          expect(result[item].category.toString()).assertEqual(keys[index]);
        }
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0027
     * @tc.name      testFilterKeywordCase0027
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterKeywordCase0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterKeywordCase0027 begin');
      expect(ErrorCenterModel.filter('d418e2', 'all').length).assertEqual(1);
      expect(ErrorCenterModel.filter('D418E2', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORMATRIX_0028
     * @tc.name      testFilterWhitespace0028
     * @tc.desc      blank keywords are treated as empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterWhitespace0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterWhitespace0028 begin');
      expect(ErrorCenterModel.filter('   ', 'all').length).assertEqual(19);
    })
  });
}
