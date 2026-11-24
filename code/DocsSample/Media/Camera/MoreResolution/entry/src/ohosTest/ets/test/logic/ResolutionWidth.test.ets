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
  resolutionWidth,
} from '../model/ResolutionLogic';

/** ResolutionWidthTest logic checks (43 cases). */
export default function resolutionWidthTest(): void {
  describe('ResolutionWidthTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0001
     * @tc.name      Resolution_ResWidth_0001
     * @tc.desc      resolutionWidth(0) returns 4096.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResWidth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResWidth_0001 begin`);
      logInfo("resolutionWidth(0)");
      const actual: number = resolutionWidth(0);
      logInfo('actual=' + String(actual) + ', expected=' + "4096");
      expect(actual).assertEqual(4096);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0002
     * @tc.name      Resolution_ResWidth_0002
     * @tc.desc      resolutionWidth(1) returns 4096.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0002 begin`);
      logInfo("resolutionWidth(1)");
      const actual: number = resolutionWidth(1);
      logInfo('actual=' + String(actual) + ', expected=' + "4096");
      expect(actual).assertEqual(4096);
      logInfo(`${BUNDLE}ResWidth_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0003
     * @tc.name      Resolution_ResWidth_0003
     * @tc.desc      resolutionWidth(2) returns 3840.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0003 begin`);
      logInfo("resolutionWidth(2)");
      const actual: number = resolutionWidth(2);
      logInfo('actual=' + String(actual) + ', expected=' + "3840");
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}ResWidth_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0004
     * @tc.name      Resolution_ResWidth_0004
     * @tc.desc      resolutionWidth(3) returns 2880.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0004 begin`);
      logInfo("resolutionWidth(3)");
      const actual: number = resolutionWidth(3);
      logInfo('actual=' + String(actual) + ', expected=' + "2880");
      expect(actual).assertEqual(2880);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0005
     * @tc.name      Resolution_ResWidth_0005
     * @tc.desc      resolutionWidth(4) returns 2560.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0005 begin`);
      logInfo("resolutionWidth(4)");
      const actual: number = resolutionWidth(4);
      logInfo('actual=' + String(actual) + ', expected=' + "2560");
      expect(actual).assertEqual(2560);
      logInfo(`${BUNDLE}ResWidth_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0006
     * @tc.name      Resolution_ResWidth_0006
     * @tc.desc      resolutionWidth(5) returns 2408.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0006 begin`);
      logInfo("resolutionWidth(5)");
      const actual: number = resolutionWidth(5);
      logInfo('actual=' + String(actual) + ', expected=' + "2408");
      expect(actual).assertEqual(2408);
      logInfo(`${BUNDLE}ResWidth_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0007
     * @tc.name      Resolution_ResWidth_0007
     * @tc.desc      resolutionWidth(6) returns 2384.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0007 begin`);
      logInfo("resolutionWidth(6)");
      const actual: number = resolutionWidth(6);
      logInfo('actual=' + String(actual) + ', expected=' + "2384");
      expect(actual).assertEqual(2384);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0008
     * @tc.name      Resolution_ResWidth_0008
     * @tc.desc      resolutionWidth(7) returns 1920.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0008 begin`);
      logInfo("resolutionWidth(7)");
      const actual: number = resolutionWidth(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ResWidth_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0009
     * @tc.name      Resolution_ResWidth_0009
     * @tc.desc      resolutionWidth(8) returns 1920.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0009 begin`);
      logInfo("resolutionWidth(8)");
      const actual: number = resolutionWidth(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ResWidth_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0010
     * @tc.name      Resolution_ResWidth_0010
     * @tc.desc      resolutionWidth(9) returns 1440.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0010 begin`);
      logInfo("resolutionWidth(9)");
      const actual: number = resolutionWidth(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1440");
      expect(actual).assertEqual(1440);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0011
     * @tc.name      Resolution_ResWidth_0011
     * @tc.desc      resolutionWidth(10) returns 1280.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0011 begin`);
      logInfo("resolutionWidth(10)");
      const actual: number = resolutionWidth(10);
      logInfo('actual=' + String(actual) + ', expected=' + "1280");
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}ResWidth_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0012
     * @tc.name      Resolution_ResWidth_0012
     * @tc.desc      resolutionWidth(11) returns 1088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResWidth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResWidth_0012 begin`);
      logInfo("resolutionWidth(11)");
      const actual: number = resolutionWidth(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1088");
      expect(actual).assertEqual(1088);
      logInfo(`${BUNDLE}ResWidth_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0013
     * @tc.name      Resolution_ResWidth_0013
     * @tc.desc      resolutionWidth(12) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0013 begin`);
      logInfo("resolutionWidth(12)");
      const actual: number = resolutionWidth(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0014
     * @tc.name      Resolution_ResWidth_0014
     * @tc.desc      resolutionWidth(13) returns 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0014 begin`);
      logInfo("resolutionWidth(13)");
      const actual: number = resolutionWidth(13);
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ResWidth_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0015
     * @tc.name      Resolution_ResWidth_0015
     * @tc.desc      resolutionWidth(14) returns 640.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0015 begin`);
      logInfo("resolutionWidth(14)");
      const actual: number = resolutionWidth(14);
      logInfo('actual=' + String(actual) + ', expected=' + "640");
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}ResWidth_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0016
     * @tc.name      Resolution_ResWidth_0016
     * @tc.desc      resolutionWidth(15) returns 480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0016 begin`);
      logInfo("resolutionWidth(15)");
      const actual: number = resolutionWidth(15);
      logInfo('actual=' + String(actual) + ', expected=' + "480");
      expect(actual).assertEqual(480);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0017
     * @tc.name      Resolution_ResWidth_0017
     * @tc.desc      resolutionWidth(16) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0017 begin`);
      logInfo("resolutionWidth(16)");
      const actual: number = resolutionWidth(16);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0018
     * @tc.name      Resolution_ResWidth_0018
     * @tc.desc      resolutionWidth(17) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResWidth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResWidth_0018 begin`);
      logInfo("resolutionWidth(17)");
      const actual: number = resolutionWidth(17);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0019
     * @tc.name      Resolution_ResWidth_0019
     * @tc.desc      resolutionWidth(-1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0019 begin`);
      logInfo("resolutionWidth(-1)");
      const actual: number = resolutionWidth(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0020
     * @tc.name      Resolution_ResWidth_0020
     * @tc.desc      resolutionWidth(-2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0020 begin`);
      logInfo("resolutionWidth(-2)");
      const actual: number = resolutionWidth(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0021
     * @tc.name      Resolution_ResWidth_0021
     * @tc.desc      resolutionWidth(20) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0021 begin`);
      logInfo("resolutionWidth(20)");
      const actual: number = resolutionWidth(20);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0022
     * @tc.name      Resolution_ResWidth_0022
     * @tc.desc      resolutionWidth(30) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0022 begin`);
      logInfo("resolutionWidth(30)");
      const actual: number = resolutionWidth(30);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0023
     * @tc.name      Resolution_ResWidth_0023
     * @tc.desc      resolutionWidth(40) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResWidth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResWidth_0023 begin`);
      logInfo("resolutionWidth(40)");
      const actual: number = resolutionWidth(40);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0024
     * @tc.name      Resolution_ResWidth_0024
     * @tc.desc      resolutionWidth(50) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0024 begin`);
      logInfo("resolutionWidth(50)");
      const actual: number = resolutionWidth(50);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0025
     * @tc.name      Resolution_ResWidth_0025
     * @tc.desc      resolutionWidth(60) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0025 begin`);
      logInfo("resolutionWidth(60)");
      const actual: number = resolutionWidth(60);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0026
     * @tc.name      Resolution_ResWidth_0026
     * @tc.desc      resolutionWidth(70) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0026 begin`);
      logInfo("resolutionWidth(70)");
      const actual: number = resolutionWidth(70);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0027
     * @tc.name      Resolution_ResWidth_0027
     * @tc.desc      resolutionWidth(80) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0027 begin`);
      logInfo("resolutionWidth(80)");
      const actual: number = resolutionWidth(80);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0028
     * @tc.name      Resolution_ResWidth_0028
     * @tc.desc      resolutionWidth(90) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0028 begin`);
      logInfo("resolutionWidth(90)");
      const actual: number = resolutionWidth(90);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0029
     * @tc.name      Resolution_ResWidth_0029
     * @tc.desc      resolutionWidth(100) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0029 begin`);
      logInfo("resolutionWidth(100)");
      const actual: number = resolutionWidth(100);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0030
     * @tc.name      Resolution_ResWidth_0030
     * @tc.desc      resolutionWidth(200) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0030 begin`);
      logInfo("resolutionWidth(200)");
      const actual: number = resolutionWidth(200);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0031
     * @tc.name      Resolution_ResWidth_0031
     * @tc.desc      resolutionWidth(255) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0031 begin`);
      logInfo("resolutionWidth(255)");
      const actual: number = resolutionWidth(255);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0032
     * @tc.name      Resolution_ResWidth_0032
     * @tc.desc      resolutionWidth(360) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0032 begin`);
      logInfo("resolutionWidth(360)");
      const actual: number = resolutionWidth(360);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0033
     * @tc.name      Resolution_ResWidth_0033
     * @tc.desc      resolutionWidth(720) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0033 begin`);
      logInfo("resolutionWidth(720)");
      const actual: number = resolutionWidth(720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0034
     * @tc.name      Resolution_ResWidth_0034
     * @tc.desc      resolutionWidth(1080) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResWidth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResWidth_0034 begin`);
      logInfo("resolutionWidth(1080)");
      const actual: number = resolutionWidth(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0035
     * @tc.name      Resolution_ResWidth_0035
     * @tc.desc      resolutionWidth(1280) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResWidth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResWidth_0035 begin`);
      logInfo("resolutionWidth(1280)");
      const actual: number = resolutionWidth(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0036
     * @tc.name      Resolution_ResWidth_0036
     * @tc.desc      resolutionWidth(1920) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0036 begin`);
      logInfo("resolutionWidth(1920)");
      const actual: number = resolutionWidth(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0037
     * @tc.name      Resolution_ResWidth_0037
     * @tc.desc      resolutionWidth(3840) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0037 begin`);
      logInfo("resolutionWidth(3840)");
      const actual: number = resolutionWidth(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0038
     * @tc.name      Resolution_ResWidth_0038
     * @tc.desc      resolutionWidth(4096) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0038 begin`);
      logInfo("resolutionWidth(4096)");
      const actual: number = resolutionWidth(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0039
     * @tc.name      Resolution_ResWidth_0039
     * @tc.desc      resolutionWidth(999) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0039 begin`);
      logInfo("resolutionWidth(999)");
      const actual: number = resolutionWidth(999);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0040
     * @tc.name      Resolution_ResWidth_0040
     * @tc.desc      resolutionWidth(1000) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0040 begin`);
      logInfo("resolutionWidth(1000)");
      const actual: number = resolutionWidth(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0041
     * @tc.name      Resolution_ResWidth_0041
     * @tc.desc      resolutionWidth(24) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0041 begin`);
      logInfo("resolutionWidth(24)");
      const actual: number = resolutionWidth(24);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0042
     * @tc.name      Resolution_ResWidth_0042
     * @tc.desc      resolutionWidth(25) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0042 begin`);
      logInfo("resolutionWidth(25)");
      const actual: number = resolutionWidth(25);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResWidth_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_WIDTH_0043
     * @tc.name      Resolution_ResWidth_0043
     * @tc.desc      resolutionWidth(28) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResWidth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResWidth_0043 begin`);
      logInfo("resolutionWidth(28)");
      const actual: number = resolutionWidth(28);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResWidth_0043 end`);
    });
  });
}
