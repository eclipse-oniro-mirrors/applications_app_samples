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

