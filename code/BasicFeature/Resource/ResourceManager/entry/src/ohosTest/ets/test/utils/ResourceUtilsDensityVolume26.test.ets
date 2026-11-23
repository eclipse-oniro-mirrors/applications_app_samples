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

export default function resourceUtilsDensityV26Test() {
  describe('ResourceUtilsDensityV26Test', () => {

    /**
     * @tc.name   testResourceUtilsDensityV260001
     * @tc.number SUB_RESMGR_UTILS26_0001
     * @tc.desc   请求密度 7 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260001 begin');
      const result: number = ResourceUtils.normalizeDensity(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(7) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(7) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260001 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260002
     * @tc.number SUB_RESMGR_UTILS26_0002
     * @tc.desc   请求密度 14 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260002 begin');
      const result: number = ResourceUtils.normalizeDensity(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(14) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(14) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260002 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260003
     * @tc.number SUB_RESMGR_UTILS26_0003
     * @tc.desc   请求密度 21 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260003 begin');
      const result: number = ResourceUtils.normalizeDensity(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(21) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(21) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260003 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260004
     * @tc.number SUB_RESMGR_UTILS26_0004
     * @tc.desc   请求密度 28 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260004 begin');
      const result: number = ResourceUtils.normalizeDensity(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(28) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(28) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260004 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260005
     * @tc.number SUB_RESMGR_UTILS26_0005
     * @tc.desc   请求密度 35 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260005 begin');
      const result: number = ResourceUtils.normalizeDensity(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(35) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(35) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260005 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260006
     * @tc.number SUB_RESMGR_UTILS26_0006
     * @tc.desc   请求密度 42 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260006 begin');
      const result: number = ResourceUtils.normalizeDensity(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(42) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(42) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260006 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260007
     * @tc.number SUB_RESMGR_UTILS26_0007
     * @tc.desc   请求密度 49 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260007 begin');
      const result: number = ResourceUtils.normalizeDensity(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(49) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(49) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260007 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260008
     * @tc.number SUB_RESMGR_UTILS26_0008
     * @tc.desc   请求密度 56 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260008 begin');
      const result: number = ResourceUtils.normalizeDensity(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(56) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(56) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260008 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260009
     * @tc.number SUB_RESMGR_UTILS26_0009
     * @tc.desc   请求密度 63 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260009 begin');
      const result: number = ResourceUtils.normalizeDensity(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(63) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(63) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260009 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260010
     * @tc.number SUB_RESMGR_UTILS26_0010
     * @tc.desc   请求密度 70 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260010 begin');
      const result: number = ResourceUtils.normalizeDensity(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(70) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(70) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260010 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260011
     * @tc.number SUB_RESMGR_UTILS26_0011
     * @tc.desc   请求密度 77 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260011 begin');
      const result: number = ResourceUtils.normalizeDensity(77);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(77) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(77) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260011 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260012
     * @tc.number SUB_RESMGR_UTILS26_0012
     * @tc.desc   请求密度 84 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260012 begin');
      const result: number = ResourceUtils.normalizeDensity(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(84) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(84) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260012 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260013
     * @tc.number SUB_RESMGR_UTILS26_0013
     * @tc.desc   请求密度 91 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260013 begin');
      const result: number = ResourceUtils.normalizeDensity(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(91) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(91) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260013 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260014
     * @tc.number SUB_RESMGR_UTILS26_0014
     * @tc.desc   请求密度 98 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260014 begin');
      const result: number = ResourceUtils.normalizeDensity(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(98) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(98) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260014 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260015
     * @tc.number SUB_RESMGR_UTILS26_0015
     * @tc.desc   请求密度 105 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260015 begin');
      const result: number = ResourceUtils.normalizeDensity(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(105) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(105) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260015 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260016
     * @tc.number SUB_RESMGR_UTILS26_0016
     * @tc.desc   请求密度 112 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260016 begin');
      const result: number = ResourceUtils.normalizeDensity(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(112) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(112) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260016 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260017
     * @tc.number SUB_RESMGR_UTILS26_0017
     * @tc.desc   请求密度 119 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260017 begin');
      const result: number = ResourceUtils.normalizeDensity(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(119) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(119) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260017 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260018
     * @tc.number SUB_RESMGR_UTILS26_0018
     * @tc.desc   请求密度 126 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260018 begin');
      const result: number = ResourceUtils.normalizeDensity(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(126) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(126) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260018 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260019
     * @tc.number SUB_RESMGR_UTILS26_0019
     * @tc.desc   请求密度 133 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260019 begin');
      const result: number = ResourceUtils.normalizeDensity(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(133) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(133) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260019 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260020
     * @tc.number SUB_RESMGR_UTILS26_0020
     * @tc.desc   请求密度 140 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260020 begin');
      const result: number = ResourceUtils.normalizeDensity(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(140) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(140) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260020 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260021
     * @tc.number SUB_RESMGR_UTILS26_0021
     * @tc.desc   请求密度 147 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260021 begin');
      const result: number = ResourceUtils.normalizeDensity(147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(147) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(147) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260021 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260022
     * @tc.number SUB_RESMGR_UTILS26_0022
     * @tc.desc   请求密度 154 归一到档位 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260022 begin');
      const result: number = ResourceUtils.normalizeDensity(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(120));
      expect(result).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(154) * ResourceUtils.BASE_DENSITY), String(120));
      expect(ResourceUtils.densityToScale(154) * ResourceUtils.BASE_DENSITY).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260022 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260023
     * @tc.number SUB_RESMGR_UTILS26_0023
     * @tc.desc   请求密度 161 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260023 begin');
      const result: number = ResourceUtils.normalizeDensity(161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(161) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(161) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260023 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260024
     * @tc.number SUB_RESMGR_UTILS26_0024
     * @tc.desc   请求密度 168 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260024 begin');
      const result: number = ResourceUtils.normalizeDensity(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(168) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(168) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260024 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260025
     * @tc.number SUB_RESMGR_UTILS26_0025
     * @tc.desc   请求密度 175 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260025 begin');
      const result: number = ResourceUtils.normalizeDensity(175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(175) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(175) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260025 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260026
     * @tc.number SUB_RESMGR_UTILS26_0026
     * @tc.desc   请求密度 182 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260026 begin');
      const result: number = ResourceUtils.normalizeDensity(182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(182) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(182) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260026 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260027
     * @tc.number SUB_RESMGR_UTILS26_0027
     * @tc.desc   请求密度 189 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260027 begin');
      const result: number = ResourceUtils.normalizeDensity(189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(189) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(189) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260027 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260028
     * @tc.number SUB_RESMGR_UTILS26_0028
     * @tc.desc   请求密度 196 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260028 begin');
      const result: number = ResourceUtils.normalizeDensity(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(196) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(196) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260028 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260029
     * @tc.number SUB_RESMGR_UTILS26_0029
     * @tc.desc   请求密度 203 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260029 begin');
      const result: number = ResourceUtils.normalizeDensity(203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(203) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(203) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260029 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260030
     * @tc.number SUB_RESMGR_UTILS26_0030
     * @tc.desc   请求密度 210 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260030 begin');
      const result: number = ResourceUtils.normalizeDensity(210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(210) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(210) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260030 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260031
     * @tc.number SUB_RESMGR_UTILS26_0031
     * @tc.desc   请求密度 217 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260031 begin');
      const result: number = ResourceUtils.normalizeDensity(217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(217) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(217) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260031 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260032
     * @tc.number SUB_RESMGR_UTILS26_0032
     * @tc.desc   请求密度 224 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260032 begin');
      const result: number = ResourceUtils.normalizeDensity(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(224) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(224) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260032 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260033
     * @tc.number SUB_RESMGR_UTILS26_0033
     * @tc.desc   请求密度 231 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260033 begin');
      const result: number = ResourceUtils.normalizeDensity(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(231) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(231) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260033 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260034
     * @tc.number SUB_RESMGR_UTILS26_0034
     * @tc.desc   请求密度 238 归一到档位 160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260034 begin');
      const result: number = ResourceUtils.normalizeDensity(238);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(160));
      expect(result).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(238) * ResourceUtils.BASE_DENSITY), String(160));
      expect(ResourceUtils.densityToScale(238) * ResourceUtils.BASE_DENSITY).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260034 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260035
     * @tc.number SUB_RESMGR_UTILS26_0035
     * @tc.desc   请求密度 245 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260035 begin');
      const result: number = ResourceUtils.normalizeDensity(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(245) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(245) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260035 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260036
     * @tc.number SUB_RESMGR_UTILS26_0036
     * @tc.desc   请求密度 252 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260036 begin');
      const result: number = ResourceUtils.normalizeDensity(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(252) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(252) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260036 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260037
     * @tc.number SUB_RESMGR_UTILS26_0037
     * @tc.desc   请求密度 259 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260037 begin');
      const result: number = ResourceUtils.normalizeDensity(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(259) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(259) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260037 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260038
     * @tc.number SUB_RESMGR_UTILS26_0038
     * @tc.desc   请求密度 266 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260038 begin');
      const result: number = ResourceUtils.normalizeDensity(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(266) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(266) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260038 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260039
     * @tc.number SUB_RESMGR_UTILS26_0039
     * @tc.desc   请求密度 273 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260039 begin');
      const result: number = ResourceUtils.normalizeDensity(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(273) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(273) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260039 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260040
     * @tc.number SUB_RESMGR_UTILS26_0040
     * @tc.desc   请求密度 280 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260040 begin');
      const result: number = ResourceUtils.normalizeDensity(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(280) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(280) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260040 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260041
     * @tc.number SUB_RESMGR_UTILS26_0041
     * @tc.desc   请求密度 287 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260041 begin');
      const result: number = ResourceUtils.normalizeDensity(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(287) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(287) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260041 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260042
     * @tc.number SUB_RESMGR_UTILS26_0042
     * @tc.desc   请求密度 294 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260042 begin');
      const result: number = ResourceUtils.normalizeDensity(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(294) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(294) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260042 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260043
     * @tc.number SUB_RESMGR_UTILS26_0043
     * @tc.desc   请求密度 301 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260043 begin');
      const result: number = ResourceUtils.normalizeDensity(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(301) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(301) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260043 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260044
     * @tc.number SUB_RESMGR_UTILS26_0044
     * @tc.desc   请求密度 308 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260044 begin');
      const result: number = ResourceUtils.normalizeDensity(308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(308) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(308) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260044 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260045
     * @tc.number SUB_RESMGR_UTILS26_0045
     * @tc.desc   请求密度 315 归一到档位 240
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260045 begin');
      const result: number = ResourceUtils.normalizeDensity(315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(240));
      expect(result).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(315) * ResourceUtils.BASE_DENSITY), String(240));
      expect(ResourceUtils.densityToScale(315) * ResourceUtils.BASE_DENSITY).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260045 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260046
     * @tc.number SUB_RESMGR_UTILS26_0046
     * @tc.desc   请求密度 322 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260046 begin');
      const result: number = ResourceUtils.normalizeDensity(322);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(322) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(322) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260046 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260047
     * @tc.number SUB_RESMGR_UTILS26_0047
     * @tc.desc   请求密度 329 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260047 begin');
      const result: number = ResourceUtils.normalizeDensity(329);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(329) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(329) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260047 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260048
     * @tc.number SUB_RESMGR_UTILS26_0048
     * @tc.desc   请求密度 336 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260048 begin');
      const result: number = ResourceUtils.normalizeDensity(336);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(336) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(336) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260048 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260049
     * @tc.number SUB_RESMGR_UTILS26_0049
     * @tc.desc   请求密度 343 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260049 begin');
      const result: number = ResourceUtils.normalizeDensity(343);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(343) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(343) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260049 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260050
     * @tc.number SUB_RESMGR_UTILS26_0050
     * @tc.desc   请求密度 350 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260050 begin');
      const result: number = ResourceUtils.normalizeDensity(350);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(350) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(350) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260050 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260051
     * @tc.number SUB_RESMGR_UTILS26_0051
     * @tc.desc   请求密度 357 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260051 begin');
      const result: number = ResourceUtils.normalizeDensity(357);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(357) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(357) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260051 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260052
     * @tc.number SUB_RESMGR_UTILS26_0052
     * @tc.desc   请求密度 364 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260052 begin');
      const result: number = ResourceUtils.normalizeDensity(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(364) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(364) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260052 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260053
     * @tc.number SUB_RESMGR_UTILS26_0053
     * @tc.desc   请求密度 371 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260053 begin');
      const result: number = ResourceUtils.normalizeDensity(371);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(371) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(371) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260053 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260054
     * @tc.number SUB_RESMGR_UTILS26_0054
     * @tc.desc   请求密度 378 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260054 begin');
      const result: number = ResourceUtils.normalizeDensity(378);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(378) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(378) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260054 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260055
     * @tc.number SUB_RESMGR_UTILS26_0055
     * @tc.desc   请求密度 385 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260055 begin');
      const result: number = ResourceUtils.normalizeDensity(385);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(385) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(385) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260055 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260056
     * @tc.number SUB_RESMGR_UTILS26_0056
     * @tc.desc   请求密度 392 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260056 begin');
      const result: number = ResourceUtils.normalizeDensity(392);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(392) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(392) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260056 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260057
     * @tc.number SUB_RESMGR_UTILS26_0057
     * @tc.desc   请求密度 399 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260057 begin');
      const result: number = ResourceUtils.normalizeDensity(399);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(399) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(399) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260057 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260058
     * @tc.number SUB_RESMGR_UTILS26_0058
     * @tc.desc   请求密度 406 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260058 begin');
      const result: number = ResourceUtils.normalizeDensity(406);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(406) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(406) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260058 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260059
     * @tc.number SUB_RESMGR_UTILS26_0059
     * @tc.desc   请求密度 413 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260059 begin');
      const result: number = ResourceUtils.normalizeDensity(413);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(413) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(413) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260059 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260060
     * @tc.number SUB_RESMGR_UTILS26_0060
     * @tc.desc   请求密度 420 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260060 begin');
      const result: number = ResourceUtils.normalizeDensity(420);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(420) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(420) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260060 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260061
     * @tc.number SUB_RESMGR_UTILS26_0061
     * @tc.desc   请求密度 427 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260061 begin');
      const result: number = ResourceUtils.normalizeDensity(427);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(427) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(427) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260061 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260062
     * @tc.number SUB_RESMGR_UTILS26_0062
     * @tc.desc   请求密度 434 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260062 begin');
      const result: number = ResourceUtils.normalizeDensity(434);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(434) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(434) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260062 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260063
     * @tc.number SUB_RESMGR_UTILS26_0063
     * @tc.desc   请求密度 441 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260063 begin');
      const result: number = ResourceUtils.normalizeDensity(441);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(441) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(441) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260063 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260064
     * @tc.number SUB_RESMGR_UTILS26_0064
     * @tc.desc   请求密度 448 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260064 begin');
      const result: number = ResourceUtils.normalizeDensity(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(448) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(448) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260064 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260065
     * @tc.number SUB_RESMGR_UTILS26_0065
     * @tc.desc   请求密度 455 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260065 begin');
      const result: number = ResourceUtils.normalizeDensity(455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(455) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(455) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260065 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260066
     * @tc.number SUB_RESMGR_UTILS26_0066
     * @tc.desc   请求密度 462 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260066 begin');
      const result: number = ResourceUtils.normalizeDensity(462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(462) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(462) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260066 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260067
     * @tc.number SUB_RESMGR_UTILS26_0067
     * @tc.desc   请求密度 469 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260067 begin');
      const result: number = ResourceUtils.normalizeDensity(469);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(469) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(469) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260067 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260068
     * @tc.number SUB_RESMGR_UTILS26_0068
     * @tc.desc   请求密度 476 归一到档位 320
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260068 begin');
      const result: number = ResourceUtils.normalizeDensity(476);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(320));
      expect(result).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(476) * ResourceUtils.BASE_DENSITY), String(320));
      expect(ResourceUtils.densityToScale(476) * ResourceUtils.BASE_DENSITY).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260068 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260069
     * @tc.number SUB_RESMGR_UTILS26_0069
     * @tc.desc   请求密度 483 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260069 begin');
      const result: number = ResourceUtils.normalizeDensity(483);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(483) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(483) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260069 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260070
     * @tc.number SUB_RESMGR_UTILS26_0070
     * @tc.desc   请求密度 490 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260070 begin');
      const result: number = ResourceUtils.normalizeDensity(490);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(490) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(490) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260070 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260071
     * @tc.number SUB_RESMGR_UTILS26_0071
     * @tc.desc   请求密度 497 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260071 begin');
      const result: number = ResourceUtils.normalizeDensity(497);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(497) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(497) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260071 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260072
     * @tc.number SUB_RESMGR_UTILS26_0072
     * @tc.desc   请求密度 504 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260072 begin');
      const result: number = ResourceUtils.normalizeDensity(504);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(504) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(504) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260072 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260073
     * @tc.number SUB_RESMGR_UTILS26_0073
     * @tc.desc   请求密度 511 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260073 begin');
      const result: number = ResourceUtils.normalizeDensity(511);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(511) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(511) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260073 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260074
     * @tc.number SUB_RESMGR_UTILS26_0074
     * @tc.desc   请求密度 518 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260074 begin');
      const result: number = ResourceUtils.normalizeDensity(518);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(518) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(518) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260074 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260075
     * @tc.number SUB_RESMGR_UTILS26_0075
     * @tc.desc   请求密度 525 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260075 begin');
      const result: number = ResourceUtils.normalizeDensity(525);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(525) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(525) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260075 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260076
     * @tc.number SUB_RESMGR_UTILS26_0076
     * @tc.desc   请求密度 532 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260076 begin');
      const result: number = ResourceUtils.normalizeDensity(532);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(532) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(532) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260076 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260077
     * @tc.number SUB_RESMGR_UTILS26_0077
     * @tc.desc   请求密度 539 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260077 begin');
      const result: number = ResourceUtils.normalizeDensity(539);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(539) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(539) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260077 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260078
     * @tc.number SUB_RESMGR_UTILS26_0078
     * @tc.desc   请求密度 546 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260078 begin');
      const result: number = ResourceUtils.normalizeDensity(546);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(546) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(546) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260078 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260079
     * @tc.number SUB_RESMGR_UTILS26_0079
     * @tc.desc   请求密度 553 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260079 begin');
      const result: number = ResourceUtils.normalizeDensity(553);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(553) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(553) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260079 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260080
     * @tc.number SUB_RESMGR_UTILS26_0080
     * @tc.desc   请求密度 560 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260080 begin');
      const result: number = ResourceUtils.normalizeDensity(560);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(560) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(560) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260080 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260081
     * @tc.number SUB_RESMGR_UTILS26_0081
     * @tc.desc   请求密度 567 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260081 begin');
      const result: number = ResourceUtils.normalizeDensity(567);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(567) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(567) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260081 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260082
     * @tc.number SUB_RESMGR_UTILS26_0082
     * @tc.desc   请求密度 574 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260082 begin');
      const result: number = ResourceUtils.normalizeDensity(574);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(574) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(574) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260082 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260083
     * @tc.number SUB_RESMGR_UTILS26_0083
     * @tc.desc   请求密度 581 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260083 begin');
      const result: number = ResourceUtils.normalizeDensity(581);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(581) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(581) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260083 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260084
     * @tc.number SUB_RESMGR_UTILS26_0084
     * @tc.desc   请求密度 588 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260084 begin');
      const result: number = ResourceUtils.normalizeDensity(588);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(588) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(588) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260084 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260085
     * @tc.number SUB_RESMGR_UTILS26_0085
     * @tc.desc   请求密度 595 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260085 begin');
      const result: number = ResourceUtils.normalizeDensity(595);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(595) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(595) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260085 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260086
     * @tc.number SUB_RESMGR_UTILS26_0086
     * @tc.desc   请求密度 602 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260086 begin');
      const result: number = ResourceUtils.normalizeDensity(602);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(602) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(602) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260086 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260087
     * @tc.number SUB_RESMGR_UTILS26_0087
     * @tc.desc   请求密度 609 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260087 begin');
      const result: number = ResourceUtils.normalizeDensity(609);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(609) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(609) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260087 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260088
     * @tc.number SUB_RESMGR_UTILS26_0088
     * @tc.desc   请求密度 616 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260088 begin');
      const result: number = ResourceUtils.normalizeDensity(616);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(616) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(616) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260088 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260089
     * @tc.number SUB_RESMGR_UTILS26_0089
     * @tc.desc   请求密度 623 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260089 begin');
      const result: number = ResourceUtils.normalizeDensity(623);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(623) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(623) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260089 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260090
     * @tc.number SUB_RESMGR_UTILS26_0090
     * @tc.desc   请求密度 630 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260090 begin');
      const result: number = ResourceUtils.normalizeDensity(630);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(630) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(630) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260090 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260091
     * @tc.number SUB_RESMGR_UTILS26_0091
     * @tc.desc   请求密度 637 归一到档位 480
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260091 begin');
      const result: number = ResourceUtils.normalizeDensity(637);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(480));
      expect(result).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(637) * ResourceUtils.BASE_DENSITY), String(480));
      expect(ResourceUtils.densityToScale(637) * ResourceUtils.BASE_DENSITY).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260091 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260092
     * @tc.number SUB_RESMGR_UTILS26_0092
     * @tc.desc   请求密度 644 归一到档位 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260092 begin');
      const result: number = ResourceUtils.normalizeDensity(644);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(644) * ResourceUtils.BASE_DENSITY), String(640));
      expect(ResourceUtils.densityToScale(644) * ResourceUtils.BASE_DENSITY).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260092 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260093
     * @tc.number SUB_RESMGR_UTILS26_0093
     * @tc.desc   请求密度 651 归一到档位 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260093 begin');
      const result: number = ResourceUtils.normalizeDensity(651);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(651) * ResourceUtils.BASE_DENSITY), String(640));
      expect(ResourceUtils.densityToScale(651) * ResourceUtils.BASE_DENSITY).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260093 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260094
     * @tc.number SUB_RESMGR_UTILS26_0094
     * @tc.desc   请求密度 658 归一到档位 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260094 begin');
      const result: number = ResourceUtils.normalizeDensity(658);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(658) * ResourceUtils.BASE_DENSITY), String(640));
      expect(ResourceUtils.densityToScale(658) * ResourceUtils.BASE_DENSITY).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260094 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260095
     * @tc.number SUB_RESMGR_UTILS26_0095
     * @tc.desc   请求密度 665 归一到档位 640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260095 begin');
      const result: number = ResourceUtils.normalizeDensity(665);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(640));
      expect(result).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(result)));
      expect(ResourceUtils.isDensitySupported(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(ResourceUtils.densityToScale(665) * ResourceUtils.BASE_DENSITY), String(640));
      expect(ResourceUtils.densityToScale(665) * ResourceUtils.BASE_DENSITY).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260095 end');
    })

    /**
     * @tc.name   testResourceUtilsDensityV260096
     * @tc.number SUB_RESMGR_UTILS26_0096
     * @tc.desc   零、负数与非整数密度回落默认档位，刚过下限的取值仍归到 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsDensityV260096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260096 begin');
      const zero: number = ResourceUtils.normalizeDensity(0);
      const negative: number = ResourceUtils.normalizeDensity(-160);
      const fractional: number = ResourceUtils.normalizeDensity(300.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d expected=320/320/320',
        zero, negative, fractional);
      expect(zero).assertEqual(320);
      expect(negative).assertEqual(320);
      expect(fractional).assertEqual(320);
      expect(ResourceUtils.normalizeDensity(121)).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsDensityV260096 end');
    })
  })
}
