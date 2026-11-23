/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  xComponentSizeText,
} from '../model/ResolutionLogic';

/** XComponentSizeTest logic checks (46 cases). */
export default function xComponentSizeTest(): void {
  describe('XComponentSizeTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0001
     * @tc.name      Resolution_XComponentSize_0001
     * @tc.desc      xComponentSize(true,50000012,720,1280,0,0,0,1) resolves to 720x1280.00016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}XComponentSize_0001 begin`);
      logInfo("xComponentSize(true,50000012,720,1280,0,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000012, 720, 1280, 0, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "720*1280.00016");
      expect(actual).assertEqual("720*1280.00016");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0002
     * @tc.name      Resolution_XComponentSize_0002
     * @tc.desc      xComponentSize(false,50000013,820,1330,90,90,1,1.7777777777777777) resolves to 2364.444444x1330.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0002 begin`);
      logInfo("xComponentSize(false,50000013,820,1330,90,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000013, 820, 1330, 90, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2364.444444*1330");
      expect(actual).assertEqual("2364.444444*1330");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0003
     * @tc.name      Resolution_XComponentSize_0003
     * @tc.desc      xComponentSize(false,50000014,920,1380,180,0,2,1.3333333333333333) resolves to 1840x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0003 begin`);
      logInfo("xComponentSize(false,50000014,920,1380,180,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000014, 920, 1380, 180, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1840*1380");
      expect(actual).assertEqual("1840*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0004
     * @tc.name      Resolution_XComponentSize_0004
     * @tc.desc      xComponentSize(true,0,1020,1430,270,90,0,1) resolves to 1020x1430.00022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0004 begin`);
      logInfo("xComponentSize(true,0,1020,1430,270,90,0,1)");
      const actual: string = xComponentSizeText(true, 0, 1020, 1430, 270, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1020*1430.00022");
      expect(actual).assertEqual("1020*1430.00022");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0005
     * @tc.name      Resolution_XComponentSize_0005
     * @tc.desc      xComponentSize(false,50000012,1120,1480,0,0,1,1.7777777777777777) resolves to 2631.111111x1480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0005 begin`);
      logInfo("xComponentSize(false,50000012,1120,1480,0,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000012, 1120, 1480, 0, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2631.111111*1480");
      expect(actual).assertEqual("2631.111111*1480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0006
     * @tc.name      Resolution_XComponentSize_0006
     * @tc.desc      xComponentSize(false,50000013,720,1530,90,90,2,1.3333333333333333) resolves to 2040x1530.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0006 begin`);
      logInfo("xComponentSize(false,50000013,720,1530,90,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000013, 720, 1530, 90, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "2040*1530");
      expect(actual).assertEqual("2040*1530");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0007
     * @tc.name      Resolution_XComponentSize_0007
     * @tc.desc      xComponentSize(true,50000014,820,1580,180,0,0,1) resolves to 3044.38982x1580.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0007 begin`);
      logInfo("xComponentSize(true,50000014,820,1580,180,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000014, 820, 1580, 180, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "3044.38982*1580");
      expect(actual).assertEqual("3044.38982*1580");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0008
     * @tc.name      Resolution_XComponentSize_0008
     * @tc.desc      xComponentSize(false,0,920,1280,270,90,1,1.7777777777777777) resolves to 2275.555556x1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0008 begin`);
      logInfo("xComponentSize(false,0,920,1280,270,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 0, 920, 1280, 270, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2275.555556*1280");
      expect(actual).assertEqual("2275.555556*1280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0009
     * @tc.name      Resolution_XComponentSize_0009
     * @tc.desc      xComponentSize(false,50000012,1020,1330,0,0,2,1.3333333333333333) resolves to 1773.333333x1330.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0009 begin`);
      logInfo("xComponentSize(false,50000012,1020,1330,0,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000012, 1020, 1330, 0, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1773.333333*1330");
      expect(actual).assertEqual("1773.333333*1330");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0010
     * @tc.name      Resolution_XComponentSize_0010
     * @tc.desc      xComponentSize(true,50000013,1120,1380,90,90,0,1) resolves to 1120x1380.00016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0010 begin`);
      logInfo("xComponentSize(true,50000013,1120,1380,90,90,0,1)");
      const actual: string = xComponentSizeText(true, 50000013, 1120, 1380, 90, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1120*1380.00016");
      expect(actual).assertEqual("1120*1380.00016");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0011
     * @tc.name      Resolution_XComponentSize_0011
     * @tc.desc      xComponentSize(false,50000014,720,1430,180,0,1,1.7777777777777777) resolves to 2542.222222x1430.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0011 begin`);
      logInfo("xComponentSize(false,50000014,720,1430,180,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000014, 720, 1430, 180, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2542.222222*1430");
      expect(actual).assertEqual("2542.222222*1430");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0012
     * @tc.name      Resolution_XComponentSize_0012
     * @tc.desc      xComponentSize(false,0,820,1480,270,90,2,1.3333333333333333) resolves to 1973.333333x1480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}XComponentSize_0012 begin`);
      logInfo("xComponentSize(false,0,820,1480,270,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 0, 820, 1480, 270, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1973.333333*1480");
      expect(actual).assertEqual("1973.333333*1480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0013
     * @tc.name      Resolution_XComponentSize_0013
     * @tc.desc      xComponentSize(true,50000012,920,1530,0,0,0,1) resolves to 920x1529.99956.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0013 begin`);
      logInfo("xComponentSize(true,50000012,920,1530,0,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000012, 920, 1530, 0, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "920*1529.99956");
      expect(actual).assertEqual("920*1529.99956");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0014
     * @tc.name      Resolution_XComponentSize_0014
     * @tc.desc      xComponentSize(false,50000013,1020,1580,90,90,1,1.7777777777777777) resolves to 2808.888889x1580.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0014 begin`);
      logInfo("xComponentSize(false,50000013,1020,1580,90,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000013, 1020, 1580, 90, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2808.888889*1580");
      expect(actual).assertEqual("2808.888889*1580");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0015
     * @tc.name      Resolution_XComponentSize_0015
     * @tc.desc      xComponentSize(false,50000014,1120,1280,180,0,2,1.3333333333333333) resolves to 1706.666667x1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0015 begin`);
      logInfo("xComponentSize(false,50000014,1120,1280,180,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000014, 1120, 1280, 180, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1706.666667*1280");
      expect(actual).assertEqual("1706.666667*1280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0016
     * @tc.name      Resolution_XComponentSize_0016
     * @tc.desc      xComponentSize(true,0,720,1330,270,90,0,1) resolves to 720x1329.99984.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0016 begin`);
      logInfo("xComponentSize(true,0,720,1330,270,90,0,1)");
      const actual: string = xComponentSizeText(true, 0, 720, 1330, 270, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "720*1329.99984");
      expect(actual).assertEqual("720*1329.99984");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0017
     * @tc.name      Resolution_XComponentSize_0017
     * @tc.desc      xComponentSize(false,50000012,820,1380,0,0,1,1.7777777777777777) resolves to 2453.333333x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0017 begin`);
      logInfo("xComponentSize(false,50000012,820,1380,0,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000012, 820, 1380, 0, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2453.333333*1380");
      expect(actual).assertEqual("2453.333333*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0018
     * @tc.name      Resolution_XComponentSize_0018
     * @tc.desc      xComponentSize(false,50000013,920,1430,90,90,2,1.3333333333333333) resolves to 1906.666667x1430.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_XComponentSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}XComponentSize_0018 begin`);
      logInfo("xComponentSize(false,50000013,920,1430,90,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000013, 920, 1430, 90, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1906.666667*1430");
      expect(actual).assertEqual("1906.666667*1430");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0019
     * @tc.name      Resolution_XComponentSize_0019
     * @tc.desc      xComponentSize(true,50000014,1020,1480,180,0,0,1) resolves to 2147.4504x1480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0019 begin`);
      logInfo("xComponentSize(true,50000014,1020,1480,180,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000014, 1020, 1480, 180, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "2147.4504*1480");
      expect(actual).assertEqual("2147.4504*1480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0020
     * @tc.name      Resolution_XComponentSize_0020
     * @tc.desc      xComponentSize(false,0,1120,1530,270,90,1,1.7777777777777777) resolves to 2720x1530.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0020 begin`);
      logInfo("xComponentSize(false,0,1120,1530,270,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 0, 1120, 1530, 270, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2720*1530");
      expect(actual).assertEqual("2720*1530");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0021
     * @tc.name      Resolution_XComponentSize_0021
     * @tc.desc      xComponentSize(false,50000012,720,1580,0,0,2,1.3333333333333333) resolves to 2106.666667x1580.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0021 begin`);
      logInfo("xComponentSize(false,50000012,720,1580,0,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000012, 720, 1580, 0, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "2106.666667*1580");
      expect(actual).assertEqual("2106.666667*1580");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0022
     * @tc.name      Resolution_XComponentSize_0022
     * @tc.desc      xComponentSize(true,50000013,820,1280,90,90,0,1) resolves to 820x1280.00032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0022 begin`);
      logInfo("xComponentSize(true,50000013,820,1280,90,90,0,1)");
      const actual: string = xComponentSizeText(true, 50000013, 820, 1280, 90, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "820*1280.00032");
      expect(actual).assertEqual("820*1280.00032");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0023
     * @tc.name      Resolution_XComponentSize_0023
     * @tc.desc      xComponentSize(false,50000014,920,1330,180,0,1,1.7777777777777777) resolves to 2364.444444x1330.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}XComponentSize_0023 begin`);
      logInfo("xComponentSize(false,50000014,920,1330,180,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000014, 920, 1330, 180, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2364.444444*1330");
      expect(actual).assertEqual("2364.444444*1330");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0024
     * @tc.name      Resolution_XComponentSize_0024
     * @tc.desc      xComponentSize(false,0,1020,1380,270,90,2,1.3333333333333333) resolves to 1840x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0024 begin`);
      logInfo("xComponentSize(false,0,1020,1380,270,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 0, 1020, 1380, 270, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1840*1380");
      expect(actual).assertEqual("1840*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0025
     * @tc.name      Resolution_XComponentSize_0025
     * @tc.desc      xComponentSize(true,50000012,1120,1430,0,0,0,1) resolves to 1120x1430.00032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0025 begin`);
      logInfo("xComponentSize(true,50000012,1120,1430,0,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000012, 1120, 1430, 0, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1120*1430.00032");
      expect(actual).assertEqual("1120*1430.00032");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0026
     * @tc.name      Resolution_XComponentSize_0026
     * @tc.desc      xComponentSize(false,50000013,720,1480,90,90,1,1.7777777777777777) resolves to 2631.111111x1480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0026 begin`);
      logInfo("xComponentSize(false,50000013,720,1480,90,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000013, 720, 1480, 90, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2631.111111*1480");
      expect(actual).assertEqual("2631.111111*1480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0027
     * @tc.name      Resolution_XComponentSize_0027
     * @tc.desc      xComponentSize(false,50000014,820,1530,180,0,2,1.3333333333333333) resolves to 2040x1530.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0027 begin`);
      logInfo("xComponentSize(false,50000014,820,1530,180,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000014, 820, 1530, 180, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "2040*1530");
      expect(actual).assertEqual("2040*1530");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0028
     * @tc.name      Resolution_XComponentSize_0028
     * @tc.desc      xComponentSize(true,0,920,1580,270,90,0,1) resolves to 920x1579.99972.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0028 begin`);
      logInfo("xComponentSize(true,0,920,1580,270,90,0,1)");
      const actual: string = xComponentSizeText(true, 0, 920, 1580, 270, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "920*1579.99972");
      expect(actual).assertEqual("920*1579.99972");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0029
     * @tc.name      Resolution_XComponentSize_0029
     * @tc.desc      xComponentSize(false,50000012,1020,1280,0,0,1,1.7777777777777777) resolves to 2275.555556x1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0029 begin`);
      logInfo("xComponentSize(false,50000012,1020,1280,0,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000012, 1020, 1280, 0, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2275.555556*1280");
      expect(actual).assertEqual("2275.555556*1280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0030
     * @tc.name      Resolution_XComponentSize_0030
     * @tc.desc      xComponentSize(false,50000013,1120,1330,90,90,2,1.3333333333333333) resolves to 1773.333333x1330.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0030 begin`);
      logInfo("xComponentSize(false,50000013,1120,1330,90,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000013, 1120, 1330, 90, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1773.333333*1330");
      expect(actual).assertEqual("1773.333333*1330");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0031
     * @tc.name      Resolution_XComponentSize_0031
     * @tc.desc      xComponentSize(true,50000014,720,1380,180,0,0,1) resolves to 2645.00046x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0031 begin`);
      logInfo("xComponentSize(true,50000014,720,1380,180,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000014, 720, 1380, 180, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "2645.00046*1380");
      expect(actual).assertEqual("2645.00046*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0032
     * @tc.name      Resolution_XComponentSize_0032
     * @tc.desc      xComponentSize(false,0,820,1430,270,90,1,1.7777777777777777) resolves to 2542.222222x1430.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0032 begin`);
      logInfo("xComponentSize(false,0,820,1430,270,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 0, 820, 1430, 270, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2542.222222*1430");
      expect(actual).assertEqual("2542.222222*1430");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0033
     * @tc.name      Resolution_XComponentSize_0033
     * @tc.desc      xComponentSize(false,50000012,920,1480,0,0,2,1.3333333333333333) resolves to 1973.333333x1480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0033 begin`);
      logInfo("xComponentSize(false,50000012,920,1480,0,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000012, 920, 1480, 0, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1973.333333*1480");
      expect(actual).assertEqual("1973.333333*1480");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0034
     * @tc.name      Resolution_XComponentSize_0034
     * @tc.desc      xComponentSize(true,50000013,1020,1530,90,90,0,1) resolves to 1020x1530.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}XComponentSize_0034 begin`);
      logInfo("xComponentSize(true,50000013,1020,1530,90,90,0,1)");
      const actual: string = xComponentSizeText(true, 50000013, 1020, 1530, 90, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1020*1530");
      expect(actual).assertEqual("1020*1530");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0035
     * @tc.name      Resolution_XComponentSize_0035
     * @tc.desc      xComponentSize(false,50000014,1120,1580,180,0,1,1.7777777777777777) resolves to 2808.888889x1580.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_XComponentSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}XComponentSize_0035 begin`);
      logInfo("xComponentSize(false,50000014,1120,1580,180,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000014, 1120, 1580, 180, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2808.888889*1580");
      expect(actual).assertEqual("2808.888889*1580");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0036
     * @tc.name      Resolution_XComponentSize_0036
     * @tc.desc      xComponentSize(false,0,720,1280,270,90,2,1.3333333333333333) resolves to 1706.666667x1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0036 begin`);
      logInfo("xComponentSize(false,0,720,1280,270,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 0, 720, 1280, 270, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1706.666667*1280");
      expect(actual).assertEqual("1706.666667*1280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0037
     * @tc.name      Resolution_XComponentSize_0037
     * @tc.desc      xComponentSize(true,50000012,820,1330,0,0,0,1) resolves to 820x1329.99982.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0037 begin`);
      logInfo("xComponentSize(true,50000012,820,1330,0,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000012, 820, 1330, 0, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "820*1329.99982");
      expect(actual).assertEqual("820*1329.99982");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0038
     * @tc.name      Resolution_XComponentSize_0038
     * @tc.desc      xComponentSize(false,50000013,920,1380,90,90,1,1.7777777777777777) resolves to 2453.333333x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0038 begin`);
      logInfo("xComponentSize(false,50000013,920,1380,90,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000013, 920, 1380, 90, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2453.333333*1380");
      expect(actual).assertEqual("2453.333333*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0039
     * @tc.name      Resolution_XComponentSize_0039
     * @tc.desc      xComponentSize(false,50000014,1020,1430,180,0,2,1.3333333333333333) resolves to 1906.666667x1430.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0039 begin`);
      logInfo("xComponentSize(false,50000014,1020,1430,180,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000014, 1020, 1430, 180, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1906.666667*1430");
      expect(actual).assertEqual("1906.666667*1430");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0040
     * @tc.name      Resolution_XComponentSize_0040
     * @tc.desc      xComponentSize(true,0,1120,1480,270,90,0,1) resolves to 1120x1480.00048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0040 begin`);
      logInfo("xComponentSize(true,0,1120,1480,270,90,0,1)");
      const actual: string = xComponentSizeText(true, 0, 1120, 1480, 270, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1120*1480.00048");
      expect(actual).assertEqual("1120*1480.00048");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0041
     * @tc.name      Resolution_XComponentSize_0041
     * @tc.desc      xComponentSize(false,50000012,720,1530,0,0,1,1.7777777777777777) resolves to 2720x1530.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0041 begin`);
      logInfo("xComponentSize(false,50000012,720,1530,0,0,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 50000012, 720, 1530, 0, 0, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2720*1530");
      expect(actual).assertEqual("2720*1530");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0042
     * @tc.name      Resolution_XComponentSize_0042
     * @tc.desc      xComponentSize(false,50000013,820,1580,90,90,2,1.3333333333333333) resolves to 2106.666667x1580.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0042 begin`);
      logInfo("xComponentSize(false,50000013,820,1580,90,90,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000013, 820, 1580, 90, 90, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "2106.666667*1580");
      expect(actual).assertEqual("2106.666667*1580");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0043
     * @tc.name      Resolution_XComponentSize_0043
     * @tc.desc      xComponentSize(true,50000014,920,1280,180,0,0,1) resolves to 1780.86912x1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0043 begin`);
      logInfo("xComponentSize(true,50000014,920,1280,180,0,0,1)");
      const actual: string = xComponentSizeText(true, 50000014, 920, 1280, 180, 0, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1780.86912*1280");
      expect(actual).assertEqual("1780.86912*1280");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0044
     * @tc.name      Resolution_XComponentSize_0044
     * @tc.desc      xComponentSize(false,0,1020,1330,270,90,1,1.7777777777777777) resolves to 2364.444444x1330.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0044 begin`);
      logInfo("xComponentSize(false,0,1020,1330,270,90,1,1.7777777777777777)");
      const actual: string = xComponentSizeText(false, 0, 1020, 1330, 270, 90, 1, 1.7777777777777777);
      logInfo('actual=' + String(actual) + ', expected=' + "2364.444444*1330");
      expect(actual).assertEqual("2364.444444*1330");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0045
     * @tc.name      Resolution_XComponentSize_0045
     * @tc.desc      xComponentSize(false,50000012,1120,1380,0,0,2,1.3333333333333333) resolves to 1840x1380.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}XComponentSize_0045 begin`);
      logInfo("xComponentSize(false,50000012,1120,1380,0,0,2,1.3333333333333333)");
      const actual: string = xComponentSizeText(false, 50000012, 1120, 1380, 0, 0, 2, 1.3333333333333333);
      logInfo('actual=' + String(actual) + ', expected=' + "1840*1380");
      expect(actual).assertEqual("1840*1380");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0046
     * @tc.name      Resolution_XComponentSize_0046
     * @tc.desc      xComponentSize(true,50000013,720,1430,90,90,0,1) resolves to 720x1429.99992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_XComponentSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}XComponentSize_0046 begin`);
      logInfo("xComponentSize(true,50000013,720,1430,90,90,0,1)");
      const actual: string = xComponentSizeText(true, 50000013, 720, 1430, 90, 90, 0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "720*1429.99992");
      expect(actual).assertEqual("720*1429.99992");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}XComponentSize_0046 end`);
    });
  });
}
