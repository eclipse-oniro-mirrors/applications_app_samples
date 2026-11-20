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

export default function dlpApiVolumeTestPart01() {
  describe('DlpApiVolumePart01', () => {
    /**
     * @tc.name   testDlpVolume0001
     * @tc.number SUB_DLP_C_API_VOLUME_0001
     * @tc.desc   Verify GetDlpPermissionInfo volume case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0001 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0001 end');
    })
    /**
     * @tc.name   testDlpVolume0002
     * @tc.number SUB_DLP_C_API_VOLUME_0002
     * @tc.desc   Verify GetDlpPermissionInfo volume case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0002 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0002 end');
    })
    /**
     * @tc.name   testDlpVolume0003
     * @tc.number SUB_DLP_C_API_VOLUME_0003
     * @tc.desc   Verify GetDlpPermissionInfo volume case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0003 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0003 end');
    })
    /**
     * @tc.name   testDlpVolume0004
     * @tc.number SUB_DLP_C_API_VOLUME_0004
     * @tc.desc   Verify GetDlpPermissionInfo volume case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0004 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0004 end');
    })
    /**
     * @tc.name   testDlpVolume0005
     * @tc.number SUB_DLP_C_API_VOLUME_0005
     * @tc.desc   Verify GetDlpPermissionInfo volume case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0005 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0005 end');
    })
    /**
     * @tc.name   testDlpVolume0006
     * @tc.number SUB_DLP_C_API_VOLUME_0006
     * @tc.desc   Verify GetDlpPermissionInfo volume case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0006 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0006 end');
    })
    /**
     * @tc.name   testDlpVolume0007
     * @tc.number SUB_DLP_C_API_VOLUME_0007
     * @tc.desc   Verify GetDlpPermissionInfo volume case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0007 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0007 end');
    })
    /**
     * @tc.name   testDlpVolume0008
     * @tc.number SUB_DLP_C_API_VOLUME_0008
     * @tc.desc   Verify GetDlpPermissionInfo volume case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0008 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0008 end');
    })
    /**
     * @tc.name   testDlpVolume0009
     * @tc.number SUB_DLP_C_API_VOLUME_0009
     * @tc.desc   Verify GetDlpPermissionInfo volume case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0009 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0009 end');
    })
    /**
     * @tc.name   testDlpVolume0010
     * @tc.number SUB_DLP_C_API_VOLUME_0010
     * @tc.desc   Verify GetDlpPermissionInfo volume case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0010 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0010 end');
    })
    /**
     * @tc.name   testDlpVolume0011
     * @tc.number SUB_DLP_C_API_VOLUME_0011
     * @tc.desc   Verify GetDlpPermissionInfo volume case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0011 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0011 end');
    })
    /**
     * @tc.name   testDlpVolume0012
     * @tc.number SUB_DLP_C_API_VOLUME_0012
     * @tc.desc   Verify GetDlpPermissionInfo volume case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0012 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0012 end');
    })
    /**
     * @tc.name   testDlpVolume0013
     * @tc.number SUB_DLP_C_API_VOLUME_0013
     * @tc.desc   Verify GetDlpPermissionInfo volume case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0013 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0013 end');
    })
    /**
     * @tc.name   testDlpVolume0014
     * @tc.number SUB_DLP_C_API_VOLUME_0014
     * @tc.desc   Verify GetDlpPermissionInfo volume case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0014 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0014 end');
    })
    /**
     * @tc.name   testDlpVolume0015
     * @tc.number SUB_DLP_C_API_VOLUME_0015
     * @tc.desc   Verify GetDlpPermissionInfo volume case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0015 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0015 end');
    })
    /**
     * @tc.name   testDlpVolume0016
     * @tc.number SUB_DLP_C_API_VOLUME_0016
     * @tc.desc   Verify GetDlpPermissionInfo volume case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0016 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0016 end');
    })
    /**
     * @tc.name   testDlpVolume0017
     * @tc.number SUB_DLP_C_API_VOLUME_0017
     * @tc.desc   Verify GetDlpPermissionInfo volume case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0017 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0017 end');
    })
    /**
     * @tc.name   testDlpVolume0018
     * @tc.number SUB_DLP_C_API_VOLUME_0018
     * @tc.desc   Verify GetDlpPermissionInfo volume case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0018 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0018 end');
    })
    /**
     * @tc.name   testDlpVolume0019
     * @tc.number SUB_DLP_C_API_VOLUME_0019
     * @tc.desc   Verify GetDlpPermissionInfo volume case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0019 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0019 end');
    })
    /**
     * @tc.name   testDlpVolume0020
     * @tc.number SUB_DLP_C_API_VOLUME_0020
     * @tc.desc   Verify GetDlpPermissionInfo volume case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0020 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0020 end');
    })
    /**
     * @tc.name   testDlpVolume0021
     * @tc.number SUB_DLP_C_API_VOLUME_0021
     * @tc.desc   Verify GetDlpPermissionInfo volume case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0021 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0021 end');
    })
    /**
     * @tc.name   testDlpVolume0022
     * @tc.number SUB_DLP_C_API_VOLUME_0022
     * @tc.desc   Verify GetDlpPermissionInfo volume case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0022 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0022 end');
    })
    /**
     * @tc.name   testDlpVolume0023
     * @tc.number SUB_DLP_C_API_VOLUME_0023
     * @tc.desc   Verify GetDlpPermissionInfo volume case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0023 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0023 end');
    })
    /**
     * @tc.name   testDlpVolume0024
     * @tc.number SUB_DLP_C_API_VOLUME_0024
     * @tc.desc   Verify GetDlpPermissionInfo volume case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0024 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0024 end');
    })
    /**
     * @tc.name   testDlpVolume0025
     * @tc.number SUB_DLP_C_API_VOLUME_0025
     * @tc.desc   Verify GetDlpPermissionInfo volume case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0025 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0025 end');
    })
    /**
     * @tc.name   testDlpVolume0026
     * @tc.number SUB_DLP_C_API_VOLUME_0026
     * @tc.desc   Verify GetDlpPermissionInfo volume case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0026 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0026 end');
    })
    /**
     * @tc.name   testDlpVolume0027
     * @tc.number SUB_DLP_C_API_VOLUME_0027
     * @tc.desc   Verify GetDlpPermissionInfo volume case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0027 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0027 end');
    })
    /**
     * @tc.name   testDlpVolume0028
     * @tc.number SUB_DLP_C_API_VOLUME_0028
     * @tc.desc   Verify GetDlpPermissionInfo volume case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0028 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0028 end');
    })
    /**
     * @tc.name   testDlpVolume0029
     * @tc.number SUB_DLP_C_API_VOLUME_0029
     * @tc.desc   Verify GetDlpPermissionInfo volume case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0029 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0029 end');
    })
    /**
     * @tc.name   testDlpVolume0030
     * @tc.number SUB_DLP_C_API_VOLUME_0030
     * @tc.desc   Verify GetDlpPermissionInfo volume case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0030 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0030 end');
    })
    /**
     * @tc.name   testDlpVolume0031
     * @tc.number SUB_DLP_C_API_VOLUME_0031
     * @tc.desc   Verify GetDlpPermissionInfo volume case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0031 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0031 end');
    })
    /**
     * @tc.name   testDlpVolume0032
     * @tc.number SUB_DLP_C_API_VOLUME_0032
     * @tc.desc   Verify GetDlpPermissionInfo volume case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0032 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0032 end');
    })
    /**
     * @tc.name   testDlpVolume0033
     * @tc.number SUB_DLP_C_API_VOLUME_0033
     * @tc.desc   Verify GetDlpPermissionInfo volume case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0033 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0033 end');
    })
    /**
     * @tc.name   testDlpVolume0034
     * @tc.number SUB_DLP_C_API_VOLUME_0034
     * @tc.desc   Verify GetDlpPermissionInfo volume case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0034 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0034 end');
    })
    /**
     * @tc.name   testDlpVolume0035
     * @tc.number SUB_DLP_C_API_VOLUME_0035
     * @tc.desc   Verify GetDlpPermissionInfo volume case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0035 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0035 end');
    })
    /**
     * @tc.name   testDlpVolume0036
     * @tc.number SUB_DLP_C_API_VOLUME_0036
     * @tc.desc   Verify GetDlpPermissionInfo volume case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0036 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0036 end');
    })
    /**
     * @tc.name   testDlpVolume0037
     * @tc.number SUB_DLP_C_API_VOLUME_0037
     * @tc.desc   Verify GetDlpPermissionInfo volume case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0037 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0037 end');
    })
    /**
     * @tc.name   testDlpVolume0038
     * @tc.number SUB_DLP_C_API_VOLUME_0038
     * @tc.desc   Verify GetDlpPermissionInfo volume case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0038 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0038 end');
    })
    /**
     * @tc.name   testDlpVolume0039
     * @tc.number SUB_DLP_C_API_VOLUME_0039
     * @tc.desc   Verify GetDlpPermissionInfo volume case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0039 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0039 end');
    })
    /**
     * @tc.name   testDlpVolume0040
     * @tc.number SUB_DLP_C_API_VOLUME_0040
     * @tc.desc   Verify GetDlpPermissionInfo volume case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0040 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0040 end');
    })
    /**
     * @tc.name   testDlpVolume0041
     * @tc.number SUB_DLP_C_API_VOLUME_0041
     * @tc.desc   Verify GetDlpPermissionInfo volume case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0041 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0041 end');
    })
    /**
     * @tc.name   testDlpVolume0042
     * @tc.number SUB_DLP_C_API_VOLUME_0042
     * @tc.desc   Verify GetDlpPermissionInfo volume case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0042 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0042 end');
    })
    /**
     * @tc.name   testDlpVolume0043
     * @tc.number SUB_DLP_C_API_VOLUME_0043
     * @tc.desc   Verify GetDlpPermissionInfo volume case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0043 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0043 end');
    })
    /**
     * @tc.name   testDlpVolume0044
     * @tc.number SUB_DLP_C_API_VOLUME_0044
     * @tc.desc   Verify GetDlpPermissionInfo volume case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0044 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0044 end');
    })
    /**
     * @tc.name   testDlpVolume0045
     * @tc.number SUB_DLP_C_API_VOLUME_0045
     * @tc.desc   Verify GetDlpPermissionInfo volume case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0045 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0045 end');
    })
    /**
     * @tc.name   testDlpVolume0046
     * @tc.number SUB_DLP_C_API_VOLUME_0046
     * @tc.desc   Verify GetDlpPermissionInfo volume case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0046 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0046 end');
    })
    /**
     * @tc.name   testDlpVolume0047
     * @tc.number SUB_DLP_C_API_VOLUME_0047
     * @tc.desc   Verify GetDlpPermissionInfo volume case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0047 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0047 end');
    })
    /**
     * @tc.name   testDlpVolume0048
     * @tc.number SUB_DLP_C_API_VOLUME_0048
     * @tc.desc   Verify GetDlpPermissionInfo volume case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0048 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0048 end');
    })
    /**
     * @tc.name   testDlpVolume0049
     * @tc.number SUB_DLP_C_API_VOLUME_0049
     * @tc.desc   Verify GetDlpPermissionInfo volume case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0049 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0049 end');
    })
    /**
     * @tc.name   testDlpVolume0050
     * @tc.number SUB_DLP_C_API_VOLUME_0050
     * @tc.desc   Verify GetDlpPermissionInfo volume case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0050 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0050 end');
    })
    /**
     * @tc.name   testDlpVolume0051
     * @tc.number SUB_DLP_C_API_VOLUME_0051
     * @tc.desc   Verify GetDlpPermissionInfo volume case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0051 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0051 end');
    })
    /**
     * @tc.name   testDlpVolume0052
     * @tc.number SUB_DLP_C_API_VOLUME_0052
     * @tc.desc   Verify GetDlpPermissionInfo volume case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0052 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0052 end');
    })
    /**
     * @tc.name   testDlpVolume0053
     * @tc.number SUB_DLP_C_API_VOLUME_0053
     * @tc.desc   Verify GetDlpPermissionInfo volume case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0053 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0053 end');
    })
    /**
     * @tc.name   testDlpVolume0054
     * @tc.number SUB_DLP_C_API_VOLUME_0054
     * @tc.desc   Verify GetDlpPermissionInfo volume case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0054 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0054 end');
    })
    /**
     * @tc.name   testDlpVolume0055
     * @tc.number SUB_DLP_C_API_VOLUME_0055
     * @tc.desc   Verify GetDlpPermissionInfo volume case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0055 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0055 end');
    })
    /**
     * @tc.name   testDlpVolume0056
     * @tc.number SUB_DLP_C_API_VOLUME_0056
     * @tc.desc   Verify GetDlpPermissionInfo volume case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0056 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0056 end');
    })
    /**
     * @tc.name   testDlpVolume0057
     * @tc.number SUB_DLP_C_API_VOLUME_0057
     * @tc.desc   Verify GetDlpPermissionInfo volume case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0057 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0057 end');
    })
    /**
     * @tc.name   testDlpVolume0058
     * @tc.number SUB_DLP_C_API_VOLUME_0058
     * @tc.desc   Verify GetDlpPermissionInfo volume case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0058 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0058 end');
    })
    /**
     * @tc.name   testDlpVolume0059
     * @tc.number SUB_DLP_C_API_VOLUME_0059
     * @tc.desc   Verify GetDlpPermissionInfo volume case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0059 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0059 end');
    })
    /**
     * @tc.name   testDlpVolume0060
     * @tc.number SUB_DLP_C_API_VOLUME_0060
     * @tc.desc   Verify GetDlpPermissionInfo volume case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0060 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0060 end');
    })
    /**
     * @tc.name   testDlpVolume0061
     * @tc.number SUB_DLP_C_API_VOLUME_0061
     * @tc.desc   Verify GetDlpPermissionInfo volume case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0061 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0061 end');
    })
    /**
     * @tc.name   testDlpVolume0062
     * @tc.number SUB_DLP_C_API_VOLUME_0062
     * @tc.desc   Verify GetDlpPermissionInfo volume case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0062 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0062 end');
    })
    /**
     * @tc.name   testDlpVolume0063
     * @tc.number SUB_DLP_C_API_VOLUME_0063
     * @tc.desc   Verify GetDlpPermissionInfo volume case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0063 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0063 end');
    })
    /**
     * @tc.name   testDlpVolume0064
     * @tc.number SUB_DLP_C_API_VOLUME_0064
     * @tc.desc   Verify GetDlpPermissionInfo volume case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0064 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0064 end');
    })
    /**
     * @tc.name   testDlpVolume0065
     * @tc.number SUB_DLP_C_API_VOLUME_0065
     * @tc.desc   Verify GetDlpPermissionInfo volume case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0065 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0065 end');
    })
    /**
     * @tc.name   testDlpVolume0066
     * @tc.number SUB_DLP_C_API_VOLUME_0066
     * @tc.desc   Verify GetDlpPermissionInfo volume case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0066 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0066 end');
    })
    /**
     * @tc.name   testDlpVolume0067
     * @tc.number SUB_DLP_C_API_VOLUME_0067
     * @tc.desc   Verify GetDlpPermissionInfo volume case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0067 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0067 end');
    })
    /**
     * @tc.name   testDlpVolume0068
     * @tc.number SUB_DLP_C_API_VOLUME_0068
     * @tc.desc   Verify GetDlpPermissionInfo volume case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0068 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0068 end');
    })
    /**
     * @tc.name   testDlpVolume0069
     * @tc.number SUB_DLP_C_API_VOLUME_0069
     * @tc.desc   Verify GetDlpPermissionInfo volume case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0069 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0069 end');
    })
    /**
     * @tc.name   testDlpVolume0070
     * @tc.number SUB_DLP_C_API_VOLUME_0070
     * @tc.desc   Verify GetDlpPermissionInfo volume case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0070 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0070 end');
    })
    /**
     * @tc.name   testDlpVolume0071
     * @tc.number SUB_DLP_C_API_VOLUME_0071
     * @tc.desc   Verify GetDlpPermissionInfo volume case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0071 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0071 end');
    })
    /**
     * @tc.name   testDlpVolume0072
     * @tc.number SUB_DLP_C_API_VOLUME_0072
     * @tc.desc   Verify GetDlpPermissionInfo volume case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0072 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0072 end');
    })
    /**
     * @tc.name   testDlpVolume0073
     * @tc.number SUB_DLP_C_API_VOLUME_0073
     * @tc.desc   Verify GetDlpPermissionInfo volume case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0073 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0073 end');
    })
    /**
     * @tc.name   testDlpVolume0074
     * @tc.number SUB_DLP_C_API_VOLUME_0074
     * @tc.desc   Verify GetDlpPermissionInfo volume case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0074 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0074 end');
    })
    /**
     * @tc.name   testDlpVolume0075
     * @tc.number SUB_DLP_C_API_VOLUME_0075
     * @tc.desc   Verify GetDlpPermissionInfo volume case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0075 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0075 end');
    })
    /**
     * @tc.name   testDlpVolume0076
     * @tc.number SUB_DLP_C_API_VOLUME_0076
     * @tc.desc   Verify GetDlpPermissionInfo volume case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0076 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0076 end');
    })
    /**
     * @tc.name   testDlpVolume0077
     * @tc.number SUB_DLP_C_API_VOLUME_0077
     * @tc.desc   Verify GetDlpPermissionInfo volume case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0077 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0077 end');
    })
    /**
     * @tc.name   testDlpVolume0078
     * @tc.number SUB_DLP_C_API_VOLUME_0078
     * @tc.desc   Verify GetDlpPermissionInfo volume case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0078 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0078 end');
    })
    /**
     * @tc.name   testDlpVolume0079
     * @tc.number SUB_DLP_C_API_VOLUME_0079
     * @tc.desc   Verify GetDlpPermissionInfo volume case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0079 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0079 end');
    })
    /**
     * @tc.name   testDlpVolume0080
     * @tc.number SUB_DLP_C_API_VOLUME_0080
     * @tc.desc   Verify GetDlpPermissionInfo volume case 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0080 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0080 end');
    })
    /**
     * @tc.name   testDlpVolume0081
     * @tc.number SUB_DLP_C_API_VOLUME_0081
     * @tc.desc   Verify GetDlpPermissionInfo volume case 81.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0081 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0081 end');
    })
    /**
     * @tc.name   testDlpVolume0082
     * @tc.number SUB_DLP_C_API_VOLUME_0082
     * @tc.desc   Verify GetDlpPermissionInfo volume case 82.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0082 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0082 end');
    })
    /**
     * @tc.name   testDlpVolume0083
     * @tc.number SUB_DLP_C_API_VOLUME_0083
     * @tc.desc   Verify GetDlpPermissionInfo volume case 83.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0083 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0083 end');
    })
    /**
     * @tc.name   testDlpVolume0084
     * @tc.number SUB_DLP_C_API_VOLUME_0084
     * @tc.desc   Verify GetDlpPermissionInfo volume case 84.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0084 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0084 end');
    })
    /**
     * @tc.name   testDlpVolume0085
     * @tc.number SUB_DLP_C_API_VOLUME_0085
     * @tc.desc   Verify GetDlpPermissionInfo volume case 85.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0085 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0085 end');
    })
    /**
     * @tc.name   testDlpVolume0086
     * @tc.number SUB_DLP_C_API_VOLUME_0086
     * @tc.desc   Verify GetDlpPermissionInfo volume case 86.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0086 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0086 end');
    })
    /**
     * @tc.name   testDlpVolume0087
     * @tc.number SUB_DLP_C_API_VOLUME_0087
     * @tc.desc   Verify GetDlpPermissionInfo volume case 87.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0087 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0087 end');
    })
    /**
     * @tc.name   testDlpVolume0088
     * @tc.number SUB_DLP_C_API_VOLUME_0088
     * @tc.desc   Verify GetDlpPermissionInfo volume case 88.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0088 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0088 end');
    })
    /**
     * @tc.name   testDlpVolume0089
     * @tc.number SUB_DLP_C_API_VOLUME_0089
     * @tc.desc   Verify GetDlpPermissionInfo volume case 89.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0089 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0089 end');
    })
    /**
     * @tc.name   testDlpVolume0090
     * @tc.number SUB_DLP_C_API_VOLUME_0090
     * @tc.desc   Verify GetDlpPermissionInfo volume case 90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0090 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0090 end');
    })
    /**
     * @tc.name   testDlpVolume0091
     * @tc.number SUB_DLP_C_API_VOLUME_0091
     * @tc.desc   Verify GetDlpPermissionInfo volume case 91.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0091 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0091 end');
    })
    /**
     * @tc.name   testDlpVolume0092
     * @tc.number SUB_DLP_C_API_VOLUME_0092
     * @tc.desc   Verify GetDlpPermissionInfo volume case 92.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0092 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0092 end');
    })
    /**
     * @tc.name   testDlpVolume0093
     * @tc.number SUB_DLP_C_API_VOLUME_0093
     * @tc.desc   Verify GetDlpPermissionInfo volume case 93.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0093 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0093 end');
    })
    /**
     * @tc.name   testDlpVolume0094
     * @tc.number SUB_DLP_C_API_VOLUME_0094
     * @tc.desc   Verify GetDlpPermissionInfo volume case 94.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0094 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0094 end');
    })
    /**
     * @tc.name   testDlpVolume0095
     * @tc.number SUB_DLP_C_API_VOLUME_0095
     * @tc.desc   Verify GetDlpPermissionInfo volume case 95.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0095 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0095 end');
    })
    /**
     * @tc.name   testDlpVolume0096
     * @tc.number SUB_DLP_C_API_VOLUME_0096
     * @tc.desc   Verify GetDlpPermissionInfo volume case 96.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0096 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0096 end');
    })
    /**
     * @tc.name   testDlpVolume0097
     * @tc.number SUB_DLP_C_API_VOLUME_0097
     * @tc.desc   Verify GetDlpPermissionInfo volume case 97.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0097 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0097 end');
    })
    /**
     * @tc.name   testDlpVolume0098
     * @tc.number SUB_DLP_C_API_VOLUME_0098
     * @tc.desc   Verify GetDlpPermissionInfo volume case 98.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0098 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0098 end');
    })
    /**
     * @tc.name   testDlpVolume0099
     * @tc.number SUB_DLP_C_API_VOLUME_0099
     * @tc.desc   Verify GetDlpPermissionInfo volume case 99.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0099 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0099 end');
    })
    /**
     * @tc.name   testDlpVolume0100
     * @tc.number SUB_DLP_C_API_VOLUME_0100
     * @tc.desc   Verify GetDlpPermissionInfo volume case 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0100 begin');
      const result: number = testNapi.GetDlpPermissionInfo();
      expect(result).assertEqual(19100006);
      expect(typeof result).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0100 end');
    })
    /**
     * @tc.name   testDlpVolume0101
     * @tc.number SUB_DLP_C_API_VOLUME_0101
     * @tc.desc   Verify GetOriginalFileName volume case 101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0101 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0101 end');
    })
    /**
     * @tc.name   testDlpVolume0102
     * @tc.number SUB_DLP_C_API_VOLUME_0102
     * @tc.desc   Verify GetOriginalFileName volume case 102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0102 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0102 end');
    })
    /**
     * @tc.name   testDlpVolume0103
     * @tc.number SUB_DLP_C_API_VOLUME_0103
     * @tc.desc   Verify GetOriginalFileName volume case 103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0103 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0103 end');
    })
    /**
     * @tc.name   testDlpVolume0104
     * @tc.number SUB_DLP_C_API_VOLUME_0104
     * @tc.desc   Verify GetOriginalFileName volume case 104.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0104 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0104 end');
    })
    /**
     * @tc.name   testDlpVolume0105
     * @tc.number SUB_DLP_C_API_VOLUME_0105
     * @tc.desc   Verify GetOriginalFileName volume case 105.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0105 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0105 end');
    })
    /**
     * @tc.name   testDlpVolume0106
     * @tc.number SUB_DLP_C_API_VOLUME_0106
     * @tc.desc   Verify GetOriginalFileName volume case 106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0106 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0106 end');
    })
    /**
     * @tc.name   testDlpVolume0107
     * @tc.number SUB_DLP_C_API_VOLUME_0107
     * @tc.desc   Verify GetOriginalFileName volume case 107.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0107 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0107 end');
    })
    /**
     * @tc.name   testDlpVolume0108
     * @tc.number SUB_DLP_C_API_VOLUME_0108
     * @tc.desc   Verify GetOriginalFileName volume case 108.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0108 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0108 end');
    })
    /**
     * @tc.name   testDlpVolume0109
     * @tc.number SUB_DLP_C_API_VOLUME_0109
     * @tc.desc   Verify GetOriginalFileName volume case 109.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0109 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0109 end');
    })
    /**
     * @tc.name   testDlpVolume0110
     * @tc.number SUB_DLP_C_API_VOLUME_0110
     * @tc.desc   Verify GetOriginalFileName volume case 110.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0110 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0110 end');
    })
    /**
     * @tc.name   testDlpVolume0111
     * @tc.number SUB_DLP_C_API_VOLUME_0111
     * @tc.desc   Verify GetOriginalFileName volume case 111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0111 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0111 end');
    })
    /**
     * @tc.name   testDlpVolume0112
     * @tc.number SUB_DLP_C_API_VOLUME_0112
     * @tc.desc   Verify GetOriginalFileName volume case 112.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0112 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0112 end');
    })
    /**
     * @tc.name   testDlpVolume0113
     * @tc.number SUB_DLP_C_API_VOLUME_0113
     * @tc.desc   Verify GetOriginalFileName volume case 113.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0113 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0113 end');
    })
  })
}
