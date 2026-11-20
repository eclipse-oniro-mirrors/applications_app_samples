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

export default function dlpApiReadOnlyTestPart01() {
  describe('DlpApiReadOnlyPart01', () => {
    /**
     * @tc.name   testDlpReadOnly0001
     * @tc.number SUB_DLP_C_API_READONLY_0001
     * @tc.desc   Verify GetDlpPermissionInfo single read 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0001 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0001 end');
    })
    /**
     * @tc.name   testDlpReadOnly0002
     * @tc.number SUB_DLP_C_API_READONLY_0002
     * @tc.desc   Verify GetDlpPermissionInfo single read 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0002 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0002 end');
    })
    /**
     * @tc.name   testDlpReadOnly0003
     * @tc.number SUB_DLP_C_API_READONLY_0003
     * @tc.desc   Verify GetDlpPermissionInfo single read 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0003 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0003 end');
    })
    /**
     * @tc.name   testDlpReadOnly0004
     * @tc.number SUB_DLP_C_API_READONLY_0004
     * @tc.desc   Verify GetDlpPermissionInfo single read 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0004 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0004 end');
    })
    /**
     * @tc.name   testDlpReadOnly0005
     * @tc.number SUB_DLP_C_API_READONLY_0005
     * @tc.desc   Verify GetDlpPermissionInfo single read 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0005 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0005 end');
    })
    /**
     * @tc.name   testDlpReadOnly0006
     * @tc.number SUB_DLP_C_API_READONLY_0006
     * @tc.desc   Verify GetDlpPermissionInfo single read 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0006 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0006 end');
    })
    /**
     * @tc.name   testDlpReadOnly0007
     * @tc.number SUB_DLP_C_API_READONLY_0007
     * @tc.desc   Verify GetDlpPermissionInfo single read 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0007 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0007 end');
    })
    /**
     * @tc.name   testDlpReadOnly0008
     * @tc.number SUB_DLP_C_API_READONLY_0008
     * @tc.desc   Verify GetDlpPermissionInfo single read 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0008 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0008 end');
    })
    /**
     * @tc.name   testDlpReadOnly0009
     * @tc.number SUB_DLP_C_API_READONLY_0009
     * @tc.desc   Verify GetDlpPermissionInfo single read 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0009 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0009 end');
    })
    /**
     * @tc.name   testDlpReadOnly0010
     * @tc.number SUB_DLP_C_API_READONLY_0010
     * @tc.desc   Verify GetDlpPermissionInfo single read 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0010 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0010 end');
    })
    /**
     * @tc.name   testDlpReadOnly0011
     * @tc.number SUB_DLP_C_API_READONLY_0011
     * @tc.desc   Verify GetDlpPermissionInfo single read 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0011 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0011 end');
    })
    /**
     * @tc.name   testDlpReadOnly0012
     * @tc.number SUB_DLP_C_API_READONLY_0012
     * @tc.desc   Verify GetDlpPermissionInfo single read 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0012 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0012 end');
    })
    /**
     * @tc.name   testDlpReadOnly0013
     * @tc.number SUB_DLP_C_API_READONLY_0013
     * @tc.desc   Verify GetDlpPermissionInfo single read 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0013 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0013 end');
    })
    /**
     * @tc.name   testDlpReadOnly0014
     * @tc.number SUB_DLP_C_API_READONLY_0014
     * @tc.desc   Verify GetDlpPermissionInfo single read 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0014 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0014 end');
    })
    /**
     * @tc.name   testDlpReadOnly0015
     * @tc.number SUB_DLP_C_API_READONLY_0015
     * @tc.desc   Verify GetDlpPermissionInfo single read 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0015 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0015 end');
    })
    /**
     * @tc.name   testDlpReadOnly0016
     * @tc.number SUB_DLP_C_API_READONLY_0016
     * @tc.desc   Verify GetDlpPermissionInfo single read 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0016 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0016 end');
    })
    /**
     * @tc.name   testDlpReadOnly0017
     * @tc.number SUB_DLP_C_API_READONLY_0017
     * @tc.desc   Verify GetDlpPermissionInfo single read 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0017 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0017 end');
    })
    /**
     * @tc.name   testDlpReadOnly0018
     * @tc.number SUB_DLP_C_API_READONLY_0018
     * @tc.desc   Verify GetDlpPermissionInfo single read 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0018 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0018 end');
    })
    /**
     * @tc.name   testDlpReadOnly0019
     * @tc.number SUB_DLP_C_API_READONLY_0019
     * @tc.desc   Verify GetDlpPermissionInfo single read 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0019 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0019 end');
    })
    /**
     * @tc.name   testDlpReadOnly0020
     * @tc.number SUB_DLP_C_API_READONLY_0020
     * @tc.desc   Verify GetDlpPermissionInfo single read 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0020 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0020 end');
    })
    /**
     * @tc.name   testDlpReadOnly0021
     * @tc.number SUB_DLP_C_API_READONLY_0021
     * @tc.desc   Verify GetDlpPermissionInfo single read 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0021 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0021 end');
    })
    /**
     * @tc.name   testDlpReadOnly0022
     * @tc.number SUB_DLP_C_API_READONLY_0022
     * @tc.desc   Verify GetDlpPermissionInfo single read 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0022 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0022 end');
    })
    /**
     * @tc.name   testDlpReadOnly0023
     * @tc.number SUB_DLP_C_API_READONLY_0023
     * @tc.desc   Verify GetDlpPermissionInfo single read 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0023 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0023 end');
    })
    /**
     * @tc.name   testDlpReadOnly0024
     * @tc.number SUB_DLP_C_API_READONLY_0024
     * @tc.desc   Verify GetDlpPermissionInfo single read 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0024 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0024 end');
    })
    /**
     * @tc.name   testDlpReadOnly0025
     * @tc.number SUB_DLP_C_API_READONLY_0025
     * @tc.desc   Verify GetDlpPermissionInfo single read 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0025 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0025 end');
    })
    /**
     * @tc.name   testDlpReadOnly0026
     * @tc.number SUB_DLP_C_API_READONLY_0026
     * @tc.desc   Verify GetDlpPermissionInfo single read 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0026 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0026 end');
    })
    /**
     * @tc.name   testDlpReadOnly0027
     * @tc.number SUB_DLP_C_API_READONLY_0027
     * @tc.desc   Verify GetDlpPermissionInfo single read 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0027 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0027 end');
    })
    /**
     * @tc.name   testDlpReadOnly0028
     * @tc.number SUB_DLP_C_API_READONLY_0028
     * @tc.desc   Verify GetDlpPermissionInfo single read 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0028 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0028 end');
    })
    /**
     * @tc.name   testDlpReadOnly0029
     * @tc.number SUB_DLP_C_API_READONLY_0029
     * @tc.desc   Verify GetDlpPermissionInfo single read 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0029 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0029 end');
    })
    /**
     * @tc.name   testDlpReadOnly0030
     * @tc.number SUB_DLP_C_API_READONLY_0030
     * @tc.desc   Verify GetDlpPermissionInfo single read 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0030 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0030 end');
    })
    /**
     * @tc.name   testDlpReadOnly0031
     * @tc.number SUB_DLP_C_API_READONLY_0031
     * @tc.desc   Verify GetDlpPermissionInfo single read 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0031 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0031 end');
    })
    /**
     * @tc.name   testDlpReadOnly0032
     * @tc.number SUB_DLP_C_API_READONLY_0032
     * @tc.desc   Verify GetDlpPermissionInfo single read 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0032 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0032 end');
    })
    /**
     * @tc.name   testDlpReadOnly0033
     * @tc.number SUB_DLP_C_API_READONLY_0033
     * @tc.desc   Verify GetDlpPermissionInfo single read 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0033 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0033 end');
    })
    /**
     * @tc.name   testDlpReadOnly0034
     * @tc.number SUB_DLP_C_API_READONLY_0034
     * @tc.desc   Verify GetDlpPermissionInfo single read 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0034 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0034 end');
    })
    /**
     * @tc.name   testDlpReadOnly0035
     * @tc.number SUB_DLP_C_API_READONLY_0035
     * @tc.desc   Verify GetDlpPermissionInfo single read 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0035 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0035 end');
    })
    /**
     * @tc.name   testDlpReadOnly0036
     * @tc.number SUB_DLP_C_API_READONLY_0036
     * @tc.desc   Verify GetDlpPermissionInfo single read 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0036 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0036 end');
    })
    /**
     * @tc.name   testDlpReadOnly0037
     * @tc.number SUB_DLP_C_API_READONLY_0037
     * @tc.desc   Verify GetDlpPermissionInfo single read 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0037 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0037 end');
    })
    /**
     * @tc.name   testDlpReadOnly0038
     * @tc.number SUB_DLP_C_API_READONLY_0038
     * @tc.desc   Verify GetDlpPermissionInfo single read 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0038 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0038 end');
    })
    /**
     * @tc.name   testDlpReadOnly0039
     * @tc.number SUB_DLP_C_API_READONLY_0039
     * @tc.desc   Verify GetDlpPermissionInfo single read 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0039 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0039 end');
    })
    /**
     * @tc.name   testDlpReadOnly0040
     * @tc.number SUB_DLP_C_API_READONLY_0040
     * @tc.desc   Verify GetDlpPermissionInfo single read 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0040 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0040 end');
    })
    /**
     * @tc.name   testDlpReadOnly0041
     * @tc.number SUB_DLP_C_API_READONLY_0041
     * @tc.desc   Verify GetOriginalFileName single read 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0041 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0041 end');
    })
    /**
     * @tc.name   testDlpReadOnly0042
     * @tc.number SUB_DLP_C_API_READONLY_0042
     * @tc.desc   Verify GetOriginalFileName single read 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0042 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0042 end');
    })
    /**
     * @tc.name   testDlpReadOnly0043
     * @tc.number SUB_DLP_C_API_READONLY_0043
     * @tc.desc   Verify GetOriginalFileName single read 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0043 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0043 end');
    })
    /**
     * @tc.name   testDlpReadOnly0044
     * @tc.number SUB_DLP_C_API_READONLY_0044
     * @tc.desc   Verify GetOriginalFileName single read 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0044 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0044 end');
    })
    /**
     * @tc.name   testDlpReadOnly0045
     * @tc.number SUB_DLP_C_API_READONLY_0045
     * @tc.desc   Verify GetOriginalFileName single read 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0045 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0045 end');
    })
    /**
     * @tc.name   testDlpReadOnly0046
     * @tc.number SUB_DLP_C_API_READONLY_0046
     * @tc.desc   Verify GetOriginalFileName single read 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0046 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0046 end');
    })
    /**
     * @tc.name   testDlpReadOnly0047
     * @tc.number SUB_DLP_C_API_READONLY_0047
     * @tc.desc   Verify GetOriginalFileName single read 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0047 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0047 end');
    })
    /**
     * @tc.name   testDlpReadOnly0048
     * @tc.number SUB_DLP_C_API_READONLY_0048
     * @tc.desc   Verify GetOriginalFileName single read 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0048 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0048 end');
    })
    /**
     * @tc.name   testDlpReadOnly0049
     * @tc.number SUB_DLP_C_API_READONLY_0049
     * @tc.desc   Verify GetOriginalFileName single read 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0049 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0049 end');
    })
    /**
     * @tc.name   testDlpReadOnly0050
     * @tc.number SUB_DLP_C_API_READONLY_0050
     * @tc.desc   Verify GetOriginalFileName single read 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0050 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0050 end');
    })
    /**
     * @tc.name   testDlpReadOnly0051
     * @tc.number SUB_DLP_C_API_READONLY_0051
     * @tc.desc   Verify GetOriginalFileName single read 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0051 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0051 end');
    })
    /**
     * @tc.name   testDlpReadOnly0052
     * @tc.number SUB_DLP_C_API_READONLY_0052
     * @tc.desc   Verify GetOriginalFileName single read 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0052 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0052 end');
    })
    /**
     * @tc.name   testDlpReadOnly0053
     * @tc.number SUB_DLP_C_API_READONLY_0053
     * @tc.desc   Verify GetOriginalFileName single read 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0053 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0053 end');
    })
    /**
     * @tc.name   testDlpReadOnly0054
     * @tc.number SUB_DLP_C_API_READONLY_0054
     * @tc.desc   Verify GetOriginalFileName single read 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0054 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0054 end');
    })
    /**
     * @tc.name   testDlpReadOnly0055
     * @tc.number SUB_DLP_C_API_READONLY_0055
     * @tc.desc   Verify GetOriginalFileName single read 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0055 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0055 end');
    })
    /**
     * @tc.name   testDlpReadOnly0056
     * @tc.number SUB_DLP_C_API_READONLY_0056
     * @tc.desc   Verify GetOriginalFileName single read 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0056 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0056 end');
    })
    /**
     * @tc.name   testDlpReadOnly0057
     * @tc.number SUB_DLP_C_API_READONLY_0057
     * @tc.desc   Verify GetOriginalFileName single read 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0057 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0057 end');
    })
    /**
     * @tc.name   testDlpReadOnly0058
     * @tc.number SUB_DLP_C_API_READONLY_0058
     * @tc.desc   Verify GetOriginalFileName single read 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0058 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0058 end');
    })
    /**
     * @tc.name   testDlpReadOnly0059
     * @tc.number SUB_DLP_C_API_READONLY_0059
     * @tc.desc   Verify GetOriginalFileName single read 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0059 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0059 end');
    })
    /**
     * @tc.name   testDlpReadOnly0060
     * @tc.number SUB_DLP_C_API_READONLY_0060
     * @tc.desc   Verify GetOriginalFileName single read 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0060 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0060 end');
    })
    /**
     * @tc.name   testDlpReadOnly0061
     * @tc.number SUB_DLP_C_API_READONLY_0061
     * @tc.desc   Verify GetOriginalFileName single read 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0061 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0061 end');
    })
    /**
     * @tc.name   testDlpReadOnly0062
     * @tc.number SUB_DLP_C_API_READONLY_0062
     * @tc.desc   Verify GetOriginalFileName single read 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0062 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0062 end');
    })
    /**
     * @tc.name   testDlpReadOnly0063
     * @tc.number SUB_DLP_C_API_READONLY_0063
     * @tc.desc   Verify GetOriginalFileName single read 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0063 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0063 end');
    })
    /**
     * @tc.name   testDlpReadOnly0064
     * @tc.number SUB_DLP_C_API_READONLY_0064
     * @tc.desc   Verify GetOriginalFileName single read 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0064 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0064 end');
    })
    /**
     * @tc.name   testDlpReadOnly0065
     * @tc.number SUB_DLP_C_API_READONLY_0065
     * @tc.desc   Verify GetOriginalFileName single read 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0065 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0065 end');
    })
    /**
     * @tc.name   testDlpReadOnly0066
     * @tc.number SUB_DLP_C_API_READONLY_0066
     * @tc.desc   Verify GetOriginalFileName single read 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0066 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0066 end');
    })
    /**
     * @tc.name   testDlpReadOnly0067
     * @tc.number SUB_DLP_C_API_READONLY_0067
     * @tc.desc   Verify GetOriginalFileName single read 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0067 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0067 end');
    })
    /**
     * @tc.name   testDlpReadOnly0068
     * @tc.number SUB_DLP_C_API_READONLY_0068
     * @tc.desc   Verify GetOriginalFileName single read 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0068 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0068 end');
    })
    /**
     * @tc.name   testDlpReadOnly0069
     * @tc.number SUB_DLP_C_API_READONLY_0069
     * @tc.desc   Verify GetOriginalFileName single read 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0069 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0069 end');
    })
    /**
     * @tc.name   testDlpReadOnly0070
     * @tc.number SUB_DLP_C_API_READONLY_0070
     * @tc.desc   Verify GetOriginalFileName single read 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0070 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0070 end');
    })
    /**
     * @tc.name   testDlpReadOnly0071
     * @tc.number SUB_DLP_C_API_READONLY_0071
     * @tc.desc   Verify GetOriginalFileName single read 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0071 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0071 end');
    })
    /**
     * @tc.name   testDlpReadOnly0072
     * @tc.number SUB_DLP_C_API_READONLY_0072
     * @tc.desc   Verify GetOriginalFileName single read 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0072 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0072 end');
    })
    /**
     * @tc.name   testDlpReadOnly0073
     * @tc.number SUB_DLP_C_API_READONLY_0073
     * @tc.desc   Verify GetOriginalFileName single read 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0073 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0073 end');
    })
    /**
     * @tc.name   testDlpReadOnly0074
     * @tc.number SUB_DLP_C_API_READONLY_0074
     * @tc.desc   Verify GetOriginalFileName single read 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0074 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0074 end');
    })
    /**
     * @tc.name   testDlpReadOnly0075
     * @tc.number SUB_DLP_C_API_READONLY_0075
     * @tc.desc   Verify GetOriginalFileName single read 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0075 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0075 end');
    })
    /**
     * @tc.name   testDlpReadOnly0076
     * @tc.number SUB_DLP_C_API_READONLY_0076
     * @tc.desc   Verify GetOriginalFileName single read 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0076 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0076 end');
    })
    /**
     * @tc.name   testDlpReadOnly0077
     * @tc.number SUB_DLP_C_API_READONLY_0077
     * @tc.desc   Verify GetOriginalFileName single read 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0077 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0077 end');
    })
    /**
     * @tc.name   testDlpReadOnly0078
     * @tc.number SUB_DLP_C_API_READONLY_0078
     * @tc.desc   Verify GetOriginalFileName single read 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0078 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0078 end');
    })
    /**
     * @tc.name   testDlpReadOnly0079
     * @tc.number SUB_DLP_C_API_READONLY_0079
     * @tc.desc   Verify GetOriginalFileName single read 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0079 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0079 end');
    })
    /**
     * @tc.name   testDlpReadOnly0080
     * @tc.number SUB_DLP_C_API_READONLY_0080
     * @tc.desc   Verify GetOriginalFileName single read 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0080 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0080 end');
    })
    /**
     * @tc.name   testDlpReadOnly0081
     * @tc.number SUB_DLP_C_API_READONLY_0081
     * @tc.desc   Verify IsInSandbox single read 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0081 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0081 end');
    })
    /**
     * @tc.name   testDlpReadOnly0082
     * @tc.number SUB_DLP_C_API_READONLY_0082
     * @tc.desc   Verify IsInSandbox single read 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0082 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0082 end');
    })
    /**
     * @tc.name   testDlpReadOnly0083
     * @tc.number SUB_DLP_C_API_READONLY_0083
     * @tc.desc   Verify IsInSandbox single read 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0083 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0083 end');
    })
    /**
     * @tc.name   testDlpReadOnly0084
     * @tc.number SUB_DLP_C_API_READONLY_0084
     * @tc.desc   Verify IsInSandbox single read 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0084 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0084 end');
    })
    /**
     * @tc.name   testDlpReadOnly0085
     * @tc.number SUB_DLP_C_API_READONLY_0085
     * @tc.desc   Verify IsInSandbox single read 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0085 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0085 end');
    })
    /**
     * @tc.name   testDlpReadOnly0086
     * @tc.number SUB_DLP_C_API_READONLY_0086
     * @tc.desc   Verify IsInSandbox single read 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0086 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0086 end');
    })
    /**
     * @tc.name   testDlpReadOnly0087
     * @tc.number SUB_DLP_C_API_READONLY_0087
     * @tc.desc   Verify IsInSandbox single read 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0087 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0087 end');
    })
    /**
     * @tc.name   testDlpReadOnly0088
     * @tc.number SUB_DLP_C_API_READONLY_0088
     * @tc.desc   Verify IsInSandbox single read 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0088 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0088 end');
    })
    /**
     * @tc.name   testDlpReadOnly0089
     * @tc.number SUB_DLP_C_API_READONLY_0089
     * @tc.desc   Verify IsInSandbox single read 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0089 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0089 end');
    })
    /**
     * @tc.name   testDlpReadOnly0090
     * @tc.number SUB_DLP_C_API_READONLY_0090
     * @tc.desc   Verify IsInSandbox single read 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0090 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0090 end');
    })
    /**
     * @tc.name   testDlpReadOnly0091
     * @tc.number SUB_DLP_C_API_READONLY_0091
     * @tc.desc   Verify IsInSandbox single read 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0091 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0091 end');
    })
    /**
     * @tc.name   testDlpReadOnly0092
     * @tc.number SUB_DLP_C_API_READONLY_0092
     * @tc.desc   Verify IsInSandbox single read 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0092 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0092 end');
    })
    /**
     * @tc.name   testDlpReadOnly0093
     * @tc.number SUB_DLP_C_API_READONLY_0093
     * @tc.desc   Verify IsInSandbox single read 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0093 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0093 end');
    })
    /**
     * @tc.name   testDlpReadOnly0094
     * @tc.number SUB_DLP_C_API_READONLY_0094
     * @tc.desc   Verify IsInSandbox single read 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0094 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0094 end');
    })
    /**
     * @tc.name   testDlpReadOnly0095
     * @tc.number SUB_DLP_C_API_READONLY_0095
     * @tc.desc   Verify IsInSandbox single read 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0095 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0095 end');
    })
    /**
     * @tc.name   testDlpReadOnly0096
     * @tc.number SUB_DLP_C_API_READONLY_0096
     * @tc.desc   Verify IsInSandbox single read 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0096 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0096 end');
    })
    /**
     * @tc.name   testDlpReadOnly0097
     * @tc.number SUB_DLP_C_API_READONLY_0097
     * @tc.desc   Verify IsInSandbox single read 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0097 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0097 end');
    })
    /**
     * @tc.name   testDlpReadOnly0098
     * @tc.number SUB_DLP_C_API_READONLY_0098
     * @tc.desc   Verify IsInSandbox single read 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0098 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0098 end');
    })
    /**
     * @tc.name   testDlpReadOnly0099
     * @tc.number SUB_DLP_C_API_READONLY_0099
     * @tc.desc   Verify IsInSandbox single read 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0099 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0099 end');
    })
    /**
     * @tc.name   testDlpReadOnly0100
     * @tc.number SUB_DLP_C_API_READONLY_0100
     * @tc.desc   Verify IsInSandbox single read 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0100 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0100 end');
    })
    /**
     * @tc.name   testDlpReadOnly0101
     * @tc.number SUB_DLP_C_API_READONLY_0101
     * @tc.desc   Verify IsInSandbox single read 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0101 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0101 end');
    })
    /**
     * @tc.name   testDlpReadOnly0102
     * @tc.number SUB_DLP_C_API_READONLY_0102
     * @tc.desc   Verify IsInSandbox single read 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0102 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0102 end');
    })
    /**
     * @tc.name   testDlpReadOnly0103
     * @tc.number SUB_DLP_C_API_READONLY_0103
     * @tc.desc   Verify IsInSandbox single read 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0103 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0103 end');
    })
    /**
     * @tc.name   testDlpReadOnly0104
     * @tc.number SUB_DLP_C_API_READONLY_0104
     * @tc.desc   Verify IsInSandbox single read 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0104 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0104 end');
    })
    /**
     * @tc.name   testDlpReadOnly0105
     * @tc.number SUB_DLP_C_API_READONLY_0105
     * @tc.desc   Verify IsInSandbox single read 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0105 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0105 end');
    })
    /**
     * @tc.name   testDlpReadOnly0106
     * @tc.number SUB_DLP_C_API_READONLY_0106
     * @tc.desc   Verify IsInSandbox single read 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0106 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0106 end');
    })
    /**
     * @tc.name   testDlpReadOnly0107
     * @tc.number SUB_DLP_C_API_READONLY_0107
     * @tc.desc   Verify IsInSandbox single read 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0107 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0107 end');
    })
    /**
     * @tc.name   testDlpReadOnly0108
     * @tc.number SUB_DLP_C_API_READONLY_0108
     * @tc.desc   Verify IsInSandbox single read 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0108 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0108 end');
    })
    /**
     * @tc.name   testDlpReadOnly0109
     * @tc.number SUB_DLP_C_API_READONLY_0109
     * @tc.desc   Verify IsInSandbox single read 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0109 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0109 end');
    })
    /**
     * @tc.name   testDlpReadOnly0110
     * @tc.number SUB_DLP_C_API_READONLY_0110
     * @tc.desc   Verify IsInSandbox single read 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0110 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0110 end');
    })
    /**
     * @tc.name   testDlpReadOnly0111
     * @tc.number SUB_DLP_C_API_READONLY_0111
     * @tc.desc   Verify IsInSandbox single read 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0111 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0111 end');
    })
    /**
     * @tc.name   testDlpReadOnly0112
     * @tc.number SUB_DLP_C_API_READONLY_0112
     * @tc.desc   Verify IsInSandbox single read 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0112 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0112 end');
    })
    /**
     * @tc.name   testDlpReadOnly0113
     * @tc.number SUB_DLP_C_API_READONLY_0113
     * @tc.desc   Verify IsInSandbox single read 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpReadOnly0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0113 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpReadOnly0113 end');
    })
  })
}
