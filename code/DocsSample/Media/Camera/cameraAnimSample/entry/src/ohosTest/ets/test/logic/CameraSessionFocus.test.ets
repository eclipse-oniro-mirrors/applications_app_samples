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
} from '../model/CameraLogic';

/** CameraSessionFocusTest logic checks (46 cases). */
export default function cameraSessionFocusTest(): void {
  describe('CameraSessionFocusTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0001
     * @tc.name      Camera_SessionFocus_0001
     * @tc.desc      setFocus(0, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFocus_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFocus_0001 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0, 1)");
      const actual: string = subject.setFocus(0, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0,1");
      expect(actual).assertEqual("0,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0002
     * @tc.name      Camera_SessionFocus_0002
     * @tc.desc      setFocus(0.1, 0.89) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0002 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.1, 0.89)");
      const actual: string = subject.setFocus(0.1, 0.89);
      logInfo('actual=' + String(actual) + ', expected=' + "0.1,0.89");
      expect(actual).assertEqual("0.1,0.89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0003
     * @tc.name      Camera_SessionFocus_0003
     * @tc.desc      setFocus(0.2, 0.78) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0003 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.2, 0.78)");
      const actual: string = subject.setFocus(0.2, 0.78);
      logInfo('actual=' + String(actual) + ', expected=' + "0.2,0.78");
      expect(actual).assertEqual("0.2,0.78");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0004
     * @tc.name      Camera_SessionFocus_0004
     * @tc.desc      setFocus(0.3, 0.67) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0004 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.3, 0.67)");
      const actual: string = subject.setFocus(0.3, 0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.3,0.67");
      expect(actual).assertEqual("0.3,0.67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0005
     * @tc.name      Camera_SessionFocus_0005
     * @tc.desc      setFocus(0.4, 0.56) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0005 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.4, 0.56)");
      const actual: string = subject.setFocus(0.4, 0.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.4,0.56");
      expect(actual).assertEqual("0.4,0.56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0006
     * @tc.name      Camera_SessionFocus_0006
     * @tc.desc      setFocus(0.415, 0.45) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0006 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.415, 0.45)");
      const actual: string = subject.setFocus(0.415, 0.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.415,0.45");
      expect(actual).assertEqual("0.415,0.45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0007
     * @tc.name      Camera_SessionFocus_0007
     * @tc.desc      setFocus(0.515, 0.34) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0007 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.515, 0.34)");
      const actual: string = subject.setFocus(0.515, 0.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.515,0.34");
      expect(actual).assertEqual("0.515,0.34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0008
     * @tc.name      Camera_SessionFocus_0008
     * @tc.desc      setFocus(0.615, 0.23) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0008 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.615, 0.23)");
      const actual: string = subject.setFocus(0.615, 0.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.615,0.23");
      expect(actual).assertEqual("0.615,0.23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0009
     * @tc.name      Camera_SessionFocus_0009
     * @tc.desc      setFocus(0.715, 0.12) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0009 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.715, 0.12)");
      const actual: string = subject.setFocus(0.715, 0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.715,0.12");
      expect(actual).assertEqual("0.715,0.12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0010
     * @tc.name      Camera_SessionFocus_0010
     * @tc.desc      setFocus(0.815, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0010 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.815, 1)");
      const actual: string = subject.setFocus(0.815, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.815,1");
