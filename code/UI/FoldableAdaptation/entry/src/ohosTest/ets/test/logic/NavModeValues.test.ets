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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NavMode } from '../../../../main/ets/utils/RouterUtils';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NavMode (4 cases). */
export default function navModeValuesTest(): void {
  describe('NavModeValuesTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_VALUES_0001
     * @tc.name      FoldableAdaptation_NavModeValues_0001
     * @tc.desc      NavMode.DefaultMode keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavModeValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavModeValues_0001 begin`);
      const actual: number = NavMode.DefaultMode;
      logInfo(`NavMode.DefaultMode: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NavModeValues_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_VALUES_0002
     * @tc.name      FoldableAdaptation_NavModeValues_0002
     * @tc.desc      NavMode.FoldMode keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavModeValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavModeValues_0002 begin`);
      const actual: number = NavMode.FoldMode;
      logInfo(`NavMode.FoldMode: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NavModeValues_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_VALUES_0003
     * @tc.name      FoldableAdaptation_NavModeValues_0003
     * @tc.desc      NavMode.ChildPageMode keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeValues_0003 begin`);
      const actual: number = NavMode.ChildPageMode;
      logInfo(`NavMode.ChildPageMode: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NavModeValues_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAV_MODE_VALUES_0004
     * @tc.name      FoldableAdaptation_NavModeValues_0004
     * @tc.desc      NavMode.HomePageMode keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NavModeValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NavModeValues_0004 begin`);
      const actual: number = NavMode.HomePageMode;
      logInfo(`NavMode.HomePageMode: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NavModeValues_0004 end`);
    });
  });
}
