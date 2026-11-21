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
  selectProfileForPreviewAndVideo,
  Profile,
  SCENE_NORMAL_PHOTO,
  SCENE_NORMAL_VIDEO,
} from '../model/ResolutionLogic';

/** ProfileSelectionFlowTest logic checks (10 cases). */
export default function profileSelectionFlowTest(): void {
  describe('ProfileSelectionFlowTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0001
     * @tc.name      Resolution_ProfileFlow_0001
     * @tc.desc      selectProfileForPreviewAndVideo scene=2 resolves to video-not-support.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileFlow_0001 begin`);
      const videos: Array<Profile> = [
      ];
      const previews: Array<Profile> = [
      ];
      logInfo("select profiles scene=2 videos=0 previews=0");
      const actual: string = selectProfileForPreviewAndVideo(2, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "video-not-support");
      expect(actual).assertEqual("video-not-support");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0002
     * @tc.name      Resolution_ProfileFlow_0002
     * @tc.desc      selectProfileForPreviewAndVideo scene=1 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0002 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=1 videos=3 previews=2");
      const actual: string = selectProfileForPreviewAndVideo(1, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0003
     * @tc.name      Resolution_ProfileFlow_0003
     * @tc.desc      selectProfileForPreviewAndVideo scene=2 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0003 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=2 videos=1 previews=4");
      const actual: string = selectProfileForPreviewAndVideo(2, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0004
     * @tc.name      Resolution_ProfileFlow_0004
     * @tc.desc      selectProfileForPreviewAndVideo scene=1 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0004 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=1 videos=4 previews=1");
      const actual: string = selectProfileForPreviewAndVideo(1, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0005
     * @tc.name      Resolution_ProfileFlow_0005
     * @tc.desc      selectProfileForPreviewAndVideo scene=2 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0005 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=2 videos=2 previews=3");
      const actual: string = selectProfileForPreviewAndVideo(2, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0006
     * @tc.name      Resolution_ProfileFlow_0006
     * @tc.desc      selectProfileForPreviewAndVideo scene=1 resolves to preview-not-support.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0006 begin`);
      const videos: Array<Profile> = [
      ];
      const previews: Array<Profile> = [
      ];
      logInfo("select profiles scene=1 videos=0 previews=0");
      const actual: string = selectProfileForPreviewAndVideo(1, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "preview-not-support");
      expect(actual).assertEqual("preview-not-support");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0007
     * @tc.name      Resolution_ProfileFlow_0007
     * @tc.desc      selectProfileForPreviewAndVideo scene=2 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0007 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=2 videos=3 previews=2");
      const actual: string = selectProfileForPreviewAndVideo(2, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0008
     * @tc.name      Resolution_ProfileFlow_0008
     * @tc.desc      selectProfileForPreviewAndVideo scene=1 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0008 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=1 videos=1 previews=4");
      const actual: string = selectProfileForPreviewAndVideo(1, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0009
     * @tc.name      Resolution_ProfileFlow_0009
     * @tc.desc      selectProfileForPreviewAndVideo scene=2 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0009 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=2 videos=4 previews=1");
      const actual: string = selectProfileForPreviewAndVideo(2, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_FLOW_0010
     * @tc.name      Resolution_ProfileFlow_0010
     * @tc.desc      selectProfileForPreviewAndVideo scene=1 resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ProfileFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProfileFlow_0010 begin`);
      const videos: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      const previews: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("select profiles scene=1 videos=2 previews=3");
      const actual: string = selectProfileForPreviewAndVideo(1, videos, previews, 1280, 720).status;
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileFlow_0010 end`);
    });
  });
}
