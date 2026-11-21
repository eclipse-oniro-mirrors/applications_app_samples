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
  zoomClamp,
} from '../model/CameraLogic';

/** BoundaryEnvelopeTest logic checks (40 cases). */
export default function boundaryEnvelopeTest(): void {
  describe('BoundaryEnvelopeTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0001
     * @tc.name      Camera_BoundaryEnvelope_0001
     * @tc.desc      envelope zoomClamp(0, 1, 6) -> 1; guard=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_BoundaryEnvelope_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0001 begin`);
      logInfo("zoomClamp(0, 1, 6)");
      const actual: number = zoomClamp(0, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0002
     * @tc.name      Camera_BoundaryEnvelope_0002
     * @tc.desc      envelope zoomClamp(1, 6, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0002 begin`);
      logInfo("zoomClamp(1, 6, 6)");
      const actual: number = zoomClamp(1, 6, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0003
     * @tc.name      Camera_BoundaryEnvelope_0003
     * @tc.desc      envelope zoomClamp(-1, 61, 6) -> 61; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0003 begin`);
      logInfo("zoomClamp(-1, 61, 6)");
      const actual: number = zoomClamp(-1, 61, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "61");
      expect(actual).assertEqual(61);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0004
     * @tc.name      Camera_BoundaryEnvelope_0004
     * @tc.desc      envelope zoomClamp(2, 1920, 6) -> 1920; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0004 begin`);
      logInfo("zoomClamp(2, 1920, 6)");
      const actual: number = zoomClamp(2, 1920, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1920");
      expect(actual).assertEqual(1920);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0005
     * @tc.name      Camera_BoundaryEnvelope_0005
     * @tc.desc      envelope zoomClamp(6, -0.5, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0005 begin`);
      logInfo("zoomClamp(6, -0.5, 6)");
      const actual: number = zoomClamp(6, -0.5, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0006
     * @tc.name      Camera_BoundaryEnvelope_0006
     * @tc.desc      envelope zoomClamp(7, 1000000, 6) -> 1000000; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0006 begin`);
      logInfo("zoomClamp(7, 1000000, 6)");
      const actual: number = zoomClamp(7, 1000000, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1000000");
      expect(actual).assertEqual(1000000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0007
     * @tc.name      Camera_BoundaryEnvelope_0007
     * @tc.desc      envelope zoomClamp(60, -0.000001, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0007 begin`);
      logInfo("zoomClamp(60, -0.000001, 6)");
      const actual: number = zoomClamp(60, -0.000001, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0008
     * @tc.name      Camera_BoundaryEnvelope_0008
     * @tc.desc      envelope zoomClamp(61, -1, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0008 begin`);
      logInfo("zoomClamp(61, -1, 6)");
      const actual: number = zoomClamp(61, -1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0009
     * @tc.name      Camera_BoundaryEnvelope_0009
     * @tc.desc      envelope zoomClamp(100, 7, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0009 begin`);
      logInfo("zoomClamp(100, 7, 6)");
      const actual: number = zoomClamp(100, 7, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0010
     * @tc.name      Camera_BoundaryEnvelope_0010
     * @tc.desc      envelope zoomClamp(1000, 100, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0010 begin`);
      logInfo("zoomClamp(1000, 100, 6)");
      const actual: number = zoomClamp(1000, 100, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0011
     * @tc.name      Camera_BoundaryEnvelope_0011
     * @tc.desc      envelope zoomClamp(1920, -1920, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0011 begin`);
      logInfo("zoomClamp(1920, -1920, 6)");
      const actual: number = zoomClamp(1920, -1920, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0012
     * @tc.name      Camera_BoundaryEnvelope_0012
     * @tc.desc      envelope zoomClamp(-1920, 59.9, 6) -> 59.9; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_BoundaryEnvelope_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0012 begin`);
      logInfo("zoomClamp(-1920, 59.9, 6)");
      const actual: number = zoomClamp(-1920, 59.9, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "59.9");
      expect(actual).assertEqual(59.9);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0013
     * @tc.name      Camera_BoundaryEnvelope_0013
     * @tc.desc      envelope zoomClamp(0.5, -1000000, 6) -> 0.5; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0013 begin`);
      logInfo("zoomClamp(0.5, -1000000, 6)");
      const actual: number = zoomClamp(0.5, -1000000, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0014
     * @tc.name      Camera_BoundaryEnvelope_0014
     * @tc.desc      envelope zoomClamp(-0.5, 0, 6) -> 0; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0014 begin`);
      logInfo("zoomClamp(-0.5, 0, 6)");
      const actual: number = zoomClamp(-0.5, 0, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0015
     * @tc.name      Camera_BoundaryEnvelope_0015
     * @tc.desc      envelope zoomClamp(59.9, 2, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0015 begin`);
      logInfo("zoomClamp(59.9, 2, 6)");
      const actual: number = zoomClamp(59.9, 2, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0016
     * @tc.name      Camera_BoundaryEnvelope_0016
     * @tc.desc      envelope zoomClamp(60.1, 60, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0016 begin`);
      logInfo("zoomClamp(60.1, 60, 6)");
      const actual: number = zoomClamp(60.1, 60, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0017
     * @tc.name      Camera_BoundaryEnvelope_0017
     * @tc.desc      envelope zoomClamp(1000000, 1000, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0017 begin`);
      logInfo("zoomClamp(1000000, 1000, 6)");
      const actual: number = zoomClamp(1000000, 1000, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0018
     * @tc.name      Camera_BoundaryEnvelope_0018
     * @tc.desc      envelope zoomClamp(-1000000, 0.5, 6) -> 0.5; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_BoundaryEnvelope_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0018 begin`);
      logInfo("zoomClamp(-1000000, 0.5, 6)");
      const actual: number = zoomClamp(-1000000, 0.5, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0019
     * @tc.name      Camera_BoundaryEnvelope_0019
     * @tc.desc      envelope zoomClamp(0.000001, 60.1, 6) -> 60.1; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0019 begin`);
      logInfo("zoomClamp(0.000001, 60.1, 6)");
      const actual: number = zoomClamp(0.000001, 60.1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "60.1");
      expect(actual).assertEqual(60.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0020
     * @tc.name      Camera_BoundaryEnvelope_0020
     * @tc.desc      envelope zoomClamp(-0.000001, 0.000001, 6) -> 0.000001; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0020 begin`);
      logInfo("zoomClamp(-0.000001, 0.000001, 6)");
      const actual: number = zoomClamp(-0.000001, 0.000001, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.000001");
      expect(actual).assertEqual(0.000001);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0021
     * @tc.name      Camera_BoundaryEnvelope_0021
     * @tc.desc      envelope zoomClamp(0.25, 60.75, 6) -> 60.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0021 begin`);
      logInfo("zoomClamp(0.25, 60.75, 6)");
      const actual: number = zoomClamp(0.25, 60.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "60.75");
      expect(actual).assertEqual(60.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0022
     * @tc.name      Camera_BoundaryEnvelope_0022
     * @tc.desc      envelope zoomClamp(1.25, 99.75, 6) -> 99.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0022 begin`);
      logInfo("zoomClamp(1.25, 99.75, 6)");
      const actual: number = zoomClamp(1.25, 99.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "99.75");
      expect(actual).assertEqual(99.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0023
     * @tc.name      Camera_BoundaryEnvelope_0023
     * @tc.desc      envelope zoomClamp(-0.75, 999.75, 6) -> 999.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_BoundaryEnvelope_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0023 begin`);
      logInfo("zoomClamp(-0.75, 999.75, 6)");
      const actual: number = zoomClamp(-0.75, 999.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "999.75");
      expect(actual).assertEqual(999.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0024
     * @tc.name      Camera_BoundaryEnvelope_0024
     * @tc.desc      envelope zoomClamp(2.25, 1919.75, 6) -> 1919.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0024 begin`);
      logInfo("zoomClamp(2.25, 1919.75, 6)");
      const actual: number = zoomClamp(2.25, 1919.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1919.75");
      expect(actual).assertEqual(1919.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0025
     * @tc.name      Camera_BoundaryEnvelope_0025
     * @tc.desc      envelope zoomClamp(6.25, -1920.25, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0025 begin`);
      logInfo("zoomClamp(6.25, -1920.25, 6)");
      const actual: number = zoomClamp(6.25, -1920.25, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0026
     * @tc.name      Camera_BoundaryEnvelope_0026
     * @tc.desc      envelope zoomClamp(7.25, 0.25, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0026 begin`);
      logInfo("zoomClamp(7.25, 0.25, 6)");
      const actual: number = zoomClamp(7.25, 0.25, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0027
     * @tc.name      Camera_BoundaryEnvelope_0027
     * @tc.desc      envelope zoomClamp(60.25, -0.75, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0027 begin`);
      logInfo("zoomClamp(60.25, -0.75, 6)");
      const actual: number = zoomClamp(60.25, -0.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0028
     * @tc.name      Camera_BoundaryEnvelope_0028
     * @tc.desc      envelope zoomClamp(61.25, 59.65, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0028 begin`);
      logInfo("zoomClamp(61.25, 59.65, 6)");
      const actual: number = zoomClamp(61.25, 59.65, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0029
     * @tc.name      Camera_BoundaryEnvelope_0029
     * @tc.desc      envelope zoomClamp(100.25, 59.85, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0029 begin`);
      logInfo("zoomClamp(100.25, 59.85, 6)");
      const actual: number = zoomClamp(100.25, 59.85, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0030
     * @tc.name      Camera_BoundaryEnvelope_0030
     * @tc.desc      envelope zoomClamp(1000.25, 999999.75, 6) -> 999999.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0030 begin`);
      logInfo("zoomClamp(1000.25, 999999.75, 6)");
      const actual: number = zoomClamp(1000.25, 999999.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "999999.75");
      expect(actual).assertEqual(999999.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0031
     * @tc.name      Camera_BoundaryEnvelope_0031
     * @tc.desc      envelope zoomClamp(1920.25, -1000000.25, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0031 begin`);
      logInfo("zoomClamp(1920.25, -1000000.25, 6)");
      const actual: number = zoomClamp(1920.25, -1000000.25, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0032
     * @tc.name      Camera_BoundaryEnvelope_0032
     * @tc.desc      envelope zoomClamp(-1919.75, -0.249999, 6) -> -0.249999; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0032 begin`);
      logInfo("zoomClamp(-1919.75, -0.249999, 6)");
      const actual: number = zoomClamp(-1919.75, -0.249999, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.249999");
      expect(actual).assertEqual(-0.249999);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0033
     * @tc.name      Camera_BoundaryEnvelope_0033
     * @tc.desc      envelope zoomClamp(0.75, -0.250001, 6) -> 0.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0033 begin`);
      logInfo("zoomClamp(0.75, -0.250001, 6)");
      const actual: number = zoomClamp(0.75, -0.250001, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0034
     * @tc.name      Camera_BoundaryEnvelope_0034
     * @tc.desc      envelope zoomClamp(-0.25, -0.25, 6) -> -0.25; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_BoundaryEnvelope_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0034 begin`);
      logInfo("zoomClamp(-0.25, -0.25, 6)");
      const actual: number = zoomClamp(-0.25, -0.25, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.25");
      expect(actual).assertEqual(-0.25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0035
     * @tc.name      Camera_BoundaryEnvelope_0035
     * @tc.desc      envelope zoomClamp(60.15, 0.75, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_BoundaryEnvelope_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0035 begin`);
      logInfo("zoomClamp(60.15, 0.75, 6)");
      const actual: number = zoomClamp(60.15, 0.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0036
     * @tc.name      Camera_BoundaryEnvelope_0036
     * @tc.desc      envelope zoomClamp(60.35, -1.25, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0036 begin`);
      logInfo("zoomClamp(60.35, -1.25, 6)");
      const actual: number = zoomClamp(60.35, -1.25, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0037
     * @tc.name      Camera_BoundaryEnvelope_0037
     * @tc.desc      envelope zoomClamp(1000000.25, 1.75, 6) -> 6; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0037 begin`);
      logInfo("zoomClamp(1000000.25, 1.75, 6)");
      const actual: number = zoomClamp(1000000.25, 1.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0038
     * @tc.name      Camera_BoundaryEnvelope_0038
     * @tc.desc      envelope zoomClamp(-999999.75, 5.75, 6) -> 5.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0038 begin`);
      logInfo("zoomClamp(-999999.75, 5.75, 6)");
      const actual: number = zoomClamp(-999999.75, 5.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "5.75");
      expect(actual).assertEqual(5.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0039
     * @tc.name      Camera_BoundaryEnvelope_0039
     * @tc.desc      envelope zoomClamp(0.250001, 6.75, 6) -> 6.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0039 begin`);
      logInfo("zoomClamp(0.250001, 6.75, 6)");
      const actual: number = zoomClamp(0.250001, 6.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6.75");
      expect(actual).assertEqual(6.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_BOUNDARY_ENVELOPE_0040
     * @tc.name      Camera_BoundaryEnvelope_0040
     * @tc.desc      envelope zoomClamp(0.249999, 59.75, 6) -> 59.75; guard=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_BoundaryEnvelope_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BoundaryEnvelope_0040 begin`);
      logInfo("zoomClamp(0.249999, 59.75, 6)");
      const actual: number = zoomClamp(0.249999, 59.75, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "59.75");
      expect(actual).assertEqual(59.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}BoundaryEnvelope_0040 end`);
    });
  });
}
