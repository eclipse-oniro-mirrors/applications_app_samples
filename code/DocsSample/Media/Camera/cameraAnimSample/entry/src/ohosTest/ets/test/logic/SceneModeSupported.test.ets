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
  sceneModeSupported,
} from '../model/CameraLogic';

/** SceneModeSupportedTest logic checks (46 cases). */
export default function sceneModeSupportedTest(): void {
  describe('SceneModeSupportedTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0001
     * @tc.name      Camera_SceneModeSupported_0001
     * @tc.desc      sceneModeSupported([], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeSupported_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0001 begin`);
      logInfo("sceneModeSupported([], 0)");
      const actual: boolean = sceneModeSupported([], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0002
     * @tc.name      Camera_SceneModeSupported_0002
     * @tc.desc      sceneModeSupported([], 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0002 begin`);
      logInfo("sceneModeSupported([], 2)");
      const actual: boolean = sceneModeSupported([], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0003
     * @tc.name      Camera_SceneModeSupported_0003
     * @tc.desc      sceneModeSupported([], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0003 begin`);
      logInfo("sceneModeSupported([], 4)");
      const actual: boolean = sceneModeSupported([], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0004
     * @tc.name      Camera_SceneModeSupported_0004
     * @tc.desc      sceneModeSupported([1], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0004 begin`);
      logInfo("sceneModeSupported([1], 0)");
      const actual: boolean = sceneModeSupported([1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0005
     * @tc.name      Camera_SceneModeSupported_0005
     * @tc.desc      sceneModeSupported([1], 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0005 begin`);
      logInfo("sceneModeSupported([1], 3)");
      const actual: boolean = sceneModeSupported([1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0006
     * @tc.name      Camera_SceneModeSupported_0006
     * @tc.desc      sceneModeSupported([1], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0006 begin`);
      logInfo("sceneModeSupported([1], 4)");
      const actual: boolean = sceneModeSupported([1], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0007
     * @tc.name      Camera_SceneModeSupported_0007
     * @tc.desc      sceneModeSupported([2], 1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0007 begin`);
      logInfo("sceneModeSupported([2], 1)");
      const actual: boolean = sceneModeSupported([2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0008
     * @tc.name      Camera_SceneModeSupported_0008
     * @tc.desc      sceneModeSupported([2], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0008 begin`);
      logInfo("sceneModeSupported([2], -1)");
      const actual: boolean = sceneModeSupported([2], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0009
     * @tc.name      Camera_SceneModeSupported_0009
     * @tc.desc      sceneModeSupported([2], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0009 begin`);
      logInfo("sceneModeSupported([2], 5)");
      const actual: boolean = sceneModeSupported([2], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0010
     * @tc.name      Camera_SceneModeSupported_0010
     * @tc.desc      sceneModeSupported([1,2], 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0010 begin`);
      logInfo("sceneModeSupported([1,2], 2)");
      const actual: boolean = sceneModeSupported([1,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0011
     * @tc.name      Camera_SceneModeSupported_0011
     * @tc.desc      sceneModeSupported([1,2], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0011 begin`);
      logInfo("sceneModeSupported([1,2], -1)");
      const actual: boolean = sceneModeSupported([1,2], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0012
     * @tc.name      Camera_SceneModeSupported_0012
     * @tc.desc      sceneModeSupported([2,1], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeSupported_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0012 begin`);
      logInfo("sceneModeSupported([2,1], 0)");
      const actual: boolean = sceneModeSupported([2,1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0013
     * @tc.name      Camera_SceneModeSupported_0013
     * @tc.desc      sceneModeSupported([2,1], 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0013 begin`);
      logInfo("sceneModeSupported([2,1], 3)");
      const actual: boolean = sceneModeSupported([2,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0014
     * @tc.name      Camera_SceneModeSupported_0014
     * @tc.desc      sceneModeSupported([2,1], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0014 begin`);
      logInfo("sceneModeSupported([2,1], 4)");
      const actual: boolean = sceneModeSupported([2,1], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0015
     * @tc.name      Camera_SceneModeSupported_0015
     * @tc.desc      sceneModeSupported([0,1,2], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0015 begin`);
      logInfo("sceneModeSupported([0,1,2], 1)");
      const actual: boolean = sceneModeSupported([0,1,2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0016
     * @tc.name      Camera_SceneModeSupported_0016
     * @tc.desc      sceneModeSupported([0,1,2], 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0016 begin`);
      logInfo("sceneModeSupported([0,1,2], 3)");
      const actual: boolean = sceneModeSupported([0,1,2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0017
     * @tc.name      Camera_SceneModeSupported_0017
     * @tc.desc      sceneModeSupported([0,1,2], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0017 begin`);
      logInfo("sceneModeSupported([0,1,2], 5)");
      const actual: boolean = sceneModeSupported([0,1,2], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0018
     * @tc.name      Camera_SceneModeSupported_0018
     * @tc.desc      sceneModeSupported([1,1], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SceneModeSupported_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0018 begin`);
      logInfo("sceneModeSupported([1,1], 1)");
      const actual: boolean = sceneModeSupported([1,1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0019
     * @tc.name      Camera_SceneModeSupported_0019
     * @tc.desc      sceneModeSupported([1,1], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0019 begin`);
      logInfo("sceneModeSupported([1,1], -1)");
      const actual: boolean = sceneModeSupported([1,1], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0020
     * @tc.name      Camera_SceneModeSupported_0020
     * @tc.desc      sceneModeSupported([2,2], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0020 begin`);
      logInfo("sceneModeSupported([2,2], 0)");
      const actual: boolean = sceneModeSupported([2,2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0021
     * @tc.name      Camera_SceneModeSupported_0021
     * @tc.desc      sceneModeSupported([2,2], 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0021 begin`);
      logInfo("sceneModeSupported([2,2], 2)");
      const actual: boolean = sceneModeSupported([2,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0022
     * @tc.name      Camera_SceneModeSupported_0022
     * @tc.desc      sceneModeSupported([2,2], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0022 begin`);
      logInfo("sceneModeSupported([2,2], 4)");
      const actual: boolean = sceneModeSupported([2,2], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0023
     * @tc.name      Camera_SceneModeSupported_0023
     * @tc.desc      sceneModeSupported([3], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeSupported_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0023 begin`);
      logInfo("sceneModeSupported([3], 0)");
      const actual: boolean = sceneModeSupported([3], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0024
     * @tc.name      Camera_SceneModeSupported_0024
     * @tc.desc      sceneModeSupported([3], 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0024 begin`);
      logInfo("sceneModeSupported([3], 3)");
      const actual: boolean = sceneModeSupported([3], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0025
     * @tc.name      Camera_SceneModeSupported_0025
     * @tc.desc      sceneModeSupported([3], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0025 begin`);
      logInfo("sceneModeSupported([3], 5)");
      const actual: boolean = sceneModeSupported([3], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0026
     * @tc.name      Camera_SceneModeSupported_0026
     * @tc.desc      sceneModeSupported([1,3], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0026 begin`);
      logInfo("sceneModeSupported([1,3], 1)");
      const actual: boolean = sceneModeSupported([1,3], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0027
     * @tc.name      Camera_SceneModeSupported_0027
     * @tc.desc      sceneModeSupported([1,3], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0027 begin`);
      logInfo("sceneModeSupported([1,3], -1)");
      const actual: boolean = sceneModeSupported([1,3], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0028
     * @tc.name      Camera_SceneModeSupported_0028
     * @tc.desc      sceneModeSupported([1,3], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0028 begin`);
      logInfo("sceneModeSupported([1,3], 5)");
      const actual: boolean = sceneModeSupported([1,3], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0029
     * @tc.name      Camera_SceneModeSupported_0029
     * @tc.desc      sceneModeSupported([2,3], 2) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0029 begin`);
      logInfo("sceneModeSupported([2,3], 2)");
      const actual: boolean = sceneModeSupported([2,3], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0030
     * @tc.name      Camera_SceneModeSupported_0030
     * @tc.desc      sceneModeSupported([2,3], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0030 begin`);
      logInfo("sceneModeSupported([2,3], 4)");
      const actual: boolean = sceneModeSupported([2,3], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0031
     * @tc.name      Camera_SceneModeSupported_0031
     * @tc.desc      sceneModeSupported([3,2,1], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0031 begin`);
      logInfo("sceneModeSupported([3,2,1], 0)");
      const actual: boolean = sceneModeSupported([3,2,1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0032
     * @tc.name      Camera_SceneModeSupported_0032
     * @tc.desc      sceneModeSupported([3,2,1], 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0032 begin`);
      logInfo("sceneModeSupported([3,2,1], 3)");
      const actual: boolean = sceneModeSupported([3,2,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0033
     * @tc.name      Camera_SceneModeSupported_0033
     * @tc.desc      sceneModeSupported([3,2,1], 4) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0033 begin`);
      logInfo("sceneModeSupported([3,2,1], 4)");
      const actual: boolean = sceneModeSupported([3,2,1], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0034
     * @tc.name      Camera_SceneModeSupported_0034
     * @tc.desc      sceneModeSupported([-1,1], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeSupported_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0034 begin`);
      logInfo("sceneModeSupported([-1,1], 1)");
      const actual: boolean = sceneModeSupported([-1,1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0035
     * @tc.name      Camera_SceneModeSupported_0035
     * @tc.desc      sceneModeSupported([-1,1], 3) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SceneModeSupported_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0035 begin`);
      logInfo("sceneModeSupported([-1,1], 3)");
      const actual: boolean = sceneModeSupported([-1,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0036
     * @tc.name      Camera_SceneModeSupported_0036
     * @tc.desc      sceneModeSupported([-1,1], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0036 begin`);
      logInfo("sceneModeSupported([-1,1], 5)");
      const actual: boolean = sceneModeSupported([-1,1], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0037
     * @tc.name      Camera_SceneModeSupported_0037
     * @tc.desc      sceneModeSupported([0], 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0037 begin`);
      logInfo("sceneModeSupported([0], 2)");
      const actual: boolean = sceneModeSupported([0], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0038
     * @tc.name      Camera_SceneModeSupported_0038
     * @tc.desc      sceneModeSupported([0], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0038 begin`);
      logInfo("sceneModeSupported([0], -1)");
      const actual: boolean = sceneModeSupported([0], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0039
     * @tc.name      Camera_SceneModeSupported_0039
     * @tc.desc      sceneModeSupported([4,5], 0) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0039 begin`);
      logInfo("sceneModeSupported([4,5], 0)");
      const actual: boolean = sceneModeSupported([4,5], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0040
     * @tc.name      Camera_SceneModeSupported_0040
     * @tc.desc      sceneModeSupported([4,5], 2) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0040 begin`);
      logInfo("sceneModeSupported([4,5], 2)");
      const actual: boolean = sceneModeSupported([4,5], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0041
     * @tc.name      Camera_SceneModeSupported_0041
     * @tc.desc      sceneModeSupported([4,5], 4) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0041 begin`);
      logInfo("sceneModeSupported([4,5], 4)");
      const actual: boolean = sceneModeSupported([4,5], 4);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0042
     * @tc.name      Camera_SceneModeSupported_0042
     * @tc.desc      sceneModeSupported([1,2,3,4], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0042 begin`);
      logInfo("sceneModeSupported([1,2,3,4], 1)");
      const actual: boolean = sceneModeSupported([1,2,3,4], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0043
     * @tc.name      Camera_SceneModeSupported_0043
     * @tc.desc      sceneModeSupported([1,2,3,4], 3) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0043 begin`);
      logInfo("sceneModeSupported([1,2,3,4], 3)");
      const actual: boolean = sceneModeSupported([1,2,3,4], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0044
     * @tc.name      Camera_SceneModeSupported_0044
     * @tc.desc      sceneModeSupported([1,2,3,4], 5) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0044 begin`);
      logInfo("sceneModeSupported([1,2,3,4], 5)");
      const actual: boolean = sceneModeSupported([1,2,3,4], 5);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo(`${BUNDLE}SceneModeSupported_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0045
     * @tc.name      Camera_SceneModeSupported_0045
     * @tc.desc      sceneModeSupported([2,1,0], 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeSupported_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0045 begin`);
      logInfo("sceneModeSupported([2,1,0], 1)");
      const actual: boolean = sceneModeSupported([2,1,0], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}SceneModeSupported_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_SUPPORTED_0046
     * @tc.name      Camera_SceneModeSupported_0046
     * @tc.desc      sceneModeSupported([2,1,0], -1) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeSupported_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeSupported_0046 begin`);
      logInfo("sceneModeSupported([2,1,0], -1)");
      const actual: boolean = sceneModeSupported([2,1,0], -1);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}SceneModeSupported_0046 end`);
    });
  });
}
