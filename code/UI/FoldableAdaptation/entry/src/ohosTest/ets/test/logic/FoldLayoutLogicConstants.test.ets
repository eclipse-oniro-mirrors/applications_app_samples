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
import { DEFAULT_WINDOW_WIDTH, FOLDABLE_ITEM_WIDTH, FULL_SCREEN_ROUTE, ITEM_WIDTH } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FoldLayoutLogic (4 cases). */
export default function foldLayoutLogicConstantsTest(): void {
  describe('FoldLayoutLogicConstantsTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_LOGIC_CONSTANTS_0001
     * @tc.name      FoldableAdaptation_FoldLayoutLogicConstants_0001
     * @tc.desc      FULL_SCREEN_ROUTE keeps value ["fullscreen"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0001 begin`);
      const actual: string[] = FULL_SCREEN_ROUTE;
      logInfo(`FULL_SCREEN_ROUTE: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`FULL_SCREEN_ROUTE: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["fullscreen"]');
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_LOGIC_CONSTANTS_0002
     * @tc.name      FoldableAdaptation_FoldLayoutLogicConstants_0002
     * @tc.desc      FOLDABLE_ITEM_WIDTH keeps value 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0002 begin`);
      const actual: number = FOLDABLE_ITEM_WIDTH;
      logInfo(`FOLDABLE_ITEM_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(158);
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_LOGIC_CONSTANTS_0003
     * @tc.name      FoldableAdaptation_FoldLayoutLogicConstants_0003
     * @tc.desc      ITEM_WIDTH keeps value 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0003 begin`);
      const actual: number = ITEM_WIDTH;
      logInfo(`ITEM_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(177);
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_LOGIC_CONSTANTS_0004
     * @tc.name      FoldableAdaptation_FoldLayoutLogicConstants_0004
     * @tc.desc      DEFAULT_WINDOW_WIDTH keeps value 1280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FoldLayoutLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0004 begin`);
      const actual: number = DEFAULT_WINDOW_WIDTH;
      logInfo(`DEFAULT_WINDOW_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}FoldLayoutLogicConstants_0004 end`);
    });
  });
}
