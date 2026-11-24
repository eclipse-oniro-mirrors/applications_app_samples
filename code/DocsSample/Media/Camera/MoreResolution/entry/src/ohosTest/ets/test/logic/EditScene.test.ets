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
  editUsesPhoto,
  editUsesVideo,
} from '../model/ResolutionLogic';

/** EditSceneTest logic checks (5 cases). */
export default function editSceneTest(): void {
  describe('EditSceneTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_SCENE_0001
     * @tc.name      Resolution_EditScene_0001
     * @tc.desc      edit scene -1 -> photo/video branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_EditScene_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}EditScene_0001 begin`);
      logInfo("editUsesPhoto(-1) + ':' + editUsesVideo(-1)");
      const actual: string = editUsesPhoto(-1) + ':' + editUsesVideo(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditScene_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_SCENE_0002
     * @tc.name      Resolution_EditScene_0002
     * @tc.desc      edit scene 0 -> photo/video branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditScene_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditScene_0002 begin`);
      logInfo("editUsesPhoto(0) + ':' + editUsesVideo(0)");
      const actual: string = editUsesPhoto(0) + ':' + editUsesVideo(0);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo(`${BUNDLE}EditScene_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_SCENE_0003
     * @tc.name      Resolution_EditScene_0003
     * @tc.desc      edit scene 1 -> photo/video branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditScene_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditScene_0003 begin`);
      logInfo("editUsesPhoto(1) + ':' + editUsesVideo(1)");
      const actual: string = editUsesPhoto(1) + ':' + editUsesVideo(1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}EditScene_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_SCENE_0004
     * @tc.name      Resolution_EditScene_0004
     * @tc.desc      edit scene 2 -> photo/video branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditScene_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditScene_0004 begin`);
      logInfo("editUsesPhoto(2) + ':' + editUsesVideo(2)");
      const actual: string = editUsesPhoto(2) + ':' + editUsesVideo(2);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}EditScene_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_EDIT_SCENE_0005
     * @tc.name      Resolution_EditScene_0005
     * @tc.desc      edit scene 3 -> photo/video branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_EditScene_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}EditScene_0005 begin`);
      logInfo("editUsesPhoto(3) + ':' + editUsesVideo(3)");
      const actual: string = editUsesPhoto(3) + ':' + editUsesVideo(3);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo(`${BUNDLE}EditScene_0005 end`);
    });
  });
}
