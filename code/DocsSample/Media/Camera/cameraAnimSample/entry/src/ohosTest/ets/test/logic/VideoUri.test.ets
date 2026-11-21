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
      logInfo("videoUriOf(\"fd://3\")");
      const actual: string = videoUriOf("fd://3");
      logInfo('actual=' + String(actual) + ', expected=' + "file://fd://3");
      expect(actual).assertEqual("file://fd://3");
      logInfo(`${BUNDLE}VideoUri_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0009
     * @tc.name      Camera_VideoUri_0009
     * @tc.desc      videoUriOf("1") prefixes the file scheme -> "file://1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0009 begin`);
      logInfo("videoUriOf(\"1\")");
      const actual: string = videoUriOf("1");
      logInfo('actual=' + String(actual) + ', expected=' + "file://1");
      expect(actual).assertEqual("file://1");
      logInfo(`${BUNDLE}VideoUri_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0010
     * @tc.name      Camera_VideoUri_0010
     * @tc.desc      videoUriOf("0") prefixes the file scheme -> "file://0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0010 begin`);
      logInfo("videoUriOf(\"0\")");
      const actual: string = videoUriOf("0");
      logInfo('actual=' + String(actual) + ', expected=' + "file://0");
      expect(actual).assertEqual("file://0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0011
     * @tc.name      Camera_VideoUri_0011
     * @tc.desc      videoUriOf("../a.mp4") prefixes the file scheme -> "file://../a.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0011 begin`);
      logInfo("videoUriOf(\"../a.mp4\")");
      const actual: string = videoUriOf("../a.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://../a.mp4");
      expect(actual).assertEqual("file://../a.mp4");
      logInfo(`${BUNDLE}VideoUri_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0012
     * @tc.name      Camera_VideoUri_0012
     * @tc.desc      videoUriOf("C:/a/b.mp4") prefixes the file scheme -> "file://C:/a/b.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoUri_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoUri_0012 begin`);
      logInfo("videoUriOf(\"C:/a/b.mp4\")");
      const actual: string = videoUriOf("C:/a/b.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://C:/a/b.mp4");
      expect(actual).assertEqual("file://C:/a/b.mp4");
      logInfo(`${BUNDLE}VideoUri_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0013
     * @tc.name      Camera_VideoUri_0013
     * @tc.desc      videoUriOf("a/b/c/d.mp4") prefixes the file scheme -> "file://a/b/c/d.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0013 begin`);
      logInfo("videoUriOf(\"a/b/c/d.mp4\")");
      const actual: string = videoUriOf("a/b/c/d.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://a/b/c/d.mp4");
      expect(actual).assertEqual("file://a/b/c/d.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0014
     * @tc.name      Camera_VideoUri_0014
     * @tc.desc      videoUriOf("x") prefixes the file scheme -> "file://x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0014 begin`);
      logInfo("videoUriOf(\"x\")");
      const actual: string = videoUriOf("x");
      logInfo('actual=' + String(actual) + ', expected=' + "file://x");
      expect(actual).assertEqual("file://x");
      logInfo(`${BUNDLE}VideoUri_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0015
     * @tc.name      Camera_VideoUri_0015
     * @tc.desc      videoUriOf("x.mp4.mp4") prefixes the file scheme -> "file://x.mp4.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0015 begin`);
      logInfo("videoUriOf(\"x.mp4.mp4\")");
      const actual: string = videoUriOf("x.mp4.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://x.mp4.mp4");
      expect(actual).assertEqual("file://x.mp4.mp4");
      logInfo(`${BUNDLE}VideoUri_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0016
     * @tc.name      Camera_VideoUri_0016
     * @tc.desc      videoUriOf("video_2026_01_01.mp4") prefixes the file scheme -> "file://video_2026_01_01.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0016 begin`);
      logInfo("videoUriOf(\"video_2026_01_01.mp4\")");
      const actual: string = videoUriOf("video_2026_01_01.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://video_2026_01_01.mp4");
      expect(actual).assertEqual("file://video_2026_01_01.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0017
     * @tc.name      Camera_VideoUri_0017
     * @tc.desc      videoUriOf(" space.mp4") prefixes the file scheme -> "file:// space.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0017 begin`);
      logInfo("videoUriOf(\" space.mp4\")");
      const actual: string = videoUriOf(" space.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file:// space.mp4");
      expect(actual).assertEqual("file:// space.mp4");
      logInfo(`${BUNDLE}VideoUri_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0018
     * @tc.name      Camera_VideoUri_0018
     * @tc.desc      videoUriOf("a-b_c.mp4") prefixes the file scheme -> "file://a-b_c.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_VideoUri_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VideoUri_0018 begin`);
      logInfo("videoUriOf(\"a-b_c.mp4\")");
      const actual: string = videoUriOf("a-b_c.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://a-b_c.mp4");
      expect(actual).assertEqual("file://a-b_c.mp4");
      logInfo(`${BUNDLE}VideoUri_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0019
     * @tc.name      Camera_VideoUri_0019
     * @tc.desc      videoUriOf("VID_0001.MP4") prefixes the file scheme -> "file://VID_0001.MP4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0019 begin`);
      logInfo("videoUriOf(\"VID_0001.MP4\")");
      const actual: string = videoUriOf("VID_0001.MP4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://VID_0001.MP4");
      expect(actual).assertEqual("file://VID_0001.MP4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0020
     * @tc.name      Camera_VideoUri_0020
     * @tc.desc      videoUriOf("1.2.3.mp4") prefixes the file scheme -> "file://1.2.3.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0020 begin`);
      logInfo("videoUriOf(\"1.2.3.mp4\")");
      const actual: string = videoUriOf("1.2.3.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://1.2.3.mp4");
      expect(actual).assertEqual("file://1.2.3.mp4");
      logInfo(`${BUNDLE}VideoUri_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0021
     * @tc.name      Camera_VideoUri_0021
     * @tc.desc      videoUriOf("aaaaaaaaaaaaaaaa.mp4") prefixes the file scheme -> "file://aaaaaaaaaaaaaaaa.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0021 begin`);
      logInfo("videoUriOf(\"aaaaaaaaaaaaaaaa.mp4\")");
      const actual: string = videoUriOf("aaaaaaaaaaaaaaaa.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://aaaaaaaaaaaaaaaa.mp4");
      expect(actual).assertEqual("file://aaaaaaaaaaaaaaaa.mp4");
      logInfo(`${BUNDLE}VideoUri_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0022
     * @tc.name      Camera_VideoUri_0022
     * @tc.desc      videoUriOf("b") prefixes the file scheme -> "file://b".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0022 begin`);
      logInfo("videoUriOf(\"b\")");
      const actual: string = videoUriOf("b");
      logInfo('actual=' + String(actual) + ', expected=' + "file://b");
      expect(actual).assertEqual("file://b");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0023
     * @tc.name      Camera_VideoUri_0023
     * @tc.desc      videoUriOf("c.mp4") prefixes the file scheme -> "file://c.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoUri_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoUri_0023 begin`);
      logInfo("videoUriOf(\"c.mp4\")");
      const actual: string = videoUriOf("c.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://c.mp4");
      expect(actual).assertEqual("file://c.mp4");
      logInfo(`${BUNDLE}VideoUri_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0024
     * @tc.name      Camera_VideoUri_0024
     * @tc.desc      videoUriOf("/") prefixes the file scheme -> "file:///".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0024 begin`);
      logInfo("videoUriOf(\"/\")");
      const actual: string = videoUriOf("/");
      logInfo('actual=' + String(actual) + ', expected=' + "file:///");
      expect(actual).assertEqual("file:///");
      logInfo(`${BUNDLE}VideoUri_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0025
     * @tc.name      Camera_VideoUri_0025
     * @tc.desc      videoUriOf("/data") prefixes the file scheme -> "file:///data".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0025 begin`);
      logInfo("videoUriOf(\"/data\")");
      const actual: string = videoUriOf("/data");
      logInfo('actual=' + String(actual) + ', expected=' + "file:///data");
      expect(actual).assertEqual("file:///data");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0026
     * @tc.name      Camera_VideoUri_0026
     * @tc.desc      videoUriOf("/data/storage") prefixes the file scheme -> "file:///data/storage".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0026 begin`);
      logInfo("videoUriOf(\"/data/storage\")");
      const actual: string = videoUriOf("/data/storage");
      logInfo('actual=' + String(actual) + ', expected=' + "file:///data/storage");
      expect(actual).assertEqual("file:///data/storage");
      logInfo(`${BUNDLE}VideoUri_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0027
     * @tc.name      Camera_VideoUri_0027
     * @tc.desc      videoUriOf("el2/base/files/a.mp4") prefixes the file scheme -> "file://el2/base/files/a.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0027 begin`);
      logInfo("videoUriOf(\"el2/base/files/a.mp4\")");
      const actual: string = videoUriOf("el2/base/files/a.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://el2/base/files/a.mp4");
      expect(actual).assertEqual("file://el2/base/files/a.mp4");
      logInfo(`${BUNDLE}VideoUri_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0028
     * @tc.name      Camera_VideoUri_0028
     * @tc.desc      videoUriOf("x/y") prefixes the file scheme -> "file://x/y".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0028 begin`);
      logInfo("videoUriOf(\"x/y\")");
      const actual: string = videoUriOf("x/y");
      logInfo('actual=' + String(actual) + ', expected=' + "file://x/y");
      expect(actual).assertEqual("file://x/y");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0029
     * @tc.name      Camera_VideoUri_0029
     * @tc.desc      videoUriOf("x/y/z") prefixes the file scheme -> "file://x/y/z".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0029 begin`);
      logInfo("videoUriOf(\"x/y/z\")");
      const actual: string = videoUriOf("x/y/z");
      logInfo('actual=' + String(actual) + ', expected=' + "file://x/y/z");
      expect(actual).assertEqual("file://x/y/z");
      logInfo(`${BUNDLE}VideoUri_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0030
     * @tc.name      Camera_VideoUri_0030
     * @tc.desc      videoUriOf("deep/path/to/file.mp4") prefixes the file scheme -> "file://deep/path/to/file.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0030 begin`);
      logInfo("videoUriOf(\"deep/path/to/file.mp4\")");
      const actual: string = videoUriOf("deep/path/to/file.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://deep/path/to/file.mp4");
      expect(actual).assertEqual("file://deep/path/to/file.mp4");
      logInfo(`${BUNDLE}VideoUri_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0031
     * @tc.name      Camera_VideoUri_0031
     * @tc.desc      videoUriOf("another file name.mp4") prefixes the file scheme -> "file://another file name.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0031 begin`);
      logInfo("videoUriOf(\"another file name.mp4\")");
      const actual: string = videoUriOf("another file name.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://another file name.mp4");
      expect(actual).assertEqual("file://another file name.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0032
     * @tc.name      Camera_VideoUri_0032
     * @tc.desc      videoUriOf("UPPER.MP4") prefixes the file scheme -> "file://UPPER.MP4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0032 begin`);
      logInfo("videoUriOf(\"UPPER.MP4\")");
      const actual: string = videoUriOf("UPPER.MP4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://UPPER.MP4");
      expect(actual).assertEqual("file://UPPER.MP4");
      logInfo(`${BUNDLE}VideoUri_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0033
     * @tc.name      Camera_VideoUri_0033
     * @tc.desc      videoUriOf("lower.mp4") prefixes the file scheme -> "file://lower.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0033 begin`);
      logInfo("videoUriOf(\"lower.mp4\")");
      const actual: string = videoUriOf("lower.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://lower.mp4");
      expect(actual).assertEqual("file://lower.mp4");
      logInfo(`${BUNDLE}VideoUri_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0034
     * @tc.name      Camera_VideoUri_0034
     * @tc.desc      videoUriOf("mix.Ed.mp4") prefixes the file scheme -> "file://mix.Ed.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_VideoUri_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VideoUri_0034 begin`);
      logInfo("videoUriOf(\"mix.Ed.mp4\")");
      const actual: string = videoUriOf("mix.Ed.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://mix.Ed.mp4");
      expect(actual).assertEqual("file://mix.Ed.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0035
     * @tc.name      Camera_VideoUri_0035
     * @tc.desc      videoUriOf("中文 空格.mp4") prefixes the file scheme -> "file://中文 空格.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_VideoUri_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VideoUri_0035 begin`);
      logInfo("videoUriOf(\"中文 空格.mp4\")");
      const actual: string = videoUriOf("中文 空格.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://中文 空格.mp4");
      expect(actual).assertEqual("file://中文 空格.mp4");
      logInfo(`${BUNDLE}VideoUri_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0036
     * @tc.name      Camera_VideoUri_0036
     * @tc.desc      videoUriOf("-") prefixes the file scheme -> "file://-".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0036 begin`);
      logInfo("videoUriOf(\"-\")");
      const actual: string = videoUriOf("-");
      logInfo('actual=' + String(actual) + ', expected=' + "file://-");
      expect(actual).assertEqual("file://-");
      logInfo(`${BUNDLE}VideoUri_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0037
     * @tc.name      Camera_VideoUri_0037
     * @tc.desc      videoUriOf("--") prefixes the file scheme -> "file://--".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0037 begin`);
      logInfo("videoUriOf(\"--\")");
      const actual: string = videoUriOf("--");
      logInfo('actual=' + String(actual) + ', expected=' + "file://--");
      expect(actual).assertEqual("file://--");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0038
     * @tc.name      Camera_VideoUri_0038
     * @tc.desc      videoUriOf("...") prefixes the file scheme -> "file://...".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0038 begin`);
      logInfo("videoUriOf(\"...\")");
      const actual: string = videoUriOf("...");
      logInfo('actual=' + String(actual) + ', expected=' + "file://...");
      expect(actual).assertEqual("file://...");
      logInfo(`${BUNDLE}VideoUri_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0039
     * @tc.name      Camera_VideoUri_0039
     * @tc.desc      videoUriOf("a..b.mp4") prefixes the file scheme -> "file://a..b.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0039 begin`);
      logInfo("videoUriOf(\"a..b.mp4\")");
      const actual: string = videoUriOf("a..b.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://a..b.mp4");
      expect(actual).assertEqual("file://a..b.mp4");
      logInfo(`${BUNDLE}VideoUri_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0040
     * @tc.name      Camera_VideoUri_0040
     * @tc.desc      videoUriOf("0123456789.mp4") prefixes the file scheme -> "file://0123456789.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0040 begin`);
      logInfo("videoUriOf(\"0123456789.mp4\")");
      const actual: string = videoUriOf("0123456789.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://0123456789.mp4");
      expect(actual).assertEqual("file://0123456789.mp4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VideoUri_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_VIDEO_URI_0041
     * @tc.name      Camera_VideoUri_0041
     * @tc.desc      videoUriOf("file://already.mp4") prefixes the file scheme -> "file://file://already.mp4".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_VideoUri_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VideoUri_0041 begin`);
      logInfo("videoUriOf(\"file://already.mp4\")");
      const actual: string = videoUriOf("file://already.mp4");
      logInfo('actual=' + String(actual) + ', expected=' + "file://file://already.mp4");
      expect(actual).assertEqual("file://file://already.mp4");
      logInfo(`${BUNDLE}VideoUri_0041 end`);
    });
  });
}
