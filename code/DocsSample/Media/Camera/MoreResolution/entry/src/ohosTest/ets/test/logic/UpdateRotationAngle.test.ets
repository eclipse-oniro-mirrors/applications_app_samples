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
  updateRotationAngle,
} from '../model/ResolutionLogic';

/** UpdateRotationAngleTest logic checks (43 cases). */
export default function updateRotationAngleTest(): void {
  describe('UpdateRotationAngleTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0001
     * @tc.name      Resolution_UpdateRotation_0001
     * @tc.desc      updateRotationAngle(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_UpdateRotation_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UpdateRotation_0001 begin`);
      logInfo("updateRotationAngle(0)");
      const actual: number = updateRotationAngle(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0002
     * @tc.name      Resolution_UpdateRotation_0002
     * @tc.desc      updateRotationAngle(1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0002 begin`);
      logInfo("updateRotationAngle(1)");
      const actual: number = updateRotationAngle(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0003
     * @tc.name      Resolution_UpdateRotation_0003
     * @tc.desc      updateRotationAngle(2) returns 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0003 begin`);
      logInfo("updateRotationAngle(2)");
      const actual: number = updateRotationAngle(2);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}UpdateRotation_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0004
     * @tc.name      Resolution_UpdateRotation_0004
     * @tc.desc      updateRotationAngle(3) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0004 begin`);
      logInfo("updateRotationAngle(3)");
      const actual: number = updateRotationAngle(3);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0005
     * @tc.name      Resolution_UpdateRotation_0005
     * @tc.desc      updateRotationAngle(4) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0005 begin`);
      logInfo("updateRotationAngle(4)");
      const actual: number = updateRotationAngle(4);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0006
     * @tc.name      Resolution_UpdateRotation_0006
     * @tc.desc      updateRotationAngle(5) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0006 begin`);
      logInfo("updateRotationAngle(5)");
      const actual: number = updateRotationAngle(5);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0007
     * @tc.name      Resolution_UpdateRotation_0007
     * @tc.desc      updateRotationAngle(6) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0007 begin`);
      logInfo("updateRotationAngle(6)");
      const actual: number = updateRotationAngle(6);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0008
     * @tc.name      Resolution_UpdateRotation_0008
     * @tc.desc      updateRotationAngle(7) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0008 begin`);
      logInfo("updateRotationAngle(7)");
      const actual: number = updateRotationAngle(7);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0009
     * @tc.name      Resolution_UpdateRotation_0009
     * @tc.desc      updateRotationAngle(8) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0009 begin`);
      logInfo("updateRotationAngle(8)");
      const actual: number = updateRotationAngle(8);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0010
     * @tc.name      Resolution_UpdateRotation_0010
     * @tc.desc      updateRotationAngle(9) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0010 begin`);
      logInfo("updateRotationAngle(9)");
      const actual: number = updateRotationAngle(9);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0011
     * @tc.name      Resolution_UpdateRotation_0011
     * @tc.desc      updateRotationAngle(10) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0011 begin`);
      logInfo("updateRotationAngle(10)");
      const actual: number = updateRotationAngle(10);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0012
     * @tc.name      Resolution_UpdateRotation_0012
     * @tc.desc      updateRotationAngle(11) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_UpdateRotation_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UpdateRotation_0012 begin`);
      logInfo("updateRotationAngle(11)");
      const actual: number = updateRotationAngle(11);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0013
     * @tc.name      Resolution_UpdateRotation_0013
     * @tc.desc      updateRotationAngle(12) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0013 begin`);
      logInfo("updateRotationAngle(12)");
      const actual: number = updateRotationAngle(12);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0014
     * @tc.name      Resolution_UpdateRotation_0014
     * @tc.desc      updateRotationAngle(13) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0014 begin`);
      logInfo("updateRotationAngle(13)");
      const actual: number = updateRotationAngle(13);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0015
     * @tc.name      Resolution_UpdateRotation_0015
     * @tc.desc      updateRotationAngle(14) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0015 begin`);
      logInfo("updateRotationAngle(14)");
      const actual: number = updateRotationAngle(14);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0016
     * @tc.name      Resolution_UpdateRotation_0016
     * @tc.desc      updateRotationAngle(15) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0016 begin`);
      logInfo("updateRotationAngle(15)");
      const actual: number = updateRotationAngle(15);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0017
     * @tc.name      Resolution_UpdateRotation_0017
     * @tc.desc      updateRotationAngle(16) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0017 begin`);
      logInfo("updateRotationAngle(16)");
      const actual: number = updateRotationAngle(16);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0018
     * @tc.name      Resolution_UpdateRotation_0018
     * @tc.desc      updateRotationAngle(-1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_UpdateRotation_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UpdateRotation_0018 begin`);
      logInfo("updateRotationAngle(-1)");
      const actual: number = updateRotationAngle(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0019
     * @tc.name      Resolution_UpdateRotation_0019
     * @tc.desc      updateRotationAngle(20) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0019 begin`);
      logInfo("updateRotationAngle(20)");
      const actual: number = updateRotationAngle(20);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0020
     * @tc.name      Resolution_UpdateRotation_0020
     * @tc.desc      updateRotationAngle(30) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0020 begin`);
      logInfo("updateRotationAngle(30)");
      const actual: number = updateRotationAngle(30);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0021
     * @tc.name      Resolution_UpdateRotation_0021
     * @tc.desc      updateRotationAngle(40) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0021 begin`);
      logInfo("updateRotationAngle(40)");
      const actual: number = updateRotationAngle(40);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0022
     * @tc.name      Resolution_UpdateRotation_0022
     * @tc.desc      updateRotationAngle(50) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0022 begin`);
      logInfo("updateRotationAngle(50)");
      const actual: number = updateRotationAngle(50);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0023
     * @tc.name      Resolution_UpdateRotation_0023
     * @tc.desc      updateRotationAngle(60) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_UpdateRotation_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UpdateRotation_0023 begin`);
      logInfo("updateRotationAngle(60)");
      const actual: number = updateRotationAngle(60);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0024
     * @tc.name      Resolution_UpdateRotation_0024
     * @tc.desc      updateRotationAngle(70) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0024 begin`);
      logInfo("updateRotationAngle(70)");
      const actual: number = updateRotationAngle(70);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0025
     * @tc.name      Resolution_UpdateRotation_0025
     * @tc.desc      updateRotationAngle(80) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0025 begin`);
      logInfo("updateRotationAngle(80)");
      const actual: number = updateRotationAngle(80);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0026
     * @tc.name      Resolution_UpdateRotation_0026
     * @tc.desc      updateRotationAngle(90) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0026 begin`);
      logInfo("updateRotationAngle(90)");
      const actual: number = updateRotationAngle(90);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0027
     * @tc.name      Resolution_UpdateRotation_0027
     * @tc.desc      updateRotationAngle(100) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0027 begin`);
      logInfo("updateRotationAngle(100)");
      const actual: number = updateRotationAngle(100);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0028
     * @tc.name      Resolution_UpdateRotation_0028
     * @tc.desc      updateRotationAngle(200) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0028 begin`);
      logInfo("updateRotationAngle(200)");
      const actual: number = updateRotationAngle(200);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0029
     * @tc.name      Resolution_UpdateRotation_0029
     * @tc.desc      updateRotationAngle(255) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0029 begin`);
      logInfo("updateRotationAngle(255)");
      const actual: number = updateRotationAngle(255);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0030
     * @tc.name      Resolution_UpdateRotation_0030
     * @tc.desc      updateRotationAngle(360) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0030 begin`);
      logInfo("updateRotationAngle(360)");
      const actual: number = updateRotationAngle(360);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0031
     * @tc.name      Resolution_UpdateRotation_0031
     * @tc.desc      updateRotationAngle(720) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0031 begin`);
      logInfo("updateRotationAngle(720)");
      const actual: number = updateRotationAngle(720);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0032
     * @tc.name      Resolution_UpdateRotation_0032
     * @tc.desc      updateRotationAngle(1080) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0032 begin`);
      logInfo("updateRotationAngle(1080)");
      const actual: number = updateRotationAngle(1080);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0033
     * @tc.name      Resolution_UpdateRotation_0033
     * @tc.desc      updateRotationAngle(1280) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0033 begin`);
      logInfo("updateRotationAngle(1280)");
      const actual: number = updateRotationAngle(1280);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0034
     * @tc.name      Resolution_UpdateRotation_0034
     * @tc.desc      updateRotationAngle(1920) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_UpdateRotation_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UpdateRotation_0034 begin`);
      logInfo("updateRotationAngle(1920)");
      const actual: number = updateRotationAngle(1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0035
     * @tc.name      Resolution_UpdateRotation_0035
     * @tc.desc      updateRotationAngle(3840) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_UpdateRotation_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UpdateRotation_0035 begin`);
      logInfo("updateRotationAngle(3840)");
      const actual: number = updateRotationAngle(3840);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0036
     * @tc.name      Resolution_UpdateRotation_0036
     * @tc.desc      updateRotationAngle(4096) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0036 begin`);
      logInfo("updateRotationAngle(4096)");
      const actual: number = updateRotationAngle(4096);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0037
     * @tc.name      Resolution_UpdateRotation_0037
     * @tc.desc      updateRotationAngle(999) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0037 begin`);
      logInfo("updateRotationAngle(999)");
      const actual: number = updateRotationAngle(999);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0038
     * @tc.name      Resolution_UpdateRotation_0038
     * @tc.desc      updateRotationAngle(1000) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0038 begin`);
      logInfo("updateRotationAngle(1000)");
      const actual: number = updateRotationAngle(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0039
     * @tc.name      Resolution_UpdateRotation_0039
     * @tc.desc      updateRotationAngle(24) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0039 begin`);
      logInfo("updateRotationAngle(24)");
      const actual: number = updateRotationAngle(24);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0040
     * @tc.name      Resolution_UpdateRotation_0040
     * @tc.desc      updateRotationAngle(25) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0040 begin`);
      logInfo("updateRotationAngle(25)");
      const actual: number = updateRotationAngle(25);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0041
     * @tc.name      Resolution_UpdateRotation_0041
     * @tc.desc      updateRotationAngle(28) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0041 begin`);
      logInfo("updateRotationAngle(28)");
      const actual: number = updateRotationAngle(28);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0042
     * @tc.name      Resolution_UpdateRotation_0042
     * @tc.desc      updateRotationAngle(17) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0042 begin`);
      logInfo("updateRotationAngle(17)");
      const actual: number = updateRotationAngle(17);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateRotation_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_UPDATE_ROTATION_0043
     * @tc.name      Resolution_UpdateRotation_0043
     * @tc.desc      updateRotationAngle(19) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_UpdateRotation_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UpdateRotation_0043 begin`);
      logInfo("updateRotationAngle(19)");
      const actual: number = updateRotationAngle(19);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}UpdateRotation_0043 end`);
    });
  });
}
