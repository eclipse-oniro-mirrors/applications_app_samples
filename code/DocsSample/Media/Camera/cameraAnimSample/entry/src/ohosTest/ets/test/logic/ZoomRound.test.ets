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
} from '../model/CameraLogic';

/** ZoomRoundTest logic checks (46 cases). */
export default function zoomRoundTest(): void {
  describe('ZoomRoundTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0001
     * @tc.name      Camera_ZoomRound_0001
     * @tc.desc      zoomRound(0.1) keeps two fraction digits -> 0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomRound_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRound_0001 begin`);
      logInfo("zoomRound(0.1)");
      const actual: number = zoomRound(0.1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1");
      expect(actual).assertEqual(0.1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0002
     * @tc.name      Camera_ZoomRound_0002
     * @tc.desc      zoomRound(0.01) keeps two fraction digits -> 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0002 begin`);
      logInfo("zoomRound(0.01)");
      const actual: number = zoomRound(0.01);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}ZoomRound_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0003
     * @tc.name      Camera_ZoomRound_0003
     * @tc.desc      zoomRound(0.004) keeps two fraction digits -> 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0003 begin`);
      logInfo("zoomRound(0.004)");
      const actual: number = zoomRound(0.004);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomRound_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0004
     * @tc.name      Camera_ZoomRound_0004
     * @tc.desc      zoomRound(0.005) keeps two fraction digits -> 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0004 begin`);
      logInfo("zoomRound(0.005)");
      const actual: number = zoomRound(0.005);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0005
     * @tc.name      Camera_ZoomRound_0005
     * @tc.desc      zoomRound(0.006) keeps two fraction digits -> 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0005 begin`);
      logInfo("zoomRound(0.006)");
      const actual: number = zoomRound(0.006);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}ZoomRound_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0006
     * @tc.name      Camera_ZoomRound_0006
     * @tc.desc      zoomRound(0.014) keeps two fraction digits -> 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0006 begin`);
      logInfo("zoomRound(0.014)");
      const actual: number = zoomRound(0.014);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo(`${BUNDLE}ZoomRound_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0007
     * @tc.name      Camera_ZoomRound_0007
     * @tc.desc      zoomRound(0.015) keeps two fraction digits -> 0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0007 begin`);
      logInfo("zoomRound(0.015)");
      const actual: number = zoomRound(0.015);
      logInfo('actual=' + String(actual) + ', expected=' + "0.01");
      expect(actual).assertEqual(0.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0008
     * @tc.name      Camera_ZoomRound_0008
     * @tc.desc      zoomRound(0.016) keeps two fraction digits -> 0.02.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0008 begin`);
      logInfo("zoomRound(0.016)");
      const actual: number = zoomRound(0.016);
      logInfo('actual=' + String(actual) + ', expected=' + "0.02");
      expect(actual).assertEqual(0.02);
      logInfo(`${BUNDLE}ZoomRound_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0009
     * @tc.name      Camera_ZoomRound_0009
     * @tc.desc      zoomRound(1.005) keeps two fraction digits -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0009 begin`);
      logInfo("zoomRound(1.005)");
      const actual: number = zoomRound(1.005);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomRound_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0010
     * @tc.name      Camera_ZoomRound_0010
     * @tc.desc      zoomRound(1.015) keeps two fraction digits -> 1.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0010 begin`);
      logInfo("zoomRound(1.015)");
      const actual: number = zoomRound(1.015);
      logInfo('actual=' + String(actual) + ', expected=' + "1.01");
      expect(actual).assertEqual(1.01);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0011
     * @tc.name      Camera_ZoomRound_0011
     * @tc.desc      zoomRound(1.025) keeps two fraction digits -> 1.02.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0011 begin`);
      logInfo("zoomRound(1.025)");
      const actual: number = zoomRound(1.025);
      logInfo('actual=' + String(actual) + ', expected=' + "1.02");
      expect(actual).assertEqual(1.02);
      logInfo(`${BUNDLE}ZoomRound_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0012
     * @tc.name      Camera_ZoomRound_0012
     * @tc.desc      zoomRound(1.114) keeps two fraction digits -> 1.11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomRound_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRound_0012 begin`);
      logInfo("zoomRound(1.114)");
      const actual: number = zoomRound(1.114);
      logInfo('actual=' + String(actual) + ', expected=' + "1.11");
      expect(actual).assertEqual(1.11);
      logInfo(`${BUNDLE}ZoomRound_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0013
     * @tc.name      Camera_ZoomRound_0013
     * @tc.desc      zoomRound(1.115) keeps two fraction digits -> 1.11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0013 begin`);
      logInfo("zoomRound(1.115)");
      const actual: number = zoomRound(1.115);
      logInfo('actual=' + String(actual) + ', expected=' + "1.11");
      expect(actual).assertEqual(1.11);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0014
     * @tc.name      Camera_ZoomRound_0014
     * @tc.desc      zoomRound(1.116) keeps two fraction digits -> 1.12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0014 begin`);
      logInfo("zoomRound(1.116)");
      const actual: number = zoomRound(1.116);
      logInfo('actual=' + String(actual) + ', expected=' + "1.12");
      expect(actual).assertEqual(1.12);
      logInfo(`${BUNDLE}ZoomRound_0014 end`);
    });
