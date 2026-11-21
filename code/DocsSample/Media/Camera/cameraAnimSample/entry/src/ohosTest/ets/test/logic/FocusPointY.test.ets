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
  focusPointY,
} from '../model/CameraLogic';

/** FocusPointYTest logic checks (48 cases). */
export default function focusPointYTest(): void {
  describe('FocusPointYTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0001
     * @tc.name      Camera_FocusPointY_0001
     * @tc.desc      focusPointY(0, 720) mirrors the touch X to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_FocusPointY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FocusPointY_0001 begin`);
      logInfo("focusPointY(0, 720)");
      const actual: number = focusPointY(0, 720);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0002
     * @tc.name      Camera_FocusPointY_0002
     * @tc.desc      focusPointY(1, 1920) mirrors the touch X to 0.999479.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0002 begin`);
      logInfo("focusPointY(1, 1920)");
      const actual: number = focusPointY(1, 1920);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999479");
      expect(actual).assertEqual(0.999479);
      logInfo(`${BUNDLE}FocusPointY_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0003
     * @tc.name      Camera_FocusPointY_0003
     * @tc.desc      focusPointY(2, 2400) mirrors the touch X to 0.999167.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0003 begin`);
      logInfo("focusPointY(2, 2400)");
      const actual: number = focusPointY(2, 2400);
      logInfo('actual=' + String(actual) + ', expected=' + "0.999167");
      expect(actual).assertEqual(0.999167);
      logInfo(`${BUNDLE}FocusPointY_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0004
     * @tc.name      Camera_FocusPointY_0004
     * @tc.desc      focusPointY(10, 900) mirrors the touch X to 0.988889.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0004 begin`);
      logInfo("focusPointY(10, 900)");
      const actual: number = focusPointY(10, 900);
      logInfo('actual=' + String(actual) + ', expected=' + "0.988889");
      expect(actual).assertEqual(0.988889);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FocusPointY_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0005
     * @tc.name      Camera_FocusPointY_0005
     * @tc.desc      focusPointY(45, 1200) mirrors the touch X to 0.9625.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_FocusPointY_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FocusPointY_0005 begin`);
      logInfo("focusPointY(45, 1200)");
      const actual: number = focusPointY(45, 1200);
      logInfo('actual=' + String(actual) + ', expected=' + "0.9625");
      expect(actual).assertEqual(0.9625);
      logInfo(`${BUNDLE}FocusPointY_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FOCUS_POINT_Y_0006
     * @tc.name      Camera_FocusPointY_0006
     * @tc.desc      focusPointY(90, 2000) mirrors the touch X to 0.955.
