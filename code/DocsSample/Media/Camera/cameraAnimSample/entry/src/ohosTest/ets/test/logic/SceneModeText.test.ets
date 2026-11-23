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
  sceneModeText,
} from '../model/CameraLogic';

/** SceneModeTextTest logic checks (46 cases). */
export default function sceneModeTextTest(): void {
  describe('SceneModeTextTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0001
     * @tc.name      Camera_SceneModeText_0001
     * @tc.desc      sceneModeText(0) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeText_0001 begin`);
      logInfo("sceneModeText(0)");
      const actual: string = sceneModeText(0);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0002
     * @tc.name      Camera_SceneModeText_0002
     * @tc.desc      sceneModeText(1) returns "拍照" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0002 begin`);
      logInfo("sceneModeText(1)");
      const actual: string = sceneModeText(1);
      logInfo('actual=' + String(actual) + ', expected=' + "拍照");
      expect(actual).assertEqual("拍照");
      logInfo(`${BUNDLE}SceneModeText_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0003
     * @tc.name      Camera_SceneModeText_0003
     * @tc.desc      sceneModeText(2) returns "录像" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0003 begin`);
      logInfo("sceneModeText(2)");
      const actual: string = sceneModeText(2);
      logInfo('actual=' + String(actual) + ', expected=' + "录像");
      expect(actual).assertEqual("录像");
      logInfo(`${BUNDLE}SceneModeText_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0004
     * @tc.name      Camera_SceneModeText_0004
     * @tc.desc      sceneModeText(3) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0004 begin`);
      logInfo("sceneModeText(3)");
      const actual: string = sceneModeText(3);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0005
     * @tc.name      Camera_SceneModeText_0005
     * @tc.desc      sceneModeText(4) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0005 begin`);
      logInfo("sceneModeText(4)");
      const actual: string = sceneModeText(4);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0006
     * @tc.name      Camera_SceneModeText_0006
     * @tc.desc      sceneModeText(5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0006 begin`);
      logInfo("sceneModeText(5)");
      const actual: string = sceneModeText(5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0007
     * @tc.name      Camera_SceneModeText_0007
     * @tc.desc      sceneModeText(6) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0007 begin`);
      logInfo("sceneModeText(6)");
      const actual: string = sceneModeText(6);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0008
     * @tc.name      Camera_SceneModeText_0008
     * @tc.desc      sceneModeText(7) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0008 begin`);
      logInfo("sceneModeText(7)");
      const actual: string = sceneModeText(7);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0009
     * @tc.name      Camera_SceneModeText_0009
     * @tc.desc      sceneModeText(8) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0009 begin`);
      logInfo("sceneModeText(8)");
      const actual: string = sceneModeText(8);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0010
     * @tc.name      Camera_SceneModeText_0010
     * @tc.desc      sceneModeText(9) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0010 begin`);
      logInfo("sceneModeText(9)");
      const actual: string = sceneModeText(9);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0011
     * @tc.name      Camera_SceneModeText_0011
     * @tc.desc      sceneModeText(10) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0011 begin`);
      logInfo("sceneModeText(10)");
      const actual: string = sceneModeText(10);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0012
     * @tc.name      Camera_SceneModeText_0012
     * @tc.desc      sceneModeText(11) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeText_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeText_0012 begin`);
      logInfo("sceneModeText(11)");
      const actual: string = sceneModeText(11);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0013
     * @tc.name      Camera_SceneModeText_0013
     * @tc.desc      sceneModeText(12) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0013 begin`);
      logInfo("sceneModeText(12)");
      const actual: string = sceneModeText(12);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0014
     * @tc.name      Camera_SceneModeText_0014
     * @tc.desc      sceneModeText(13) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0014 begin`);
      logInfo("sceneModeText(13)");
      const actual: string = sceneModeText(13);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0015
     * @tc.name      Camera_SceneModeText_0015
     * @tc.desc      sceneModeText(14) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0015 begin`);
      logInfo("sceneModeText(14)");
      const actual: string = sceneModeText(14);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0016
     * @tc.name      Camera_SceneModeText_0016
     * @tc.desc      sceneModeText(15) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0016 begin`);
      logInfo("sceneModeText(15)");
      const actual: string = sceneModeText(15);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0017
     * @tc.name      Camera_SceneModeText_0017
     * @tc.desc      sceneModeText(16) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0017 begin`);
      logInfo("sceneModeText(16)");
      const actual: string = sceneModeText(16);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0018
     * @tc.name      Camera_SceneModeText_0018
     * @tc.desc      sceneModeText(17) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SceneModeText_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SceneModeText_0018 begin`);
      logInfo("sceneModeText(17)");
      const actual: string = sceneModeText(17);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0019
     * @tc.name      Camera_SceneModeText_0019
     * @tc.desc      sceneModeText(18) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0019 begin`);
      logInfo("sceneModeText(18)");
      const actual: string = sceneModeText(18);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0020
     * @tc.name      Camera_SceneModeText_0020
     * @tc.desc      sceneModeText(19) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0020 begin`);
      logInfo("sceneModeText(19)");
      const actual: string = sceneModeText(19);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0021
     * @tc.name      Camera_SceneModeText_0021
     * @tc.desc      sceneModeText(20) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0021 begin`);
      logInfo("sceneModeText(20)");
      const actual: string = sceneModeText(20);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0022
     * @tc.name      Camera_SceneModeText_0022
     * @tc.desc      sceneModeText(21) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0022 begin`);
      logInfo("sceneModeText(21)");
      const actual: string = sceneModeText(21);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0023
     * @tc.name      Camera_SceneModeText_0023
     * @tc.desc      sceneModeText(22) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeText_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeText_0023 begin`);
      logInfo("sceneModeText(22)");
      const actual: string = sceneModeText(22);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0024
     * @tc.name      Camera_SceneModeText_0024
     * @tc.desc      sceneModeText(23) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0024 begin`);
      logInfo("sceneModeText(23)");
      const actual: string = sceneModeText(23);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0025
     * @tc.name      Camera_SceneModeText_0025
     * @tc.desc      sceneModeText(24) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0025 begin`);
      logInfo("sceneModeText(24)");
      const actual: string = sceneModeText(24);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0026
     * @tc.name      Camera_SceneModeText_0026
     * @tc.desc      sceneModeText(25) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0026 begin`);
      logInfo("sceneModeText(25)");
      const actual: string = sceneModeText(25);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0027
     * @tc.name      Camera_SceneModeText_0027
     * @tc.desc      sceneModeText(26) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0027 begin`);
      logInfo("sceneModeText(26)");
      const actual: string = sceneModeText(26);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0028
     * @tc.name      Camera_SceneModeText_0028
     * @tc.desc      sceneModeText(27) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0028 begin`);
      logInfo("sceneModeText(27)");
      const actual: string = sceneModeText(27);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0029
     * @tc.name      Camera_SceneModeText_0029
     * @tc.desc      sceneModeText(28) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0029 begin`);
      logInfo("sceneModeText(28)");
      const actual: string = sceneModeText(28);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0030
     * @tc.name      Camera_SceneModeText_0030
     * @tc.desc      sceneModeText(29) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0030 begin`);
      logInfo("sceneModeText(29)");
      const actual: string = sceneModeText(29);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0031
     * @tc.name      Camera_SceneModeText_0031
     * @tc.desc      sceneModeText(30) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0031 begin`);
      logInfo("sceneModeText(30)");
      const actual: string = sceneModeText(30);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0032
     * @tc.name      Camera_SceneModeText_0032
     * @tc.desc      sceneModeText(-1) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0032 begin`);
      logInfo("sceneModeText(-1)");
      const actual: string = sceneModeText(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0033
     * @tc.name      Camera_SceneModeText_0033
     * @tc.desc      sceneModeText(-2) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0033 begin`);
      logInfo("sceneModeText(-2)");
      const actual: string = sceneModeText(-2);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0034
     * @tc.name      Camera_SceneModeText_0034
     * @tc.desc      sceneModeText(-3) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeText_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeText_0034 begin`);
      logInfo("sceneModeText(-3)");
      const actual: string = sceneModeText(-3);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0035
     * @tc.name      Camera_SceneModeText_0035
     * @tc.desc      sceneModeText(-4) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SceneModeText_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SceneModeText_0035 begin`);
      logInfo("sceneModeText(-4)");
      const actual: string = sceneModeText(-4);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0036
     * @tc.name      Camera_SceneModeText_0036
     * @tc.desc      sceneModeText(-5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0036 begin`);
      logInfo("sceneModeText(-5)");
      const actual: string = sceneModeText(-5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0037
     * @tc.name      Camera_SceneModeText_0037
     * @tc.desc      sceneModeText(100) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0037 begin`);
      logInfo("sceneModeText(100)");
      const actual: string = sceneModeText(100);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0038
     * @tc.name      Camera_SceneModeText_0038
     * @tc.desc      sceneModeText(255) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0038 begin`);
      logInfo("sceneModeText(255)");
      const actual: string = sceneModeText(255);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0039
     * @tc.name      Camera_SceneModeText_0039
     * @tc.desc      sceneModeText(360) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0039 begin`);
      logInfo("sceneModeText(360)");
      const actual: string = sceneModeText(360);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0040
     * @tc.name      Camera_SceneModeText_0040
     * @tc.desc      sceneModeText(1000) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0040 begin`);
      logInfo("sceneModeText(1000)");
      const actual: string = sceneModeText(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0041
     * @tc.name      Camera_SceneModeText_0041
     * @tc.desc      sceneModeText(1.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0041 begin`);
      logInfo("sceneModeText(1.5)");
      const actual: string = sceneModeText(1.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0042
     * @tc.name      Camera_SceneModeText_0042
     * @tc.desc      sceneModeText(2.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0042 begin`);
      logInfo("sceneModeText(2.5)");
      const actual: string = sceneModeText(2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0043
     * @tc.name      Camera_SceneModeText_0043
     * @tc.desc      sceneModeText(3.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0043 begin`);
      logInfo("sceneModeText(3.5)");
      const actual: string = sceneModeText(3.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0044
     * @tc.name      Camera_SceneModeText_0044
     * @tc.desc      sceneModeText(4.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0044 begin`);
      logInfo("sceneModeText(4.5)");
      const actual: string = sceneModeText(4.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0045
     * @tc.name      Camera_SceneModeText_0045
     * @tc.desc      sceneModeText(5.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SceneModeText_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SceneModeText_0045 begin`);
      logInfo("sceneModeText(5.5)");
      const actual: string = sceneModeText(5.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo(`${BUNDLE}SceneModeText_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SCENE_MODE_TEXT_0046
     * @tc.name      Camera_SceneModeText_0046
     * @tc.desc      sceneModeText(0.5) returns "" for the mode tab.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SceneModeText_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SceneModeText_0046 begin`);
      logInfo("sceneModeText(0.5)");
      const actual: string = sceneModeText(0.5);
      logInfo('actual=' + String(actual) + ', expected=' + "");
      expect(actual).assertEqual("");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SceneModeText_0046 end`);
    });
  });
}
