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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  zoomRound,
  zoomClamp,
} from '../model/CameraLogic';

/** ZoomCycleTest logic checks (46 cases). */
export default function zoomCycleTest(): void {
  describe('ZoomCycleTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0001
     * @tc.name      Camera_ZoomCycle_0001
     * @tc.desc      zoomClamp(zoomRound(-0.5), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomCycle_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomCycle_0001 begin`);
      logInfo("zoomClamp(zoomRound(-0.5), 1, 6)");
      const actual: number = zoomClamp(zoomRound(-0.5), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0002
     * @tc.name      Camera_ZoomCycle_0002
     * @tc.desc      zoomClamp(zoomRound(0.058), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0002 begin`);
      logInfo("zoomClamp(zoomRound(0.058), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.058), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0003
     * @tc.name      Camera_ZoomCycle_0003
     * @tc.desc      zoomClamp(zoomRound(0.616), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0003 begin`);
      logInfo("zoomClamp(zoomRound(0.616), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.616), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0004
     * @tc.name      Camera_ZoomCycle_0004
     * @tc.desc      zoomClamp(zoomRound(1.174), 1, 6) yields 1.17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0004 begin`);
      logInfo("zoomClamp(zoomRound(1.174), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.174), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.17");
      expect(actual).assertEqual(1.17);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0005
     * @tc.name      Camera_ZoomCycle_0005
     * @tc.desc      zoomClamp(zoomRound(1.732), 1, 6) yields 1.73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0005 begin`);
      logInfo("zoomClamp(zoomRound(1.732), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.732), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.73");
      expect(actual).assertEqual(1.73);
      logInfo(`${BUNDLE}ZoomCycle_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0006
     * @tc.name      Camera_ZoomCycle_0006
     * @tc.desc      zoomClamp(zoomRound(2.29), 1, 6) yields 2.29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0006 begin`);
      logInfo("zoomClamp(zoomRound(2.29), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.29), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.29");
      expect(actual).assertEqual(2.29);
      logInfo(`${BUNDLE}ZoomCycle_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0007
     * @tc.name      Camera_ZoomCycle_0007
     * @tc.desc      zoomClamp(zoomRound(2.848), 1, 6) yields 2.85.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0007 begin`);
      logInfo("zoomClamp(zoomRound(2.848), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.848), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.85");
      expect(actual).assertEqual(2.85);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0008
     * @tc.name      Camera_ZoomCycle_0008
     * @tc.desc      zoomClamp(zoomRound(3.119), 1, 6) yields 3.12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0008 begin`);
      logInfo("zoomClamp(zoomRound(3.119), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.119), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.12");
      expect(actual).assertEqual(3.12);
      logInfo(`${BUNDLE}ZoomCycle_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0009
     * @tc.name      Camera_ZoomCycle_0009
     * @tc.desc      zoomClamp(zoomRound(3.677), 1, 6) yields 3.68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0009 begin`);
      logInfo("zoomClamp(zoomRound(3.677), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.677), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.68");
      expect(actual).assertEqual(3.68);
      logInfo(`${BUNDLE}ZoomCycle_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0010
     * @tc.name      Camera_ZoomCycle_0010
     * @tc.desc      zoomClamp(zoomRound(4.235), 1, 6) yields 4.24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0010 begin`);
      logInfo("zoomClamp(zoomRound(4.235), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.235), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.24");
      expect(actual).assertEqual(4.24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0011
     * @tc.name      Camera_ZoomCycle_0011
     * @tc.desc      zoomClamp(zoomRound(4.793), 1, 6) yields 4.79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0011 begin`);
      logInfo("zoomClamp(zoomRound(4.793), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.793), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.79");
      expect(actual).assertEqual(4.79);
      logInfo(`${BUNDLE}ZoomCycle_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0012
     * @tc.name      Camera_ZoomCycle_0012
     * @tc.desc      zoomClamp(zoomRound(5.351), 1, 6) yields 5.35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomCycle_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomCycle_0012 begin`);
      logInfo("zoomClamp(zoomRound(5.351), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.351), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.35");
      expect(actual).assertEqual(5.35);
      logInfo(`${BUNDLE}ZoomCycle_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0013
     * @tc.name      Camera_ZoomCycle_0013
     * @tc.desc      zoomClamp(zoomRound(5.909), 1, 6) yields 5.91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0013 begin`);
      logInfo("zoomClamp(zoomRound(5.909), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.909), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.91");
      expect(actual).assertEqual(5.91);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0014
     * @tc.name      Camera_ZoomCycle_0014
     * @tc.desc      zoomClamp(zoomRound(-0.254), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0014 begin`);
      logInfo("zoomClamp(zoomRound(-0.254), 1, 6)");
      const actual: number = zoomClamp(zoomRound(-0.254), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0015
     * @tc.name      Camera_ZoomCycle_0015
     * @tc.desc      zoomClamp(zoomRound(0.017), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0015 begin`);
      logInfo("zoomClamp(zoomRound(0.017), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.017), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0016
     * @tc.name      Camera_ZoomCycle_0016
     * @tc.desc      zoomClamp(zoomRound(0.575), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0016 begin`);
      logInfo("zoomClamp(zoomRound(0.575), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.575), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0017
     * @tc.name      Camera_ZoomCycle_0017
     * @tc.desc      zoomClamp(zoomRound(1.133), 1, 6) yields 1.13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0017 begin`);
      logInfo("zoomClamp(zoomRound(1.133), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.133), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.13");
      expect(actual).assertEqual(1.13);
      logInfo(`${BUNDLE}ZoomCycle_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0018
     * @tc.name      Camera_ZoomCycle_0018
     * @tc.desc      zoomClamp(zoomRound(1.691), 1, 6) yields 1.69.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomCycle_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomCycle_0018 begin`);
      logInfo("zoomClamp(zoomRound(1.691), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.691), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.69");
      expect(actual).assertEqual(1.69);
      logInfo(`${BUNDLE}ZoomCycle_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0019
     * @tc.name      Camera_ZoomCycle_0019
     * @tc.desc      zoomClamp(zoomRound(2.249), 1, 6) yields 2.25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0019 begin`);
      logInfo("zoomClamp(zoomRound(2.249), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.249), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.25");
      expect(actual).assertEqual(2.25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0020
     * @tc.name      Camera_ZoomCycle_0020
     * @tc.desc      zoomClamp(zoomRound(2.807), 1, 6) yields 2.81.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0020 begin`);
      logInfo("zoomClamp(zoomRound(2.807), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.807), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.81");
      expect(actual).assertEqual(2.81);
      logInfo(`${BUNDLE}ZoomCycle_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0021
     * @tc.name      Camera_ZoomCycle_0021
     * @tc.desc      zoomClamp(zoomRound(3.365), 1, 6) yields 3.37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0021 begin`);
      logInfo("zoomClamp(zoomRound(3.365), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.365), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.37");
      expect(actual).assertEqual(3.37);
      logInfo(`${BUNDLE}ZoomCycle_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0022
     * @tc.name      Camera_ZoomCycle_0022
     * @tc.desc      zoomClamp(zoomRound(3.636), 1, 6) yields 3.64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0022 begin`);
      logInfo("zoomClamp(zoomRound(3.636), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.636), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.64");
      expect(actual).assertEqual(3.64);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0023
     * @tc.name      Camera_ZoomCycle_0023
     * @tc.desc      zoomClamp(zoomRound(4.194), 1, 6) yields 4.19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomCycle_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomCycle_0023 begin`);
      logInfo("zoomClamp(zoomRound(4.194), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.194), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.19");
      expect(actual).assertEqual(4.19);
      logInfo(`${BUNDLE}ZoomCycle_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0024
     * @tc.name      Camera_ZoomCycle_0024
     * @tc.desc      zoomClamp(zoomRound(4.752), 1, 6) yields 4.75.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0024 begin`);
      logInfo("zoomClamp(zoomRound(4.752), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.752), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.75");
      expect(actual).assertEqual(4.75);
      logInfo(`${BUNDLE}ZoomCycle_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0025
     * @tc.name      Camera_ZoomCycle_0025
     * @tc.desc      zoomClamp(zoomRound(5.31), 1, 6) yields 5.31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0025 begin`);
      logInfo("zoomClamp(zoomRound(5.31), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.31), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.31");
      expect(actual).assertEqual(5.31);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0026
     * @tc.name      Camera_ZoomCycle_0026
     * @tc.desc      zoomClamp(zoomRound(5.868), 1, 6) yields 5.87.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0026 begin`);
      logInfo("zoomClamp(zoomRound(5.868), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.868), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.87");
      expect(actual).assertEqual(5.87);
      logInfo(`${BUNDLE}ZoomCycle_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0027
     * @tc.name      Camera_ZoomCycle_0027
     * @tc.desc      zoomClamp(zoomRound(-0.295), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0027 begin`);
      logInfo("zoomClamp(zoomRound(-0.295), 1, 6)");
      const actual: number = zoomClamp(zoomRound(-0.295), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0028
     * @tc.name      Camera_ZoomCycle_0028
     * @tc.desc      zoomClamp(zoomRound(0.263), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0028 begin`);
      logInfo("zoomClamp(zoomRound(0.263), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.263), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0029
     * @tc.name      Camera_ZoomCycle_0029
     * @tc.desc      zoomClamp(zoomRound(0.534), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0029 begin`);
      logInfo("zoomClamp(zoomRound(0.534), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.534), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0030
     * @tc.name      Camera_ZoomCycle_0030
     * @tc.desc      zoomClamp(zoomRound(1.092), 1, 6) yields 1.09.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0030 begin`);
      logInfo("zoomClamp(zoomRound(1.092), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.092), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.09");
      expect(actual).assertEqual(1.09);
      logInfo(`${BUNDLE}ZoomCycle_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0031
     * @tc.name      Camera_ZoomCycle_0031
     * @tc.desc      zoomClamp(zoomRound(1.65), 1, 6) yields 1.65.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0031 begin`);
      logInfo("zoomClamp(zoomRound(1.65), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.65), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.65");
      expect(actual).assertEqual(1.65);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0032
     * @tc.name      Camera_ZoomCycle_0032
     * @tc.desc      zoomClamp(zoomRound(2.208), 1, 6) yields 2.21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0032 begin`);
      logInfo("zoomClamp(zoomRound(2.208), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.208), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.21");
      expect(actual).assertEqual(2.21);
      logInfo(`${BUNDLE}ZoomCycle_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0033
     * @tc.name      Camera_ZoomCycle_0033
     * @tc.desc      zoomClamp(zoomRound(2.766), 1, 6) yields 2.77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0033 begin`);
      logInfo("zoomClamp(zoomRound(2.766), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.766), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.77");
      expect(actual).assertEqual(2.77);
      logInfo(`${BUNDLE}ZoomCycle_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0034
     * @tc.name      Camera_ZoomCycle_0034
     * @tc.desc      zoomClamp(zoomRound(3.324), 1, 6) yields 3.32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomCycle_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomCycle_0034 begin`);
      logInfo("zoomClamp(zoomRound(3.324), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.324), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.32");
      expect(actual).assertEqual(3.32);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0035
     * @tc.name      Camera_ZoomCycle_0035
     * @tc.desc      zoomClamp(zoomRound(3.882), 1, 6) yields 3.88.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomCycle_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomCycle_0035 begin`);
      logInfo("zoomClamp(zoomRound(3.882), 1, 6)");
      const actual: number = zoomClamp(zoomRound(3.882), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.88");
      expect(actual).assertEqual(3.88);
      logInfo(`${BUNDLE}ZoomCycle_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0036
     * @tc.name      Camera_ZoomCycle_0036
     * @tc.desc      zoomClamp(zoomRound(4.153), 1, 6) yields 4.15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0036 begin`);
      logInfo("zoomClamp(zoomRound(4.153), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.153), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.15");
      expect(actual).assertEqual(4.15);
      logInfo(`${BUNDLE}ZoomCycle_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0037
     * @tc.name      Camera_ZoomCycle_0037
     * @tc.desc      zoomClamp(zoomRound(4.711), 1, 6) yields 4.71.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0037 begin`);
      logInfo("zoomClamp(zoomRound(4.711), 1, 6)");
      const actual: number = zoomClamp(zoomRound(4.711), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "4.71");
      expect(actual).assertEqual(4.71);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0038
     * @tc.name      Camera_ZoomCycle_0038
     * @tc.desc      zoomClamp(zoomRound(5.269), 1, 6) yields 5.27.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0038 begin`);
      logInfo("zoomClamp(zoomRound(5.269), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.269), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.27");
      expect(actual).assertEqual(5.27);
      logInfo(`${BUNDLE}ZoomCycle_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0039
     * @tc.name      Camera_ZoomCycle_0039
     * @tc.desc      zoomClamp(zoomRound(5.827), 1, 6) yields 5.83.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0039 begin`);
      logInfo("zoomClamp(zoomRound(5.827), 1, 6)");
      const actual: number = zoomClamp(zoomRound(5.827), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.83");
      expect(actual).assertEqual(5.83);
      logInfo(`${BUNDLE}ZoomCycle_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0040
     * @tc.name      Camera_ZoomCycle_0040
     * @tc.desc      zoomClamp(zoomRound(-0.336), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0040 begin`);
      logInfo("zoomClamp(zoomRound(-0.336), 1, 6)");
      const actual: number = zoomClamp(zoomRound(-0.336), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0041
     * @tc.name      Camera_ZoomCycle_0041
     * @tc.desc      zoomClamp(zoomRound(0.222), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0041 begin`);
      logInfo("zoomClamp(zoomRound(0.222), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.222), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0042
     * @tc.name      Camera_ZoomCycle_0042
     * @tc.desc      zoomClamp(zoomRound(0.78), 1, 6) yields 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0042 begin`);
      logInfo("zoomClamp(zoomRound(0.78), 1, 6)");
      const actual: number = zoomClamp(zoomRound(0.78), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomCycle_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0043
     * @tc.name      Camera_ZoomCycle_0043
     * @tc.desc      zoomClamp(zoomRound(1.051), 1, 6) yields 1.05.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0043 begin`);
      logInfo("zoomClamp(zoomRound(1.051), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.051), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.05");
      expect(actual).assertEqual(1.05);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0044
     * @tc.name      Camera_ZoomCycle_0044
     * @tc.desc      zoomClamp(zoomRound(1.609), 1, 6) yields 1.61.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0044 begin`);
      logInfo("zoomClamp(zoomRound(1.609), 1, 6)");
      const actual: number = zoomClamp(zoomRound(1.609), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1.61");
      expect(actual).assertEqual(1.61);
      logInfo(`${BUNDLE}ZoomCycle_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0045
     * @tc.name      Camera_ZoomCycle_0045
     * @tc.desc      zoomClamp(zoomRound(2.167), 1, 6) yields 2.17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomCycle_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomCycle_0045 begin`);
      logInfo("zoomClamp(zoomRound(2.167), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.167), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.17");
      expect(actual).assertEqual(2.17);
      logInfo(`${BUNDLE}ZoomCycle_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_CYCLE_0046
     * @tc.name      Camera_ZoomCycle_0046
     * @tc.desc      zoomClamp(zoomRound(2.725), 1, 6) yields 2.73.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomCycle_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomCycle_0046 begin`);
      logInfo("zoomClamp(zoomRound(2.725), 1, 6)");
      const actual: number = zoomClamp(zoomRound(2.725), 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "2.73");
      expect(actual).assertEqual(2.73);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomCycle_0046 end`);
    });
  });
}
