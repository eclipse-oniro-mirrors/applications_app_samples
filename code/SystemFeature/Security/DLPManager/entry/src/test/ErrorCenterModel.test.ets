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

export default function errorCenterModelTest(): void {
  describe('ErrorCenterModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0001
     * @tc.name      testKnownCodes0001
     * @tc.desc      the curated code list is complete
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKnownCodes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKnownCodes0001 begin');
      console.info('testKnownCodes0001 begin');
      expect(ErrorCenterModel.knownCodes().length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0002
     * @tc.name      testEntries0002
     * @tc.desc      entries reflect every known code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntries0002 begin');
      console.info('testEntries0002 begin');
      const entries: Array<ErrorInfo> = ErrorCenterModel.entries();
      expect(entries.length).assertEqual(19);
      expect(entries[0].code).assertEqual(0);
      expect(entries[0].message).assertEqual('操作成功');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0003
     * @tc.name      testFilterAll0003
     * @tc.desc      an empty filter returns every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterAll0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterAll0003 begin');
      console.info('testFilterAll0003 begin');
      expect(ErrorCenterModel.filter('', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0004
     * @tc.name      testFilterDecimal0004
     * @tc.desc      decimal codes match directly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterDecimal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterDecimal0004 begin');
      console.info('testFilterDecimal0004 begin');
      const result: Array<ErrorInfo> = ErrorCenterModel.filter('13900002', 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual(13900002);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0005
     * @tc.name      testFilterHex0005
     * @tc.desc      hexadecimal codes match the formatted text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHex0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterHex0005 begin');
      console.info('testFilterHex0005 begin');
      expect(ErrorCenterModel.filter('D418E2', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0006
     * @tc.name      testFilterMessage0006
     * @tc.desc      message keywords match entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterMessage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterMessage0006 begin');
      console.info('testFilterMessage0006 begin');
      expect(ErrorCenterModel.filter('文件不存在', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0007
     * @tc.name      testFilterHint0007
     * @tc.desc      hint keywords also match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterHint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterHint0007 begin');
      console.info('testFilterHint0007 begin');
      expect(ErrorCenterModel.filter('重试', 'all').length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0008
     * @tc.name      testFilterNoResult0008
     * @tc.desc      unmatched keywords return an empty list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNoResult0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterNoResult0008 begin');
      console.info('testFilterNoResult0008 begin');
      expect(ErrorCenterModel.filter('zzz', 'all').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0009
     * @tc.name      testFilterPermission0009
     * @tc.desc      permission filters keep permission entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterPermission0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterPermission0009 begin');
      console.info('testFilterPermission0009 begin');
      const result: Array<ErrorInfo> = ErrorCenterModel.filter('', 'permission_denied');
      expect(result.length).assertEqual(3);
      for (let index = 0; index < result.length; index++) {
        expect(result[index].category).assertEqual(ErrorCategory.PERMISSION_DENIED);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0010
     * @tc.name      testFilterDlp0010
     * @tc.desc      dlp filters keep policy entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterDlp0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterDlp0010 begin');
      console.info('testFilterDlp0010 begin');
      expect(ErrorCenterModel.filter('', 'dlp_policy').length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0011
     * @tc.name      testFilterStorage0011
     * @tc.desc      storage filters keep the space entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterStorage0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterStorage0011 begin');
      console.info('testFilterStorage0011 begin');
      expect(ErrorCenterModel.filter('', 'storage_full').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0012
     * @tc.name      testFilterFile0012
     * @tc.desc      file filters keep the missing file entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterFile0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterFile0012 begin');
      console.info('testFilterFile0012 begin');
      expect(ErrorCenterModel.filter('', 'file_not_found').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0013
     * @tc.name      testFilterCombined0013
     * @tc.desc      category and keyword filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterCombined0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterCombined0013 begin');
      console.info('testFilterCombined0013 begin');
      expect(ErrorCenterModel.filter('13900002', 'permission_denied').length).assertEqual(0);
      expect(ErrorCenterModel.filter('13900012', 'permission_denied').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0014
     * @tc.name      testCategoryKeys0014
     * @tc.desc      filter chips expose five categories
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryKeys0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryKeys0014 begin');
      console.info('testCategoryKeys0014 begin');
      const keys: Array<string> = ErrorCenterModel.categoryKeys();
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('all');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0015
     * @tc.name      testCategoryLabelSuccess0015
     * @tc.desc      success category has a label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryLabelSuccess0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryLabelSuccess0015 begin');
      console.info('testCategoryLabelSuccess0015 begin');
      expect(categoryLabel(ErrorCategory.NONE)).assertEqual('成功');
      expect(categoryLabel(ErrorCategory.FILE_NOT_FOUND)).assertEqual('文件不存在');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0016
     * @tc.name      testCategoryLabelOthers0016
     * @tc.desc      remaining categories have labels
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCategoryLabelOthers0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCategoryLabelOthers0016 begin');
      console.info('testCategoryLabelOthers0016 begin');
      expect(categoryLabel(ErrorCategory.PERMISSION_DENIED)).assertEqual('权限不足');
      expect(categoryLabel(ErrorCategory.DLP_POLICY)).assertEqual('DLP 策略');
      expect(categoryLabel(ErrorCategory.UNKNOWN)).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0017
     * @tc.name      testRetryableCount0017
     * @tc.desc      retryable entries are counted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableCount0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableCount0017 begin');
      console.info('testRetryableCount0017 begin');
      expect(ErrorCenterModel.retryableCount(ErrorCenterModel.entries())).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0018
     * @tc.name      testRetryableLabel0018
     * @tc.desc      retryable labels reflect the flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableLabel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRetryableLabel0018 begin');
      console.info('testRetryableLabel0018 begin');
      expect(ErrorCenterModel.retryableLabel(lookupError(13900002))).assertEqual('不可重试');
      expect(ErrorCenterModel.retryableLabel(lookupError(13900004))).assertEqual('可重试');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0019
     * @tc.name      testFormattedCode0019
     * @tc.desc      formatted codes are zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormattedCode0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormattedCode0019 begin');
      console.info('testFormattedCode0019 begin');
      expect(ErrorCenterModel.formattedCode(lookupError(0))).assertEqual('0x00000000');
      expect(ErrorCenterModel.formattedCode(lookupError(13900002))).assertEqual('0x00D418E2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0020
     * @tc.name      testFilterCaseInsensitive0020
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterCaseInsensitive0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterCaseInsensitive0020 begin');
      console.info('testFilterCaseInsensitive0020 begin');
      expect(ErrorCenterModel.filter('d418e2', 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0021
     * @tc.name      testFilterAllPrefix0021
     * @tc.desc      the hex prefix matches every formatted code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterAllPrefix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterAllPrefix0021 begin');
      console.info('testFilterAllPrefix0021 begin');
      expect(ErrorCenterModel.filter('0x', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_ERRORCENTER_0022
     * @tc.name      testKnownCodesCopy0022
     * @tc.desc      known code lists are defensive copies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKnownCodesCopy0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKnownCodesCopy0022 begin');
      console.info('testKnownCodesCopy0022 begin');
      const first: Array<number> = ErrorCenterModel.knownCodes();
      first.push(12345);
      expect(ErrorCenterModel.knownCodes().length).assertEqual(19);
    })
  });
}
