/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  CameraInit2Model,
  SCENE_NORMAL_PHOTO,
} from '../model/ResolutionLogic';

/** CameraInit2FlowTest logic checks (17 cases). */
export default function cameraInit2FlowTest(): void {
  describe('CameraInit2FlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0001
     * @tc.name      Resolution_Init2Flow_0001
     * @tc.desc      initCamera2 inputs true,0,true,false,false,false,true,true,true,false resolve to no-camera.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Flow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Flow_0001 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,0,true,false,false,false,true,true,true,false)");
      const actual: string = subject.init(true, 0, true, false, false, false, true, true, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0002
     * @tc.name      Resolution_Init2Flow_0002
     * @tc.desc      initCamera2 inputs false,1,false,true,true,true,false,false,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0002 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,1,false,true,true,true,false,false,false,true)");
      const actual: string = subject.init(false, 1, false, true, true, true, false, false, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0003
     * @tc.name      Resolution_Init2Flow_0003
     * @tc.desc      initCamera2 inputs true,2,true,true,true,true,true,true,true,true resolve to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0003 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,2,true,true,true,true,true,true,true,true)");
      const actual: string = subject.init(true, 2, true, true, true, true, true, true, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0004
     * @tc.name      Resolution_Init2Flow_0004
     * @tc.desc      initCamera2 inputs false,0,false,false,true,true,false,true,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0004 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,0,false,false,true,true,false,true,false,true)");
      const actual: string = subject.init(false, 0, false, false, true, true, false, true, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0005
     * @tc.name      Resolution_Init2Flow_0005
     * @tc.desc      initCamera2 inputs true,1,true,true,false,true,true,false,true,false resolve to no-output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0005 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,1,true,true,false,true,true,false,true,false)");
      const actual: string = subject.init(true, 1, true, true, false, true, true, false, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-output");
      expect(actual).assertEqual("no-output");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0006
     * @tc.name      Resolution_Init2Flow_0006
     * @tc.desc      initCamera2 inputs false,2,false,true,true,false,false,true,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0006 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,2,false,true,true,false,false,true,false,true)");
      const actual: string = subject.init(false, 2, false, true, true, false, false, true, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0007
     * @tc.name      Resolution_Init2Flow_0007
     * @tc.desc      initCamera2 inputs true,0,true,false,true,true,true,true,true,true resolve to no-camera.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0007 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,0,true,false,true,true,true,true,true,true)");
      const actual: string = subject.init(true, 0, true, false, true, true, true, true, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0008
     * @tc.name      Resolution_Init2Flow_0008
     * @tc.desc      initCamera2 inputs true,2,true,true,false,true,true,true,true,false resolve to no-output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0008 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,2,true,true,false,true,true,true,true,false)");
      const actual: string = subject.init(true, 2, true, true, false, true, true, true, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-output");
      expect(actual).assertEqual("no-output");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0009
     * @tc.name      Resolution_Init2Flow_0009
     * @tc.desc      initCamera2 inputs true,1,true,true,true,false,true,false,true,true resolve to preview-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0009 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,1,true,true,true,false,true,false,true,true)");
      const actual: string = subject.init(true, 1, true, true, true, false, true, false, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "preview-failed");
      expect(actual).assertEqual("preview-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0010
     * @tc.name      Resolution_Init2Flow_0010
     * @tc.desc      initCamera2 inputs false,2,false,true,true,true,false,true,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0010 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,2,false,true,true,true,false,true,false,true)");
      const actual: string = subject.init(false, 2, false, true, true, true, false, true, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0011
     * @tc.name      Resolution_Init2Flow_0011
     * @tc.desc      initCamera2 inputs true,0,true,false,false,true,true,true,true,false resolve to no-camera.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0011 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,0,true,false,false,true,true,true,true,false)");
      const actual: string = subject.init(true, 0, true, false, false, true, true, true, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0012
     * @tc.name      Resolution_Init2Flow_0012
     * @tc.desc      initCamera2 inputs false,0,false,false,true,false,false,true,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_Init2Flow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Init2Flow_0012 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,0,false,false,true,false,false,true,false,true)");
      const actual: string = subject.init(false, 0, false, false, true, false, false, true, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0013
     * @tc.name      Resolution_Init2Flow_0013
     * @tc.desc      initCamera2 inputs true,2,true,true,false,false,true,true,true,false resolve to no-output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0013 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,2,true,true,false,false,true,true,true,false)");
      const actual: string = subject.init(true, 2, true, true, false, false, true, true, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-output");
      expect(actual).assertEqual("no-output");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0014
     * @tc.name      Resolution_Init2Flow_0014
     * @tc.desc      initCamera2 inputs true,1,true,true,true,true,true,false,true,true resolve to profile-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0014 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,1,true,true,true,true,true,false,true,true)");
      const actual: string = subject.init(true, 1, true, true, true, true, true, false, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "profile-failed");
      expect(actual).assertEqual("profile-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0015
     * @tc.name      Resolution_Init2Flow_0015
     * @tc.desc      initCamera2 inputs false,1,false,true,true,false,false,false,false,true resolve to no-manager.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0015 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(false,1,false,true,true,false,false,false,false,true)");
      const actual: string = subject.init(false, 1, false, true, true, false, false, false, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-manager");
      expect(actual).assertEqual("no-manager");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0016
     * @tc.name      Resolution_Init2Flow_0016
     * @tc.desc      initCamera2 inputs true,0,true,false,true,false,true,true,true,true resolve to no-camera.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0016 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,0,true,false,true,false,true,true,true,true)");
      const actual: string = subject.init(true, 0, true, false, true, false, true, true, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-camera");
      expect(actual).assertEqual("no-camera");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_INIT2_FLOW_0017
     * @tc.name      Resolution_Init2Flow_0017
     * @tc.desc      initCamera2 inputs true,1,true,true,false,false,true,false,true,false resolve to no-output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_Init2Flow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Init2Flow_0017 begin`);
      const subject: CameraInit2Model = new CameraInit2Model();
      subject.setSceneMode(SCENE_NORMAL_PHOTO);
      logInfo("init2(true,1,true,true,false,false,true,false,true,false)");
      const actual: string = subject.init(true, 1, true, true, false, false, true, false, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-output");
      expect(actual).assertEqual("no-output");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Init2Flow_0017 end`);
    });
  });
}
