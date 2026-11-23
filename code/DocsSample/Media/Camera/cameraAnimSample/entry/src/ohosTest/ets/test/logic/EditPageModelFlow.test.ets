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
  EditPageModel,
} from '../model/CameraLogic';

/** EditPageModelFlowTest logic checks (46 cases). */
export default function editPageModelFlowTest(): void {
  describe('EditPageModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0001
     * @tc.name      Camera_EditPageModelFlow_0001
     * @tc.desc      video controls after 1 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditPageModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0001 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      logInfo("video click x1 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0002
     * @tc.name      Camera_EditPageModelFlow_0002
     * @tc.desc      video controls after 1 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0002 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.back();
      logInfo("video click x1 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0003
     * @tc.name      Camera_EditPageModelFlow_0003
     * @tc.desc      video controls after 1 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0003 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x1 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0004
     * @tc.name      Camera_EditPageModelFlow_0004
     * @tc.desc      video controls after 1 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0004 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x1 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0005
     * @tc.name      Camera_EditPageModelFlow_0005
     * @tc.desc      video controls after 1 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0005 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      logInfo("video click x1 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0006
     * @tc.name      Camera_EditPageModelFlow_0006
     * @tc.desc      video controls after 1 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0006 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.back();
      logInfo("video click x1 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0007
     * @tc.name      Camera_EditPageModelFlow_0007
     * @tc.desc      video controls after 1 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0007 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x1 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0008
     * @tc.name      Camera_EditPageModelFlow_0008
     * @tc.desc      video controls after 1 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0008 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://1', 'files/1.mp4');
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x1 scene=2 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0009
     * @tc.name      Camera_EditPageModelFlow_0009
     * @tc.desc      video controls after 2 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0009 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x2 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0010
     * @tc.name      Camera_EditPageModelFlow_0010
     * @tc.desc      video controls after 2 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0010 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x2 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0011
     * @tc.name      Camera_EditPageModelFlow_0011
     * @tc.desc      video controls after 2 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0011 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x2 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0012
     * @tc.name      Camera_EditPageModelFlow_0012
     * @tc.desc      video controls after 2 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditPageModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0012 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x2 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0013
     * @tc.name      Camera_EditPageModelFlow_0013
     * @tc.desc      video controls after 2 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0013 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x2 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0014
     * @tc.name      Camera_EditPageModelFlow_0014
     * @tc.desc      video controls after 2 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0014 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x2 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0015
     * @tc.name      Camera_EditPageModelFlow_0015
     * @tc.desc      video controls after 2 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0015 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x2 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0016
     * @tc.name      Camera_EditPageModelFlow_0016
     * @tc.desc      video controls after 2 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0016 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://2', 'files/2.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x2 scene=2 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0017
     * @tc.name      Camera_EditPageModelFlow_0017
     * @tc.desc      video controls after 3 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0017 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x3 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0018
     * @tc.name      Camera_EditPageModelFlow_0018
     * @tc.desc      video controls after 3 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EditPageModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0018 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x3 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0019
     * @tc.name      Camera_EditPageModelFlow_0019
     * @tc.desc      video controls after 3 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0019 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x3 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0020
     * @tc.name      Camera_EditPageModelFlow_0020
     * @tc.desc      video controls after 3 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0020 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x3 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0021
     * @tc.name      Camera_EditPageModelFlow_0021
     * @tc.desc      video controls after 3 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0021 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x3 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0022
     * @tc.name      Camera_EditPageModelFlow_0022
     * @tc.desc      video controls after 3 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0022 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x3 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0023
     * @tc.name      Camera_EditPageModelFlow_0023
     * @tc.desc      video controls after 3 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditPageModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0023 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://3', 'files/3.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x3 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0024
     * @tc.name      Camera_EditPageModelFlow_0024
     * @tc.desc      video controls after 4 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0024 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x4 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0025
     * @tc.name      Camera_EditPageModelFlow_0025
     * @tc.desc      video controls after 4 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0025 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x4 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0026
     * @tc.name      Camera_EditPageModelFlow_0026
     * @tc.desc      video controls after 4 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0026 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x4 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0027
     * @tc.name      Camera_EditPageModelFlow_0027
     * @tc.desc      video controls after 4 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0027 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x4 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0028
     * @tc.name      Camera_EditPageModelFlow_0028
     * @tc.desc      video controls after 4 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0028 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x4 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0029
     * @tc.name      Camera_EditPageModelFlow_0029
     * @tc.desc      video controls after 4 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0029 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x4 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0030
     * @tc.name      Camera_EditPageModelFlow_0030
     * @tc.desc      video controls after 4 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0030 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x4 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0031
     * @tc.name      Camera_EditPageModelFlow_0031
     * @tc.desc      video controls after 4 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0031 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://4', 'files/4.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x4 scene=2 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0032
     * @tc.name      Camera_EditPageModelFlow_0032
     * @tc.desc      video controls after 5 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0032 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x5 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0033
     * @tc.name      Camera_EditPageModelFlow_0033
     * @tc.desc      video controls after 5 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0033 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x5 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0034
     * @tc.name      Camera_EditPageModelFlow_0034
     * @tc.desc      video controls after 5 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditPageModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0034 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x5 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0035
     * @tc.name      Camera_EditPageModelFlow_0035
     * @tc.desc      video controls after 5 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_EditPageModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0035 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x5 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0036
     * @tc.name      Camera_EditPageModelFlow_0036
     * @tc.desc      video controls after 5 clicks (finish=false, back=false) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0036 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x5 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:0");
      expect(actual).assertEqual("false:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0037
     * @tc.name      Camera_EditPageModelFlow_0037
     * @tc.desc      video controls after 5 clicks (finish=false, back=true) are false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0037 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x5 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "false:1");
      expect(actual).assertEqual("false:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0038
     * @tc.name      Camera_EditPageModelFlow_0038
     * @tc.desc      video controls after 5 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0038 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x5 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0039
     * @tc.name      Camera_EditPageModelFlow_0039
     * @tc.desc      video controls after 5 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0039 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://5', 'files/5.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x5 scene=2 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0040
     * @tc.name      Camera_EditPageModelFlow_0040
     * @tc.desc      video controls after 6 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0040 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x6 scene=1 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0041
     * @tc.name      Camera_EditPageModelFlow_0041
     * @tc.desc      video controls after 6 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0041 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x6 scene=1 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0042
     * @tc.name      Camera_EditPageModelFlow_0042
     * @tc.desc      video controls after 6 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0042 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x6 scene=1 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0043
     * @tc.name      Camera_EditPageModelFlow_0043
     * @tc.desc      video controls after 6 clicks (finish=true, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0043 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(1, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      subject.back();
      logInfo("video click x6 scene=1 finish=true back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0044
     * @tc.name      Camera_EditPageModelFlow_0044
     * @tc.desc      video controls after 6 clicks (finish=false, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0044 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      logInfo("video click x6 scene=2 finish=false back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0045
     * @tc.name      Camera_EditPageModelFlow_0045
     * @tc.desc      video controls after 6 clicks (finish=false, back=true) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_EditPageModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0045 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.back();
      logInfo("video click x6 scene=2 finish=false back=true");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:1");
      expect(actual).assertEqual("true:1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_EDIT_MODEL_FLOW_0046
     * @tc.name      Camera_EditPageModelFlow_0046
     * @tc.desc      video controls after 6 clicks (finish=true, back=false) are true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_EditPageModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditPageModelFlow_0046 begin`);
      const subject: EditPageModel = new EditPageModel();
      subject.appear(2, 'photo://6', 'files/6.mp4');
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.clickVideo();
      subject.onFinish();
      logInfo("video click x6 scene=2 finish=true back=false");
      const actual: string = subject.controls() + ':' + subject.backCount();
      logInfo('actual=' + String(actual) + ', expected=' + "true:0");
      expect(actual).assertEqual("true:0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditPageModelFlow_0046 end`);
    });
  });
}
