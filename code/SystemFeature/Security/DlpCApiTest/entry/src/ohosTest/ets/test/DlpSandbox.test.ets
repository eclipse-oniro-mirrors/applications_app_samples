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
import testNapi from 'libentry.so';

const NOT_IN_DLP_SANDBOX_ERROR: number = 19100006;
const EXPECTED_ORIGINAL_FILE_NAME: string = 'test.txt';
const EXPECTED_CONFIG_INFO: string = 'configInfo';
const SUCCESS_ERROR_CODE: number = 0;

export default function dlpSandboxTest() {
  describe('DlpSandboxTest', () => {

    /**
     * @tc.name   testGetDlpPermissionInfo0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0100
     * @tc.desc   Test that OH_DLP_GetDlpPermissionInfo returns error code 19100006 outside a DLP sandbox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDlpPermissionInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(NOT_IN_DLP_SANDBOX_ERROR);
      expect(result === SUCCESS_ERROR_CODE).assertFalse();
    })

    /**
     * @tc.name   testGetDlpPermissionInfoRepeat0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0200
     * @tc.desc   Test that repeated calls of OH_DLP_GetDlpPermissionInfo return the same value without side effects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDlpPermissionInfoRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const firstResult: number = testNapi.GetDlpPermissionInfo();
      const secondResult: number = testNapi.GetDlpPermissionInfo();
      expect(secondResult).assertEqual(firstResult);
    })

    /**
     * @tc.name   testGetOriginalFileName0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0300
     * @tc.desc   Test that OH_DLP_GetOriginalFileName strips the dlp suffix from test.txt.dlp and returns test.txt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginalFileName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: string | number = testNapi.GetOriginalFileName();
      expect(typeof result).assertEqual('string');
      expect(result === EXPECTED_ORIGINAL_FILE_NAME).assertTrue();
    })

    /**
     * @tc.name   testGetOriginalFileNameRepeat0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0400
     * @tc.desc   Test that repeated calls of OH_DLP_GetOriginalFileName return the same original file name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetOriginalFileNameRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const firstResult: string | number = testNapi.GetOriginalFileName();
      const secondResult: string | number = testNapi.GetOriginalFileName();
      expect(secondResult).assertEqual(firstResult);
      expect(typeof firstResult).assertEqual('string');
      expect(firstResult === EXPECTED_ORIGINAL_FILE_NAME).assertTrue();
    })

    /**
     * @tc.name   testIsInSandbox0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0500
     * @tc.desc   Test that OH_DLP_IsInSandbox returns false for an app outside a DLP sandbox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsInSandbox0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: boolean | number = testNapi.IsInSandbox();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
    })

    /**
     * @tc.name   testIsInSandboxRepeat0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0600
     * @tc.desc   Test that repeated calls of OH_DLP_IsInSandbox keep the same sandbox state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsInSandboxRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const firstResult: boolean | number = testNapi.IsInSandbox();
      const secondResult: boolean | number = testNapi.IsInSandbox();
      expect(secondResult).assertEqual(firstResult);
    })

    /**
     * @tc.name   testSetSandboxAppConfig0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0700
     * @tc.desc   Test that OH_DLP_SetSandboxAppConfig saves the config and returns success code 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSandboxAppConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result: number = testNapi.SetSandboxAppConfig();
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(SUCCESS_ERROR_CODE);
    })

    /**
     * @tc.name   testGetSandboxAppConfig0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0800
     * @tc.desc   Test that OH_DLP_GetSandboxAppConfig returns the config info configInfo after it has been set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSandboxAppConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(SUCCESS_ERROR_CODE);
      const result: string | number = testNapi.GetSandboxAppConfig();
      expect(typeof result).assertEqual('string');
      expect(result === EXPECTED_CONFIG_INFO).assertTrue();
    })

    /**
     * @tc.name   testSandboxAppConfigLifecycle0001
     * @tc.number SUB_DLP_C_API_DLPSANDBOX_0900
     * @tc.desc   Test the set-get-clean lifecycle of the sandbox app config, which must not survive the clean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSandboxAppConfigLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(SUCCESS_ERROR_CODE);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(typeof getResult).assertEqual('string');
      expect(getResult === EXPECTED_CONFIG_INFO).assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(SUCCESS_ERROR_CODE);
      const afterCleanResult: string | number = testNapi.GetSandboxAppConfig();
      expect(afterCleanResult === EXPECTED_CONFIG_INFO).assertFalse();
    })
  })
}
