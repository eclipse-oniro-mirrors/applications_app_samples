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
  canStartVideo,
  canStopVideo,
} from '../model/ResolutionLogic';

/** RecordingGuardTest logic checks (4 cases). */
export default function recordingGuardTest(): void {
  describe('RecordingGuardTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_RECORD_GUARD_0001
     * @tc.name      Resolution_RecordGuard_0001
     * @tc.desc      recording guard for recording=true, hasVideo=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_RecordGuard_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RecordGuard_0001 begin`);
      logInfo("canStartVideo(true, true) + ':' + canStopVideo(true)");
      const actual: string = canStartVideo(true, true) + ':' + canStopVideo(true);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RecordGuard_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RECORD_GUARD_0002
     * @tc.name      Resolution_RecordGuard_0002
     * @tc.desc      recording guard for recording=false, hasVideo=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_RecordGuard_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RecordGuard_0002 begin`);
      logInfo("canStartVideo(false, false) + ':' + canStopVideo(false)");
      const actual: string = canStartVideo(false, false) + ':' + canStopVideo(false);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo(`${BUNDLE}RecordGuard_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RECORD_GUARD_0003
     * @tc.name      Resolution_RecordGuard_0003
     * @tc.desc      recording guard for recording=true, hasVideo=false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_RecordGuard_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RecordGuard_0003 begin`);
      logInfo("canStartVideo(true, false) + ':' + canStopVideo(true)");
      const actual: string = canStartVideo(true, false) + ':' + canStopVideo(true);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}RecordGuard_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_RECORD_GUARD_0004
     * @tc.name      Resolution_RecordGuard_0004
     * @tc.desc      recording guard for recording=false, hasVideo=true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_RecordGuard_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RecordGuard_0004 begin`);
      logInfo("canStartVideo(false, true) + ':' + canStopVideo(false)");
      const actual: string = canStartVideo(false, true) + ':' + canStopVideo(false);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RecordGuard_0004 end`);
    });
  });
}
