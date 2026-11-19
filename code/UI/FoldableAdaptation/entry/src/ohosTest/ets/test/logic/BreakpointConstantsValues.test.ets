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
import { BreakpointConstants } from '../../../../main/ets/constants/BreakpointConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for BreakpointConstants (6 cases). */
export default function breakpointConstantsValuesTest(): void {
  describe('BreakpointConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0001
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0001
     * @tc.desc      BreakpointConstants.BREAKPOINT_SM keeps value "sm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('BreakpointConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0001 begin`);
      const actual: string = BreakpointConstants.BREAKPOINT_SM;
      logInfo(`BreakpointConstants.BREAKPOINT_SM: actual=${actual}`);
      expect(actual).assertEqual('sm');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0002
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0002
     * @tc.desc      BreakpointConstants.BREAKPOINT_MD keeps value "md"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('BreakpointConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0002 begin`);
      const actual: string = BreakpointConstants.BREAKPOINT_MD;
      logInfo(`BreakpointConstants.BREAKPOINT_MD: actual=${actual}`);
      expect(actual).assertEqual('md');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0003
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0003
     * @tc.desc      BreakpointConstants.BREAKPOINT_LG keeps value "lg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0003 begin`);
      const actual: string = BreakpointConstants.BREAKPOINT_LG;
      logInfo(`BreakpointConstants.BREAKPOINT_LG: actual=${actual}`);
      expect(actual).assertEqual('lg');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0004
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0004
     * @tc.desc      BreakpointConstants.GRID_ROW_COLUMNS keeps value [4,8,12]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0004 begin`);
      const actual: number[] = BreakpointConstants.GRID_ROW_COLUMNS;
      logInfo(`BreakpointConstants.GRID_ROW_COLUMNS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`BreakpointConstants.GRID_ROW_COLUMNS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[4,8,12]');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0005
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0005
     * @tc.desc      BreakpointConstants.GRID_COLUMN_SPANS keeps value [0,4,8]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0005 begin`);
      const actual: number[] = BreakpointConstants.GRID_COLUMN_SPANS;
      logInfo(`BreakpointConstants.GRID_COLUMN_SPANS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`BreakpointConstants.GRID_COLUMN_SPANS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,4,8]');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_BREAKPOINT_CONSTANTS_VALUES_0006
     * @tc.name      FoldableAdaptation_BreakpointConstantsValues_0006
     * @tc.desc      BreakpointConstants.BREAKPOINT_RANGES keeps value [320,600,840]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('BreakpointConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}BreakpointConstantsValues_0006 begin`);
      const actual: number[] = BreakpointConstants.BREAKPOINT_RANGES;
      logInfo(`BreakpointConstants.BREAKPOINT_RANGES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`BreakpointConstants.BREAKPOINT_RANGES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[320,600,840]');
      logInfo(`${BUNDLE}BreakpointConstantsValues_0006 end`);
    });
  });
}
