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

export default function resourceUtilsScaleTest() {
  describe('ResourceUtilsScaleTest', () => {

    /**
     * @tc.name   testResourceUtilsScale0001
     * @tc.number SUB_RESMGR_UTILS_02_0001
     * @tc.desc   densityToScale(2) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0001 begin');
      const result: number = ResourceUtils.densityToScale(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(2) === false));
      expect(ResourceUtils.isDensitySupported(2) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0001 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0002
     * @tc.number SUB_RESMGR_UTILS_02_0002
     * @tc.desc   densityToScale(4) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0002 begin');
      const result: number = ResourceUtils.densityToScale(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(4) === false));
      expect(ResourceUtils.isDensitySupported(4) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0002 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0003
     * @tc.number SUB_RESMGR_UTILS_02_0003
     * @tc.desc   densityToScale(6) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0003 begin');
      const result: number = ResourceUtils.densityToScale(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(6) === false));
      expect(ResourceUtils.isDensitySupported(6) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0003 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0004
     * @tc.number SUB_RESMGR_UTILS_02_0004
     * @tc.desc   densityToScale(8) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0004 begin');
      const result: number = ResourceUtils.densityToScale(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(8) === false));
      expect(ResourceUtils.isDensitySupported(8) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0004 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0005
     * @tc.number SUB_RESMGR_UTILS_02_0005
     * @tc.desc   densityToScale(10) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0005 begin');
      const result: number = ResourceUtils.densityToScale(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(10) === false));
      expect(ResourceUtils.isDensitySupported(10) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0005 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0006
     * @tc.number SUB_RESMGR_UTILS_02_0006
     * @tc.desc   densityToScale(12) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0006 begin');
      const result: number = ResourceUtils.densityToScale(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(12) === false));
      expect(ResourceUtils.isDensitySupported(12) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0006 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0007
     * @tc.number SUB_RESMGR_UTILS_02_0007
     * @tc.desc   densityToScale(14) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0007 begin');
      const result: number = ResourceUtils.densityToScale(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(14) === false));
      expect(ResourceUtils.isDensitySupported(14) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0007 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0008
     * @tc.number SUB_RESMGR_UTILS_02_0008
     * @tc.desc   densityToScale(16) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0008 begin');
      const result: number = ResourceUtils.densityToScale(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(16) === false));
      expect(ResourceUtils.isDensitySupported(16) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0008 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0009
     * @tc.number SUB_RESMGR_UTILS_02_0009
     * @tc.desc   densityToScale(18) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0009 begin');
      const result: number = ResourceUtils.densityToScale(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(18) === false));
      expect(ResourceUtils.isDensitySupported(18) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0009 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0010
     * @tc.number SUB_RESMGR_UTILS_02_0010
     * @tc.desc   densityToScale(20) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0010 begin');
      const result: number = ResourceUtils.densityToScale(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(20) === false));
      expect(ResourceUtils.isDensitySupported(20) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0010 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0011
     * @tc.number SUB_RESMGR_UTILS_02_0011
     * @tc.desc   densityToScale(22) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0011 begin');
      const result: number = ResourceUtils.densityToScale(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(22) === false));
      expect(ResourceUtils.isDensitySupported(22) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0011 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0012
     * @tc.number SUB_RESMGR_UTILS_02_0012
     * @tc.desc   densityToScale(24) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0012 begin');
      const result: number = ResourceUtils.densityToScale(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(24) === false));
      expect(ResourceUtils.isDensitySupported(24) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0012 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0013
     * @tc.number SUB_RESMGR_UTILS_02_0013
     * @tc.desc   densityToScale(26) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0013 begin');
      const result: number = ResourceUtils.densityToScale(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(26) === false));
      expect(ResourceUtils.isDensitySupported(26) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0013 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0014
     * @tc.number SUB_RESMGR_UTILS_02_0014
     * @tc.desc   densityToScale(28) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0014 begin');
      const result: number = ResourceUtils.densityToScale(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(28) === false));
      expect(ResourceUtils.isDensitySupported(28) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0014 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0015
     * @tc.number SUB_RESMGR_UTILS_02_0015
     * @tc.desc   densityToScale(30) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0015 begin');
      const result: number = ResourceUtils.densityToScale(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(30) === false));
      expect(ResourceUtils.isDensitySupported(30) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0015 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0016
     * @tc.number SUB_RESMGR_UTILS_02_0016
     * @tc.desc   densityToScale(32) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0016 begin');
      const result: number = ResourceUtils.densityToScale(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(32) === false));
      expect(ResourceUtils.isDensitySupported(32) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0016 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0017
     * @tc.number SUB_RESMGR_UTILS_02_0017
     * @tc.desc   densityToScale(34) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0017 begin');
      const result: number = ResourceUtils.densityToScale(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(34) === false));
      expect(ResourceUtils.isDensitySupported(34) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0017 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0018
     * @tc.number SUB_RESMGR_UTILS_02_0018
     * @tc.desc   densityToScale(36) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0018 begin');
      const result: number = ResourceUtils.densityToScale(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(36) === false));
      expect(ResourceUtils.isDensitySupported(36) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0018 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0019
     * @tc.number SUB_RESMGR_UTILS_02_0019
     * @tc.desc   densityToScale(38) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0019 begin');
      const result: number = ResourceUtils.densityToScale(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(38) === false));
      expect(ResourceUtils.isDensitySupported(38) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0019 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0020
     * @tc.number SUB_RESMGR_UTILS_02_0020
     * @tc.desc   densityToScale(40) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0020 begin');
      const result: number = ResourceUtils.densityToScale(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(40) === false));
      expect(ResourceUtils.isDensitySupported(40) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0020 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0021
     * @tc.number SUB_RESMGR_UTILS_02_0021
     * @tc.desc   densityToScale(42) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0021 begin');
      const result: number = ResourceUtils.densityToScale(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(42) === false));
      expect(ResourceUtils.isDensitySupported(42) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0021 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0022
     * @tc.number SUB_RESMGR_UTILS_02_0022
     * @tc.desc   densityToScale(44) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0022 begin');
      const result: number = ResourceUtils.densityToScale(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(44) === false));
      expect(ResourceUtils.isDensitySupported(44) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0022 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0023
     * @tc.number SUB_RESMGR_UTILS_02_0023
     * @tc.desc   densityToScale(46) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0023 begin');
      const result: number = ResourceUtils.densityToScale(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(46) === false));
      expect(ResourceUtils.isDensitySupported(46) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0023 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0024
     * @tc.number SUB_RESMGR_UTILS_02_0024
     * @tc.desc   densityToScale(48) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0024 begin');
      const result: number = ResourceUtils.densityToScale(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(48) === false));
      expect(ResourceUtils.isDensitySupported(48) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0024 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0025
     * @tc.number SUB_RESMGR_UTILS_02_0025
     * @tc.desc   densityToScale(50) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0025 begin');
      const result: number = ResourceUtils.densityToScale(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(50) === false));
      expect(ResourceUtils.isDensitySupported(50) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0025 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0026
     * @tc.number SUB_RESMGR_UTILS_02_0026
     * @tc.desc   densityToScale(52) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0026 begin');
      const result: number = ResourceUtils.densityToScale(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(52) === false));
      expect(ResourceUtils.isDensitySupported(52) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0026 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0027
     * @tc.number SUB_RESMGR_UTILS_02_0027
     * @tc.desc   densityToScale(54) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0027 begin');
      const result: number = ResourceUtils.densityToScale(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(54) === false));
      expect(ResourceUtils.isDensitySupported(54) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0027 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0028
     * @tc.number SUB_RESMGR_UTILS_02_0028
     * @tc.desc   densityToScale(56) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0028 begin');
      const result: number = ResourceUtils.densityToScale(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(56) === false));
      expect(ResourceUtils.isDensitySupported(56) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0028 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0029
     * @tc.number SUB_RESMGR_UTILS_02_0029
     * @tc.desc   densityToScale(58) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0029 begin');
      const result: number = ResourceUtils.densityToScale(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(58) === false));
      expect(ResourceUtils.isDensitySupported(58) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0029 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0030
     * @tc.number SUB_RESMGR_UTILS_02_0030
     * @tc.desc   densityToScale(60) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0030 begin');
      const result: number = ResourceUtils.densityToScale(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(60) === false));
      expect(ResourceUtils.isDensitySupported(60) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0030 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0031
     * @tc.number SUB_RESMGR_UTILS_02_0031
     * @tc.desc   densityToScale(62) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0031 begin');
      const result: number = ResourceUtils.densityToScale(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(62) === false));
      expect(ResourceUtils.isDensitySupported(62) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0031 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0032
     * @tc.number SUB_RESMGR_UTILS_02_0032
     * @tc.desc   densityToScale(64) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0032 begin');
      const result: number = ResourceUtils.densityToScale(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(64) === false));
      expect(ResourceUtils.isDensitySupported(64) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0032 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0033
     * @tc.number SUB_RESMGR_UTILS_02_0033
     * @tc.desc   densityToScale(66) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0033 begin');
      const result: number = ResourceUtils.densityToScale(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(66) === false));
      expect(ResourceUtils.isDensitySupported(66) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0033 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0034
     * @tc.number SUB_RESMGR_UTILS_02_0034
     * @tc.desc   densityToScale(68) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0034 begin');
      const result: number = ResourceUtils.densityToScale(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(68) === false));
      expect(ResourceUtils.isDensitySupported(68) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0034 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0035
     * @tc.number SUB_RESMGR_UTILS_02_0035
     * @tc.desc   densityToScale(70) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0035 begin');
      const result: number = ResourceUtils.densityToScale(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(70) === false));
      expect(ResourceUtils.isDensitySupported(70) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0035 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0036
     * @tc.number SUB_RESMGR_UTILS_02_0036
     * @tc.desc   densityToScale(72) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0036 begin');
      const result: number = ResourceUtils.densityToScale(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(72) === false));
      expect(ResourceUtils.isDensitySupported(72) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0036 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0037
     * @tc.number SUB_RESMGR_UTILS_02_0037
     * @tc.desc   densityToScale(74) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0037 begin');
      const result: number = ResourceUtils.densityToScale(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(74) === false));
      expect(ResourceUtils.isDensitySupported(74) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0037 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0038
     * @tc.number SUB_RESMGR_UTILS_02_0038
     * @tc.desc   densityToScale(76) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0038 begin');
      const result: number = ResourceUtils.densityToScale(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(76) === false));
      expect(ResourceUtils.isDensitySupported(76) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0038 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0039
     * @tc.number SUB_RESMGR_UTILS_02_0039
     * @tc.desc   densityToScale(78) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0039 begin');
      const result: number = ResourceUtils.densityToScale(78);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(78) === false));
      expect(ResourceUtils.isDensitySupported(78) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0039 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0040
     * @tc.number SUB_RESMGR_UTILS_02_0040
     * @tc.desc   densityToScale(80) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0040 begin');
      const result: number = ResourceUtils.densityToScale(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(80) === false));
      expect(ResourceUtils.isDensitySupported(80) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0040 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0041
     * @tc.number SUB_RESMGR_UTILS_02_0041
     * @tc.desc   densityToScale(82) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0041 begin');
      const result: number = ResourceUtils.densityToScale(82);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(82) === false));
      expect(ResourceUtils.isDensitySupported(82) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0041 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0042
     * @tc.number SUB_RESMGR_UTILS_02_0042
     * @tc.desc   densityToScale(84) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0042 begin');
      const result: number = ResourceUtils.densityToScale(84);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(84) === false));
      expect(ResourceUtils.isDensitySupported(84) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0042 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0043
     * @tc.number SUB_RESMGR_UTILS_02_0043
     * @tc.desc   densityToScale(86) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0043 begin');
      const result: number = ResourceUtils.densityToScale(86);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(86) === false));
      expect(ResourceUtils.isDensitySupported(86) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0043 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0044
     * @tc.number SUB_RESMGR_UTILS_02_0044
     * @tc.desc   densityToScale(88) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0044 begin');
      const result: number = ResourceUtils.densityToScale(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(88) === false));
      expect(ResourceUtils.isDensitySupported(88) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0044 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0045
     * @tc.number SUB_RESMGR_UTILS_02_0045
     * @tc.desc   densityToScale(90) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0045 begin');
      const result: number = ResourceUtils.densityToScale(90);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(90) === false));
      expect(ResourceUtils.isDensitySupported(90) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0045 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0046
     * @tc.number SUB_RESMGR_UTILS_02_0046
     * @tc.desc   densityToScale(92) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0046 begin');
      const result: number = ResourceUtils.densityToScale(92);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(92) === false));
      expect(ResourceUtils.isDensitySupported(92) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0046 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0047
     * @tc.number SUB_RESMGR_UTILS_02_0047
     * @tc.desc   densityToScale(94) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0047 begin');
      const result: number = ResourceUtils.densityToScale(94);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(94) === false));
      expect(ResourceUtils.isDensitySupported(94) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0047 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0048
     * @tc.number SUB_RESMGR_UTILS_02_0048
     * @tc.desc   densityToScale(96) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0048 begin');
      const result: number = ResourceUtils.densityToScale(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(96) === false));
      expect(ResourceUtils.isDensitySupported(96) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0048 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0049
     * @tc.number SUB_RESMGR_UTILS_02_0049
     * @tc.desc   densityToScale(98) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0049 begin');
      const result: number = ResourceUtils.densityToScale(98);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(98) === false));
      expect(ResourceUtils.isDensitySupported(98) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0049 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0050
     * @tc.number SUB_RESMGR_UTILS_02_0050
     * @tc.desc   densityToScale(100) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0050 begin');
      const result: number = ResourceUtils.densityToScale(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(100) === false));
      expect(ResourceUtils.isDensitySupported(100) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0050 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0051
     * @tc.number SUB_RESMGR_UTILS_02_0051
     * @tc.desc   densityToScale(102) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0051 begin');
      const result: number = ResourceUtils.densityToScale(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(102) === false));
      expect(ResourceUtils.isDensitySupported(102) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0051 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0052
     * @tc.number SUB_RESMGR_UTILS_02_0052
     * @tc.desc   densityToScale(104) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0052 begin');
      const result: number = ResourceUtils.densityToScale(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(104) === false));
      expect(ResourceUtils.isDensitySupported(104) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0052 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0053
     * @tc.number SUB_RESMGR_UTILS_02_0053
     * @tc.desc   densityToScale(106) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0053 begin');
      const result: number = ResourceUtils.densityToScale(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(106) === false));
      expect(ResourceUtils.isDensitySupported(106) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0053 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0054
     * @tc.number SUB_RESMGR_UTILS_02_0054
     * @tc.desc   densityToScale(108) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0054 begin');
      const result: number = ResourceUtils.densityToScale(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(108) === false));
      expect(ResourceUtils.isDensitySupported(108) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0054 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0055
     * @tc.number SUB_RESMGR_UTILS_02_0055
     * @tc.desc   densityToScale(110) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0055 begin');
      const result: number = ResourceUtils.densityToScale(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(110) === false));
      expect(ResourceUtils.isDensitySupported(110) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0055 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0056
     * @tc.number SUB_RESMGR_UTILS_02_0056
     * @tc.desc   densityToScale(112) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0056 begin');
      const result: number = ResourceUtils.densityToScale(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(112) === false));
      expect(ResourceUtils.isDensitySupported(112) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0056 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0057
     * @tc.number SUB_RESMGR_UTILS_02_0057
     * @tc.desc   densityToScale(114) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0057 begin');
      const result: number = ResourceUtils.densityToScale(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(114) === false));
      expect(ResourceUtils.isDensitySupported(114) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0057 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0058
     * @tc.number SUB_RESMGR_UTILS_02_0058
     * @tc.desc   densityToScale(116) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0058 begin');
      const result: number = ResourceUtils.densityToScale(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(116) === false));
      expect(ResourceUtils.isDensitySupported(116) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0058 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0059
     * @tc.number SUB_RESMGR_UTILS_02_0059
     * @tc.desc   densityToScale(118) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0059 begin');
      const result: number = ResourceUtils.densityToScale(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(118) === false));
      expect(ResourceUtils.isDensitySupported(118) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0059 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0060
     * @tc.number SUB_RESMGR_UTILS_02_0060
     * @tc.desc   densityToScale(120) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0060 begin');
      const result: number = ResourceUtils.densityToScale(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(120) === true));
      expect(ResourceUtils.isDensitySupported(120) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0060 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0061
     * @tc.number SUB_RESMGR_UTILS_02_0061
     * @tc.desc   densityToScale(122) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0061 begin');
      const result: number = ResourceUtils.densityToScale(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(122) === false));
      expect(ResourceUtils.isDensitySupported(122) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0061 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0062
     * @tc.number SUB_RESMGR_UTILS_02_0062
     * @tc.desc   densityToScale(124) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0062 begin');
      const result: number = ResourceUtils.densityToScale(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(124) === false));
      expect(ResourceUtils.isDensitySupported(124) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0062 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0063
     * @tc.number SUB_RESMGR_UTILS_02_0063
     * @tc.desc   densityToScale(126) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0063 begin');
      const result: number = ResourceUtils.densityToScale(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(126) === false));
      expect(ResourceUtils.isDensitySupported(126) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0063 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0064
     * @tc.number SUB_RESMGR_UTILS_02_0064
     * @tc.desc   densityToScale(128) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0064 begin');
      const result: number = ResourceUtils.densityToScale(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(128) === false));
      expect(ResourceUtils.isDensitySupported(128) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0064 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0065
     * @tc.number SUB_RESMGR_UTILS_02_0065
     * @tc.desc   densityToScale(130) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0065 begin');
      const result: number = ResourceUtils.densityToScale(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(130) === false));
      expect(ResourceUtils.isDensitySupported(130) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0065 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0066
     * @tc.number SUB_RESMGR_UTILS_02_0066
     * @tc.desc   densityToScale(132) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0066 begin');
      const result: number = ResourceUtils.densityToScale(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(132) === false));
      expect(ResourceUtils.isDensitySupported(132) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0066 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0067
     * @tc.number SUB_RESMGR_UTILS_02_0067
     * @tc.desc   densityToScale(134) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0067 begin');
      const result: number = ResourceUtils.densityToScale(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(134) === false));
      expect(ResourceUtils.isDensitySupported(134) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0067 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0068
     * @tc.number SUB_RESMGR_UTILS_02_0068
     * @tc.desc   densityToScale(136) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0068 begin');
      const result: number = ResourceUtils.densityToScale(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(136) === false));
      expect(ResourceUtils.isDensitySupported(136) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0068 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0069
     * @tc.number SUB_RESMGR_UTILS_02_0069
     * @tc.desc   densityToScale(138) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0069 begin');
      const result: number = ResourceUtils.densityToScale(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(138) === false));
      expect(ResourceUtils.isDensitySupported(138) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0069 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0070
     * @tc.number SUB_RESMGR_UTILS_02_0070
     * @tc.desc   densityToScale(140) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0070 begin');
      const result: number = ResourceUtils.densityToScale(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(140) === false));
      expect(ResourceUtils.isDensitySupported(140) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0070 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0071
     * @tc.number SUB_RESMGR_UTILS_02_0071
     * @tc.desc   densityToScale(142) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0071 begin');
      const result: number = ResourceUtils.densityToScale(142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(142) === false));
      expect(ResourceUtils.isDensitySupported(142) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0071 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0072
     * @tc.number SUB_RESMGR_UTILS_02_0072
     * @tc.desc   densityToScale(144) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0072 begin');
      const result: number = ResourceUtils.densityToScale(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(144) === false));
      expect(ResourceUtils.isDensitySupported(144) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0072 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0073
     * @tc.number SUB_RESMGR_UTILS_02_0073
     * @tc.desc   densityToScale(146) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0073 begin');
      const result: number = ResourceUtils.densityToScale(146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(146) === false));
      expect(ResourceUtils.isDensitySupported(146) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0073 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0074
     * @tc.number SUB_RESMGR_UTILS_02_0074
     * @tc.desc   densityToScale(148) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0074 begin');
      const result: number = ResourceUtils.densityToScale(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(148) === false));
      expect(ResourceUtils.isDensitySupported(148) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0074 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0075
     * @tc.number SUB_RESMGR_UTILS_02_0075
     * @tc.desc   densityToScale(150) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0075 begin');
      const result: number = ResourceUtils.densityToScale(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(150) === false));
      expect(ResourceUtils.isDensitySupported(150) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0075 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0076
     * @tc.number SUB_RESMGR_UTILS_02_0076
     * @tc.desc   densityToScale(152) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0076 begin');
      const result: number = ResourceUtils.densityToScale(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(152) === false));
      expect(ResourceUtils.isDensitySupported(152) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0076 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0077
     * @tc.number SUB_RESMGR_UTILS_02_0077
     * @tc.desc   densityToScale(154) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0077 begin');
      const result: number = ResourceUtils.densityToScale(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(154) === false));
      expect(ResourceUtils.isDensitySupported(154) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0077 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0078
     * @tc.number SUB_RESMGR_UTILS_02_0078
     * @tc.desc   densityToScale(156) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0078 begin');
      const result: number = ResourceUtils.densityToScale(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(156) === false));
      expect(ResourceUtils.isDensitySupported(156) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0078 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0079
     * @tc.number SUB_RESMGR_UTILS_02_0079
     * @tc.desc   densityToScale(158) is 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0079 begin');
      const result: number = ResourceUtils.densityToScale(158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.75));
      expect(result).assertEqual(0.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(120));
      expect(result * 160).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(158) === false));
      expect(ResourceUtils.isDensitySupported(158) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0079 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0080
     * @tc.number SUB_RESMGR_UTILS_02_0080
     * @tc.desc   densityToScale(160) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0080 begin');
      const result: number = ResourceUtils.densityToScale(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(160) === true));
      expect(ResourceUtils.isDensitySupported(160) === true).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0080 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0081
     * @tc.number SUB_RESMGR_UTILS_02_0081
     * @tc.desc   densityToScale(162) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0081 begin');
      const result: number = ResourceUtils.densityToScale(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(162) === false));
      expect(ResourceUtils.isDensitySupported(162) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0081 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0082
     * @tc.number SUB_RESMGR_UTILS_02_0082
     * @tc.desc   densityToScale(164) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0082 begin');
      const result: number = ResourceUtils.densityToScale(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(164) === false));
      expect(ResourceUtils.isDensitySupported(164) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0082 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0083
     * @tc.number SUB_RESMGR_UTILS_02_0083
     * @tc.desc   densityToScale(166) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0083 begin');
      const result: number = ResourceUtils.densityToScale(166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(166) === false));
      expect(ResourceUtils.isDensitySupported(166) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0083 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0084
     * @tc.number SUB_RESMGR_UTILS_02_0084
     * @tc.desc   densityToScale(168) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0084 begin');
      const result: number = ResourceUtils.densityToScale(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(168) === false));
      expect(ResourceUtils.isDensitySupported(168) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0084 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0085
     * @tc.number SUB_RESMGR_UTILS_02_0085
     * @tc.desc   densityToScale(170) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0085 begin');
      const result: number = ResourceUtils.densityToScale(170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(170) === false));
      expect(ResourceUtils.isDensitySupported(170) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0085 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0086
     * @tc.number SUB_RESMGR_UTILS_02_0086
     * @tc.desc   densityToScale(172) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0086 begin');
      const result: number = ResourceUtils.densityToScale(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(172) === false));
      expect(ResourceUtils.isDensitySupported(172) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0086 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0087
     * @tc.number SUB_RESMGR_UTILS_02_0087
     * @tc.desc   densityToScale(174) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0087 begin');
      const result: number = ResourceUtils.densityToScale(174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(174) === false));
      expect(ResourceUtils.isDensitySupported(174) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0087 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0088
     * @tc.number SUB_RESMGR_UTILS_02_0088
     * @tc.desc   densityToScale(176) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0088 begin');
      const result: number = ResourceUtils.densityToScale(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(176) === false));
      expect(ResourceUtils.isDensitySupported(176) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0088 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0089
     * @tc.number SUB_RESMGR_UTILS_02_0089
     * @tc.desc   densityToScale(178) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0089 begin');
      const result: number = ResourceUtils.densityToScale(178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(178) === false));
      expect(ResourceUtils.isDensitySupported(178) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0089 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0090
     * @tc.number SUB_RESMGR_UTILS_02_0090
     * @tc.desc   densityToScale(180) is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0090 begin');
      const result: number = ResourceUtils.densityToScale(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result * 160), String(160));
      expect(result * 160).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(180) === false));
      expect(ResourceUtils.isDensitySupported(180) === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0090 end');
    })

    /**
     * @tc.name   testResourceUtilsScale0091
     * @tc.number SUB_RESMGR_UTILS_02_0091
     * @tc.desc   比例只在精确档位上取整数值，非档位请求必须向下匹配
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsScale0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0091 begin');
      // 最小档位对应 0.75 倍，最大档位对应 4 倍
      const minimum: number = ResourceUtils.densityToScale(120);
      const maximum: number = ResourceUtils.densityToScale(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(minimum), String(0.75));
      expect(minimum).assertEqual(0.75);
      expect(maximum).assertEqual(4);
      // 479 不是档位，只有把请求向下归一到 320 才能得到 2 倍
      const belowBucket: number = ResourceUtils.densityToScale(479);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(belowBucket), String(2));
      expect(belowBucket).assertEqual(2);
      // 480 本身就是档位，比例必须跳到 3 倍，不能继续停在 2 倍
      const exactBucket: number = ResourceUtils.densityToScale(480);
      expect(exactBucket).assertEqual(3);
      // 同一输入在合法档位判定上必须与归一化结论一致
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isDensitySupported(480)));
      expect(ResourceUtils.isDensitySupported(480)).assertTrue();
      expect(ResourceUtils.isDensitySupported(479)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsScale0091 end');
    })

  })
}
