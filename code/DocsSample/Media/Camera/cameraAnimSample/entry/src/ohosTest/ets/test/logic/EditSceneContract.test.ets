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
  editUsesPhoto,
  editUsesVideo,
  sliderApplies,
  routerUrlForEdit,
} from '../model/CameraLogic';

/** EditSceneContractTest logic checks (46 cases). */
export default function editSceneContractTest(): void {
  describe('EditSceneContractTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0001
     * @tc.name      Camera_EditSceneContract_0001
     * @tc.desc      scene -1 with zoom range length 0 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditSceneContract_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditSceneContract_0001 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(0) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(0) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:false:pages/EditPage");
      expect(actual).assertEqual("false:false:false:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0002
     * @tc.name      Camera_EditSceneContract_0002
     * @tc.desc      scene 0 with zoom range length 1 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0002 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(1) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(1) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0003
     * @tc.name      Camera_EditSceneContract_0003
     * @tc.desc      scene 1 with zoom range length 2 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0003 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(2) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(2) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0004
     * @tc.name      Camera_EditSceneContract_0004
     * @tc.desc      scene 2 with zoom range length 3 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0004 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(3) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(3) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0005
     * @tc.name      Camera_EditSceneContract_0005
     * @tc.desc      scene 3 with zoom range length 4 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0005 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(4) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(4) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0006
     * @tc.name      Camera_EditSceneContract_0006
     * @tc.desc      scene -1 with zoom range length 5 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0006 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(5) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(5) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0007
     * @tc.name      Camera_EditSceneContract_0007
     * @tc.desc      scene 0 with zoom range length 6 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0007 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(6) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(6) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0008
     * @tc.name      Camera_EditSceneContract_0008
     * @tc.desc      scene 1 with zoom range length 7 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0008 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(7) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(7) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0009
     * @tc.name      Camera_EditSceneContract_0009
     * @tc.desc      scene 2 with zoom range length 8 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0009 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(8) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(8) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0010
     * @tc.name      Camera_EditSceneContract_0010
     * @tc.desc      scene 3 with zoom range length 9 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0010 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(9) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(9) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0011
     * @tc.name      Camera_EditSceneContract_0011
     * @tc.desc      scene -1 with zoom range length 10 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0011 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(10) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(10) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0012
     * @tc.name      Camera_EditSceneContract_0012
     * @tc.desc      scene 0 with zoom range length 11 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditSceneContract_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditSceneContract_0012 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(11) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(11) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0013
     * @tc.name      Camera_EditSceneContract_0013
     * @tc.desc      scene 1 with zoom range length 12 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0013 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(12) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(12) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0014
     * @tc.name      Camera_EditSceneContract_0014
     * @tc.desc      scene 2 with zoom range length 13 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0014 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(13) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(13) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0015
     * @tc.name      Camera_EditSceneContract_0015
     * @tc.desc      scene 3 with zoom range length 14 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0015 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(14) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(14) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0016
     * @tc.name      Camera_EditSceneContract_0016
     * @tc.desc      scene -1 with zoom range length 15 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0016 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(15) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(15) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0017
     * @tc.name      Camera_EditSceneContract_0017
     * @tc.desc      scene 0 with zoom range length 16 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0017 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(16) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(16) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0018
     * @tc.name      Camera_EditSceneContract_0018
     * @tc.desc      scene 1 with zoom range length 17 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EditSceneContract_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EditSceneContract_0018 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(17) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(17) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0019
     * @tc.name      Camera_EditSceneContract_0019
     * @tc.desc      scene 2 with zoom range length 18 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0019 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(18) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(18) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0020
     * @tc.name      Camera_EditSceneContract_0020
     * @tc.desc      scene 3 with zoom range length 19 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0020 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(19) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(19) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0021
     * @tc.name      Camera_EditSceneContract_0021
     * @tc.desc      scene -1 with zoom range length 20 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0021 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(20) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(20) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0022
     * @tc.name      Camera_EditSceneContract_0022
     * @tc.desc      scene 0 with zoom range length 21 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0022 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(21) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(21) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0023
     * @tc.name      Camera_EditSceneContract_0023
     * @tc.desc      scene 1 with zoom range length 22 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditSceneContract_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditSceneContract_0023 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(22) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(22) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0024
     * @tc.name      Camera_EditSceneContract_0024
     * @tc.desc      scene 2 with zoom range length 23 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0024 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(23) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(23) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0025
     * @tc.name      Camera_EditSceneContract_0025
     * @tc.desc      scene 3 with zoom range length 24 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0025 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(24) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(24) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0026
     * @tc.name      Camera_EditSceneContract_0026
     * @tc.desc      scene -1 with zoom range length 25 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0026 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(25) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(25) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0027
     * @tc.name      Camera_EditSceneContract_0027
     * @tc.desc      scene 0 with zoom range length 26 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0027 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(26) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(26) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0028
     * @tc.name      Camera_EditSceneContract_0028
     * @tc.desc      scene 1 with zoom range length 27 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0028 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(27) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(27) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0029
     * @tc.name      Camera_EditSceneContract_0029
     * @tc.desc      scene 2 with zoom range length 28 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0029 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(28) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(28) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0030
     * @tc.name      Camera_EditSceneContract_0030
     * @tc.desc      scene 3 with zoom range length 29 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0030 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(29) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(29) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0031
     * @tc.name      Camera_EditSceneContract_0031
     * @tc.desc      scene -1 with zoom range length 30 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0031 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(30) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(30) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0032
     * @tc.name      Camera_EditSceneContract_0032
     * @tc.desc      scene 0 with zoom range length 31 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0032 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(31) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(31) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0033
     * @tc.name      Camera_EditSceneContract_0033
     * @tc.desc      scene 1 with zoom range length 32 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0033 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(32) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(32) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0034
     * @tc.name      Camera_EditSceneContract_0034
     * @tc.desc      scene 2 with zoom range length 33 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditSceneContract_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditSceneContract_0034 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(33) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(33) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0035
     * @tc.name      Camera_EditSceneContract_0035
     * @tc.desc      scene 3 with zoom range length 34 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EditSceneContract_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EditSceneContract_0035 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(34) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(34) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0036
     * @tc.name      Camera_EditSceneContract_0036
     * @tc.desc      scene -1 with zoom range length 35 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0036 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(35) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(35) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0037
     * @tc.name      Camera_EditSceneContract_0037
     * @tc.desc      scene 0 with zoom range length 36 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0037 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(36) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(36) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0038
     * @tc.name      Camera_EditSceneContract_0038
     * @tc.desc      scene 1 with zoom range length 37 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0038 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(37) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(37) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0039
     * @tc.name      Camera_EditSceneContract_0039
     * @tc.desc      scene 2 with zoom range length 38 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0039 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(38) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(38) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0040
     * @tc.name      Camera_EditSceneContract_0040
     * @tc.desc      scene 3 with zoom range length 39 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0040 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(39) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(39) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0041
     * @tc.name      Camera_EditSceneContract_0041
     * @tc.desc      scene -1 with zoom range length 40 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0041 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(40) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(40) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0042
     * @tc.name      Camera_EditSceneContract_0042
     * @tc.desc      scene 0 with zoom range length 41 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0042 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(41) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0) + ':' + sliderApplies(41) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0043
     * @tc.name      Camera_EditSceneContract_0043
     * @tc.desc      scene 1 with zoom range length 42 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0043 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(42) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1) + ':' + sliderApplies(42) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "true:false:true:pages/EditPage");
      expect(actual).assertEqual("true:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0044
     * @tc.name      Camera_EditSceneContract_0044
     * @tc.desc      scene 2 with zoom range length 43 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0044 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(43) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2) + ':' + sliderApplies(43) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true:pages/EditPage");
      expect(actual).assertEqual("false:true:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0045
     * @tc.name      Camera_EditSceneContract_0045
     * @tc.desc      scene 3 with zoom range length 44 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditSceneContract_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditSceneContract_0045 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(44) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3) + ':' + sliderApplies(44) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo(`${BUNDLE}EditSceneContract_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_SCENE_CONTRACT_0046
     * @tc.name      Camera_EditSceneContract_0046
     * @tc.desc      scene -1 with zoom range length 45 selects the photo/video edit branch and route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditSceneContract_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditSceneContract_0046 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(45) + ':' + routerUrlForEdit()");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1) + ':' + sliderApplies(45) + ':' + routerUrlForEdit();
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true:pages/EditPage");
      expect(actual).assertEqual("false:false:true:pages/EditPage");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditSceneContract_0046 end`);
    });
  });
}
