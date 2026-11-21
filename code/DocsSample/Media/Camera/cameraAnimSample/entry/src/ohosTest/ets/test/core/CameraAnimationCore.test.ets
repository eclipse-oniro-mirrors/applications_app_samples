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
  SHOW_BLUR_DURATION,
  HIDE_BLUR_DURATION,
  ROTATION_DURATION,
  FLIP_DELAY,
  ROTATE_AXIS,
  IMG_ROTATE_ANGLE_90,
  IMG_ROTATE_ANGLE_270,
  IMG_FLIP_ANGLE_0,
  IMG_FLIP_ANGLE_180,
  IMG_FLIP_ANGLE_90,
  IMG_FLIP_ANGLE_270,
  IMG_FLIP_ANGLE_MINUS_90,
  ANIM_MODE_SWITCH_BLUR,
  IMG_SCALE,
  durationOf,
  flashBlackDelay,
  flashBlackTargetOpacity,
  flashBlackResetOpacity,
  modeSwitchBlur,
  modeSwitchScale,
  rotationAngleOf,
  initialFlipOf,
  firstFlipTargetOf,
  secondFlipStartOf,
  secondFlipTargetOf,
  FOCUS_FRAME_DURATION,
  FOCUS_FRAME_SIZE,
  FOCUS_FRAME_HALF,
  focusFrameDelay,
  focusFrameX,
  focusFrameY,
} from '../model/CameraLogic';

/** CameraAnimationCoreTest logic checks (46 cases). */
export default function cameraAnimationCoreTest(): void {
  describe('CameraAnimationCoreTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0001
     * @tc.name      Camera_AnimCore_0001
     * @tc.desc      SHOW_BLUR_DURATION is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimCore_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimCore_0001 begin`);
      logInfo("animation SHOW_BLUR_DURATION");
      const actual: number = SHOW_BLUR_DURATION;
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0002
     * @tc.name      Camera_AnimCore_0002
     * @tc.desc      HIDE_BLUR_DURATION is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0002 begin`);
      logInfo("animation HIDE_BLUR_DURATION");
      const actual: number = HIDE_BLUR_DURATION;
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0003
     * @tc.name      Camera_AnimCore_0003
     * @tc.desc      ROTATION_DURATION is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0003 begin`);
      logInfo("animation ROTATION_DURATION");
      const actual: number = ROTATION_DURATION;
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0004
     * @tc.name      Camera_AnimCore_0004
     * @tc.desc      FLIP_DELAY is pinned to 50 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0004 begin`);
      logInfo("animation FLIP_DELAY");
      const actual: number = FLIP_DELAY;
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0005
     * @tc.name      Camera_AnimCore_0005
     * @tc.desc      ROTATE_AXIS is pinned to 0.5 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0005 begin`);
      logInfo("animation ROTATE_AXIS");
      const actual: number = ROTATE_AXIS;
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0006
     * @tc.name      Camera_AnimCore_0006
     * @tc.desc      IMG_ROTATE_ANGLE_90 is pinned to 90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0006 begin`);
      logInfo("animation IMG_ROTATE_ANGLE_90");
      const actual: number = IMG_ROTATE_ANGLE_90;
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0007
     * @tc.name      Camera_AnimCore_0007
     * @tc.desc      IMG_ROTATE_ANGLE_270 is pinned to 270 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0007 begin`);
      logInfo("animation IMG_ROTATE_ANGLE_270");
      const actual: number = IMG_ROTATE_ANGLE_270;
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0008
     * @tc.name      Camera_AnimCore_0008
     * @tc.desc      IMG_FLIP_ANGLE_0 is pinned to 0 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0008 begin`);
      logInfo("animation IMG_FLIP_ANGLE_0");
      const actual: number = IMG_FLIP_ANGLE_0;
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0009
     * @tc.name      Camera_AnimCore_0009
     * @tc.desc      IMG_FLIP_ANGLE_180 is pinned to 180 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0009 begin`);
      logInfo("animation IMG_FLIP_ANGLE_180");
      const actual: number = IMG_FLIP_ANGLE_180;
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0010
     * @tc.name      Camera_AnimCore_0010
     * @tc.desc      IMG_FLIP_ANGLE_90 is pinned to 90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0010 begin`);
      logInfo("animation IMG_FLIP_ANGLE_90");
      const actual: number = IMG_FLIP_ANGLE_90;
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0011
     * @tc.name      Camera_AnimCore_0011
     * @tc.desc      IMG_FLIP_ANGLE_270 is pinned to 270 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0011 begin`);
      logInfo("animation IMG_FLIP_ANGLE_270");
      const actual: number = IMG_FLIP_ANGLE_270;
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0012
     * @tc.name      Camera_AnimCore_0012
     * @tc.desc      IMG_FLIP_ANGLE_MINUS_90 is pinned to -90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimCore_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimCore_0012 begin`);
      logInfo("animation IMG_FLIP_ANGLE_MINUS_90");
      const actual: number = IMG_FLIP_ANGLE_MINUS_90;
      logInfo('actual=' + String(actual) + ', expected=' + "-90");
      expect(actual).assertEqual(-90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0013
     * @tc.name      Camera_AnimCore_0013
     * @tc.desc      ANIM_MODE_SWITCH_BLUR is pinned to 48 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0013 begin`);
      logInfo("animation ANIM_MODE_SWITCH_BLUR");
      const actual: number = ANIM_MODE_SWITCH_BLUR;
      logInfo('actual=' + String(actual) + ', expected=' + "48");
      expect(actual).assertEqual(48);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0014
     * @tc.name      Camera_AnimCore_0014
     * @tc.desc      IMG_SCALE is pinned to 0.75 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0014 begin`);
      logInfo("animation IMG_SCALE");
      const actual: number = IMG_SCALE;
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0015
     * @tc.name      Camera_AnimCore_0015
     * @tc.desc      FOCUS_FRAME_DURATION is pinned to 3500 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0015 begin`);
      logInfo("animation FOCUS_FRAME_DURATION");
      const actual: number = FOCUS_FRAME_DURATION;
      logInfo('actual=' + String(actual) + ', expected=' + "3500");
      expect(actual).assertEqual(3500);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0016
     * @tc.name      Camera_AnimCore_0016
     * @tc.desc      FOCUS_FRAME_SIZE is pinned to 120 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0016 begin`);
      logInfo("animation FOCUS_FRAME_SIZE");
      const actual: number = FOCUS_FRAME_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "120");
      expect(actual).assertEqual(120);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0017
     * @tc.name      Camera_AnimCore_0017
     * @tc.desc      FOCUS_FRAME_HALF is pinned to 60 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0017 begin`);
      logInfo("animation FOCUS_FRAME_HALF");
      const actual: number = FOCUS_FRAME_HALF;
      logInfo('actual=' + String(actual) + ', expected=' + "60");
      expect(actual).assertEqual(60);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0018
     * @tc.name      Camera_AnimCore_0018
     * @tc.desc      durationOf(0) is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimCore_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimCore_0018 begin`);
      logInfo("animation durationOf(0)");
      const actual: number = durationOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0019
     * @tc.name      Camera_AnimCore_0019
     * @tc.desc      durationOf(1) is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0019 begin`);
      logInfo("animation durationOf(1)");
      const actual: number = durationOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0020
     * @tc.name      Camera_AnimCore_0020
     * @tc.desc      durationOf(2) is pinned to 200 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0020 begin`);
      logInfo("animation durationOf(2)");
      const actual: number = durationOf(2);
      logInfo('actual=' + String(actual) + ', expected=' + "200");
      expect(actual).assertEqual(200);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0021
     * @tc.name      Camera_AnimCore_0021
     * @tc.desc      durationOf(3) is pinned to 50 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0021 begin`);
      logInfo("animation durationOf(3)");
      const actual: number = durationOf(3);
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0022
     * @tc.name      Camera_AnimCore_0022
     * @tc.desc      durationOf(4) is pinned to -1 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0022 begin`);
      logInfo("animation durationOf(4)");
      const actual: number = durationOf(4);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0023
     * @tc.name      Camera_AnimCore_0023
     * @tc.desc      durationOf(-1) is pinned to -1 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimCore_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimCore_0023 begin`);
      logInfo("animation durationOf(-1)");
      const actual: number = durationOf(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0024
     * @tc.name      Camera_AnimCore_0024
     * @tc.desc      rotationAngleOf(1) is pinned to 90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0024 begin`);
      logInfo("animation rotationAngleOf(1)");
      const actual: number = rotationAngleOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0025
     * @tc.name      Camera_AnimCore_0025
     * @tc.desc      rotationAngleOf(0) is pinned to 270 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0025 begin`);
      logInfo("animation rotationAngleOf(0)");
      const actual: number = rotationAngleOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0026
     * @tc.name      Camera_AnimCore_0026
     * @tc.desc      rotationAngleOf(2) is pinned to 270 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0026 begin`);
      logInfo("animation rotationAngleOf(2)");
      const actual: number = rotationAngleOf(2);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0027
     * @tc.name      Camera_AnimCore_0027
     * @tc.desc      initialFlipOf(1) is pinned to 0 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0027 begin`);
      logInfo("animation initialFlipOf(1)");
      const actual: number = initialFlipOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0028
     * @tc.name      Camera_AnimCore_0028
     * @tc.desc      initialFlipOf(0) is pinned to 180 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0028 begin`);
      logInfo("animation initialFlipOf(0)");
      const actual: number = initialFlipOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0029
     * @tc.name      Camera_AnimCore_0029
     * @tc.desc      initialFlipOf(2) is pinned to 180 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0029 begin`);
      logInfo("animation initialFlipOf(2)");
      const actual: number = initialFlipOf(2);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0030
     * @tc.name      Camera_AnimCore_0030
     * @tc.desc      firstFlipTargetOf(1) is pinned to 90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0030 begin`);
      logInfo("animation firstFlipTargetOf(1)");
      const actual: number = firstFlipTargetOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "90");
      expect(actual).assertEqual(90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0031
     * @tc.name      Camera_AnimCore_0031
     * @tc.desc      firstFlipTargetOf(0) is pinned to 270 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0031 begin`);
      logInfo("animation firstFlipTargetOf(0)");
      const actual: number = firstFlipTargetOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "270");
      expect(actual).assertEqual(270);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0032
     * @tc.name      Camera_AnimCore_0032
     * @tc.desc      secondFlipStartOf(1) is pinned to -90 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0032 begin`);
      logInfo("animation secondFlipStartOf(1)");
      const actual: number = secondFlipStartOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "-90");
      expect(actual).assertEqual(-90);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0033
     * @tc.name      Camera_AnimCore_0033
     * @tc.desc      secondFlipStartOf(0) is pinned to 180 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0033 begin`);
      logInfo("animation secondFlipStartOf(0)");
      const actual: number = secondFlipStartOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0034
     * @tc.name      Camera_AnimCore_0034
     * @tc.desc      secondFlipTargetOf(1) is pinned to 0 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimCore_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimCore_0034 begin`);
      logInfo("animation secondFlipTargetOf(1)");
      const actual: number = secondFlipTargetOf(1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0035
     * @tc.name      Camera_AnimCore_0035
     * @tc.desc      secondFlipTargetOf(0) is pinned to 180 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_AnimCore_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}AnimCore_0035 begin`);
      logInfo("animation secondFlipTargetOf(0)");
      const actual: number = secondFlipTargetOf(0);
      logInfo('actual=' + String(actual) + ', expected=' + "180");
      expect(actual).assertEqual(180);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0036
     * @tc.name      Camera_AnimCore_0036
     * @tc.desc      flashBlackDelay() is pinned to 50 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0036 begin`);
      logInfo("animation flashBlackDelay()");
      const actual: number = flashBlackDelay();
      logInfo('actual=' + String(actual) + ', expected=' + "50");
      expect(actual).assertEqual(50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0037
     * @tc.name      Camera_AnimCore_0037
     * @tc.desc      flashBlackTargetOpacity() is pinned to 0 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0037 begin`);
      logInfo("animation flashBlackTargetOpacity()");
      const actual: number = flashBlackTargetOpacity();
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0038
     * @tc.name      Camera_AnimCore_0038
     * @tc.desc      flashBlackResetOpacity() is pinned to 1 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0038 begin`);
      logInfo("animation flashBlackResetOpacity()");
      const actual: number = flashBlackResetOpacity();
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0039
     * @tc.name      Camera_AnimCore_0039
     * @tc.desc      modeSwitchBlur() is pinned to 48 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0039 begin`);
      logInfo("animation modeSwitchBlur()");
      const actual: number = modeSwitchBlur();
      logInfo('actual=' + String(actual) + ', expected=' + "48");
      expect(actual).assertEqual(48);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0040
     * @tc.name      Camera_AnimCore_0040
     * @tc.desc      modeSwitchScale() is pinned to 0.75 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0040 begin`);
      logInfo("animation modeSwitchScale()");
      const actual: number = modeSwitchScale();
      logInfo('actual=' + String(actual) + ', expected=' + "0.75");
      expect(actual).assertEqual(0.75);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0041
     * @tc.name      Camera_AnimCore_0041
     * @tc.desc      focusFrameDelay() is pinned to 3500 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0041 begin`);
      logInfo("animation focusFrameDelay()");
      const actual: number = focusFrameDelay();
      logInfo('actual=' + String(actual) + ', expected=' + "3500");
      expect(actual).assertEqual(3500);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0042
     * @tc.name      Camera_AnimCore_0042
     * @tc.desc      focusFrameX(10) is pinned to -50 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0042 begin`);
      logInfo("animation focusFrameX(10)");
      const actual: number = focusFrameX(10);
      logInfo('actual=' + String(actual) + ', expected=' + "-50");
      expect(actual).assertEqual(-50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0043
     * @tc.name      Camera_AnimCore_0043
     * @tc.desc      focusFrameX(70) is pinned to 10 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0043 begin`);
      logInfo("animation focusFrameX(70)");
      const actual: number = focusFrameX(70);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0044
     * @tc.name      Camera_AnimCore_0044
     * @tc.desc      focusFrameY(10) is pinned to -50 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0044 begin`);
      logInfo("animation focusFrameY(10)");
      const actual: number = focusFrameY(10);
      logInfo('actual=' + String(actual) + ', expected=' + "-50");
      expect(actual).assertEqual(-50);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0045
     * @tc.name      Camera_AnimCore_0045
     * @tc.desc      focusFrameY(70) is pinned to 10 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_AnimCore_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AnimCore_0045 begin`);
      logInfo("animation focusFrameY(70)");
      const actual: number = focusFrameY(70);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual(10);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_ANIM_CORE_0046
     * @tc.name      Camera_AnimCore_0046
     * @tc.desc      focusFrameX(0) is pinned to -60 for the blur/rotate/flash animation contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_AnimCore_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AnimCore_0046 begin`);
      logInfo("animation focusFrameX(0)");
      const actual: number = focusFrameX(0);
      logInfo('actual=' + String(actual) + ', expected=' + "-60");
      expect(actual).assertEqual(-60);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}AnimCore_0046 end`);
    });
  });
}
