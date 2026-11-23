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

export default function resourceUtilsDensityB18Test() {
  describe('ResourceUtilsDensityB18Test', () => {

    /**
     * @tc.name   testResourceUtilsDensityB180001
     * @tc.number SUB_RESMGR_UTILS_18_0001
     * @tc.desc   normalizeDensity(200) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180001 begin');
      const result: number = ResourceUtils.normalizeDensity(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180001 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180002
     * @tc.number SUB_RESMGR_UTILS_18_0002
     * @tc.desc   normalizeDensity(201) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180002 begin');
      const result: number = ResourceUtils.normalizeDensity(201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180002 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180003
     * @tc.number SUB_RESMGR_UTILS_18_0003
     * @tc.desc   normalizeDensity(202) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180003 begin');
      const result: number = ResourceUtils.normalizeDensity(202);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180003 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180004
     * @tc.number SUB_RESMGR_UTILS_18_0004
     * @tc.desc   normalizeDensity(203) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180004 begin');
      const result: number = ResourceUtils.normalizeDensity(203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180004 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180005
     * @tc.number SUB_RESMGR_UTILS_18_0005
     * @tc.desc   normalizeDensity(204) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180005 begin');
      const result: number = ResourceUtils.normalizeDensity(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180005 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180006
     * @tc.number SUB_RESMGR_UTILS_18_0006
     * @tc.desc   normalizeDensity(205) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180006 begin');
      const result: number = ResourceUtils.normalizeDensity(205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180006 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180007
     * @tc.number SUB_RESMGR_UTILS_18_0007
     * @tc.desc   normalizeDensity(206) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180007 begin');
      const result: number = ResourceUtils.normalizeDensity(206);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180007 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180008
     * @tc.number SUB_RESMGR_UTILS_18_0008
     * @tc.desc   normalizeDensity(207) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180008 begin');
      const result: number = ResourceUtils.normalizeDensity(207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180008 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180009
     * @tc.number SUB_RESMGR_UTILS_18_0009
     * @tc.desc   normalizeDensity(208) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180009 begin');
      const result: number = ResourceUtils.normalizeDensity(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180009 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180010
     * @tc.number SUB_RESMGR_UTILS_18_0010
     * @tc.desc   normalizeDensity(209) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180010 begin');
      const result: number = ResourceUtils.normalizeDensity(209);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180010 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180011
     * @tc.number SUB_RESMGR_UTILS_18_0011
     * @tc.desc   normalizeDensity(210) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180011 begin');
      const result: number = ResourceUtils.normalizeDensity(210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180011 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180012
     * @tc.number SUB_RESMGR_UTILS_18_0012
     * @tc.desc   normalizeDensity(211) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180012 begin');
      const result: number = ResourceUtils.normalizeDensity(211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180012 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180013
     * @tc.number SUB_RESMGR_UTILS_18_0013
     * @tc.desc   normalizeDensity(212) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180013 begin');
      const result: number = ResourceUtils.normalizeDensity(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180013 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180014
     * @tc.number SUB_RESMGR_UTILS_18_0014
     * @tc.desc   normalizeDensity(213) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180014 begin');
      const result: number = ResourceUtils.normalizeDensity(213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180014 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180015
     * @tc.number SUB_RESMGR_UTILS_18_0015
     * @tc.desc   normalizeDensity(214) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180015 begin');
      const result: number = ResourceUtils.normalizeDensity(214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180015 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180016
     * @tc.number SUB_RESMGR_UTILS_18_0016
     * @tc.desc   normalizeDensity(215) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180016 begin');
      const result: number = ResourceUtils.normalizeDensity(215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180016 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180017
     * @tc.number SUB_RESMGR_UTILS_18_0017
     * @tc.desc   normalizeDensity(216) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180017 begin');
      const result: number = ResourceUtils.normalizeDensity(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180017 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180018
     * @tc.number SUB_RESMGR_UTILS_18_0018
     * @tc.desc   normalizeDensity(217) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180018 begin');
      const result: number = ResourceUtils.normalizeDensity(217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180018 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180019
     * @tc.number SUB_RESMGR_UTILS_18_0019
     * @tc.desc   normalizeDensity(218) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180019 begin');
      const result: number = ResourceUtils.normalizeDensity(218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180019 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180020
     * @tc.number SUB_RESMGR_UTILS_18_0020
     * @tc.desc   normalizeDensity(219) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180020 begin');
      const result: number = ResourceUtils.normalizeDensity(219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180020 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180021
     * @tc.number SUB_RESMGR_UTILS_18_0021
     * @tc.desc   normalizeDensity(220) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180021 begin');
      const result: number = ResourceUtils.normalizeDensity(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180021 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180022
     * @tc.number SUB_RESMGR_UTILS_18_0022
     * @tc.desc   normalizeDensity(221) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180022 begin');
      const result: number = ResourceUtils.normalizeDensity(221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180022 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180023
     * @tc.number SUB_RESMGR_UTILS_18_0023
     * @tc.desc   normalizeDensity(222) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180023 begin');
      const result: number = ResourceUtils.normalizeDensity(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180023 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180024
     * @tc.number SUB_RESMGR_UTILS_18_0024
     * @tc.desc   normalizeDensity(223) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180024 begin');
      const result: number = ResourceUtils.normalizeDensity(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180024 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180025
     * @tc.number SUB_RESMGR_UTILS_18_0025
     * @tc.desc   normalizeDensity(224) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180025 begin');
      const result: number = ResourceUtils.normalizeDensity(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180025 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180026
     * @tc.number SUB_RESMGR_UTILS_18_0026
     * @tc.desc   normalizeDensity(225) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180026 begin');
      const result: number = ResourceUtils.normalizeDensity(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180026 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180027
     * @tc.number SUB_RESMGR_UTILS_18_0027
     * @tc.desc   normalizeDensity(226) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180027 begin');
      const result: number = ResourceUtils.normalizeDensity(226);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180027 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180028
     * @tc.number SUB_RESMGR_UTILS_18_0028
     * @tc.desc   normalizeDensity(227) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180028 begin');
      const result: number = ResourceUtils.normalizeDensity(227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180028 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180029
     * @tc.number SUB_RESMGR_UTILS_18_0029
     * @tc.desc   normalizeDensity(228) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180029 begin');
      const result: number = ResourceUtils.normalizeDensity(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180029 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180030
     * @tc.number SUB_RESMGR_UTILS_18_0030
     * @tc.desc   normalizeDensity(229) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180030 begin');
      const result: number = ResourceUtils.normalizeDensity(229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180030 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180031
     * @tc.number SUB_RESMGR_UTILS_18_0031
     * @tc.desc   normalizeDensity(230) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180031 begin');
      const result: number = ResourceUtils.normalizeDensity(230);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180031 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180032
     * @tc.number SUB_RESMGR_UTILS_18_0032
     * @tc.desc   normalizeDensity(231) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180032 begin');
      const result: number = ResourceUtils.normalizeDensity(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180032 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180033
     * @tc.number SUB_RESMGR_UTILS_18_0033
     * @tc.desc   normalizeDensity(232) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180033 begin');
      const result: number = ResourceUtils.normalizeDensity(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180033 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180034
     * @tc.number SUB_RESMGR_UTILS_18_0034
     * @tc.desc   normalizeDensity(233) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180034 begin');
      const result: number = ResourceUtils.normalizeDensity(233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180034 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180035
     * @tc.number SUB_RESMGR_UTILS_18_0035
     * @tc.desc   normalizeDensity(234) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180035 begin');
      const result: number = ResourceUtils.normalizeDensity(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180035 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180036
     * @tc.number SUB_RESMGR_UTILS_18_0036
     * @tc.desc   normalizeDensity(235) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180036 begin');
      const result: number = ResourceUtils.normalizeDensity(235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180036 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180037
     * @tc.number SUB_RESMGR_UTILS_18_0037
     * @tc.desc   normalizeDensity(236) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180037 begin');
      const result: number = ResourceUtils.normalizeDensity(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180037 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180038
     * @tc.number SUB_RESMGR_UTILS_18_0038
     * @tc.desc   normalizeDensity(237) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180038 begin');
      const result: number = ResourceUtils.normalizeDensity(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180038 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180039
     * @tc.number SUB_RESMGR_UTILS_18_0039
     * @tc.desc   normalizeDensity(238) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180039 begin');
      const result: number = ResourceUtils.normalizeDensity(238);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180039 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180040
     * @tc.number SUB_RESMGR_UTILS_18_0040
     * @tc.desc   normalizeDensity(239) returns the bucket 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180040 begin');
      const result: number = ResourceUtils.normalizeDensity(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180040 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180041
     * @tc.number SUB_RESMGR_UTILS_18_0041
     * @tc.desc   normalizeDensity(240) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180041 begin');
      const result: number = ResourceUtils.normalizeDensity(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180041 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180042
     * @tc.number SUB_RESMGR_UTILS_18_0042
     * @tc.desc   normalizeDensity(241) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180042 begin');
      const result: number = ResourceUtils.normalizeDensity(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180042 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180043
     * @tc.number SUB_RESMGR_UTILS_18_0043
     * @tc.desc   normalizeDensity(242) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180043 begin');
      const result: number = ResourceUtils.normalizeDensity(242);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180043 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180044
     * @tc.number SUB_RESMGR_UTILS_18_0044
     * @tc.desc   normalizeDensity(243) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180044 begin');
      const result: number = ResourceUtils.normalizeDensity(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180044 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180045
     * @tc.number SUB_RESMGR_UTILS_18_0045
     * @tc.desc   normalizeDensity(244) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180045 begin');
      const result: number = ResourceUtils.normalizeDensity(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180045 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180046
     * @tc.number SUB_RESMGR_UTILS_18_0046
     * @tc.desc   normalizeDensity(245) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180046 begin');
      const result: number = ResourceUtils.normalizeDensity(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180046 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180047
     * @tc.number SUB_RESMGR_UTILS_18_0047
     * @tc.desc   normalizeDensity(246) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180047 begin');
      const result: number = ResourceUtils.normalizeDensity(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180047 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180048
     * @tc.number SUB_RESMGR_UTILS_18_0048
     * @tc.desc   normalizeDensity(247) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180048 begin');
      const result: number = ResourceUtils.normalizeDensity(247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180048 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180049
     * @tc.number SUB_RESMGR_UTILS_18_0049
     * @tc.desc   normalizeDensity(248) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180049 begin');
      const result: number = ResourceUtils.normalizeDensity(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180049 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180050
     * @tc.number SUB_RESMGR_UTILS_18_0050
     * @tc.desc   normalizeDensity(249) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180050 begin');
      const result: number = ResourceUtils.normalizeDensity(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180050 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180051
     * @tc.number SUB_RESMGR_UTILS_18_0051
     * @tc.desc   normalizeDensity(250) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180051 begin');
      const result: number = ResourceUtils.normalizeDensity(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180051 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180052
     * @tc.number SUB_RESMGR_UTILS_18_0052
     * @tc.desc   normalizeDensity(251) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180052 begin');
      const result: number = ResourceUtils.normalizeDensity(251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180052 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180053
     * @tc.number SUB_RESMGR_UTILS_18_0053
     * @tc.desc   normalizeDensity(252) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180053 begin');
      const result: number = ResourceUtils.normalizeDensity(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180053 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180054
     * @tc.number SUB_RESMGR_UTILS_18_0054
     * @tc.desc   normalizeDensity(253) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180054 begin');
      const result: number = ResourceUtils.normalizeDensity(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180054 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180055
     * @tc.number SUB_RESMGR_UTILS_18_0055
     * @tc.desc   normalizeDensity(254) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180055 begin');
      const result: number = ResourceUtils.normalizeDensity(254);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180055 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180056
     * @tc.number SUB_RESMGR_UTILS_18_0056
     * @tc.desc   normalizeDensity(255) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180056 begin');
      const result: number = ResourceUtils.normalizeDensity(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180056 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180057
     * @tc.number SUB_RESMGR_UTILS_18_0057
     * @tc.desc   normalizeDensity(256) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180057 begin');
      const result: number = ResourceUtils.normalizeDensity(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180057 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180058
     * @tc.number SUB_RESMGR_UTILS_18_0058
     * @tc.desc   normalizeDensity(257) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180058 begin');
      const result: number = ResourceUtils.normalizeDensity(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180058 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180059
     * @tc.number SUB_RESMGR_UTILS_18_0059
     * @tc.desc   normalizeDensity(258) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180059 begin');
      const result: number = ResourceUtils.normalizeDensity(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180059 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180060
     * @tc.number SUB_RESMGR_UTILS_18_0060
     * @tc.desc   normalizeDensity(259) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180060 begin');
      const result: number = ResourceUtils.normalizeDensity(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180060 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180061
     * @tc.number SUB_RESMGR_UTILS_18_0061
     * @tc.desc   normalizeDensity(260) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180061 begin');
      const result: number = ResourceUtils.normalizeDensity(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180061 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180062
     * @tc.number SUB_RESMGR_UTILS_18_0062
     * @tc.desc   normalizeDensity(261) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180062 begin');
      const result: number = ResourceUtils.normalizeDensity(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180062 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180063
     * @tc.number SUB_RESMGR_UTILS_18_0063
     * @tc.desc   normalizeDensity(262) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180063 begin');
      const result: number = ResourceUtils.normalizeDensity(262);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180063 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180064
     * @tc.number SUB_RESMGR_UTILS_18_0064
     * @tc.desc   normalizeDensity(263) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180064 begin');
      const result: number = ResourceUtils.normalizeDensity(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180064 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180065
     * @tc.number SUB_RESMGR_UTILS_18_0065
     * @tc.desc   normalizeDensity(264) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180065 begin');
      const result: number = ResourceUtils.normalizeDensity(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180065 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180066
     * @tc.number SUB_RESMGR_UTILS_18_0066
     * @tc.desc   normalizeDensity(265) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180066 begin');
      const result: number = ResourceUtils.normalizeDensity(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180066 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180067
     * @tc.number SUB_RESMGR_UTILS_18_0067
     * @tc.desc   normalizeDensity(266) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180067 begin');
      const result: number = ResourceUtils.normalizeDensity(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180067 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180068
     * @tc.number SUB_RESMGR_UTILS_18_0068
     * @tc.desc   normalizeDensity(267) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180068 begin');
      const result: number = ResourceUtils.normalizeDensity(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180068 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180069
     * @tc.number SUB_RESMGR_UTILS_18_0069
     * @tc.desc   normalizeDensity(268) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180069 begin');
      const result: number = ResourceUtils.normalizeDensity(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180069 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180070
     * @tc.number SUB_RESMGR_UTILS_18_0070
     * @tc.desc   normalizeDensity(269) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180070 begin');
      const result: number = ResourceUtils.normalizeDensity(269);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180070 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180071
     * @tc.number SUB_RESMGR_UTILS_18_0071
     * @tc.desc   normalizeDensity(270) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180071 begin');
      const result: number = ResourceUtils.normalizeDensity(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180071 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180072
     * @tc.number SUB_RESMGR_UTILS_18_0072
     * @tc.desc   normalizeDensity(271) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180072 begin');
      const result: number = ResourceUtils.normalizeDensity(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180072 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180073
     * @tc.number SUB_RESMGR_UTILS_18_0073
     * @tc.desc   normalizeDensity(272) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180073 begin');
      const result: number = ResourceUtils.normalizeDensity(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180073 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180074
     * @tc.number SUB_RESMGR_UTILS_18_0074
     * @tc.desc   normalizeDensity(273) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180074 begin');
      const result: number = ResourceUtils.normalizeDensity(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180074 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180075
     * @tc.number SUB_RESMGR_UTILS_18_0075
     * @tc.desc   normalizeDensity(274) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180075 begin');
      const result: number = ResourceUtils.normalizeDensity(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180075 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180076
     * @tc.number SUB_RESMGR_UTILS_18_0076
     * @tc.desc   normalizeDensity(275) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180076 begin');
      const result: number = ResourceUtils.normalizeDensity(275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180076 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180077
     * @tc.number SUB_RESMGR_UTILS_18_0077
     * @tc.desc   normalizeDensity(276) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180077 begin');
      const result: number = ResourceUtils.normalizeDensity(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180077 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180078
     * @tc.number SUB_RESMGR_UTILS_18_0078
     * @tc.desc   normalizeDensity(277) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180078 begin');
      const result: number = ResourceUtils.normalizeDensity(277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180078 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180079
     * @tc.number SUB_RESMGR_UTILS_18_0079
     * @tc.desc   normalizeDensity(278) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180079 begin');
      const result: number = ResourceUtils.normalizeDensity(278);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180079 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180080
     * @tc.number SUB_RESMGR_UTILS_18_0080
     * @tc.desc   normalizeDensity(279) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180080 begin');
      const result: number = ResourceUtils.normalizeDensity(279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180080 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180081
     * @tc.number SUB_RESMGR_UTILS_18_0081
     * @tc.desc   normalizeDensity(280) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180081 begin');
      const result: number = ResourceUtils.normalizeDensity(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180081 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180082
     * @tc.number SUB_RESMGR_UTILS_18_0082
     * @tc.desc   normalizeDensity(281) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180082 begin');
      const result: number = ResourceUtils.normalizeDensity(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180082 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180083
     * @tc.number SUB_RESMGR_UTILS_18_0083
     * @tc.desc   normalizeDensity(282) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180083 begin');
      const result: number = ResourceUtils.normalizeDensity(282);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180083 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180084
     * @tc.number SUB_RESMGR_UTILS_18_0084
     * @tc.desc   normalizeDensity(283) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180084 begin');
      const result: number = ResourceUtils.normalizeDensity(283);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180084 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180085
     * @tc.number SUB_RESMGR_UTILS_18_0085
     * @tc.desc   normalizeDensity(284) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180085 begin');
      const result: number = ResourceUtils.normalizeDensity(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180085 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180086
     * @tc.number SUB_RESMGR_UTILS_18_0086
     * @tc.desc   normalizeDensity(285) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180086 begin');
      const result: number = ResourceUtils.normalizeDensity(285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180086 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180087
     * @tc.number SUB_RESMGR_UTILS_18_0087
     * @tc.desc   normalizeDensity(286) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180087 begin');
      const result: number = ResourceUtils.normalizeDensity(286);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180087 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180088
     * @tc.number SUB_RESMGR_UTILS_18_0088
     * @tc.desc   normalizeDensity(287) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180088 begin');
      const result: number = ResourceUtils.normalizeDensity(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180088 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180089
     * @tc.number SUB_RESMGR_UTILS_18_0089
     * @tc.desc   normalizeDensity(288) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180089 begin');
      const result: number = ResourceUtils.normalizeDensity(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180089 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180090
     * @tc.number SUB_RESMGR_UTILS_18_0090
     * @tc.desc   normalizeDensity(289) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180090 begin');
      const result: number = ResourceUtils.normalizeDensity(289);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180090 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180091
     * @tc.number SUB_RESMGR_UTILS_18_0091
     * @tc.desc   normalizeDensity(290) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180091 begin');
      const result: number = ResourceUtils.normalizeDensity(290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180091 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180092
     * @tc.number SUB_RESMGR_UTILS_18_0092
     * @tc.desc   normalizeDensity(291) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180092 begin');
      const result: number = ResourceUtils.normalizeDensity(291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180092 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180093
     * @tc.number SUB_RESMGR_UTILS_18_0093
     * @tc.desc   normalizeDensity(292) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180093 begin');
      const result: number = ResourceUtils.normalizeDensity(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180093 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180094
     * @tc.number SUB_RESMGR_UTILS_18_0094
     * @tc.desc   normalizeDensity(293) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180094 begin');
      const result: number = ResourceUtils.normalizeDensity(293);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180094 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB180095
     * @tc.number SUB_RESMGR_UTILS_18_0095
     * @tc.desc   normalizeDensity(294) returns the bucket 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB180095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180095 begin');
      const result: number = ResourceUtils.normalizeDensity(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB180095 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB1896
     * @tc.number SUB_RESMGR_UTILS_18_0096
     * @tc.desc   240 与 480 档位两侧
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB1896', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB1896 begin');
      expect(ResourceUtils.normalizeDensity(239)).assertEqual(160);
      expect(ResourceUtils.normalizeDensity(240)).assertEqual(240);
      expect(ResourceUtils.normalizeDensity(241)).assertEqual(240);
      expect(ResourceUtils.normalizeDensity(480)).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB1896 end');
    })
  })
}
