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
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function dlpApiStateTest() {
  describe('DlpApiStateTest', () => {
    /**
     * @tc.name   testDlpState0001
     * @tc.number SUB_DLP_C_API_STATE_0001
     * @tc.desc   Verify set/get/clean state 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0001 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0001 end');
    })

    /**
     * @tc.name   testDlpState0002
     * @tc.number SUB_DLP_C_API_STATE_0002
     * @tc.desc   Verify set/get/clean state 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0002 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0002 end');
    })

    /**
     * @tc.name   testDlpState0003
     * @tc.number SUB_DLP_C_API_STATE_0003
     * @tc.desc   Verify set/get/clean state 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0003 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0003 end');
    })

    /**
     * @tc.name   testDlpState0004
     * @tc.number SUB_DLP_C_API_STATE_0004
     * @tc.desc   Verify set/get/clean state 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0004 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0004 end');
    })

    /**
     * @tc.name   testDlpState0005
     * @tc.number SUB_DLP_C_API_STATE_0005
     * @tc.desc   Verify set/get/clean state 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0005 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0005 end');
    })

    /**
     * @tc.name   testDlpState0006
     * @tc.number SUB_DLP_C_API_STATE_0006
     * @tc.desc   Verify set/get/clean state 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0006 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0006 end');
    })

    /**
     * @tc.name   testDlpState0007
     * @tc.number SUB_DLP_C_API_STATE_0007
     * @tc.desc   Verify set/get/clean state 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0007 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0007 end');
    })

    /**
     * @tc.name   testDlpState0008
     * @tc.number SUB_DLP_C_API_STATE_0008
     * @tc.desc   Verify set/get/clean state 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0008 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0008 end');
    })

    /**
     * @tc.name   testDlpState0009
     * @tc.number SUB_DLP_C_API_STATE_0009
     * @tc.desc   Verify set/get/clean state 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0009 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0009 end');
    })

    /**
     * @tc.name   testDlpState0010
     * @tc.number SUB_DLP_C_API_STATE_0010
     * @tc.desc   Verify set/get/clean state 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0010 begin');
      const setResult: number = testNapi.SetSandboxAppConfig();
      expect(setResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertTrue();
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0010 end');
    })

    /**
     * @tc.name   testDlpState0011
     * @tc.number SUB_DLP_C_API_STATE_0011
     * @tc.desc   Verify clean then read state 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0011 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0011 end');
    })

    /**
     * @tc.name   testDlpState0012
     * @tc.number SUB_DLP_C_API_STATE_0012
     * @tc.desc   Verify clean then read state 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0012 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0012 end');
    })

    /**
     * @tc.name   testDlpState0013
     * @tc.number SUB_DLP_C_API_STATE_0013
     * @tc.desc   Verify clean then read state 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0013 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0013 end');
    })

    /**
     * @tc.name   testDlpState0014
     * @tc.number SUB_DLP_C_API_STATE_0014
     * @tc.desc   Verify clean then read state 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0014 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0014 end');
    })

    /**
     * @tc.name   testDlpState0015
     * @tc.number SUB_DLP_C_API_STATE_0015
     * @tc.desc   Verify clean then read state 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0015 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0015 end');
    })

    /**
     * @tc.name   testDlpState0016
     * @tc.number SUB_DLP_C_API_STATE_0016
     * @tc.desc   Verify clean then read state 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0016 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0016 end');
    })

    /**
     * @tc.name   testDlpState0017
     * @tc.number SUB_DLP_C_API_STATE_0017
     * @tc.desc   Verify clean then read state 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0017 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0017 end');
    })

    /**
     * @tc.name   testDlpState0018
     * @tc.number SUB_DLP_C_API_STATE_0018
     * @tc.desc   Verify clean then read state 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0018 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0018 end');
    })

    /**
     * @tc.name   testDlpState0019
     * @tc.number SUB_DLP_C_API_STATE_0019
     * @tc.desc   Verify clean then read state 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0019 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0019 end');
    })

    /**
     * @tc.name   testDlpState0020
     * @tc.number SUB_DLP_C_API_STATE_0020
     * @tc.desc   Verify clean then read state 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0020 begin');
      const cleanResult: number = testNapi.CleanSandboxAppConfig();
      expect(cleanResult).assertEqual(0);
      const getResult: string | number = testNapi.GetSandboxAppConfig();
      expect(getResult === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0020 end');
    })

    /**
     * @tc.name   testDlpState0021
     * @tc.number SUB_DLP_C_API_STATE_0021
     * @tc.desc   Verify mixed state and read APIs 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0021 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0021 end');
    })

    /**
     * @tc.name   testDlpState0022
     * @tc.number SUB_DLP_C_API_STATE_0022
     * @tc.desc   Verify mixed state and read APIs 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0022 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0022 end');
    })

    /**
     * @tc.name   testDlpState0023
     * @tc.number SUB_DLP_C_API_STATE_0023
     * @tc.desc   Verify mixed state and read APIs 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0023 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0023 end');
    })

    /**
     * @tc.name   testDlpState0024
     * @tc.number SUB_DLP_C_API_STATE_0024
     * @tc.desc   Verify mixed state and read APIs 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0024 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0024 end');
    })

    /**
     * @tc.name   testDlpState0025
     * @tc.number SUB_DLP_C_API_STATE_0025
     * @tc.desc   Verify mixed state and read APIs 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0025 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0025 end');
    })

    /**
     * @tc.name   testDlpState0026
     * @tc.number SUB_DLP_C_API_STATE_0026
     * @tc.desc   Verify mixed state and read APIs 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0026 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0026 end');
    })

    /**
     * @tc.name   testDlpState0027
     * @tc.number SUB_DLP_C_API_STATE_0027
     * @tc.desc   Verify mixed state and read APIs 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0027 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0027 end');
    })

    /**
     * @tc.name   testDlpState0028
     * @tc.number SUB_DLP_C_API_STATE_0028
     * @tc.desc   Verify mixed state and read APIs 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0028 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0028 end');
    })

    /**
     * @tc.name   testDlpState0029
     * @tc.number SUB_DLP_C_API_STATE_0029
     * @tc.desc   Verify mixed state and read APIs 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0029 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0029 end');
    })

    /**
     * @tc.name   testDlpState0030
     * @tc.number SUB_DLP_C_API_STATE_0030
     * @tc.desc   Verify mixed state and read APIs 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0030 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpState0030 end');
    })
  })
}
