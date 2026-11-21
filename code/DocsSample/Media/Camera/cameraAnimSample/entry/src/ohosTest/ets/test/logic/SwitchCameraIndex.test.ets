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
  switchCameraIndex,
} from '../model/CameraLogic';

/** SwitchCameraIndexTest logic checks (45 cases). */
export default function switchCameraIndexTest(): void {
  describe('SwitchCameraIndexTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0001
     * @tc.name      Camera_SwitchCameraIndex_0001
     * @tc.desc      switchCameraIndex(0) toggles the device slot to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SwitchCameraIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0001 begin`);
      logInfo("switchCameraIndex(0)");
      const actual: number = switchCameraIndex(0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0002
     * @tc.name      Camera_SwitchCameraIndex_0002
     * @tc.desc      switchCameraIndex(1) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0002 begin`);
      logInfo("switchCameraIndex(1)");
      const actual: number = switchCameraIndex(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0003
     * @tc.name      Camera_SwitchCameraIndex_0003
     * @tc.desc      switchCameraIndex(2) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0003 begin`);
      logInfo("switchCameraIndex(2)");
      const actual: number = switchCameraIndex(2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0004
     * @tc.name      Camera_SwitchCameraIndex_0004
     * @tc.desc      switchCameraIndex(3) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0004 begin`);
      logInfo("switchCameraIndex(3)");
      const actual: number = switchCameraIndex(3);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0005
     * @tc.name      Camera_SwitchCameraIndex_0005
     * @tc.desc      switchCameraIndex(4) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0005 begin`);
      logInfo("switchCameraIndex(4)");
      const actual: number = switchCameraIndex(4);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0006
     * @tc.name      Camera_SwitchCameraIndex_0006
     * @tc.desc      switchCameraIndex(5) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0006 begin`);
      logInfo("switchCameraIndex(5)");
      const actual: number = switchCameraIndex(5);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0007
     * @tc.name      Camera_SwitchCameraIndex_0007
     * @tc.desc      switchCameraIndex(6) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0007 begin`);
      logInfo("switchCameraIndex(6)");
      const actual: number = switchCameraIndex(6);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0008
     * @tc.name      Camera_SwitchCameraIndex_0008
     * @tc.desc      switchCameraIndex(7) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0008 begin`);
      logInfo("switchCameraIndex(7)");
      const actual: number = switchCameraIndex(7);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0009
     * @tc.name      Camera_SwitchCameraIndex_0009
     * @tc.desc      switchCameraIndex(8) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0009 begin`);
      logInfo("switchCameraIndex(8)");
      const actual: number = switchCameraIndex(8);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0010
     * @tc.name      Camera_SwitchCameraIndex_0010
     * @tc.desc      switchCameraIndex(9) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0010 begin`);
      logInfo("switchCameraIndex(9)");
      const actual: number = switchCameraIndex(9);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0011
     * @tc.name      Camera_SwitchCameraIndex_0011
     * @tc.desc      switchCameraIndex(10) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0011 begin`);
      logInfo("switchCameraIndex(10)");
      const actual: number = switchCameraIndex(10);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0012
     * @tc.name      Camera_SwitchCameraIndex_0012
     * @tc.desc      switchCameraIndex(11) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SwitchCameraIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0012 begin`);
      logInfo("switchCameraIndex(11)");
      const actual: number = switchCameraIndex(11);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0013
     * @tc.name      Camera_SwitchCameraIndex_0013
     * @tc.desc      switchCameraIndex(12) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0013 begin`);
      logInfo("switchCameraIndex(12)");
      const actual: number = switchCameraIndex(12);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0014
     * @tc.name      Camera_SwitchCameraIndex_0014
     * @tc.desc      switchCameraIndex(13) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0014 begin`);
      logInfo("switchCameraIndex(13)");
      const actual: number = switchCameraIndex(13);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0015
     * @tc.name      Camera_SwitchCameraIndex_0015
     * @tc.desc      switchCameraIndex(14) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0015 begin`);
      logInfo("switchCameraIndex(14)");
      const actual: number = switchCameraIndex(14);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0016
     * @tc.name      Camera_SwitchCameraIndex_0016
     * @tc.desc      switchCameraIndex(15) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0016 begin`);
      logInfo("switchCameraIndex(15)");
      const actual: number = switchCameraIndex(15);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0017
     * @tc.name      Camera_SwitchCameraIndex_0017
     * @tc.desc      switchCameraIndex(16) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0017 begin`);
      logInfo("switchCameraIndex(16)");
      const actual: number = switchCameraIndex(16);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0018
     * @tc.name      Camera_SwitchCameraIndex_0018
     * @tc.desc      switchCameraIndex(17) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SwitchCameraIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0018 begin`);
      logInfo("switchCameraIndex(17)");
      const actual: number = switchCameraIndex(17);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0019
     * @tc.name      Camera_SwitchCameraIndex_0019
     * @tc.desc      switchCameraIndex(18) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0019 begin`);
      logInfo("switchCameraIndex(18)");
      const actual: number = switchCameraIndex(18);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SwitchCameraIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0020
     * @tc.name      Camera_SwitchCameraIndex_0020
     * @tc.desc      switchCameraIndex(19) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0020 begin`);
      logInfo("switchCameraIndex(19)");
      const actual: number = switchCameraIndex(19);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwitchCameraIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SWITCH_CAMERA_INDEX_0021
     * @tc.name      Camera_SwitchCameraIndex_0021
     * @tc.desc      switchCameraIndex(20) toggles the device slot to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SwitchCameraIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwitchCameraIndex_0021 begin`);
      logInfo("switchCameraIndex(20)");
      const actual: number = switchCameraIndex(20);
