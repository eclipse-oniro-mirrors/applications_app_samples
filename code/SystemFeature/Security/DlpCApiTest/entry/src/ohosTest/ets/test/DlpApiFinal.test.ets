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

export default function dlpApiFinalTest() {
  describe('DlpApiFinalTest', () => {
    /**
     * @tc.name   testDlpFinal0001
     * @tc.number SUB_DLP_C_API_FINAL_0001
     * @tc.desc   Verify config round trip 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0001 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0001 end');
    })

    /**
     * @tc.name   testDlpFinal0002
     * @tc.number SUB_DLP_C_API_FINAL_0002
     * @tc.desc   Verify config round trip 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0002 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0002 end');
    })

    /**
     * @tc.name   testDlpFinal0003
     * @tc.number SUB_DLP_C_API_FINAL_0003
     * @tc.desc   Verify config round trip 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0003 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0003 end');
    })

    /**
     * @tc.name   testDlpFinal0004
     * @tc.number SUB_DLP_C_API_FINAL_0004
     * @tc.desc   Verify config round trip 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0004 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0004 end');
    })

    /**
     * @tc.name   testDlpFinal0005
     * @tc.number SUB_DLP_C_API_FINAL_0005
     * @tc.desc   Verify config round trip 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0005 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0005 end');
    })

    /**
     * @tc.name   testDlpFinal0006
     * @tc.number SUB_DLP_C_API_FINAL_0006
     * @tc.desc   Verify clean result 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0006 begin');
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      const value: string | number = testNapi.GetSandboxAppConfig();
      expect(value === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0006 end');
    })

    /**
     * @tc.name   testDlpFinal0007
     * @tc.number SUB_DLP_C_API_FINAL_0007
     * @tc.desc   Verify clean result 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0007 begin');
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      const value: string | number = testNapi.GetSandboxAppConfig();
      expect(value === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0007 end');
    })

    /**
     * @tc.name   testDlpFinal0008
     * @tc.number SUB_DLP_C_API_FINAL_0008
     * @tc.desc   Verify clean result 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0008 begin');
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      const value: string | number = testNapi.GetSandboxAppConfig();
      expect(value === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0008 end');
    })

    /**
     * @tc.name   testDlpFinal0009
     * @tc.number SUB_DLP_C_API_FINAL_0009
     * @tc.desc   Verify clean result 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0009 begin');
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      const value: string | number = testNapi.GetSandboxAppConfig();
      expect(value === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0009 end');
    })

    /**
     * @tc.name   testDlpFinal0010
     * @tc.number SUB_DLP_C_API_FINAL_0010
     * @tc.desc   Verify clean result 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0010 begin');
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      const value: string | number = testNapi.GetSandboxAppConfig();
      expect(value === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0010 end');
    })

    /**
     * @tc.name   testDlpFinal0011
     * @tc.number SUB_DLP_C_API_FINAL_0011
     * @tc.desc   Verify read API trio 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0011 begin');
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0011 end');
    })

    /**
     * @tc.name   testDlpFinal0012
     * @tc.number SUB_DLP_C_API_FINAL_0012
     * @tc.desc   Verify read API trio 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0012 begin');
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0012 end');
    })

    /**
     * @tc.name   testDlpFinal0013
     * @tc.number SUB_DLP_C_API_FINAL_0013
     * @tc.desc   Verify read API trio 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0013 begin');
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0013 end');
    })

    /**
     * @tc.name   testDlpFinal0014
     * @tc.number SUB_DLP_C_API_FINAL_0014
     * @tc.desc   Verify read API trio 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0014 begin');
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0014 end');
    })

    /**
     * @tc.name   testDlpFinal0015
     * @tc.number SUB_DLP_C_API_FINAL_0015
     * @tc.desc   Verify read API trio 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0015 begin');
      expect(testNapi.GetDlpPermissionInfo()).assertEqual(19100006);
      expect(testNapi.GetOriginalFileName() === 'test.txt').assertTrue();
      expect(testNapi.IsInSandbox() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0015 end');
    })

    /**
     * @tc.name   testDlpFinal0016
     * @tc.number SUB_DLP_C_API_FINAL_0016
     * @tc.desc   Verify config cleanup 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0016 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0016 end');
    })

    /**
     * @tc.name   testDlpFinal0017
     * @tc.number SUB_DLP_C_API_FINAL_0017
     * @tc.desc   Verify config cleanup 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0017 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0017 end');
    })

    /**
     * @tc.name   testDlpFinal0018
     * @tc.number SUB_DLP_C_API_FINAL_0018
     * @tc.desc   Verify config cleanup 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0018 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0018 end');
    })

    /**
     * @tc.name   testDlpFinal0019
     * @tc.number SUB_DLP_C_API_FINAL_0019
     * @tc.desc   Verify config cleanup 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0019 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0019 end');
    })

    /**
     * @tc.name   testDlpFinal0020
     * @tc.number SUB_DLP_C_API_FINAL_0020
     * @tc.desc   Verify config cleanup 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0020 begin');
      expect(testNapi.SetSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertTrue();
      expect(testNapi.CleanSandboxAppConfig()).assertEqual(0);
      expect(testNapi.GetSandboxAppConfig() === 'configInfo').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpFinal0020 end');
    })
  })
}
