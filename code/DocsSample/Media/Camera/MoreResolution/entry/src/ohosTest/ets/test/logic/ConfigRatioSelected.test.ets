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
  configRatioForSelectedIndex,
} from '../model/ResolutionLogic';

/** ConfigRatioSelectedTest logic checks (43 cases). */
export default function configRatioSelectedTest(): void {
  describe('ConfigRatioSelectedTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0001
     * @tc.name      Resolution_ConfigRatio_0001
     * @tc.desc      configRatioForSelectedIndex(0) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ConfigRatio_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigRatio_0001 begin`);
      logInfo("configRatioForSelectedIndex(0)");
      const actual: number = configRatioForSelectedIndex(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0002
     * @tc.name      Resolution_ConfigRatio_0002
     * @tc.desc      configRatioForSelectedIndex(1) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0002 begin`);
      logInfo("configRatioForSelectedIndex(1)");
      const actual: number = configRatioForSelectedIndex(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConfigRatio_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0003
     * @tc.name      Resolution_ConfigRatio_0003
     * @tc.desc      configRatioForSelectedIndex(2) yields 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0003 begin`);
      logInfo("configRatioForSelectedIndex(2)");
      const actual: number = configRatioForSelectedIndex(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ConfigRatio_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0004
     * @tc.name      Resolution_ConfigRatio_0004
     * @tc.desc      configRatioForSelectedIndex(3) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0004 begin`);
      logInfo("configRatioForSelectedIndex(3)");
      const actual: number = configRatioForSelectedIndex(3);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0005
     * @tc.name      Resolution_ConfigRatio_0005
     * @tc.desc      configRatioForSelectedIndex(4) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0005 begin`);
      logInfo("configRatioForSelectedIndex(4)");
      const actual: number = configRatioForSelectedIndex(4);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0006
     * @tc.name      Resolution_ConfigRatio_0006
     * @tc.desc      configRatioForSelectedIndex(5) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0006 begin`);
      logInfo("configRatioForSelectedIndex(5)");
      const actual: number = configRatioForSelectedIndex(5);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0007
     * @tc.name      Resolution_ConfigRatio_0007
     * @tc.desc      configRatioForSelectedIndex(6) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0007 begin`);
      logInfo("configRatioForSelectedIndex(6)");
      const actual: number = configRatioForSelectedIndex(6);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0008
     * @tc.name      Resolution_ConfigRatio_0008
     * @tc.desc      configRatioForSelectedIndex(7) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0008 begin`);
      logInfo("configRatioForSelectedIndex(7)");
      const actual: number = configRatioForSelectedIndex(7);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0009
     * @tc.name      Resolution_ConfigRatio_0009
     * @tc.desc      configRatioForSelectedIndex(8) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0009 begin`);
      logInfo("configRatioForSelectedIndex(8)");
      const actual: number = configRatioForSelectedIndex(8);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0010
     * @tc.name      Resolution_ConfigRatio_0010
     * @tc.desc      configRatioForSelectedIndex(9) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0010 begin`);
      logInfo("configRatioForSelectedIndex(9)");
      const actual: number = configRatioForSelectedIndex(9);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0011
     * @tc.name      Resolution_ConfigRatio_0011
     * @tc.desc      configRatioForSelectedIndex(10) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0011 begin`);
      logInfo("configRatioForSelectedIndex(10)");
      const actual: number = configRatioForSelectedIndex(10);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0012
     * @tc.name      Resolution_ConfigRatio_0012
     * @tc.desc      configRatioForSelectedIndex(11) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ConfigRatio_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigRatio_0012 begin`);
      logInfo("configRatioForSelectedIndex(11)");
      const actual: number = configRatioForSelectedIndex(11);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0013
     * @tc.name      Resolution_ConfigRatio_0013
     * @tc.desc      configRatioForSelectedIndex(12) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0013 begin`);
      logInfo("configRatioForSelectedIndex(12)");
      const actual: number = configRatioForSelectedIndex(12);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0014
     * @tc.name      Resolution_ConfigRatio_0014
     * @tc.desc      configRatioForSelectedIndex(13) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0014 begin`);
      logInfo("configRatioForSelectedIndex(13)");
      const actual: number = configRatioForSelectedIndex(13);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0015
     * @tc.name      Resolution_ConfigRatio_0015
     * @tc.desc      configRatioForSelectedIndex(14) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0015 begin`);
      logInfo("configRatioForSelectedIndex(14)");
      const actual: number = configRatioForSelectedIndex(14);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0016
     * @tc.name      Resolution_ConfigRatio_0016
     * @tc.desc      configRatioForSelectedIndex(15) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0016 begin`);
      logInfo("configRatioForSelectedIndex(15)");
      const actual: number = configRatioForSelectedIndex(15);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0017
     * @tc.name      Resolution_ConfigRatio_0017
     * @tc.desc      configRatioForSelectedIndex(16) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0017 begin`);
      logInfo("configRatioForSelectedIndex(16)");
      const actual: number = configRatioForSelectedIndex(16);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0018
     * @tc.name      Resolution_ConfigRatio_0018
     * @tc.desc      configRatioForSelectedIndex(-1) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ConfigRatio_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigRatio_0018 begin`);
      logInfo("configRatioForSelectedIndex(-1)");
      const actual: number = configRatioForSelectedIndex(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0019
     * @tc.name      Resolution_ConfigRatio_0019
     * @tc.desc      configRatioForSelectedIndex(20) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0019 begin`);
      logInfo("configRatioForSelectedIndex(20)");
      const actual: number = configRatioForSelectedIndex(20);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0020
     * @tc.name      Resolution_ConfigRatio_0020
     * @tc.desc      configRatioForSelectedIndex(30) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0020 begin`);
      logInfo("configRatioForSelectedIndex(30)");
      const actual: number = configRatioForSelectedIndex(30);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0021
     * @tc.name      Resolution_ConfigRatio_0021
     * @tc.desc      configRatioForSelectedIndex(40) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0021 begin`);
      logInfo("configRatioForSelectedIndex(40)");
      const actual: number = configRatioForSelectedIndex(40);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0022
     * @tc.name      Resolution_ConfigRatio_0022
     * @tc.desc      configRatioForSelectedIndex(50) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0022 begin`);
      logInfo("configRatioForSelectedIndex(50)");
      const actual: number = configRatioForSelectedIndex(50);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0023
     * @tc.name      Resolution_ConfigRatio_0023
     * @tc.desc      configRatioForSelectedIndex(60) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ConfigRatio_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigRatio_0023 begin`);
      logInfo("configRatioForSelectedIndex(60)");
      const actual: number = configRatioForSelectedIndex(60);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0024
     * @tc.name      Resolution_ConfigRatio_0024
     * @tc.desc      configRatioForSelectedIndex(70) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0024 begin`);
      logInfo("configRatioForSelectedIndex(70)");
      const actual: number = configRatioForSelectedIndex(70);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0025
     * @tc.name      Resolution_ConfigRatio_0025
     * @tc.desc      configRatioForSelectedIndex(80) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0025 begin`);
      logInfo("configRatioForSelectedIndex(80)");
      const actual: number = configRatioForSelectedIndex(80);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0026
     * @tc.name      Resolution_ConfigRatio_0026
     * @tc.desc      configRatioForSelectedIndex(90) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0026 begin`);
      logInfo("configRatioForSelectedIndex(90)");
      const actual: number = configRatioForSelectedIndex(90);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0027
     * @tc.name      Resolution_ConfigRatio_0027
     * @tc.desc      configRatioForSelectedIndex(100) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0027 begin`);
      logInfo("configRatioForSelectedIndex(100)");
      const actual: number = configRatioForSelectedIndex(100);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0028
     * @tc.name      Resolution_ConfigRatio_0028
     * @tc.desc      configRatioForSelectedIndex(200) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0028 begin`);
      logInfo("configRatioForSelectedIndex(200)");
      const actual: number = configRatioForSelectedIndex(200);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0029
     * @tc.name      Resolution_ConfigRatio_0029
     * @tc.desc      configRatioForSelectedIndex(255) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0029 begin`);
      logInfo("configRatioForSelectedIndex(255)");
      const actual: number = configRatioForSelectedIndex(255);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0030
     * @tc.name      Resolution_ConfigRatio_0030
     * @tc.desc      configRatioForSelectedIndex(360) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0030 begin`);
      logInfo("configRatioForSelectedIndex(360)");
      const actual: number = configRatioForSelectedIndex(360);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0031
     * @tc.name      Resolution_ConfigRatio_0031
     * @tc.desc      configRatioForSelectedIndex(720) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0031 begin`);
      logInfo("configRatioForSelectedIndex(720)");
      const actual: number = configRatioForSelectedIndex(720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0032
     * @tc.name      Resolution_ConfigRatio_0032
     * @tc.desc      configRatioForSelectedIndex(1080) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0032 begin`);
      logInfo("configRatioForSelectedIndex(1080)");
      const actual: number = configRatioForSelectedIndex(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0033
     * @tc.name      Resolution_ConfigRatio_0033
     * @tc.desc      configRatioForSelectedIndex(1280) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0033 begin`);
      logInfo("configRatioForSelectedIndex(1280)");
      const actual: number = configRatioForSelectedIndex(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0034
     * @tc.name      Resolution_ConfigRatio_0034
     * @tc.desc      configRatioForSelectedIndex(1920) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ConfigRatio_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConfigRatio_0034 begin`);
      logInfo("configRatioForSelectedIndex(1920)");
      const actual: number = configRatioForSelectedIndex(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ConfigRatio_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0035
     * @tc.name      Resolution_ConfigRatio_0035
     * @tc.desc      configRatioForSelectedIndex(3840) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ConfigRatio_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConfigRatio_0035 begin`);
      logInfo("configRatioForSelectedIndex(3840)");
      const actual: number = configRatioForSelectedIndex(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_CONFIG_RATIO_0036
     * @tc.name      Resolution_ConfigRatio_0036
     * @tc.desc      configRatioForSelectedIndex(4096) yields 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ConfigRatio_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConfigRatio_0036 begin`);
      logInfo("configRatioForSelectedIndex(4096)");
      const actual: number = configRatioForSelectedIndex(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConfigRatio_0036 end`);
    });

    /**
