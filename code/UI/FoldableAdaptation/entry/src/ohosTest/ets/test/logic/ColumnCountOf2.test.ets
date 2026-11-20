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
import { columnCountOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for columnCountOf (4 cases). */
export default function columnCountOf2Test(): void {
  describe('ColumnCountOf2Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0097
     * @tc.name      FoldableAdaptation_ColumnCountOf_0097
     * @tc.desc      columnCountOf(template="kyuUzZ92") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0097 begin`);
      const actual: number = columnCountOf('kyuUzZ92');
      logInfo(`columnCountOf(template="kyuUzZ92"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0098
     * @tc.name      FoldableAdaptation_ColumnCountOf_0098
     * @tc.desc      columnCountOf(template="vXl5geZ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0098 begin`);
      const actual: number = columnCountOf('vXl5geZ');
      logInfo(`columnCountOf(template="vXl5geZ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0099
     * @tc.name      FoldableAdaptation_ColumnCountOf_0099
     * @tc.desc      columnCountOf(template="JdKgp3HbGrQm") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0099 begin`);
      const actual: number = columnCountOf('JdKgp3HbGrQm');
      logInfo(`columnCountOf(template="JdKgp3HbGrQm"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0100
     * @tc.name      FoldableAdaptation_ColumnCountOf_0100
     * @tc.desc      columnCountOf(template="hTmbK7s") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0100 begin`);
      const actual: number = columnCountOf('hTmbK7s');
      logInfo(`columnCountOf(template="hTmbK7s"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0100 end`);
    });
  });
}
