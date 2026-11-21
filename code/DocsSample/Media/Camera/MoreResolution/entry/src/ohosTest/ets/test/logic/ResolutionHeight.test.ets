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
