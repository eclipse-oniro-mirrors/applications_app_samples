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
  videoFrameAllowed,
} from '../model/CameraLogic';

/** VideoFrameAllowedTest logic checks (46 cases). */
export default function videoFrameAllowedTest(): void {
  describe('VideoFrameAllowedTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0001
     * @tc.name      Camera_VideoFrameAllowed_0001
     * @tc.desc      videoFrameAllowed(0, 0) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoFrameAllowed_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0001 begin`);
      logInfo("videoFrameAllowed(0, 0)");
      const actual: boolean = videoFrameAllowed(0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0002
     * @tc.name      Camera_VideoFrameAllowed_0002
     * @tc.desc      videoFrameAllowed(0, 24) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0002 begin`);
      logInfo("videoFrameAllowed(0, 24)");
      const actual: boolean = videoFrameAllowed(0, 24);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0003
     * @tc.name      Camera_VideoFrameAllowed_0003
     * @tc.desc      videoFrameAllowed(0, 30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0003 begin`);
      logInfo("videoFrameAllowed(0, 30)");
      const actual: boolean = videoFrameAllowed(0, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0004
     * @tc.name      Camera_VideoFrameAllowed_0004
     * @tc.desc      videoFrameAllowed(1, 1) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0004 begin`);
      logInfo("videoFrameAllowed(1, 1)");
      const actual: boolean = videoFrameAllowed(1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0005
     * @tc.name      Camera_VideoFrameAllowed_0005
     * @tc.desc      videoFrameAllowed(1, 30.5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0005 begin`);
      logInfo("videoFrameAllowed(1, 30.5)");
      const actual: boolean = videoFrameAllowed(1, 30.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0006
     * @tc.name      Camera_VideoFrameAllowed_0006
     * @tc.desc      videoFrameAllowed(15, 15) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0006 begin`);
      logInfo("videoFrameAllowed(15, 15)");
      const actual: boolean = videoFrameAllowed(15, 15);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0007
     * @tc.name      Camera_VideoFrameAllowed_0007
     * @tc.desc      videoFrameAllowed(15, 29) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0007 begin`);
      logInfo("videoFrameAllowed(15, 29)");
      const actual: boolean = videoFrameAllowed(15, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0008
     * @tc.name      Camera_VideoFrameAllowed_0008
     * @tc.desc      videoFrameAllowed(24, 24) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0008 begin`);
      logInfo("videoFrameAllowed(24, 24)");
      const actual: boolean = videoFrameAllowed(24, 24);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0009
     * @tc.name      Camera_VideoFrameAllowed_0009
     * @tc.desc      videoFrameAllowed(24, 30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0009 begin`);
      logInfo("videoFrameAllowed(24, 30)");
      const actual: boolean = videoFrameAllowed(24, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0010
     * @tc.name      Camera_VideoFrameAllowed_0010
     * @tc.desc      videoFrameAllowed(24, 45) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0010 begin`);
      logInfo("videoFrameAllowed(24, 45)");
      const actual: boolean = videoFrameAllowed(24, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0011
     * @tc.name      Camera_VideoFrameAllowed_0011
     * @tc.desc      videoFrameAllowed(25, 30.5) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0011 begin`);
      logInfo("videoFrameAllowed(25, 30.5)");
      const actual: boolean = videoFrameAllowed(25, 30.5);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0012
     * @tc.name      Camera_VideoFrameAllowed_0012
     * @tc.desc      videoFrameAllowed(25, 55) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoFrameAllowed_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0012 begin`);
      logInfo("videoFrameAllowed(25, 55)");
      const actual: boolean = videoFrameAllowed(25, 55);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0013
     * @tc.name      Camera_VideoFrameAllowed_0013
     * @tc.desc      videoFrameAllowed(29, 29) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0013 begin`);
      logInfo("videoFrameAllowed(29, 29)");
      const actual: boolean = videoFrameAllowed(29, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0014
     * @tc.name      Camera_VideoFrameAllowed_0014
     * @tc.desc      videoFrameAllowed(29, 31) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0014 begin`);
      logInfo("videoFrameAllowed(29, 31)");
      const actual: boolean = videoFrameAllowed(29, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0015
     * @tc.name      Camera_VideoFrameAllowed_0015
     * @tc.desc      videoFrameAllowed(30, 30) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0015 begin`);
      logInfo("videoFrameAllowed(30, 30)");
      const actual: boolean = videoFrameAllowed(30, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}VideoFrameAllowed_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0016
     * @tc.name      Camera_VideoFrameAllowed_0016
     * @tc.desc      videoFrameAllowed(30, 45) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoFrameAllowed_0016 begin`);
      logInfo("videoFrameAllowed(30, 45)");
      const actual: boolean = videoFrameAllowed(30, 45);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}VideoFrameAllowed_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_FRAME_ALLOWED_0017
     * @tc.name      Camera_VideoFrameAllowed_0017
     * @tc.desc      videoFrameAllowed(30, 59.9) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoFrameAllowed_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
