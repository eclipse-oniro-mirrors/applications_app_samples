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
  resolutionRatio,
} from '../model/ResolutionLogic';

/** ResolutionRatioTest logic checks (43 cases). */
export default function resolutionRatioTest(): void {
  describe('ResolutionRatioTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0001
     * @tc.name      Resolution_ResRatio_0001
     * @tc.desc      resolutionRatio(0) gives 1.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResRatio_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResRatio_0001 begin`);
      logInfo("resolutionRatio(0)");
      const actual: number = resolutionRatio(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0002
     * @tc.name      Resolution_ResRatio_0002
     * @tc.desc      resolutionRatio(1) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0002 begin`);
      logInfo("resolutionRatio(1)");
      const actual: number = resolutionRatio(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ResRatio_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0003
     * @tc.name      Resolution_ResRatio_0003
     * @tc.desc      resolutionRatio(2) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0003 begin`);
      logInfo("resolutionRatio(2)");
      const actual: number = resolutionRatio(2);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ResRatio_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0004
     * @tc.name      Resolution_ResRatio_0004
     * @tc.desc      resolutionRatio(3) gives 1.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0004 begin`);
      logInfo("resolutionRatio(3)");
      const actual: number = resolutionRatio(3);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0005
     * @tc.name      Resolution_ResRatio_0005
     * @tc.desc      resolutionRatio(4) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0005 begin`);
      logInfo("resolutionRatio(4)");
      const actual: number = resolutionRatio(4);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ResRatio_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0006
     * @tc.name      Resolution_ResRatio_0006
     * @tc.desc      resolutionRatio(5) gives 2.22963.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0006 begin`);
      logInfo("resolutionRatio(5)");
      const actual: number = resolutionRatio(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.22963");
      expect(actual).assertEqual(2.22963);
      logInfo(`${BUNDLE}ResRatio_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0007
     * @tc.name      Resolution_ResRatio_0007
     * @tc.desc      resolutionRatio(6) gives 2.207407.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0007 begin`);
      logInfo("resolutionRatio(6)");
      const actual: number = resolutionRatio(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.207407");
      expect(actual).assertEqual(2.207407);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0008
     * @tc.name      Resolution_ResRatio_0008
     * @tc.desc      resolutionRatio(7) gives 1.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0008 begin`);
      logInfo("resolutionRatio(7)");
      const actual: number = resolutionRatio(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo(`${BUNDLE}ResRatio_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0009
     * @tc.name      Resolution_ResRatio_0009
     * @tc.desc      resolutionRatio(8) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0009 begin`);
      logInfo("resolutionRatio(8)");
      const actual: number = resolutionRatio(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ResRatio_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0010
     * @tc.name      Resolution_ResRatio_0010
     * @tc.desc      resolutionRatio(9) gives 1.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0010 begin`);
      logInfo("resolutionRatio(9)");
      const actual: number = resolutionRatio(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0011
     * @tc.name      Resolution_ResRatio_0011
     * @tc.desc      resolutionRatio(10) gives 1.777778.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0011 begin`);
      logInfo("resolutionRatio(10)");
      const actual: number = resolutionRatio(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1.777778");
      expect(actual).assertEqual(1.777778);
      logInfo(`${BUNDLE}ResRatio_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0012
     * @tc.name      Resolution_ResRatio_0012
     * @tc.desc      resolutionRatio(11) gives 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResRatio_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResRatio_0012 begin`);
      logInfo("resolutionRatio(11)");
      const actual: number = resolutionRatio(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ResRatio_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0013
     * @tc.name      Resolution_ResRatio_0013
     * @tc.desc      resolutionRatio(12) gives 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0013 begin`);
      logInfo("resolutionRatio(12)");
      const actual: number = resolutionRatio(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0014
     * @tc.name      Resolution_ResRatio_0014
     * @tc.desc      resolutionRatio(13) gives 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0014 begin`);
      logInfo("resolutionRatio(13)");
      const actual: number = resolutionRatio(13);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ResRatio_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0015
     * @tc.name      Resolution_ResRatio_0015
     * @tc.desc      resolutionRatio(14) gives 1.333333.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0015 begin`);
      logInfo("resolutionRatio(14)");
      const actual: number = resolutionRatio(14);
      logInfo('actual=' + String(actual) + ', expected=' + "1.333333");
      expect(actual).assertEqual(1.333333);
      logInfo(`${BUNDLE}ResRatio_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0016
     * @tc.name      Resolution_ResRatio_0016
     * @tc.desc      resolutionRatio(15) gives 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0016 begin`);
      logInfo("resolutionRatio(15)");
      const actual: number = resolutionRatio(15);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0017
     * @tc.name      Resolution_ResRatio_0017
     * @tc.desc      resolutionRatio(16) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0017 begin`);
      logInfo("resolutionRatio(16)");
      const actual: number = resolutionRatio(16);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0018
     * @tc.name      Resolution_ResRatio_0018
     * @tc.desc      resolutionRatio(-1) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResRatio_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResRatio_0018 begin`);
      logInfo("resolutionRatio(-1)");
      const actual: number = resolutionRatio(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0019
     * @tc.name      Resolution_ResRatio_0019
     * @tc.desc      resolutionRatio(20) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0019 begin`);
      logInfo("resolutionRatio(20)");
      const actual: number = resolutionRatio(20);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0020
     * @tc.name      Resolution_ResRatio_0020
     * @tc.desc      resolutionRatio(30) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0020 begin`);
      logInfo("resolutionRatio(30)");
      const actual: number = resolutionRatio(30);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0021
     * @tc.name      Resolution_ResRatio_0021
     * @tc.desc      resolutionRatio(40) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0021 begin`);
      logInfo("resolutionRatio(40)");
      const actual: number = resolutionRatio(40);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0022
     * @tc.name      Resolution_ResRatio_0022
     * @tc.desc      resolutionRatio(50) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0022 begin`);
      logInfo("resolutionRatio(50)");
      const actual: number = resolutionRatio(50);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0023
     * @tc.name      Resolution_ResRatio_0023
     * @tc.desc      resolutionRatio(60) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResRatio_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResRatio_0023 begin`);
      logInfo("resolutionRatio(60)");
      const actual: number = resolutionRatio(60);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0024
     * @tc.name      Resolution_ResRatio_0024
     * @tc.desc      resolutionRatio(70) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0024 begin`);
      logInfo("resolutionRatio(70)");
      const actual: number = resolutionRatio(70);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0025
     * @tc.name      Resolution_ResRatio_0025
     * @tc.desc      resolutionRatio(80) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0025 begin`);
      logInfo("resolutionRatio(80)");
      const actual: number = resolutionRatio(80);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0026
     * @tc.name      Resolution_ResRatio_0026
     * @tc.desc      resolutionRatio(90) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0026 begin`);
      logInfo("resolutionRatio(90)");
      const actual: number = resolutionRatio(90);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0027
     * @tc.name      Resolution_ResRatio_0027
     * @tc.desc      resolutionRatio(100) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0027 begin`);
      logInfo("resolutionRatio(100)");
      const actual: number = resolutionRatio(100);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0028
     * @tc.name      Resolution_ResRatio_0028
     * @tc.desc      resolutionRatio(200) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0028 begin`);
      logInfo("resolutionRatio(200)");
      const actual: number = resolutionRatio(200);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0029
     * @tc.name      Resolution_ResRatio_0029
     * @tc.desc      resolutionRatio(255) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0029 begin`);
      logInfo("resolutionRatio(255)");
      const actual: number = resolutionRatio(255);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0030
     * @tc.name      Resolution_ResRatio_0030
     * @tc.desc      resolutionRatio(360) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0030 begin`);
      logInfo("resolutionRatio(360)");
      const actual: number = resolutionRatio(360);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0031
     * @tc.name      Resolution_ResRatio_0031
     * @tc.desc      resolutionRatio(720) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0031 begin`);
      logInfo("resolutionRatio(720)");
      const actual: number = resolutionRatio(720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0032
     * @tc.name      Resolution_ResRatio_0032
     * @tc.desc      resolutionRatio(1080) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0032 begin`);
      logInfo("resolutionRatio(1080)");
      const actual: number = resolutionRatio(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0033
     * @tc.name      Resolution_ResRatio_0033
     * @tc.desc      resolutionRatio(1280) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0033 begin`);
      logInfo("resolutionRatio(1280)");
      const actual: number = resolutionRatio(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0034
     * @tc.name      Resolution_ResRatio_0034
     * @tc.desc      resolutionRatio(1920) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResRatio_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResRatio_0034 begin`);
      logInfo("resolutionRatio(1920)");
      const actual: number = resolutionRatio(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0035
     * @tc.name      Resolution_ResRatio_0035
     * @tc.desc      resolutionRatio(3840) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResRatio_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResRatio_0035 begin`);
      logInfo("resolutionRatio(3840)");
      const actual: number = resolutionRatio(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0036
     * @tc.name      Resolution_ResRatio_0036
     * @tc.desc      resolutionRatio(4096) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0036 begin`);
      logInfo("resolutionRatio(4096)");
      const actual: number = resolutionRatio(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0037
     * @tc.name      Resolution_ResRatio_0037
     * @tc.desc      resolutionRatio(999) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0037 begin`);
      logInfo("resolutionRatio(999)");
      const actual: number = resolutionRatio(999);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0038
     * @tc.name      Resolution_ResRatio_0038
     * @tc.desc      resolutionRatio(1000) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0038 begin`);
      logInfo("resolutionRatio(1000)");
      const actual: number = resolutionRatio(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0039
     * @tc.name      Resolution_ResRatio_0039
     * @tc.desc      resolutionRatio(24) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0039 begin`);
      logInfo("resolutionRatio(24)");
      const actual: number = resolutionRatio(24);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0040
     * @tc.name      Resolution_ResRatio_0040
     * @tc.desc      resolutionRatio(25) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0040 begin`);
      logInfo("resolutionRatio(25)");
      const actual: number = resolutionRatio(25);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0041
     * @tc.name      Resolution_ResRatio_0041
     * @tc.desc      resolutionRatio(28) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0041 begin`);
      logInfo("resolutionRatio(28)");
      const actual: number = resolutionRatio(28);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0042
     * @tc.name      Resolution_ResRatio_0042
     * @tc.desc      resolutionRatio(17) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0042 begin`);
      logInfo("resolutionRatio(17)");
      const actual: number = resolutionRatio(17);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResRatio_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_RATIO_0043
     * @tc.name      Resolution_ResRatio_0043
     * @tc.desc      resolutionRatio(19) gives 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResRatio_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResRatio_0043 begin`);
      logInfo("resolutionRatio(19)");
      const actual: number = resolutionRatio(19);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResRatio_0043 end`);
    });
  });
}
