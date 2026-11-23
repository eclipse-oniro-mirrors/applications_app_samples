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
  resolutionHeight,
} from '../model/ResolutionLogic';

/** ResolutionHeightTest logic checks (43 cases). */
export default function resolutionHeightTest(): void {
  describe('ResolutionHeightTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0001
     * @tc.name      Resolution_ResHeight_0001
     * @tc.desc      resolutionHeight(0) returns 3072.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResHeight_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResHeight_0001 begin`);
      logInfo("resolutionHeight(0)");
      const actual: number = resolutionHeight(0);
      logInfo('actual=' + String(actual) + ', expected=' + "3072");
      expect(actual).assertEqual(3072);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0002
     * @tc.name      Resolution_ResHeight_0002
     * @tc.desc      resolutionHeight(1) returns 2304.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0002 begin`);
      logInfo("resolutionHeight(1)");
      const actual: number = resolutionHeight(1);
      logInfo('actual=' + String(actual) + ', expected=' + "2304");
      expect(actual).assertEqual(2304);
      logInfo(`${BUNDLE}ResHeight_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0003
     * @tc.name      Resolution_ResHeight_0003
     * @tc.desc      resolutionHeight(2) returns 2160.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0003 begin`);
      logInfo("resolutionHeight(2)");
      const actual: number = resolutionHeight(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2160");
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}ResHeight_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0004
     * @tc.name      Resolution_ResHeight_0004
     * @tc.desc      resolutionHeight(3) returns 2160.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0004 begin`);
      logInfo("resolutionHeight(3)");
      const actual: number = resolutionHeight(3);
      logInfo('actual=' + String(actual) + ', expected=' + "2160");
      expect(actual).assertEqual(2160);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0005
     * @tc.name      Resolution_ResHeight_0005
     * @tc.desc      resolutionHeight(4) returns 1440.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0005 begin`);
      logInfo("resolutionHeight(4)");
      const actual: number = resolutionHeight(4);
      logInfo('actual=' + String(actual) + ', expected=' + "1440");
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}ResHeight_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0006
     * @tc.name      Resolution_ResHeight_0006
     * @tc.desc      resolutionHeight(5) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0006 begin`);
      logInfo("resolutionHeight(5)");
      const actual: number = resolutionHeight(5);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ResHeight_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0007
     * @tc.name      Resolution_ResHeight_0007
     * @tc.desc      resolutionHeight(6) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0007 begin`);
      logInfo("resolutionHeight(6)");
      const actual: number = resolutionHeight(6);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0008
     * @tc.name      Resolution_ResHeight_0008
     * @tc.desc      resolutionHeight(7) returns 1440.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0008 begin`);
      logInfo("resolutionHeight(7)");
      const actual: number = resolutionHeight(7);
      logInfo('actual=' + String(actual) + ', expected=' + "1440");
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}ResHeight_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0009
     * @tc.name      Resolution_ResHeight_0009
     * @tc.desc      resolutionHeight(8) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0009 begin`);
      logInfo("resolutionHeight(8)");
      const actual: number = resolutionHeight(8);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ResHeight_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0010
     * @tc.name      Resolution_ResHeight_0010
     * @tc.desc      resolutionHeight(9) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0010 begin`);
      logInfo("resolutionHeight(9)");
      const actual: number = resolutionHeight(9);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0011
     * @tc.name      Resolution_ResHeight_0011
     * @tc.desc      resolutionHeight(10) returns 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0011 begin`);
      logInfo("resolutionHeight(10)");
      const actual: number = resolutionHeight(10);
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ResHeight_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0012
     * @tc.name      Resolution_ResHeight_0012
     * @tc.desc      resolutionHeight(11) returns 1088.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResHeight_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResHeight_0012 begin`);
      logInfo("resolutionHeight(11)");
      const actual: number = resolutionHeight(11);
      logInfo('actual=' + String(actual) + ', expected=' + "1088");
      expect(actual).assertEqual(1088);
      logInfo(`${BUNDLE}ResHeight_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0013
     * @tc.name      Resolution_ResHeight_0013
     * @tc.desc      resolutionHeight(12) returns 1080.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0013 begin`);
      logInfo("resolutionHeight(12)");
      const actual: number = resolutionHeight(12);
      logInfo('actual=' + String(actual) + ', expected=' + "1080");
      expect(actual).assertEqual(1080);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0014
     * @tc.name      Resolution_ResHeight_0014
     * @tc.desc      resolutionHeight(13) returns 720.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0014 begin`);
      logInfo("resolutionHeight(13)");
      const actual: number = resolutionHeight(13);
      logInfo('actual=' + String(actual) + ', expected=' + "720");
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ResHeight_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0015
     * @tc.name      Resolution_ResHeight_0015
     * @tc.desc      resolutionHeight(14) returns 480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0015 begin`);
      logInfo("resolutionHeight(14)");
      const actual: number = resolutionHeight(14);
      logInfo('actual=' + String(actual) + ', expected=' + "480");
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}ResHeight_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0016
     * @tc.name      Resolution_ResHeight_0016
     * @tc.desc      resolutionHeight(15) returns 480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0016 begin`);
      logInfo("resolutionHeight(15)");
      const actual: number = resolutionHeight(15);
      logInfo('actual=' + String(actual) + ', expected=' + "480");
      expect(actual).assertEqual(480);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0017
     * @tc.name      Resolution_ResHeight_0017
     * @tc.desc      resolutionHeight(16) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0017 begin`);
      logInfo("resolutionHeight(16)");
      const actual: number = resolutionHeight(16);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0018
     * @tc.name      Resolution_ResHeight_0018
     * @tc.desc      resolutionHeight(17) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResHeight_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResHeight_0018 begin`);
      logInfo("resolutionHeight(17)");
      const actual: number = resolutionHeight(17);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0019
     * @tc.name      Resolution_ResHeight_0019
     * @tc.desc      resolutionHeight(-1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0019 begin`);
      logInfo("resolutionHeight(-1)");
      const actual: number = resolutionHeight(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0020
     * @tc.name      Resolution_ResHeight_0020
     * @tc.desc      resolutionHeight(-2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0020 begin`);
      logInfo("resolutionHeight(-2)");
      const actual: number = resolutionHeight(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0021
     * @tc.name      Resolution_ResHeight_0021
     * @tc.desc      resolutionHeight(20) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0021 begin`);
      logInfo("resolutionHeight(20)");
      const actual: number = resolutionHeight(20);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0022
     * @tc.name      Resolution_ResHeight_0022
     * @tc.desc      resolutionHeight(30) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0022 begin`);
      logInfo("resolutionHeight(30)");
      const actual: number = resolutionHeight(30);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0023
     * @tc.name      Resolution_ResHeight_0023
     * @tc.desc      resolutionHeight(40) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResHeight_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResHeight_0023 begin`);
      logInfo("resolutionHeight(40)");
      const actual: number = resolutionHeight(40);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0024
     * @tc.name      Resolution_ResHeight_0024
     * @tc.desc      resolutionHeight(50) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0024 begin`);
      logInfo("resolutionHeight(50)");
      const actual: number = resolutionHeight(50);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0025
     * @tc.name      Resolution_ResHeight_0025
     * @tc.desc      resolutionHeight(60) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0025 begin`);
      logInfo("resolutionHeight(60)");
      const actual: number = resolutionHeight(60);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0026
     * @tc.name      Resolution_ResHeight_0026
     * @tc.desc      resolutionHeight(70) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0026 begin`);
      logInfo("resolutionHeight(70)");
      const actual: number = resolutionHeight(70);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0027
     * @tc.name      Resolution_ResHeight_0027
     * @tc.desc      resolutionHeight(80) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0027 begin`);
      logInfo("resolutionHeight(80)");
      const actual: number = resolutionHeight(80);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0028
     * @tc.name      Resolution_ResHeight_0028
     * @tc.desc      resolutionHeight(90) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0028 begin`);
      logInfo("resolutionHeight(90)");
      const actual: number = resolutionHeight(90);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0029
     * @tc.name      Resolution_ResHeight_0029
     * @tc.desc      resolutionHeight(100) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0029 begin`);
      logInfo("resolutionHeight(100)");
      const actual: number = resolutionHeight(100);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0030
     * @tc.name      Resolution_ResHeight_0030
     * @tc.desc      resolutionHeight(200) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0030 begin`);
      logInfo("resolutionHeight(200)");
      const actual: number = resolutionHeight(200);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0031
     * @tc.name      Resolution_ResHeight_0031
     * @tc.desc      resolutionHeight(255) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0031 begin`);
      logInfo("resolutionHeight(255)");
      const actual: number = resolutionHeight(255);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0032
     * @tc.name      Resolution_ResHeight_0032
     * @tc.desc      resolutionHeight(360) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0032 begin`);
      logInfo("resolutionHeight(360)");
      const actual: number = resolutionHeight(360);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0033
     * @tc.name      Resolution_ResHeight_0033
     * @tc.desc      resolutionHeight(720) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0033 begin`);
      logInfo("resolutionHeight(720)");
      const actual: number = resolutionHeight(720);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0034
     * @tc.name      Resolution_ResHeight_0034
     * @tc.desc      resolutionHeight(1080) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ResHeight_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResHeight_0034 begin`);
      logInfo("resolutionHeight(1080)");
      const actual: number = resolutionHeight(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0035
     * @tc.name      Resolution_ResHeight_0035
     * @tc.desc      resolutionHeight(1280) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ResHeight_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResHeight_0035 begin`);
      logInfo("resolutionHeight(1280)");
      const actual: number = resolutionHeight(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0036
     * @tc.name      Resolution_ResHeight_0036
     * @tc.desc      resolutionHeight(1920) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0036 begin`);
      logInfo("resolutionHeight(1920)");
      const actual: number = resolutionHeight(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0037
     * @tc.name      Resolution_ResHeight_0037
     * @tc.desc      resolutionHeight(3840) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0037 begin`);
      logInfo("resolutionHeight(3840)");
      const actual: number = resolutionHeight(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0038
     * @tc.name      Resolution_ResHeight_0038
     * @tc.desc      resolutionHeight(4096) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0038 begin`);
      logInfo("resolutionHeight(4096)");
      const actual: number = resolutionHeight(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0039
     * @tc.name      Resolution_ResHeight_0039
     * @tc.desc      resolutionHeight(999) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0039 begin`);
      logInfo("resolutionHeight(999)");
      const actual: number = resolutionHeight(999);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0040
     * @tc.name      Resolution_ResHeight_0040
     * @tc.desc      resolutionHeight(1000) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0040 begin`);
      logInfo("resolutionHeight(1000)");
      const actual: number = resolutionHeight(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0041
     * @tc.name      Resolution_ResHeight_0041
     * @tc.desc      resolutionHeight(24) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0041 begin`);
      logInfo("resolutionHeight(24)");
      const actual: number = resolutionHeight(24);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0042
     * @tc.name      Resolution_ResHeight_0042
     * @tc.desc      resolutionHeight(25) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0042 begin`);
      logInfo("resolutionHeight(25)");
      const actual: number = resolutionHeight(25);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ResHeight_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RES_HEIGHT_0043
     * @tc.name      Resolution_ResHeight_0043
     * @tc.desc      resolutionHeight(28) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ResHeight_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResHeight_0043 begin`);
      logInfo("resolutionHeight(28)");
      const actual: number = resolutionHeight(28);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ResHeight_0043 end`);
    });
  });
}
