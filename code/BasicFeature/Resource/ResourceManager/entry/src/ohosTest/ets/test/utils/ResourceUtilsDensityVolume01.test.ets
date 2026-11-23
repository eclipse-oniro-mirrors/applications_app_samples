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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsDensityTest() {
  describe('ResourceUtilsDensityTest', () => {

    /**
     * @tc.name   testResourceUtilsDensity0001
     * @tc.number SUB_RESMGR_UTILS_01_0001
     * @tc.desc   normalizeDensity(-120) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0001 begin');
      const result: number = ResourceUtils.normalizeDensity(-120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0001 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0002
     * @tc.number SUB_RESMGR_UTILS_01_0002
     * @tc.desc   normalizeDensity(-5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0002 begin');
      const result: number = ResourceUtils.normalizeDensity(-5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0002 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0003
     * @tc.number SUB_RESMGR_UTILS_01_0003
     * @tc.desc   normalizeDensity(-1) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0003 begin');
      const result: number = ResourceUtils.normalizeDensity(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0003 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0004
     * @tc.number SUB_RESMGR_UTILS_01_0004
     * @tc.desc   normalizeDensity(0) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0004 begin');
      const result: number = ResourceUtils.normalizeDensity(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0004 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0005
     * @tc.number SUB_RESMGR_UTILS_01_0005
     * @tc.desc   normalizeDensity(0.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0005 begin');
      const result: number = ResourceUtils.normalizeDensity(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0005 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0006
     * @tc.number SUB_RESMGR_UTILS_01_0006
     * @tc.desc   normalizeDensity(1.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0006 begin');
      const result: number = ResourceUtils.normalizeDensity(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0006 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0007
     * @tc.number SUB_RESMGR_UTILS_01_0007
     * @tc.desc   normalizeDensity(8.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0007 begin');
      const result: number = ResourceUtils.normalizeDensity(8.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0007 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0008
     * @tc.number SUB_RESMGR_UTILS_01_0008
     * @tc.desc   normalizeDensity(16.2) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0008 begin');
      const result: number = ResourceUtils.normalizeDensity(16.2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0008 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0009
     * @tc.number SUB_RESMGR_UTILS_01_0009
     * @tc.desc   normalizeDensity(119.9) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0009 begin');
      const result: number = ResourceUtils.normalizeDensity(119.9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0009 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0010
     * @tc.number SUB_RESMGR_UTILS_01_0010
     * @tc.desc   normalizeDensity(121.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0010 begin');
      const result: number = ResourceUtils.normalizeDensity(121.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0010 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0011
     * @tc.number SUB_RESMGR_UTILS_01_0011
     * @tc.desc   normalizeDensity(159.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0011 begin');
      const result: number = ResourceUtils.normalizeDensity(159.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0011 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0012
     * @tc.number SUB_RESMGR_UTILS_01_0012
     * @tc.desc   normalizeDensity(160.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0012 begin');
      const result: number = ResourceUtils.normalizeDensity(160.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0012 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0013
     * @tc.number SUB_RESMGR_UTILS_01_0013
     * @tc.desc   normalizeDensity(239.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0013 begin');
      const result: number = ResourceUtils.normalizeDensity(239.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0013 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0014
     * @tc.number SUB_RESMGR_UTILS_01_0014
     * @tc.desc   normalizeDensity(320.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0014 begin');
      const result: number = ResourceUtils.normalizeDensity(320.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0014 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0015
     * @tc.number SUB_RESMGR_UTILS_01_0015
     * @tc.desc   normalizeDensity(639.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0015 begin');
      const result: number = ResourceUtils.normalizeDensity(639.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0015 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0016
     * @tc.number SUB_RESMGR_UTILS_01_0016
     * @tc.desc   normalizeDensity(640.5) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0016 begin');
      const result: number = ResourceUtils.normalizeDensity(640.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0016 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0017
     * @tc.number SUB_RESMGR_UTILS_01_0017
     * @tc.desc   normalizeDensity(1000.25) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0017 begin');
      const result: number = ResourceUtils.normalizeDensity(1000.25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0017 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0018
     * @tc.number SUB_RESMGR_UTILS_01_0018
     * @tc.desc   normalizeDensity(1) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0018 begin');
      const result: number = ResourceUtils.normalizeDensity(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0018 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0019
     * @tc.number SUB_RESMGR_UTILS_01_0019
     * @tc.desc   normalizeDensity(2) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0019 begin');
      const result: number = ResourceUtils.normalizeDensity(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0019 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0020
     * @tc.number SUB_RESMGR_UTILS_01_0020
     * @tc.desc   normalizeDensity(8) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0020 begin');
      const result: number = ResourceUtils.normalizeDensity(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0020 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0021
     * @tc.number SUB_RESMGR_UTILS_01_0021
     * @tc.desc   normalizeDensity(16) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0021 begin');
      const result: number = ResourceUtils.normalizeDensity(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0021 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0022
     * @tc.number SUB_RESMGR_UTILS_01_0022
     * @tc.desc   normalizeDensity(32) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0022 begin');
      const result: number = ResourceUtils.normalizeDensity(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0022 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0023
     * @tc.number SUB_RESMGR_UTILS_01_0023
     * @tc.desc   normalizeDensity(48) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0023 begin');
      const result: number = ResourceUtils.normalizeDensity(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0023 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0024
     * @tc.number SUB_RESMGR_UTILS_01_0024
     * @tc.desc   normalizeDensity(64) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0024 begin');
      const result: number = ResourceUtils.normalizeDensity(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0024 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0025
     * @tc.number SUB_RESMGR_UTILS_01_0025
     * @tc.desc   normalizeDensity(80) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0025 begin');
      const result: number = ResourceUtils.normalizeDensity(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0025 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0026
     * @tc.number SUB_RESMGR_UTILS_01_0026
     * @tc.desc   normalizeDensity(100) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0026 begin');
      const result: number = ResourceUtils.normalizeDensity(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0026 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0027
     * @tc.number SUB_RESMGR_UTILS_01_0027
     * @tc.desc   normalizeDensity(119) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0027 begin');
      const result: number = ResourceUtils.normalizeDensity(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0027 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0028
     * @tc.number SUB_RESMGR_UTILS_01_0028
     * @tc.desc   normalizeDensity(120) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0028 begin');
      const result: number = ResourceUtils.normalizeDensity(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0028 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0029
     * @tc.number SUB_RESMGR_UTILS_01_0029
     * @tc.desc   normalizeDensity(121) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0029 begin');
      const result: number = ResourceUtils.normalizeDensity(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0029 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0030
     * @tc.number SUB_RESMGR_UTILS_01_0030
     * @tc.desc   normalizeDensity(128) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0030 begin');
      const result: number = ResourceUtils.normalizeDensity(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0030 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0031
     * @tc.number SUB_RESMGR_UTILS_01_0031
     * @tc.desc   normalizeDensity(140) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0031 begin');
      const result: number = ResourceUtils.normalizeDensity(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0031 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0032
     * @tc.number SUB_RESMGR_UTILS_01_0032
     * @tc.desc   normalizeDensity(159) returns the bucket 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0032 begin');
      const result: number = ResourceUtils.normalizeDensity(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0032 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0033
     * @tc.number SUB_RESMGR_UTILS_01_0033
     * @tc.desc   normalizeDensity(160) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0033 begin');
      const result: number = ResourceUtils.normalizeDensity(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0033 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0034
     * @tc.number SUB_RESMGR_UTILS_01_0034
     * @tc.desc   normalizeDensity(161) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0034 begin');
      const result: number = ResourceUtils.normalizeDensity(161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0034 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0035
     * @tc.number SUB_RESMGR_UTILS_01_0035
     * @tc.desc   normalizeDensity(192) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0035 begin');
      const result: number = ResourceUtils.normalizeDensity(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0035 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0036
     * @tc.number SUB_RESMGR_UTILS_01_0036
     * @tc.desc   normalizeDensity(200) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0036 begin');
      const result: number = ResourceUtils.normalizeDensity(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0036 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0037
     * @tc.number SUB_RESMGR_UTILS_01_0037
     * @tc.desc   normalizeDensity(239) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0037 begin');
      const result: number = ResourceUtils.normalizeDensity(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0037 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0038
     * @tc.number SUB_RESMGR_UTILS_01_0038
     * @tc.desc   normalizeDensity(240) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0038 begin');
      const result: number = ResourceUtils.normalizeDensity(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0038 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0039
     * @tc.number SUB_RESMGR_UTILS_01_0039
     * @tc.desc   normalizeDensity(241) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0039 begin');
      const result: number = ResourceUtils.normalizeDensity(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0039 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0040
     * @tc.number SUB_RESMGR_UTILS_01_0040
     * @tc.desc   normalizeDensity(256) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0040 begin');
      const result: number = ResourceUtils.normalizeDensity(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0040 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0041
     * @tc.number SUB_RESMGR_UTILS_01_0041
     * @tc.desc   normalizeDensity(280) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0041 begin');
      const result: number = ResourceUtils.normalizeDensity(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0041 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0042
     * @tc.number SUB_RESMGR_UTILS_01_0042
     * @tc.desc   normalizeDensity(300) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0042 begin');
      const result: number = ResourceUtils.normalizeDensity(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0042 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0043
     * @tc.number SUB_RESMGR_UTILS_01_0043
     * @tc.desc   normalizeDensity(319) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0043 begin');
      const result: number = ResourceUtils.normalizeDensity(319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0043 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0044
     * @tc.number SUB_RESMGR_UTILS_01_0044
     * @tc.desc   normalizeDensity(320) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0044 begin');
      const result: number = ResourceUtils.normalizeDensity(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0044 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0045
     * @tc.number SUB_RESMGR_UTILS_01_0045
     * @tc.desc   normalizeDensity(321) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0045 begin');
      const result: number = ResourceUtils.normalizeDensity(321);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0045 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0046
     * @tc.number SUB_RESMGR_UTILS_01_0046
     * @tc.desc   normalizeDensity(360) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0046 begin');
      const result: number = ResourceUtils.normalizeDensity(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0046 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0047
     * @tc.number SUB_RESMGR_UTILS_01_0047
     * @tc.desc   normalizeDensity(400) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0047 begin');
      const result: number = ResourceUtils.normalizeDensity(400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0047 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0048
     * @tc.number SUB_RESMGR_UTILS_01_0048
     * @tc.desc   normalizeDensity(440) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0048 begin');
      const result: number = ResourceUtils.normalizeDensity(440);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0048 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0049
     * @tc.number SUB_RESMGR_UTILS_01_0049
     * @tc.desc   normalizeDensity(479) returns the bucket 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0049 begin');
      const result: number = ResourceUtils.normalizeDensity(479);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0049 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0050
     * @tc.number SUB_RESMGR_UTILS_01_0050
     * @tc.desc   normalizeDensity(481) returns the bucket 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0050 begin');
      const result: number = ResourceUtils.normalizeDensity(481);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0050 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0051
     * @tc.number SUB_RESMGR_UTILS_01_0051
     * @tc.desc   normalizeDensity(500) returns the bucket 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0051 begin');
      const result: number = ResourceUtils.normalizeDensity(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0051 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0052
     * @tc.number SUB_RESMGR_UTILS_01_0052
     * @tc.desc   normalizeDensity(560) returns the bucket 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0052 begin');
      const result: number = ResourceUtils.normalizeDensity(560);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0052 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0053
     * @tc.number SUB_RESMGR_UTILS_01_0053
     * @tc.desc   normalizeDensity(600) returns the bucket 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0053 begin');
      const result: number = ResourceUtils.normalizeDensity(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0053 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0054
     * @tc.number SUB_RESMGR_UTILS_01_0054
     * @tc.desc   normalizeDensity(639) returns the bucket 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0054 begin');
      const result: number = ResourceUtils.normalizeDensity(639);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0054 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0055
     * @tc.number SUB_RESMGR_UTILS_01_0055
     * @tc.desc   normalizeDensity(640) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0055 begin');
      const result: number = ResourceUtils.normalizeDensity(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0055 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0056
     * @tc.number SUB_RESMGR_UTILS_01_0056
     * @tc.desc   normalizeDensity(1024) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0056 begin');
      const result: number = ResourceUtils.normalizeDensity(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0056 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0057
     * @tc.number SUB_RESMGR_UTILS_01_0057
     * @tc.desc   normalizeDensity(1280) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0057 begin');
      const result: number = ResourceUtils.normalizeDensity(1280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0057 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0058
     * @tc.number SUB_RESMGR_UTILS_01_0058
     * @tc.desc   normalizeDensity(1536) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0058 begin');
      const result: number = ResourceUtils.normalizeDensity(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0058 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0059
     * @tc.number SUB_RESMGR_UTILS_01_0059
     * @tc.desc   normalizeDensity(1792) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0059 begin');
      const result: number = ResourceUtils.normalizeDensity(1792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0059 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0060
     * @tc.number SUB_RESMGR_UTILS_01_0060
     * @tc.desc   normalizeDensity(2048) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0060 begin');
      const result: number = ResourceUtils.normalizeDensity(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0060 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0061
     * @tc.number SUB_RESMGR_UTILS_01_0061
     * @tc.desc   normalizeDensity(2304) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0061 begin');
      const result: number = ResourceUtils.normalizeDensity(2304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0061 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0062
     * @tc.number SUB_RESMGR_UTILS_01_0062
     * @tc.desc   normalizeDensity(2560) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0062 begin');
      const result: number = ResourceUtils.normalizeDensity(2560);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0062 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0063
     * @tc.number SUB_RESMGR_UTILS_01_0063
     * @tc.desc   normalizeDensity(2816) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0063 begin');
      const result: number = ResourceUtils.normalizeDensity(2816);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0063 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0064
     * @tc.number SUB_RESMGR_UTILS_01_0064
     * @tc.desc   normalizeDensity(3072) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0064 begin');
      const result: number = ResourceUtils.normalizeDensity(3072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0064 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0065
     * @tc.number SUB_RESMGR_UTILS_01_0065
     * @tc.desc   normalizeDensity(3328) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0065 begin');
      const result: number = ResourceUtils.normalizeDensity(3328);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0065 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0066
     * @tc.number SUB_RESMGR_UTILS_01_0066
     * @tc.desc   normalizeDensity(3584) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0066 begin');
      const result: number = ResourceUtils.normalizeDensity(3584);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0066 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0067
     * @tc.number SUB_RESMGR_UTILS_01_0067
     * @tc.desc   normalizeDensity(3840) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0067 begin');
      const result: number = ResourceUtils.normalizeDensity(3840);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0067 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0068
     * @tc.number SUB_RESMGR_UTILS_01_0068
     * @tc.desc   normalizeDensity(4096) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0068 begin');
      const result: number = ResourceUtils.normalizeDensity(4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0068 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0069
     * @tc.number SUB_RESMGR_UTILS_01_0069
     * @tc.desc   normalizeDensity(4352) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0069 begin');
      const result: number = ResourceUtils.normalizeDensity(4352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0069 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0070
     * @tc.number SUB_RESMGR_UTILS_01_0070
     * @tc.desc   normalizeDensity(4608) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0070 begin');
      const result: number = ResourceUtils.normalizeDensity(4608);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0070 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0071
     * @tc.number SUB_RESMGR_UTILS_01_0071
     * @tc.desc   normalizeDensity(4864) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0071 begin');
      const result: number = ResourceUtils.normalizeDensity(4864);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0071 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0072
     * @tc.number SUB_RESMGR_UTILS_01_0072
     * @tc.desc   normalizeDensity(5120) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0072 begin');
      const result: number = ResourceUtils.normalizeDensity(5120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0072 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0073
     * @tc.number SUB_RESMGR_UTILS_01_0073
     * @tc.desc   normalizeDensity(5376) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0073 begin');
      const result: number = ResourceUtils.normalizeDensity(5376);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0073 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0074
     * @tc.number SUB_RESMGR_UTILS_01_0074
     * @tc.desc   normalizeDensity(5632) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0074 begin');
      const result: number = ResourceUtils.normalizeDensity(5632);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0074 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0075
     * @tc.number SUB_RESMGR_UTILS_01_0075
     * @tc.desc   normalizeDensity(5888) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0075 begin');
      const result: number = ResourceUtils.normalizeDensity(5888);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0075 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0076
     * @tc.number SUB_RESMGR_UTILS_01_0076
     * @tc.desc   normalizeDensity(6144) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0076 begin');
      const result: number = ResourceUtils.normalizeDensity(6144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0076 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0077
     * @tc.number SUB_RESMGR_UTILS_01_0077
     * @tc.desc   normalizeDensity(6400) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0077 begin');
      const result: number = ResourceUtils.normalizeDensity(6400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0077 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0078
     * @tc.number SUB_RESMGR_UTILS_01_0078
     * @tc.desc   normalizeDensity(6656) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0078 begin');
      const result: number = ResourceUtils.normalizeDensity(6656);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0078 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0079
     * @tc.number SUB_RESMGR_UTILS_01_0079
     * @tc.desc   normalizeDensity(6912) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0079 begin');
      const result: number = ResourceUtils.normalizeDensity(6912);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0079 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0080
     * @tc.number SUB_RESMGR_UTILS_01_0080
     * @tc.desc   normalizeDensity(7168) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0080 begin');
      const result: number = ResourceUtils.normalizeDensity(7168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0080 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0081
     * @tc.number SUB_RESMGR_UTILS_01_0081
     * @tc.desc   normalizeDensity(7424) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0081 begin');
      const result: number = ResourceUtils.normalizeDensity(7424);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0081 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0082
     * @tc.number SUB_RESMGR_UTILS_01_0082
     * @tc.desc   normalizeDensity(7680) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0082 begin');
      const result: number = ResourceUtils.normalizeDensity(7680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0082 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0083
     * @tc.number SUB_RESMGR_UTILS_01_0083
     * @tc.desc   normalizeDensity(7936) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0083 begin');
      const result: number = ResourceUtils.normalizeDensity(7936);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0083 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0084
     * @tc.number SUB_RESMGR_UTILS_01_0084
     * @tc.desc   normalizeDensity(8192) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0084 begin');
      const result: number = ResourceUtils.normalizeDensity(8192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0084 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0085
     * @tc.number SUB_RESMGR_UTILS_01_0085
     * @tc.desc   normalizeDensity(8448) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0085 begin');
      const result: number = ResourceUtils.normalizeDensity(8448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0085 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0086
     * @tc.number SUB_RESMGR_UTILS_01_0086
     * @tc.desc   normalizeDensity(8704) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0086 begin');
      const result: number = ResourceUtils.normalizeDensity(8704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0086 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0087
     * @tc.number SUB_RESMGR_UTILS_01_0087
     * @tc.desc   normalizeDensity(8960) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0087 begin');
      const result: number = ResourceUtils.normalizeDensity(8960);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0087 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0088
     * @tc.number SUB_RESMGR_UTILS_01_0088
     * @tc.desc   normalizeDensity(9216) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0088 begin');
      const result: number = ResourceUtils.normalizeDensity(9216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0088 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0089
     * @tc.number SUB_RESMGR_UTILS_01_0089
     * @tc.desc   normalizeDensity(10000) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0089 begin');
      const result: number = ResourceUtils.normalizeDensity(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0089 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0090
     * @tc.number SUB_RESMGR_UTILS_01_0090
     * @tc.desc   normalizeDensity(65535) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0090 begin');
      const result: number = ResourceUtils.normalizeDensity(65535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0090 end');
    })

    /**
     * @tc.name   testResourceUtilsDensity0091
     * @tc.number SUB_RESMGR_UTILS_01_0091
     * @tc.desc   档位空档只能向下取整，越界与非整数输入必须回落到合法档位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensity0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0091 begin');
      // 121 落在 120 与 160 的空档里，规格要求向下取 120 而不是就近 160
      const gapLow: number = ResourceUtils.normalizeDensity(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(gapLow), String(120));
      expect(gapLow).assertEqual(120);
      // 639 落在 480 与 640 的空档里，只能取 480
      const gapHigh: number = ResourceUtils.normalizeDensity(639);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(gapHigh), String(480));
      expect(gapHigh).assertEqual(480);
      // 超出最大档位后必须夹到 640，而不是原样返回
      const oversized: number = ResourceUtils.normalizeDensity(1000000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(oversized), String(640));
      expect(oversized).assertEqual(640);
      // 负数与非整数都不是合法档位，必须回落到默认 320
      const negative: number = ResourceUtils.normalizeDensity(-640);
      const fractional: number = ResourceUtils.normalizeDensity(320.0001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(negative), String(320));
      expect(negative).assertEqual(320);
      expect(fractional).assertEqual(320);
      // 归一化结果再次归一化必须保持不变，边界值也不例外
      expect(ResourceUtils.normalizeDensity(gapLow)).assertEqual(gapLow);
      expect(ResourceUtils.normalizeDensity(gapHigh)).assertEqual(gapHigh);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensity0091 end');
    })

  })
}
