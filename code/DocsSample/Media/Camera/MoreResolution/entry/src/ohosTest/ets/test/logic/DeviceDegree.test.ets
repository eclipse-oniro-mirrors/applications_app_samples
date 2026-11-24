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
  deviceDegree,
} from '../model/ResolutionLogic';

/** DeviceDegreeTest logic checks (16 cases). */
export default function deviceDegreeTest(): void {
  describe('DeviceDegreeTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0001
     * @tc.name      Resolution_DeviceDegree_0001
     * @tc.desc      deviceDegree(0, 1, 2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceDegree_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceDegree_0001 begin`);
      logInfo("deviceDegree(0, 1, 2)");
      const actual: number = deviceDegree(0, 1, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0002
     * @tc.name      Resolution_DeviceDegree_0002
     * @tc.desc      deviceDegree(1, 5, -5) returns 349.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0002 begin`);
      logInfo("deviceDegree(1, 5, -5)");
      const actual: number = deviceDegree(1, 5, -5);
      logInfo('actual=' + String(actual) + ', expected=' + "349");
      expect(actual).assertEqual(349);
      logInfo(`${BUNDLE}DeviceDegree_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0003
     * @tc.name      Resolution_DeviceDegree_0003
     * @tc.desc      deviceDegree(2, -1, 0) returns 243.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0003 begin`);
      logInfo("deviceDegree(2, -1, 0)");
      const actual: number = deviceDegree(2, -1, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "243");
      expect(actual).assertEqual(243);
      logInfo(`${BUNDLE}DeviceDegree_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0004
     * @tc.name      Resolution_DeviceDegree_0004
     * @tc.desc      deviceDegree(3, -9, -1) returns 198.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0004 begin`);
      logInfo("deviceDegree(3, -9, -1)");
      const actual: number = deviceDegree(3, -9, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "198");
      expect(actual).assertEqual(198);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0005
     * @tc.name      Resolution_DeviceDegree_0005
     * @tc.desc      deviceDegree(5, -0.5, 100) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0005 begin`);
      logInfo("deviceDegree(5, -0.5, 100)");
      const actual: number = deviceDegree(5, -0.5, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DeviceDegree_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0006
     * @tc.name      Resolution_DeviceDegree_0006
     * @tc.desc      deviceDegree(9, 0, 9) returns 270.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0006 begin`);
      logInfo("deviceDegree(9, 0, 9)");
      const actual: number = deviceDegree(9, 0, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}DeviceDegree_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0007
     * @tc.name      Resolution_DeviceDegree_0007
     * @tc.desc      deviceDegree(10, 3, 0.5) returns 287.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0007 begin`);
      logInfo("deviceDegree(10, 3, 0.5)");
      const actual: number = deviceDegree(10, 3, 0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "287");
      expect(actual).assertEqual(287);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0008
     * @tc.name      Resolution_DeviceDegree_0008
     * @tc.desc      deviceDegree(-1, 10, 3) returns 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0008 begin`);
      logInfo("deviceDegree(-1, 10, 3)");
      const actual: number = deviceDegree(-1, 10, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}DeviceDegree_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0009
     * @tc.name      Resolution_DeviceDegree_0009
     * @tc.desc      deviceDegree(-2, -5, -9) returns 158.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0009 begin`);
      logInfo("deviceDegree(-2, -5, -9)");
      const actual: number = deviceDegree(-2, -5, -9);
      logInfo('actual=' + String(actual) + ', expected=' + "158");
      expect(actual).assertEqual(158);
      logInfo(`${BUNDLE}DeviceDegree_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0010
     * @tc.name      Resolution_DeviceDegree_0010
     * @tc.desc      deviceDegree(-5, 0.5, 1) returns 84.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0010 begin`);
      logInfo("deviceDegree(-5, 0.5, 1)");
      const actual: number = deviceDegree(-5, 0.5, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "84");
      expect(actual).assertEqual(84);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0011
     * @tc.name      Resolution_DeviceDegree_0011
     * @tc.desc      deviceDegree(-9, -100, -2) returns 175.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0011 begin`);
      logInfo("deviceDegree(-9, -100, -2)");
      const actual: number = deviceDegree(-9, -100, -2);
      logInfo('actual=' + String(actual) + ', expected=' + "175");
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}DeviceDegree_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0012
     * @tc.name      Resolution_DeviceDegree_0012
     * @tc.desc      deviceDegree(-10, 2, -100) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_DeviceDegree_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeviceDegree_0012 begin`);
      logInfo("deviceDegree(-10, 2, -100)");
      const actual: number = deviceDegree(-10, 2, -100);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DeviceDegree_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0013
     * @tc.name      Resolution_DeviceDegree_0013
     * @tc.desc      deviceDegree(0.5, 9, 10) returns 357.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0013 begin`);
      logInfo("deviceDegree(0.5, 9, 10)");
      const actual: number = deviceDegree(0.5, 9, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "357");
      expect(actual).assertEqual(357);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0014
     * @tc.name      Resolution_DeviceDegree_0014
     * @tc.desc      deviceDegree(-0.5, -2, -0.5) returns 166.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0014 begin`);
      logInfo("deviceDegree(-0.5, -2, -0.5)");
      const actual: number = deviceDegree(-0.5, -2, -0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "166");
      expect(actual).assertEqual(166);
      logInfo(`${BUNDLE}DeviceDegree_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0015
     * @tc.name      Resolution_DeviceDegree_0015
     * @tc.desc      deviceDegree(100, -10, 5) returns 264.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0015 begin`);
      logInfo("deviceDegree(100, -10, 5)");
      const actual: number = deviceDegree(100, -10, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "264");
      expect(actual).assertEqual(264);
      logInfo(`${BUNDLE}DeviceDegree_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_DEVICE_DEGREE_0016
     * @tc.name      Resolution_DeviceDegree_0016
     * @tc.desc      deviceDegree(-100, 100, -10) returns 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_DeviceDegree_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeviceDegree_0016 begin`);
      logInfo("deviceDegree(-100, 100, -10)");
      const actual: number = deviceDegree(-100, 100, -10);
      logInfo('actual=' + String(actual) + ', expected=' + "45");
      expect(actual).assertEqual(45);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}DeviceDegree_0016 end`);
    });
  });
}
