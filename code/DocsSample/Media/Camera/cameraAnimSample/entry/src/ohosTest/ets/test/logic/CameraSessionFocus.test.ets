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
      expect(actual).assertEqual("0.815,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0011
     * @tc.name      Camera_SessionFocus_0011
     * @tc.desc      setFocus(0.83, 0.89) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0011 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.83, 0.89)");
      const actual: string = subject.setFocus(0.83, 0.89);
      logInfo('actual=' + String(actual) + ', expected=' + "0.83,0.89");
      expect(actual).assertEqual("0.83,0.89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0012
     * @tc.name      Camera_SessionFocus_0012
     * @tc.desc      setFocus(0.93, 0.78) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFocus_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFocus_0012 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.93, 0.78)");
      const actual: string = subject.setFocus(0.93, 0.78);
      logInfo('actual=' + String(actual) + ', expected=' + "0.93,0.78");
      expect(actual).assertEqual("0.93,0.78");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0013
     * @tc.name      Camera_SessionFocus_0013
     * @tc.desc      setFocus(0.034, 0.67) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0013 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.034, 0.67)");
      const actual: string = subject.setFocus(0.034, 0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.034,0.67");
      expect(actual).assertEqual("0.034,0.67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0014
     * @tc.name      Camera_SessionFocus_0014
     * @tc.desc      setFocus(0.134, 0.56) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0014 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.134, 0.56)");
      const actual: string = subject.setFocus(0.134, 0.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.134,0.56");
      expect(actual).assertEqual("0.134,0.56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0015
     * @tc.name      Camera_SessionFocus_0015
     * @tc.desc      setFocus(0.234, 0.45) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0015 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.234, 0.45)");
      const actual: string = subject.setFocus(0.234, 0.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.234,0.45");
      expect(actual).assertEqual("0.234,0.45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0016
     * @tc.name      Camera_SessionFocus_0016
     * @tc.desc      setFocus(0.249, 0.34) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0016 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.249, 0.34)");
      const actual: string = subject.setFocus(0.249, 0.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.249,0.34");
      expect(actual).assertEqual("0.249,0.34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0017
     * @tc.name      Camera_SessionFocus_0017
     * @tc.desc      setFocus(0.349, 0.23) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0017 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.349, 0.23)");
      const actual: string = subject.setFocus(0.349, 0.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.349,0.23");
      expect(actual).assertEqual("0.349,0.23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0018
     * @tc.name      Camera_SessionFocus_0018
     * @tc.desc      setFocus(0.449, 0.12) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionFocus_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionFocus_0018 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.449, 0.12)");
      const actual: string = subject.setFocus(0.449, 0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.449,0.12");
      expect(actual).assertEqual("0.449,0.12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0019
     * @tc.name      Camera_SessionFocus_0019
     * @tc.desc      setFocus(0.549, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0019 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.549, 1)");
      const actual: string = subject.setFocus(0.549, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.549,1");
      expect(actual).assertEqual("0.549,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0020
     * @tc.name      Camera_SessionFocus_0020
     * @tc.desc      setFocus(0.649, 0.89) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0020 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.649, 0.89)");
      const actual: string = subject.setFocus(0.649, 0.89);
      logInfo('actual=' + String(actual) + ', expected=' + "0.649,0.89");
      expect(actual).assertEqual("0.649,0.89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0021
     * @tc.name      Camera_SessionFocus_0021
     * @tc.desc      setFocus(0.664, 0.78) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0021 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.664, 0.78)");
      const actual: string = subject.setFocus(0.664, 0.78);
      logInfo('actual=' + String(actual) + ', expected=' + "0.664,0.78");
      expect(actual).assertEqual("0.664,0.78");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0022
     * @tc.name      Camera_SessionFocus_0022
     * @tc.desc      setFocus(0.764, 0.67) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0022 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.764, 0.67)");
      const actual: string = subject.setFocus(0.764, 0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.764,0.67");
      expect(actual).assertEqual("0.764,0.67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0023
     * @tc.name      Camera_SessionFocus_0023
     * @tc.desc      setFocus(0.864, 0.56) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFocus_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFocus_0023 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.864, 0.56)");
      const actual: string = subject.setFocus(0.864, 0.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.864,0.56");
      expect(actual).assertEqual("0.864,0.56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0024
     * @tc.name      Camera_SessionFocus_0024
     * @tc.desc      setFocus(0.964, 0.45) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0024 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.964, 0.45)");
      const actual: string = subject.setFocus(0.964, 0.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.964,0.45");
      expect(actual).assertEqual("0.964,0.45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0025
     * @tc.name      Camera_SessionFocus_0025
     * @tc.desc      setFocus(0.068, 0.34) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0025 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.068, 0.34)");
      const actual: string = subject.setFocus(0.068, 0.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.068,0.34");
      expect(actual).assertEqual("0.068,0.34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0026
     * @tc.name      Camera_SessionFocus_0026
     * @tc.desc      setFocus(0.083, 0.23) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0026 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.083, 0.23)");
      const actual: string = subject.setFocus(0.083, 0.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.083,0.23");
      expect(actual).assertEqual("0.083,0.23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0027
     * @tc.name      Camera_SessionFocus_0027
     * @tc.desc      setFocus(0.183, 0.12) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0027 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.183, 0.12)");
      const actual: string = subject.setFocus(0.183, 0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.183,0.12");
      expect(actual).assertEqual("0.183,0.12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0028
     * @tc.name      Camera_SessionFocus_0028
     * @tc.desc      setFocus(0.283, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0028 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.283, 1)");
      const actual: string = subject.setFocus(0.283, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.283,1");
      expect(actual).assertEqual("0.283,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0029
     * @tc.name      Camera_SessionFocus_0029
     * @tc.desc      setFocus(0.383, 0.89) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0029 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.383, 0.89)");
      const actual: string = subject.setFocus(0.383, 0.89);
      logInfo('actual=' + String(actual) + ', expected=' + "0.383,0.89");
      expect(actual).assertEqual("0.383,0.89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0030
     * @tc.name      Camera_SessionFocus_0030
     * @tc.desc      setFocus(0.483, 0.78) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0030 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.483, 0.78)");
      const actual: string = subject.setFocus(0.483, 0.78);
      logInfo('actual=' + String(actual) + ', expected=' + "0.483,0.78");
      expect(actual).assertEqual("0.483,0.78");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0031
     * @tc.name      Camera_SessionFocus_0031
     * @tc.desc      setFocus(0.498, 0.67) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0031 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.498, 0.67)");
      const actual: string = subject.setFocus(0.498, 0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.498,0.67");
      expect(actual).assertEqual("0.498,0.67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0032
     * @tc.name      Camera_SessionFocus_0032
     * @tc.desc      setFocus(0.598, 0.56) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0032 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.598, 0.56)");
      const actual: string = subject.setFocus(0.598, 0.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.598,0.56");
      expect(actual).assertEqual("0.598,0.56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0033
     * @tc.name      Camera_SessionFocus_0033
     * @tc.desc      setFocus(0.698, 0.45) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0033 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.698, 0.45)");
      const actual: string = subject.setFocus(0.698, 0.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.698,0.45");
      expect(actual).assertEqual("0.698,0.45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0034
     * @tc.name      Camera_SessionFocus_0034
     * @tc.desc      setFocus(0.798, 0.34) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFocus_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFocus_0034 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.798, 0.34)");
      const actual: string = subject.setFocus(0.798, 0.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.798,0.34");
      expect(actual).assertEqual("0.798,0.34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0035
     * @tc.name      Camera_SessionFocus_0035
     * @tc.desc      setFocus(0.898, 0.23) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_SessionFocus_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionFocus_0035 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.898, 0.23)");
      const actual: string = subject.setFocus(0.898, 0.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.898,0.23");
      expect(actual).assertEqual("0.898,0.23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0036
     * @tc.name      Camera_SessionFocus_0036
     * @tc.desc      setFocus(0.913, 0.12) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0036 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.913, 0.12)");
      const actual: string = subject.setFocus(0.913, 0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.913,0.12");
      expect(actual).assertEqual("0.913,0.12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0037
     * @tc.name      Camera_SessionFocus_0037
     * @tc.desc      setFocus(0.017, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0037 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.017, 1)");
      const actual: string = subject.setFocus(0.017, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.017,1");
      expect(actual).assertEqual("0.017,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0038
     * @tc.name      Camera_SessionFocus_0038
     * @tc.desc      setFocus(0.117, 0.89) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0038 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.117, 0.89)");
      const actual: string = subject.setFocus(0.117, 0.89);
      logInfo('actual=' + String(actual) + ', expected=' + "0.117,0.89");
      expect(actual).assertEqual("0.117,0.89");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0039
     * @tc.name      Camera_SessionFocus_0039
     * @tc.desc      setFocus(0.217, 0.78) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0039 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.217, 0.78)");
      const actual: string = subject.setFocus(0.217, 0.78);
      logInfo('actual=' + String(actual) + ', expected=' + "0.217,0.78");
      expect(actual).assertEqual("0.217,0.78");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0040
     * @tc.name      Camera_SessionFocus_0040
     * @tc.desc      setFocus(0.317, 0.67) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0040 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.317, 0.67)");
      const actual: string = subject.setFocus(0.317, 0.67);
      logInfo('actual=' + String(actual) + ', expected=' + "0.317,0.67");
      expect(actual).assertEqual("0.317,0.67");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0041
     * @tc.name      Camera_SessionFocus_0041
     * @tc.desc      setFocus(0.332, 0.56) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0041 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.332, 0.56)");
      const actual: string = subject.setFocus(0.332, 0.56);
      logInfo('actual=' + String(actual) + ', expected=' + "0.332,0.56");
      expect(actual).assertEqual("0.332,0.56");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0042
     * @tc.name      Camera_SessionFocus_0042
     * @tc.desc      setFocus(0.432, 0.45) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0042 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.432, 0.45)");
      const actual: string = subject.setFocus(0.432, 0.45);
      logInfo('actual=' + String(actual) + ', expected=' + "0.432,0.45");
      expect(actual).assertEqual("0.432,0.45");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0043
     * @tc.name      Camera_SessionFocus_0043
     * @tc.desc      setFocus(0.532, 0.34) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0043 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.532, 0.34)");
      const actual: string = subject.setFocus(0.532, 0.34);
      logInfo('actual=' + String(actual) + ', expected=' + "0.532,0.34");
      expect(actual).assertEqual("0.532,0.34");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0044
     * @tc.name      Camera_SessionFocus_0044
     * @tc.desc      setFocus(0.632, 0.23) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0044 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.632, 0.23)");
      const actual: string = subject.setFocus(0.632, 0.23);
      logInfo('actual=' + String(actual) + ', expected=' + "0.632,0.23");
      expect(actual).assertEqual("0.632,0.23");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0045
     * @tc.name      Camera_SessionFocus_0045
     * @tc.desc      setFocus(0.732, 0.12) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_SessionFocus_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionFocus_0045 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.732, 0.12)");
      const actual: string = subject.setFocus(0.732, 0.12);
      logInfo('actual=' + String(actual) + ', expected=' + "0.732,0.12");
      expect(actual).assertEqual("0.732,0.12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0045 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_SESSION_FOCUS_0046
     * @tc.name      Camera_SessionFocus_0046
     * @tc.desc      setFocus(0.747, 1) echoes the stored focus point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_SessionFocus_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionFocus_0046 begin`);
      const subject: CameraSessionModel = new CameraSessionModel();
      subject.init(true, 2, 0, true, true);
      logInfo("setFocus(0.747, 1)");
      const actual: string = subject.setFocus(0.747, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0.747,1");
      expect(actual).assertEqual("0.747,1");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SessionFocus_0046 end`);
    });
  });
}
