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

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0015
     * @tc.name      Camera_ZoomRound_0015
     * @tc.desc      zoomRound(1.999) keeps two fraction digits -> 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0015 begin`);
      logInfo("zoomRound(1.999)");
      const actual: number = zoomRound(1.999);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ZoomRound_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0016
     * @tc.name      Camera_ZoomRound_0016
     * @tc.desc      zoomRound(2.001) keeps two fraction digits -> 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0016 begin`);
      logInfo("zoomRound(2.001)");
      const actual: number = zoomRound(2.001);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0017
     * @tc.name      Camera_ZoomRound_0017
     * @tc.desc      zoomRound(2.345) keeps two fraction digits -> 2.35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0017 begin`);
      logInfo("zoomRound(2.345)");
      const actual: number = zoomRound(2.345);
      logInfo('actual=' + String(actual) + ', expected=' + "2.35");
      expect(actual).assertEqual(2.35);
      logInfo(`${BUNDLE}ZoomRound_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0018
     * @tc.name      Camera_ZoomRound_0018
     * @tc.desc      zoomRound(3.456) keeps two fraction digits -> 3.46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomRound_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomRound_0018 begin`);
      logInfo("zoomRound(3.456)");
      const actual: number = zoomRound(3.456);
      logInfo('actual=' + String(actual) + ', expected=' + "3.46");
      expect(actual).assertEqual(3.46);
      logInfo(`${BUNDLE}ZoomRound_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0019
     * @tc.name      Camera_ZoomRound_0019
     * @tc.desc      zoomRound(4.567) keeps two fraction digits -> 4.57.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0019 begin`);
      logInfo("zoomRound(4.567)");
      const actual: number = zoomRound(4.567);
      logInfo('actual=' + String(actual) + ', expected=' + "4.57");
      expect(actual).assertEqual(4.57);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0020
     * @tc.name      Camera_ZoomRound_0020
     * @tc.desc      zoomRound(5.678) keeps two fraction digits -> 5.68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0020 begin`);
      logInfo("zoomRound(5.678)");
      const actual: number = zoomRound(5.678);
      logInfo('actual=' + String(actual) + ', expected=' + "5.68");
      expect(actual).assertEqual(5.68);
      logInfo(`${BUNDLE}ZoomRound_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0021
     * @tc.name      Camera_ZoomRound_0021
     * @tc.desc      zoomRound(6.789) keeps two fraction digits -> 6.79.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0021 begin`);
      logInfo("zoomRound(6.789)");
      const actual: number = zoomRound(6.789);
      logInfo('actual=' + String(actual) + ', expected=' + "6.79");
      expect(actual).assertEqual(6.79);
      logInfo(`${BUNDLE}ZoomRound_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0022
     * @tc.name      Camera_ZoomRound_0022
     * @tc.desc      zoomRound(9.999) keeps two fraction digits -> 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0022 begin`);
      logInfo("zoomRound(9.999)");
      const actual: number = zoomRound(9.999);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0023
     * @tc.name      Camera_ZoomRound_0023
     * @tc.desc      zoomRound(-0.001) keeps two fraction digits -> 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomRound_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRound_0023 begin`);
      logInfo("zoomRound(-0.001)");
      const actual: number = zoomRound(-0.001);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ZoomRound_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0024
     * @tc.name      Camera_ZoomRound_0024
     * @tc.desc      zoomRound(-0.005) keeps two fraction digits -> -0.01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0024 begin`);
      logInfo("zoomRound(-0.005)");
      const actual: number = zoomRound(-0.005);
      logInfo('actual=' + String(actual) + ', expected=' + "-0.01");
      expect(actual).assertEqual(-0.01);
      logInfo(`${BUNDLE}ZoomRound_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0025
     * @tc.name      Camera_ZoomRound_0025
     * @tc.desc      zoomRound(-1.005) keeps two fraction digits -> -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0025 begin`);
      logInfo("zoomRound(-1.005)");
      const actual: number = zoomRound(-1.005);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0026
     * @tc.name      Camera_ZoomRound_0026
     * @tc.desc      zoomRound(-1.115) keeps two fraction digits -> -1.11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0026 begin`);
      logInfo("zoomRound(-1.115)");
      const actual: number = zoomRound(-1.115);
      logInfo('actual=' + String(actual) + ', expected=' + "-1.11");
      expect(actual).assertEqual(-1.11);
      logInfo(`${BUNDLE}ZoomRound_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0027
     * @tc.name      Camera_ZoomRound_0027
     * @tc.desc      zoomRound(100.005) keeps two fraction digits -> 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0027 begin`);
      logInfo("zoomRound(100.005)");
      const actual: number = zoomRound(100.005);
      logInfo('actual=' + String(actual) + ', expected=' + "100");
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ZoomRound_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0028
     * @tc.name      Camera_ZoomRound_0028
     * @tc.desc      zoomRound(100.015) keeps two fraction digits -> 100.02.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0028 begin`);
      logInfo("zoomRound(100.015)");
      const actual: number = zoomRound(100.015);
      logInfo('actual=' + String(actual) + ', expected=' + "100.02");
      expect(actual).assertEqual(100.02);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0029
     * @tc.name      Camera_ZoomRound_0029
     * @tc.desc      zoomRound(0.994) keeps two fraction digits -> 0.99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0029 begin`);
      logInfo("zoomRound(0.994)");
      const actual: number = zoomRound(0.994);
      logInfo('actual=' + String(actual) + ', expected=' + "0.99");
      expect(actual).assertEqual(0.99);
      logInfo(`${BUNDLE}ZoomRound_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0030
     * @tc.name      Camera_ZoomRound_0030
     * @tc.desc      zoomRound(0.995) keeps two fraction digits -> 0.99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0030 begin`);
      logInfo("zoomRound(0.995)");
      const actual: number = zoomRound(0.995);
      logInfo('actual=' + String(actual) + ', expected=' + "0.99");
      expect(actual).assertEqual(0.99);
      logInfo(`${BUNDLE}ZoomRound_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0031
     * @tc.name      Camera_ZoomRound_0031
     * @tc.desc      zoomRound(0.996) keeps two fraction digits -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0031 begin`);
      logInfo("zoomRound(0.996)");
      const actual: number = zoomRound(0.996);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0032
     * @tc.name      Camera_ZoomRound_0032
     * @tc.desc      zoomRound(10.5) keeps two fraction digits -> 10.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0032 begin`);
      logInfo("zoomRound(10.5)");
      const actual: number = zoomRound(10.5);
      logInfo('actual=' + String(actual) + ', expected=' + "10.5");
      expect(actual).assertEqual(10.5);
      logInfo(`${BUNDLE}ZoomRound_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0033
     * @tc.name      Camera_ZoomRound_0033
     * @tc.desc      zoomRound(45.45) keeps two fraction digits -> 45.45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0033 begin`);
      logInfo("zoomRound(45.45)");
      const actual: number = zoomRound(45.45);
      logInfo('actual=' + String(actual) + ', expected=' + "45.45");
      expect(actual).assertEqual(45.45);
      logInfo(`${BUNDLE}ZoomRound_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0034
     * @tc.name      Camera_ZoomRound_0034
     * @tc.desc      zoomRound(1.5) keeps two fraction digits -> 1.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomRound_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRound_0034 begin`);
      logInfo("zoomRound(1.5)");
      const actual: number = zoomRound(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "1.5");
      expect(actual).assertEqual(1.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0035
     * @tc.name      Camera_ZoomRound_0035
     * @tc.desc      zoomRound(2.5) keeps two fraction digits -> 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ZoomRound_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomRound_0035 begin`);
      logInfo("zoomRound(2.5)");
      const actual: number = zoomRound(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5");
      expect(actual).assertEqual(2.5);
      logInfo(`${BUNDLE}ZoomRound_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0036
     * @tc.name      Camera_ZoomRound_0036
     * @tc.desc      zoomRound(3.5) keeps two fraction digits -> 3.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0036 begin`);
      logInfo("zoomRound(3.5)");
      const actual: number = zoomRound(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "3.5");
      expect(actual).assertEqual(3.5);
      logInfo(`${BUNDLE}ZoomRound_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0037
     * @tc.name      Camera_ZoomRound_0037
     * @tc.desc      zoomRound(5.5) keeps two fraction digits -> 5.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0037 begin`);
      logInfo("zoomRound(5.5)");
      const actual: number = zoomRound(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "5.5");
      expect(actual).assertEqual(5.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0038
     * @tc.name      Camera_ZoomRound_0038
     * @tc.desc      zoomRound(6.5) keeps two fraction digits -> 6.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0038 begin`);
      logInfo("zoomRound(6.5)");
      const actual: number = zoomRound(6.5);
      logInfo('actual=' + String(actual) + ', expected=' + "6.5");
      expect(actual).assertEqual(6.5);
      logInfo(`${BUNDLE}ZoomRound_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0039
     * @tc.name      Camera_ZoomRound_0039
     * @tc.desc      zoomRound(999.999) keeps two fraction digits -> 1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0039 begin`);
      logInfo("zoomRound(999.999)");
      const actual: number = zoomRound(999.999);
      logInfo('actual=' + String(actual) + ', expected=' + "1000");
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}ZoomRound_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0040
     * @tc.name      Camera_ZoomRound_0040
     * @tc.desc      zoomRound(0) keeps two fraction digits -> 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0040 begin`);
      logInfo("zoomRound(0)");
      const actual: number = zoomRound(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0041
     * @tc.name      Camera_ZoomRound_0041
     * @tc.desc      zoomRound(1) keeps two fraction digits -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0041 begin`);
      logInfo("zoomRound(1)");
      const actual: number = zoomRound(1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomRound_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0042
     * @tc.name      Camera_ZoomRound_0042
     * @tc.desc      zoomRound(2) keeps two fraction digits -> 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0042 begin`);
      logInfo("zoomRound(2)");
      const actual: number = zoomRound(2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ZoomRound_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0043
     * @tc.name      Camera_ZoomRound_0043
     * @tc.desc      zoomRound(3) keeps two fraction digits -> 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0043 begin`);
      logInfo("zoomRound(3)");
      const actual: number = zoomRound(3);
      logInfo('actual=' + String(actual) + ', expected=' + "3");
      expect(actual).assertEqual(3);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0044
     * @tc.name      Camera_ZoomRound_0044
     * @tc.desc      zoomRound(4) keeps two fraction digits -> 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0044 begin`);
      logInfo("zoomRound(4)");
      const actual: number = zoomRound(4);
      logInfo('actual=' + String(actual) + ', expected=' + "4");
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ZoomRound_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0045
     * @tc.name      Camera_ZoomRound_0045
     * @tc.desc      zoomRound(5) keeps two fraction digits -> 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ZoomRound_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRound_0045 begin`);
      logInfo("zoomRound(5)");
      const actual: number = zoomRound(5);
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ZoomRound_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ZOOM_ROUND_0046
     * @tc.name      Camera_ZoomRound_0046
     * @tc.desc      zoomRound(6) keeps two fraction digits -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ZoomRound_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRound_0046 begin`);
      logInfo("zoomRound(6)");
      const actual: number = zoomRound(6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomRound_0046 end`);
    });
  });
}
