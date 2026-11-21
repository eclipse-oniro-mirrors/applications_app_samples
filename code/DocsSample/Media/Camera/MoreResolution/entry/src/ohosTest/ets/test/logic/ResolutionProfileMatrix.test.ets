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
  selectPreviewProfileIndex,
  selectExactProfileIndex,
  profileFormat,
  Profile,
} from '../model/ResolutionLogic';

/** ResolutionProfileMatrixTest logic checks (24 cases). */
export default function resolutionProfileMatrixTest(): void {
  describe('ResolutionProfileMatrixTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_PROFILE_MATRIX_0001
     * @tc.name      Resolution_ProfileMatrix_0001
     * @tc.desc      profile matrix ratio=1.777778 size=1280x720 keeps preview/exact/format decisions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ProfileMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProfileMatrix_0001 begin`);
      const profiles: Array<Profile> = [
        new Profile(1280, 720, 1003, 30, 60),
      ];
      logInfo("profile matrix ratio=1.777778 size=1280x720 kind=0");
      const actual: string = selectPreviewProfileIndex(profiles, 1.777778, 1003, 720) + '|' + selectExactProfileIndex(profiles, 1280, 720) + '|' + profileFormat(0);
      logInfo('actual=' + String(actual) + ', expected=' + "0|0|1003");
      expect(actual).assertEqual("0|0|1003");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ProfileMatrix_0001 end`);
