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
