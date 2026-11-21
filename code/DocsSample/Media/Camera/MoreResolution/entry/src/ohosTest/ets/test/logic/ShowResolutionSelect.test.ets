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
  shouldShowResolutionSelect,
} from '../model/ResolutionLogic';

/** ShowResolutionSelectTest logic checks (2 cases). */
export default function showResolutionSelectTest(): void {
  describe('ShowResolutionSelectTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SHOW_SELECT_0001
     * @tc.name      Resolution_ShowSelect_0001
     * @tc.desc      shouldShowResolutionSelect(true) reports false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ShowSelect_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowSelect_0001 begin`);
      logInfo("shouldShowResolutionSelect(true)");
      const actual: boolean = shouldShowResolutionSelect(true);
      logInfo('actual=' + String(actual) + ', expected=' + "false");
      expect(actual).assertEqual(false);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('boolean');
      logInfo(`${BUNDLE}ShowSelect_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SHOW_SELECT_0002
     * @tc.name      Resolution_ShowSelect_0002
     * @tc.desc      shouldShowResolutionSelect(false) reports true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ShowSelect_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShowSelect_0002 begin`);
      logInfo("shouldShowResolutionSelect(false)");
      const actual: boolean = shouldShowResolutionSelect(false);
      logInfo('actual=' + String(actual) + ', expected=' + "true");
      expect(actual).assertEqual(true);
      logInfo(`${BUNDLE}ShowSelect_0002 end`);
    });
  });
}
