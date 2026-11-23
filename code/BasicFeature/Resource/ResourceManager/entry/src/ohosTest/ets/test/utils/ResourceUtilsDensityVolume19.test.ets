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

export default function resourceUtilsDensityB19Test() {
  describe('ResourceUtilsDensityB19Test', () => {

    /**
     * @tc.name   testResourceUtilsDensityB190001
     * @tc.number SUB_RESMGR_UTILS_19_0001
     * @tc.desc   normalizeDensity(5000) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190001 begin');
      const result: number = ResourceUtils.normalizeDensity(5000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190001 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190002
     * @tc.number SUB_RESMGR_UTILS_19_0002
     * @tc.desc   normalizeDensity(5001) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190002 begin');
      const result: number = ResourceUtils.normalizeDensity(5001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190002 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190003
     * @tc.number SUB_RESMGR_UTILS_19_0003
     * @tc.desc   normalizeDensity(5002) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190003 begin');
      const result: number = ResourceUtils.normalizeDensity(5002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190003 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190004
     * @tc.number SUB_RESMGR_UTILS_19_0004
     * @tc.desc   normalizeDensity(5003) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190004 begin');
      const result: number = ResourceUtils.normalizeDensity(5003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190004 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190005
     * @tc.number SUB_RESMGR_UTILS_19_0005
     * @tc.desc   normalizeDensity(5004) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190005 begin');
      const result: number = ResourceUtils.normalizeDensity(5004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190005 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190006
     * @tc.number SUB_RESMGR_UTILS_19_0006
     * @tc.desc   normalizeDensity(5005) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190006 begin');
      const result: number = ResourceUtils.normalizeDensity(5005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190006 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190007
     * @tc.number SUB_RESMGR_UTILS_19_0007
     * @tc.desc   normalizeDensity(5006) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190007 begin');
      const result: number = ResourceUtils.normalizeDensity(5006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190007 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190008
     * @tc.number SUB_RESMGR_UTILS_19_0008
     * @tc.desc   normalizeDensity(5007) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190008 begin');
      const result: number = ResourceUtils.normalizeDensity(5007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190008 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190009
     * @tc.number SUB_RESMGR_UTILS_19_0009
     * @tc.desc   normalizeDensity(5008) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190009 begin');
      const result: number = ResourceUtils.normalizeDensity(5008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190009 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190010
     * @tc.number SUB_RESMGR_UTILS_19_0010
     * @tc.desc   normalizeDensity(5009) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190010 begin');
      const result: number = ResourceUtils.normalizeDensity(5009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190010 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190011
     * @tc.number SUB_RESMGR_UTILS_19_0011
     * @tc.desc   normalizeDensity(5010) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190011 begin');
      const result: number = ResourceUtils.normalizeDensity(5010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190011 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190012
     * @tc.number SUB_RESMGR_UTILS_19_0012
     * @tc.desc   normalizeDensity(5011) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190012 begin');
      const result: number = ResourceUtils.normalizeDensity(5011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190012 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190013
     * @tc.number SUB_RESMGR_UTILS_19_0013
     * @tc.desc   normalizeDensity(5012) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190013 begin');
      const result: number = ResourceUtils.normalizeDensity(5012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190013 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190014
     * @tc.number SUB_RESMGR_UTILS_19_0014
     * @tc.desc   normalizeDensity(5013) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190014 begin');
      const result: number = ResourceUtils.normalizeDensity(5013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190014 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190015
     * @tc.number SUB_RESMGR_UTILS_19_0015
     * @tc.desc   normalizeDensity(5014) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190015 begin');
      const result: number = ResourceUtils.normalizeDensity(5014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190015 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190016
     * @tc.number SUB_RESMGR_UTILS_19_0016
     * @tc.desc   normalizeDensity(5015) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190016 begin');
      const result: number = ResourceUtils.normalizeDensity(5015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190016 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190017
     * @tc.number SUB_RESMGR_UTILS_19_0017
     * @tc.desc   normalizeDensity(5016) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190017 begin');
      const result: number = ResourceUtils.normalizeDensity(5016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190017 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190018
     * @tc.number SUB_RESMGR_UTILS_19_0018
     * @tc.desc   normalizeDensity(5017) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190018 begin');
      const result: number = ResourceUtils.normalizeDensity(5017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190018 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190019
     * @tc.number SUB_RESMGR_UTILS_19_0019
     * @tc.desc   normalizeDensity(5018) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190019 begin');
      const result: number = ResourceUtils.normalizeDensity(5018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190019 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190020
     * @tc.number SUB_RESMGR_UTILS_19_0020
     * @tc.desc   normalizeDensity(5019) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190020 begin');
      const result: number = ResourceUtils.normalizeDensity(5019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190020 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190021
     * @tc.number SUB_RESMGR_UTILS_19_0021
     * @tc.desc   normalizeDensity(5020) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190021 begin');
      const result: number = ResourceUtils.normalizeDensity(5020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190021 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190022
     * @tc.number SUB_RESMGR_UTILS_19_0022
     * @tc.desc   normalizeDensity(5021) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190022 begin');
      const result: number = ResourceUtils.normalizeDensity(5021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190022 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190023
     * @tc.number SUB_RESMGR_UTILS_19_0023
     * @tc.desc   normalizeDensity(5022) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190023 begin');
      const result: number = ResourceUtils.normalizeDensity(5022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190023 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190024
     * @tc.number SUB_RESMGR_UTILS_19_0024
     * @tc.desc   normalizeDensity(5023) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190024 begin');
      const result: number = ResourceUtils.normalizeDensity(5023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190024 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190025
     * @tc.number SUB_RESMGR_UTILS_19_0025
     * @tc.desc   normalizeDensity(5024) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190025 begin');
      const result: number = ResourceUtils.normalizeDensity(5024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190025 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190026
     * @tc.number SUB_RESMGR_UTILS_19_0026
     * @tc.desc   normalizeDensity(5025) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190026 begin');
      const result: number = ResourceUtils.normalizeDensity(5025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190026 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190027
     * @tc.number SUB_RESMGR_UTILS_19_0027
     * @tc.desc   normalizeDensity(5026) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190027 begin');
      const result: number = ResourceUtils.normalizeDensity(5026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190027 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190028
     * @tc.number SUB_RESMGR_UTILS_19_0028
     * @tc.desc   normalizeDensity(5027) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190028 begin');
      const result: number = ResourceUtils.normalizeDensity(5027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190028 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190029
     * @tc.number SUB_RESMGR_UTILS_19_0029
     * @tc.desc   normalizeDensity(5028) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190029 begin');
      const result: number = ResourceUtils.normalizeDensity(5028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190029 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190030
     * @tc.number SUB_RESMGR_UTILS_19_0030
     * @tc.desc   normalizeDensity(5029) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190030 begin');
      const result: number = ResourceUtils.normalizeDensity(5029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190030 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190031
     * @tc.number SUB_RESMGR_UTILS_19_0031
     * @tc.desc   normalizeDensity(5030) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190031 begin');
      const result: number = ResourceUtils.normalizeDensity(5030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190031 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190032
     * @tc.number SUB_RESMGR_UTILS_19_0032
     * @tc.desc   normalizeDensity(5031) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190032 begin');
      const result: number = ResourceUtils.normalizeDensity(5031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190032 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190033
     * @tc.number SUB_RESMGR_UTILS_19_0033
     * @tc.desc   normalizeDensity(5032) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190033 begin');
      const result: number = ResourceUtils.normalizeDensity(5032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190033 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190034
     * @tc.number SUB_RESMGR_UTILS_19_0034
     * @tc.desc   normalizeDensity(5033) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190034 begin');
      const result: number = ResourceUtils.normalizeDensity(5033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190034 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190035
     * @tc.number SUB_RESMGR_UTILS_19_0035
     * @tc.desc   normalizeDensity(5034) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190035 begin');
      const result: number = ResourceUtils.normalizeDensity(5034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190035 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190036
     * @tc.number SUB_RESMGR_UTILS_19_0036
     * @tc.desc   normalizeDensity(5035) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190036 begin');
      const result: number = ResourceUtils.normalizeDensity(5035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190036 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190037
     * @tc.number SUB_RESMGR_UTILS_19_0037
     * @tc.desc   normalizeDensity(5036) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190037 begin');
      const result: number = ResourceUtils.normalizeDensity(5036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190037 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190038
     * @tc.number SUB_RESMGR_UTILS_19_0038
     * @tc.desc   normalizeDensity(5037) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190038 begin');
      const result: number = ResourceUtils.normalizeDensity(5037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190038 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190039
     * @tc.number SUB_RESMGR_UTILS_19_0039
     * @tc.desc   normalizeDensity(5038) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190039 begin');
      const result: number = ResourceUtils.normalizeDensity(5038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190039 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190040
     * @tc.number SUB_RESMGR_UTILS_19_0040
     * @tc.desc   normalizeDensity(5039) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190040 begin');
      const result: number = ResourceUtils.normalizeDensity(5039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190040 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190041
     * @tc.number SUB_RESMGR_UTILS_19_0041
     * @tc.desc   normalizeDensity(5040) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190041 begin');
      const result: number = ResourceUtils.normalizeDensity(5040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190041 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190042
     * @tc.number SUB_RESMGR_UTILS_19_0042
     * @tc.desc   normalizeDensity(5041) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190042 begin');
      const result: number = ResourceUtils.normalizeDensity(5041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190042 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190043
     * @tc.number SUB_RESMGR_UTILS_19_0043
     * @tc.desc   normalizeDensity(5042) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190043 begin');
      const result: number = ResourceUtils.normalizeDensity(5042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190043 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190044
     * @tc.number SUB_RESMGR_UTILS_19_0044
     * @tc.desc   normalizeDensity(5043) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190044 begin');
      const result: number = ResourceUtils.normalizeDensity(5043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190044 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190045
     * @tc.number SUB_RESMGR_UTILS_19_0045
     * @tc.desc   normalizeDensity(5044) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190045 begin');
      const result: number = ResourceUtils.normalizeDensity(5044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190045 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190046
     * @tc.number SUB_RESMGR_UTILS_19_0046
     * @tc.desc   normalizeDensity(5045) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190046 begin');
      const result: number = ResourceUtils.normalizeDensity(5045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190046 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190047
     * @tc.number SUB_RESMGR_UTILS_19_0047
     * @tc.desc   normalizeDensity(5046) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190047 begin');
      const result: number = ResourceUtils.normalizeDensity(5046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190047 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190048
     * @tc.number SUB_RESMGR_UTILS_19_0048
     * @tc.desc   normalizeDensity(5047) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190048 begin');
      const result: number = ResourceUtils.normalizeDensity(5047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190048 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190049
     * @tc.number SUB_RESMGR_UTILS_19_0049
     * @tc.desc   normalizeDensity(5048) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190049 begin');
      const result: number = ResourceUtils.normalizeDensity(5048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190049 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190050
     * @tc.number SUB_RESMGR_UTILS_19_0050
     * @tc.desc   normalizeDensity(5049) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190050 begin');
      const result: number = ResourceUtils.normalizeDensity(5049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190050 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190051
     * @tc.number SUB_RESMGR_UTILS_19_0051
     * @tc.desc   normalizeDensity(5050) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190051 begin');
      const result: number = ResourceUtils.normalizeDensity(5050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190051 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190052
     * @tc.number SUB_RESMGR_UTILS_19_0052
     * @tc.desc   normalizeDensity(5051) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190052 begin');
      const result: number = ResourceUtils.normalizeDensity(5051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190052 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190053
     * @tc.number SUB_RESMGR_UTILS_19_0053
     * @tc.desc   normalizeDensity(5052) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190053 begin');
      const result: number = ResourceUtils.normalizeDensity(5052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190053 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190054
     * @tc.number SUB_RESMGR_UTILS_19_0054
     * @tc.desc   normalizeDensity(5053) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190054 begin');
      const result: number = ResourceUtils.normalizeDensity(5053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190054 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190055
     * @tc.number SUB_RESMGR_UTILS_19_0055
     * @tc.desc   normalizeDensity(5054) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190055 begin');
      const result: number = ResourceUtils.normalizeDensity(5054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190055 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190056
     * @tc.number SUB_RESMGR_UTILS_19_0056
     * @tc.desc   normalizeDensity(5055) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190056 begin');
      const result: number = ResourceUtils.normalizeDensity(5055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190056 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190057
     * @tc.number SUB_RESMGR_UTILS_19_0057
     * @tc.desc   normalizeDensity(5056) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190057 begin');
      const result: number = ResourceUtils.normalizeDensity(5056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190057 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190058
     * @tc.number SUB_RESMGR_UTILS_19_0058
     * @tc.desc   normalizeDensity(5057) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190058 begin');
      const result: number = ResourceUtils.normalizeDensity(5057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190058 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190059
     * @tc.number SUB_RESMGR_UTILS_19_0059
     * @tc.desc   normalizeDensity(5058) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190059 begin');
      const result: number = ResourceUtils.normalizeDensity(5058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190059 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190060
     * @tc.number SUB_RESMGR_UTILS_19_0060
     * @tc.desc   normalizeDensity(5059) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190060 begin');
      const result: number = ResourceUtils.normalizeDensity(5059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190060 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190061
     * @tc.number SUB_RESMGR_UTILS_19_0061
     * @tc.desc   normalizeDensity(5060) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190061 begin');
      const result: number = ResourceUtils.normalizeDensity(5060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190061 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190062
     * @tc.number SUB_RESMGR_UTILS_19_0062
     * @tc.desc   normalizeDensity(5061) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190062 begin');
      const result: number = ResourceUtils.normalizeDensity(5061);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190062 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190063
     * @tc.number SUB_RESMGR_UTILS_19_0063
     * @tc.desc   normalizeDensity(5062) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190063 begin');
      const result: number = ResourceUtils.normalizeDensity(5062);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190063 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190064
     * @tc.number SUB_RESMGR_UTILS_19_0064
     * @tc.desc   normalizeDensity(5063) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190064 begin');
      const result: number = ResourceUtils.normalizeDensity(5063);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190064 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190065
     * @tc.number SUB_RESMGR_UTILS_19_0065
     * @tc.desc   normalizeDensity(5064) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190065 begin');
      const result: number = ResourceUtils.normalizeDensity(5064);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190065 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190066
     * @tc.number SUB_RESMGR_UTILS_19_0066
     * @tc.desc   normalizeDensity(5065) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190066 begin');
      const result: number = ResourceUtils.normalizeDensity(5065);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190066 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190067
     * @tc.number SUB_RESMGR_UTILS_19_0067
     * @tc.desc   normalizeDensity(5066) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190067 begin');
      const result: number = ResourceUtils.normalizeDensity(5066);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190067 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190068
     * @tc.number SUB_RESMGR_UTILS_19_0068
     * @tc.desc   normalizeDensity(5067) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190068 begin');
      const result: number = ResourceUtils.normalizeDensity(5067);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190068 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190069
     * @tc.number SUB_RESMGR_UTILS_19_0069
     * @tc.desc   normalizeDensity(5068) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190069 begin');
      const result: number = ResourceUtils.normalizeDensity(5068);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190069 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190070
     * @tc.number SUB_RESMGR_UTILS_19_0070
     * @tc.desc   normalizeDensity(5069) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190070 begin');
      const result: number = ResourceUtils.normalizeDensity(5069);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190070 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190071
     * @tc.number SUB_RESMGR_UTILS_19_0071
     * @tc.desc   normalizeDensity(5070) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190071 begin');
      const result: number = ResourceUtils.normalizeDensity(5070);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190071 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190072
     * @tc.number SUB_RESMGR_UTILS_19_0072
     * @tc.desc   normalizeDensity(5071) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190072 begin');
      const result: number = ResourceUtils.normalizeDensity(5071);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190072 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190073
     * @tc.number SUB_RESMGR_UTILS_19_0073
     * @tc.desc   normalizeDensity(5072) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190073 begin');
      const result: number = ResourceUtils.normalizeDensity(5072);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190073 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190074
     * @tc.number SUB_RESMGR_UTILS_19_0074
     * @tc.desc   normalizeDensity(5073) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190074 begin');
      const result: number = ResourceUtils.normalizeDensity(5073);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190074 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190075
     * @tc.number SUB_RESMGR_UTILS_19_0075
     * @tc.desc   normalizeDensity(5074) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190075 begin');
      const result: number = ResourceUtils.normalizeDensity(5074);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190075 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190076
     * @tc.number SUB_RESMGR_UTILS_19_0076
     * @tc.desc   normalizeDensity(5075) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190076 begin');
      const result: number = ResourceUtils.normalizeDensity(5075);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190076 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190077
     * @tc.number SUB_RESMGR_UTILS_19_0077
     * @tc.desc   normalizeDensity(5076) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190077 begin');
      const result: number = ResourceUtils.normalizeDensity(5076);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190077 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190078
     * @tc.number SUB_RESMGR_UTILS_19_0078
     * @tc.desc   normalizeDensity(5077) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190078 begin');
      const result: number = ResourceUtils.normalizeDensity(5077);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190078 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190079
     * @tc.number SUB_RESMGR_UTILS_19_0079
     * @tc.desc   normalizeDensity(5078) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190079 begin');
      const result: number = ResourceUtils.normalizeDensity(5078);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190079 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190080
     * @tc.number SUB_RESMGR_UTILS_19_0080
     * @tc.desc   normalizeDensity(5079) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190080 begin');
      const result: number = ResourceUtils.normalizeDensity(5079);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190080 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190081
     * @tc.number SUB_RESMGR_UTILS_19_0081
     * @tc.desc   normalizeDensity(5080) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190081 begin');
      const result: number = ResourceUtils.normalizeDensity(5080);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190081 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190082
     * @tc.number SUB_RESMGR_UTILS_19_0082
     * @tc.desc   normalizeDensity(5081) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190082 begin');
      const result: number = ResourceUtils.normalizeDensity(5081);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190082 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190083
     * @tc.number SUB_RESMGR_UTILS_19_0083
     * @tc.desc   normalizeDensity(5082) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190083 begin');
      const result: number = ResourceUtils.normalizeDensity(5082);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190083 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190084
     * @tc.number SUB_RESMGR_UTILS_19_0084
     * @tc.desc   normalizeDensity(5083) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190084 begin');
      const result: number = ResourceUtils.normalizeDensity(5083);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190084 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190085
     * @tc.number SUB_RESMGR_UTILS_19_0085
     * @tc.desc   normalizeDensity(5084) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190085 begin');
      const result: number = ResourceUtils.normalizeDensity(5084);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190085 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190086
     * @tc.number SUB_RESMGR_UTILS_19_0086
     * @tc.desc   normalizeDensity(5085) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190086 begin');
      const result: number = ResourceUtils.normalizeDensity(5085);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190086 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190087
     * @tc.number SUB_RESMGR_UTILS_19_0087
     * @tc.desc   normalizeDensity(5086) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190087 begin');
      const result: number = ResourceUtils.normalizeDensity(5086);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190087 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190088
     * @tc.number SUB_RESMGR_UTILS_19_0088
     * @tc.desc   normalizeDensity(5087) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190088 begin');
      const result: number = ResourceUtils.normalizeDensity(5087);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190088 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190089
     * @tc.number SUB_RESMGR_UTILS_19_0089
     * @tc.desc   normalizeDensity(5088) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190089 begin');
      const result: number = ResourceUtils.normalizeDensity(5088);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190089 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190090
     * @tc.number SUB_RESMGR_UTILS_19_0090
     * @tc.desc   normalizeDensity(5089) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190090 begin');
      const result: number = ResourceUtils.normalizeDensity(5089);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190090 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190091
     * @tc.number SUB_RESMGR_UTILS_19_0091
     * @tc.desc   normalizeDensity(5090) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190091 begin');
      const result: number = ResourceUtils.normalizeDensity(5090);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190091 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190092
     * @tc.number SUB_RESMGR_UTILS_19_0092
     * @tc.desc   normalizeDensity(5091) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190092 begin');
      const result: number = ResourceUtils.normalizeDensity(5091);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190092 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190093
     * @tc.number SUB_RESMGR_UTILS_19_0093
     * @tc.desc   normalizeDensity(5092) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190093 begin');
      const result: number = ResourceUtils.normalizeDensity(5092);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190093 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190094
     * @tc.number SUB_RESMGR_UTILS_19_0094
     * @tc.desc   normalizeDensity(5093) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190094 begin');
      const result: number = ResourceUtils.normalizeDensity(5093);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190094 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB190095
     * @tc.number SUB_RESMGR_UTILS_19_0095
     * @tc.desc   normalizeDensity(5094) returns the bucket 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB190095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190095 begin');
      const result: number = ResourceUtils.normalizeDensity(5094);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result >= 120 && result <= 640));
      expect(result >= 120 && result <= 640).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB190095 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityB1996
     * @tc.number SUB_RESMGR_UTILS_19_0096
     * @tc.desc   超出最大档位统一夹到 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityB1996', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB1996 begin');
      expect(ResourceUtils.normalizeDensity(639)).assertEqual(480);
      expect(ResourceUtils.normalizeDensity(640)).assertEqual(640);
      expect(ResourceUtils.normalizeDensity(5000)).assertEqual(640);
      expect(ResourceUtils.normalizeDensity(1)).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityB1996 end');
    })
  })
}
