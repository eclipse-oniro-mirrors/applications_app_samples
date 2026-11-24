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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isValidEntryParams (50 cases). */
export default function isValidEntryParamsCoreTest(): void {
  describe('IsValidEntryParamsCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}IsValidEntryParamsCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}IsValidEntryParamsCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0001
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0001
     * @tc.desc      [EmptyString|expected=false] Verify isValidEntryParams((empty)) returns False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: EmptyString|expected=false; expected: False
      const actual: boolean = ChildProcessModel.isValidEntryParams('');
      expect(actual).assertFalse();
      expect(actual).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0002
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0002
     * @tc.desc      [ShortString|expected=true] Verify isValidEntryParams(a) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('a');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0003
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0003
     * @tc.desc      [ShortString|expected=true] Verify isValidEntryParams(aa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0004
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0004
     * @tc.desc      [ShortString|expected=true] Verify isValidEntryParams(aaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: ShortString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0005
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0005
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0006
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0006
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0007
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0007
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0008
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0008
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0009
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0009
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0010
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0010
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0011
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0011
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0012
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0012
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0013
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0013
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0014
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0014
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0015
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0015
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0016
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0016
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0017
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0017
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0018
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0018
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0019
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0019
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0020
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0020
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0021
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0021
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0022
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0022
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0023
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0023
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0024
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0024
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0025
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0025
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0026
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0026
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0027
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0027
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0028
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0028
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0029
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0029
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0030
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0030
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0031
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0031
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0032
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0032
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0033
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0033
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0034
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0034
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0035
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0035
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0036
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0036
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0037
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0037
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0038
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0038
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0039
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0039
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0040
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0040
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0041
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0041
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0042
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0042
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0043
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0043
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0044
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0044
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0045
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0045
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0046
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0046
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0047
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0047
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0048
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0048
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0049
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0049
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_IS_VALID_ENTRY_PARAMS_CORE_0050
     * @tc.name      ArkTsChildProcess_isValidEntryParams_Core_0050
     * @tc.desc      [PlainString|expected=true] Verify isValidEntryParams(aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) returns True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_isValidEntryParams_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: PlainString|expected=true; expected: True
      const actual: boolean = ChildProcessModel.isValidEntryParams('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      expect(actual).assertTrue();
      expect(actual).assertEqual(true);
    });

  });
}
