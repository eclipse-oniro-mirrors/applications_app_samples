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
  videoUriOf,
} from '../model/CameraLogic';

/** VideoUriTest logic checks (41 cases). */
export default function videoUriTest(): void {
  describe('VideoUriTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0001
     * @tc.name      Camera_VideoUri_0001
     * @tc.desc      videoUriOf("") prefixes the file scheme -> "file://".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoUri_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoUri_0001 begin`);
      logInfo("videoUriOf(\"\")");
      const actual: string = videoUriOf("");
      logInfo('actual=' + String(actual) + ', expected=' + "file://");
      expect(actual).assertEqual("file://");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0002
     * @tc.name      Camera_VideoUri_0002
     * @tc.desc      videoUriOf("a") prefixes the file scheme -> "file://a".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0002 begin`);
      logInfo("videoUriOf(\"a\")");
      const actual: string = videoUriOf("a");
      logInfo('actual=' + String(actual) + ', expected=' + "file://a");
      expect(actual).assertEqual("file://a");
      logInfo(`${BUNDLE}VideoUri_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0003
     * @tc.name      Camera_VideoUri_0003
     * @tc.desc      videoUriOf("tmp/a.mp4") prefixes the file scheme -> "file://tmp/a.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0003 begin`);
      logInfo("videoUriOf(\"tmp/a.mp4\")");
      const actual: string = videoUriOf("tmp/a.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://tmp/a.mp4");
      expect(actual).assertEqual("file://tmp/a.mp4");
      logInfo(`${BUNDLE}VideoUri_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0004
     * @tc.name      Camera_VideoUri_0004
     * @tc.desc      videoUriOf("/data/storage/el2/base/files/1.mp4") prefixes the file scheme -> "file:///data/storage/el2/base/files/1.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0004 begin`);
      logInfo("videoUriOf(\"/data/storage/el2/base/files/1.mp4\")");
      const actual: string = videoUriOf("/data/storage/el2/base/files/1.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file:///data/storage/el2/base/files/1.mp4");
      expect(actual).assertEqual("file:///data/storage/el2/base/files/1.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0005
     * @tc.name      Camera_VideoUri_0005
     * @tc.desc      videoUriOf("file.mp4") prefixes the file scheme -> "file://file.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0005 begin`);
      logInfo("videoUriOf(\"file.mp4\")");
      const actual: string = videoUriOf("file.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://file.mp4");
      expect(actual).assertEqual("file://file.mp4");
      logInfo(`${BUNDLE}VideoUri_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0006
     * @tc.name      Camera_VideoUri_0006
     * @tc.desc      videoUriOf("my video.mp4") prefixes the file scheme -> "file://my video.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0006 begin`);
      logInfo("videoUriOf(\"my video.mp4\")");
      const actual: string = videoUriOf("my video.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://my video.mp4");
      expect(actual).assertEqual("file://my video.mp4");
      logInfo(`${BUNDLE}VideoUri_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0007
     * @tc.name      Camera_VideoUri_0007
     * @tc.desc      videoUriOf("中文.mp4") prefixes the file scheme -> "file://中文.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0007 begin`);
      logInfo("videoUriOf(\"中文.mp4\")");
      const actual: string = videoUriOf("中文.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://中文.mp4");
      expect(actual).assertEqual("file://中文.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0008
     * @tc.name      Camera_VideoUri_0008
     * @tc.desc      videoUriOf("fd://3") prefixes the file scheme -> "file://fd://3".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0008 begin`);
