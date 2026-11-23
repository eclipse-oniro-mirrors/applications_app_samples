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
  CameraSessionModel,
  AnimateModel,
} from '../model/CameraLogic';

/** CameraPipelineTest logic checks (46 cases). */
export default function cameraPipelineTest(): void {
  describe('CameraPipelineTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0001
     * @tc.name      Camera_CameraPipeline_0001
     * @tc.desc      pipeline scene=2 with animation branch 0 x1 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPipeline_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPipeline_0001 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=1");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0002
     * @tc.name      Camera_CameraPipeline_0002
     * @tc.desc      pipeline scene=2 with animation branch 0 x2 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0002 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=2");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0003
     * @tc.name      Camera_CameraPipeline_0003
     * @tc.desc      pipeline scene=2 with animation branch 0 x3 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0003 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=3");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0004
     * @tc.name      Camera_CameraPipeline_0004
     * @tc.desc      pipeline scene=2 with animation branch 0 x4 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0004 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=4");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0005
     * @tc.name      Camera_CameraPipeline_0005
     * @tc.desc      pipeline scene=2 with animation branch 0 x5 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0005 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=5");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0006
     * @tc.name      Camera_CameraPipeline_0006
     * @tc.desc      pipeline scene=2 with animation branch 0 x6 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0006 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=6");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0007
     * @tc.name      Camera_CameraPipeline_0007
     * @tc.desc      pipeline scene=2 with animation branch 0 x7 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0007 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=7");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0008
     * @tc.name      Camera_CameraPipeline_0008
     * @tc.desc      pipeline scene=2 with animation branch 0 x8 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0008 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=8");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0009
     * @tc.name      Camera_CameraPipeline_0009
     * @tc.desc      pipeline scene=2 with animation branch 0 x9 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0009 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=9");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0010
     * @tc.name      Camera_CameraPipeline_0010
     * @tc.desc      pipeline scene=2 with animation branch 0 x10 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0010 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=10");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0011
     * @tc.name      Camera_CameraPipeline_0011
     * @tc.desc      pipeline scene=2 with animation branch 0 x11 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0011 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=11");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0012
     * @tc.name      Camera_CameraPipeline_0012
     * @tc.desc      pipeline scene=2 with animation branch 0 x12 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPipeline_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPipeline_0012 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      logInfo("session scene=2 anim=0 round=12");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:0");
      expect(actual).assertEqual("ok:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0013
     * @tc.name      Camera_CameraPipeline_0013
     * @tc.desc      pipeline scene=1 with animation branch 1 x1 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0013 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=1");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:3");
      expect(actual).assertEqual("ok:3");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0014
     * @tc.name      Camera_CameraPipeline_0014
     * @tc.desc      pipeline scene=1 with animation branch 1 x2 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0014 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=2");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:6");
      expect(actual).assertEqual("ok:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0015
     * @tc.name      Camera_CameraPipeline_0015
     * @tc.desc      pipeline scene=1 with animation branch 1 x3 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0015 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=3");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:9");
      expect(actual).assertEqual("ok:9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0016
     * @tc.name      Camera_CameraPipeline_0016
     * @tc.desc      pipeline scene=1 with animation branch 1 x4 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0016 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=4");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:12");
      expect(actual).assertEqual("ok:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0017
     * @tc.name      Camera_CameraPipeline_0017
     * @tc.desc      pipeline scene=1 with animation branch 1 x5 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0017 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=5");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:15");
      expect(actual).assertEqual("ok:15");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0018
     * @tc.name      Camera_CameraPipeline_0018
     * @tc.desc      pipeline scene=1 with animation branch 1 x6 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CameraPipeline_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CameraPipeline_0018 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=6");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:18");
      expect(actual).assertEqual("ok:18");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0019
     * @tc.name      Camera_CameraPipeline_0019
     * @tc.desc      pipeline scene=1 with animation branch 1 x7 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0019 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=7");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:21");
      expect(actual).assertEqual("ok:21");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0020
     * @tc.name      Camera_CameraPipeline_0020
     * @tc.desc      pipeline scene=1 with animation branch 1 x8 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0020 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=8");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:24");
      expect(actual).assertEqual("ok:24");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0021
     * @tc.name      Camera_CameraPipeline_0021
     * @tc.desc      pipeline scene=1 with animation branch 1 x9 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0021 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=9");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:27");
      expect(actual).assertEqual("ok:27");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0022
     * @tc.name      Camera_CameraPipeline_0022
     * @tc.desc      pipeline scene=1 with animation branch 1 x10 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0022 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=10");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:30");
      expect(actual).assertEqual("ok:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0023
     * @tc.name      Camera_CameraPipeline_0023
     * @tc.desc      pipeline scene=1 with animation branch 1 x11 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPipeline_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPipeline_0023 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      anim.onModeChange();
      logInfo("session scene=1 anim=1 round=11");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:33");
      expect(actual).assertEqual("ok:33");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0024
     * @tc.name      Camera_CameraPipeline_0024
     * @tc.desc      pipeline scene=2 with animation branch 2 x1 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0024 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=1");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:9");
      expect(actual).assertEqual("ok:9");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0025
     * @tc.name      Camera_CameraPipeline_0025
     * @tc.desc      pipeline scene=2 with animation branch 2 x2 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0025 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=2");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:18");
      expect(actual).assertEqual("ok:18");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0026
     * @tc.name      Camera_CameraPipeline_0026
     * @tc.desc      pipeline scene=2 with animation branch 2 x3 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0026 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=3");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:27");
      expect(actual).assertEqual("ok:27");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0027
     * @tc.name      Camera_CameraPipeline_0027
     * @tc.desc      pipeline scene=2 with animation branch 2 x4 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0027 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=4");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:36");
      expect(actual).assertEqual("ok:36");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0028
     * @tc.name      Camera_CameraPipeline_0028
     * @tc.desc      pipeline scene=2 with animation branch 2 x5 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0028 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=5");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:45");
      expect(actual).assertEqual("ok:45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0029
     * @tc.name      Camera_CameraPipeline_0029
     * @tc.desc      pipeline scene=2 with animation branch 2 x6 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0029 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=6");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:54");
      expect(actual).assertEqual("ok:54");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0030
     * @tc.name      Camera_CameraPipeline_0030
     * @tc.desc      pipeline scene=2 with animation branch 2 x7 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0030 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=7");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:63");
      expect(actual).assertEqual("ok:63");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0031
     * @tc.name      Camera_CameraPipeline_0031
     * @tc.desc      pipeline scene=2 with animation branch 2 x8 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0031 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=8");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:72");
      expect(actual).assertEqual("ok:72");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0032
     * @tc.name      Camera_CameraPipeline_0032
     * @tc.desc      pipeline scene=2 with animation branch 2 x9 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0032 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=9");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:81");
      expect(actual).assertEqual("ok:81");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0033
     * @tc.name      Camera_CameraPipeline_0033
     * @tc.desc      pipeline scene=2 with animation branch 2 x10 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0033 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=10");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:90");
      expect(actual).assertEqual("ok:90");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0034
     * @tc.name      Camera_CameraPipeline_0034
     * @tc.desc      pipeline scene=2 with animation branch 2 x11 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPipeline_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPipeline_0034 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=11");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:99");
      expect(actual).assertEqual("ok:99");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0035
     * @tc.name      Camera_CameraPipeline_0035
     * @tc.desc      pipeline scene=2 with animation branch 2 x12 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_CameraPipeline_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CameraPipeline_0035 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(2);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(true);
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      anim.onSwitchCamera();
      logInfo("session scene=2 anim=2 round=12");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:108");
      expect(actual).assertEqual("ok:108");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0036
     * @tc.name      Camera_CameraPipeline_0036
     * @tc.desc      pipeline scene=1 with animation branch 3 x1 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0036 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=1");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:6");
      expect(actual).assertEqual("ok:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0037
     * @tc.name      Camera_CameraPipeline_0037
     * @tc.desc      pipeline scene=1 with animation branch 3 x2 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0037 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=2");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:12");
      expect(actual).assertEqual("ok:12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0038
     * @tc.name      Camera_CameraPipeline_0038
     * @tc.desc      pipeline scene=1 with animation branch 3 x3 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0038 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=3");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:18");
      expect(actual).assertEqual("ok:18");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0039
     * @tc.name      Camera_CameraPipeline_0039
     * @tc.desc      pipeline scene=1 with animation branch 3 x4 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0039 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=4");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:24");
      expect(actual).assertEqual("ok:24");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0040
     * @tc.name      Camera_CameraPipeline_0040
     * @tc.desc      pipeline scene=1 with animation branch 3 x5 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0040 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=5");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:30");
      expect(actual).assertEqual("ok:30");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0041
     * @tc.name      Camera_CameraPipeline_0041
     * @tc.desc      pipeline scene=1 with animation branch 3 x6 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0041 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=6");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:36");
      expect(actual).assertEqual("ok:36");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0042
     * @tc.name      Camera_CameraPipeline_0042
     * @tc.desc      pipeline scene=1 with animation branch 3 x7 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0042 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=7");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:42");
      expect(actual).assertEqual("ok:42");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0043
     * @tc.name      Camera_CameraPipeline_0043
     * @tc.desc      pipeline scene=1 with animation branch 3 x8 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0043 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=8");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:48");
      expect(actual).assertEqual("ok:48");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0044
     * @tc.name      Camera_CameraPipeline_0044
     * @tc.desc      pipeline scene=1 with animation branch 3 x9 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0044 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=9");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:54");
      expect(actual).assertEqual("ok:54");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0045
     * @tc.name      Camera_CameraPipeline_0045
     * @tc.desc      pipeline scene=1 with animation branch 3 x10 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_CameraPipeline_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CameraPipeline_0045 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=10");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:60");
      expect(actual).assertEqual("ok:60");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CAMERA_PIPELINE_0046
     * @tc.name      Camera_CameraPipeline_0046
     * @tc.desc      pipeline scene=1 with animation branch 3 x11 keeps session and animation state consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_CameraPipeline_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CameraPipeline_0046 begin`);
      const session: CameraSessionModel = new CameraSessionModel();
      session.setSceneMode(1);
      session.init(true, 2, 0, true, true);
      const anim: AnimateModel = new AnimateModel(false);
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      anim.onCaptureClick();
      anim.onFrameStart();
      logInfo("session scene=1 anim=3 round=11");
      const actual: string = session.init(true, 2, 0, true, true).toString() + ':' + anim.stepCount();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:66");
      expect(actual).assertEqual("ok:66");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}CameraPipeline_0046 end`);
    });
  });
}
