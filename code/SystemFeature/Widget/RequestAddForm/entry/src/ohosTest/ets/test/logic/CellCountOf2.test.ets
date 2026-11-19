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
import { cellCountOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellCountOf (29 cases). */
export default function cellCountOf2Test(): void {
  describe('CellCountOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0097
     * @tc.name      RequestAddForm_CellCountOf_0097
     * @tc.desc      cellCountOf(dimension=143) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0097 begin`);
      const actual: number = cellCountOf(143);
      logInfo(`cellCountOf(dimension=143): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0098
     * @tc.name      RequestAddForm_CellCountOf_0098
     * @tc.desc      cellCountOf(dimension=187) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0098 begin`);
      const actual: number = cellCountOf(187);
      logInfo(`cellCountOf(dimension=187): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0099
     * @tc.name      RequestAddForm_CellCountOf_0099
     * @tc.desc      cellCountOf(dimension=139) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0099 begin`);
      const actual: number = cellCountOf(139);
      logInfo(`cellCountOf(dimension=139): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0100
     * @tc.name      RequestAddForm_CellCountOf_0100
     * @tc.desc      cellCountOf(dimension=32.5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0100 begin`);
      const actual: number = cellCountOf(32.5);
      logInfo(`cellCountOf(dimension=32.5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0101
     * @tc.name      RequestAddForm_CellCountOf_0101
     * @tc.desc      cellCountOf(dimension=15.58) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0101 begin`);
      const actual: number = cellCountOf(15.58);
      logInfo(`cellCountOf(dimension=15.58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0102
     * @tc.name      RequestAddForm_CellCountOf_0102
     * @tc.desc      cellCountOf(dimension=-10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0102 begin`);
      const actual: number = cellCountOf(-10);
      logInfo(`cellCountOf(dimension=-10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0103
     * @tc.name      RequestAddForm_CellCountOf_0103
     * @tc.desc      cellCountOf(dimension=84) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0103 begin`);
      const actual: number = cellCountOf(84);
      logInfo(`cellCountOf(dimension=84): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0104
     * @tc.name      RequestAddForm_CellCountOf_0104
     * @tc.desc      cellCountOf(dimension=41) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0104 begin`);
      const actual: number = cellCountOf(41);
      logInfo(`cellCountOf(dimension=41): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0105
     * @tc.name      RequestAddForm_CellCountOf_0105
     * @tc.desc      cellCountOf(dimension=54.55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0105 begin`);
      const actual: number = cellCountOf(54.55);
      logInfo(`cellCountOf(dimension=54.55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0106
     * @tc.name      RequestAddForm_CellCountOf_0106
     * @tc.desc      cellCountOf(dimension=51.97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0106 begin`);
      const actual: number = cellCountOf(51.97);
      logInfo(`cellCountOf(dimension=51.97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0107
     * @tc.name      RequestAddForm_CellCountOf_0107
     * @tc.desc      cellCountOf(dimension=97.15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0107 begin`);
      const actual: number = cellCountOf(97.15);
      logInfo(`cellCountOf(dimension=97.15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0108
     * @tc.name      RequestAddForm_CellCountOf_0108
     * @tc.desc      cellCountOf(dimension=19.25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0108 begin`);
      const actual: number = cellCountOf(19.25);
      logInfo(`cellCountOf(dimension=19.25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0109
     * @tc.name      RequestAddForm_CellCountOf_0109
     * @tc.desc      cellCountOf(dimension=46.92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0109 begin`);
      const actual: number = cellCountOf(46.92);
      logInfo(`cellCountOf(dimension=46.92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0110
     * @tc.name      RequestAddForm_CellCountOf_0110
     * @tc.desc      cellCountOf(dimension=-5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0110 begin`);
      const actual: number = cellCountOf(-5);
      logInfo(`cellCountOf(dimension=-5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0111
     * @tc.name      RequestAddForm_CellCountOf_0111
     * @tc.desc      cellCountOf(dimension=56.26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0111 begin`);
      const actual: number = cellCountOf(56.26);
      logInfo(`cellCountOf(dimension=56.26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0112
     * @tc.name      RequestAddForm_CellCountOf_0112
     * @tc.desc      cellCountOf(dimension=39.58) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0112 begin`);
      const actual: number = cellCountOf(39.58);
      logInfo(`cellCountOf(dimension=39.58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0113
     * @tc.name      RequestAddForm_CellCountOf_0113
     * @tc.desc      cellCountOf(dimension=29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0113 begin`);
      const actual: number = cellCountOf(29);
      logInfo(`cellCountOf(dimension=29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0114
     * @tc.name      RequestAddForm_CellCountOf_0114
     * @tc.desc      cellCountOf(dimension=136) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0114 begin`);
      const actual: number = cellCountOf(136);
      logInfo(`cellCountOf(dimension=136): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0115
     * @tc.name      RequestAddForm_CellCountOf_0115
     * @tc.desc      cellCountOf(dimension=177) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0115 begin`);
      const actual: number = cellCountOf(177);
      logInfo(`cellCountOf(dimension=177): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0116
     * @tc.name      RequestAddForm_CellCountOf_0116
     * @tc.desc      cellCountOf(dimension=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0116 begin`);
      const actual: number = cellCountOf(-13);
      logInfo(`cellCountOf(dimension=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0117
     * @tc.name      RequestAddForm_CellCountOf_0117
     * @tc.desc      cellCountOf(dimension=176) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0117 begin`);
      const actual: number = cellCountOf(176);
      logInfo(`cellCountOf(dimension=176): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0118
     * @tc.name      RequestAddForm_CellCountOf_0118
     * @tc.desc      cellCountOf(dimension=27) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0118 begin`);
      const actual: number = cellCountOf(27);
      logInfo(`cellCountOf(dimension=27): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0119
     * @tc.name      RequestAddForm_CellCountOf_0119
     * @tc.desc      cellCountOf(dimension=89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0119 begin`);
      const actual: number = cellCountOf(89);
      logInfo(`cellCountOf(dimension=89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0120
     * @tc.name      RequestAddForm_CellCountOf_0120
     * @tc.desc      cellCountOf(dimension=-82) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0120 begin`);
      const actual: number = cellCountOf(-82);
      logInfo(`cellCountOf(dimension=-82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0121
     * @tc.name      RequestAddForm_CellCountOf_0121
     * @tc.desc      cellCountOf(dimension=134) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0121 begin`);
      const actual: number = cellCountOf(134);
      logInfo(`cellCountOf(dimension=134): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0122
     * @tc.name      RequestAddForm_CellCountOf_0122
     * @tc.desc      cellCountOf(dimension=60.82) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0122 begin`);
      const actual: number = cellCountOf(60.82);
      logInfo(`cellCountOf(dimension=60.82): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0123
     * @tc.name      RequestAddForm_CellCountOf_0123
     * @tc.desc      cellCountOf(dimension=104) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0123 begin`);
      const actual: number = cellCountOf(104);
      logInfo(`cellCountOf(dimension=104): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0124
     * @tc.name      RequestAddForm_CellCountOf_0124
     * @tc.desc      cellCountOf(dimension=-51) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0124 begin`);
      const actual: number = cellCountOf(-51);
      logInfo(`cellCountOf(dimension=-51): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0125
     * @tc.name      RequestAddForm_CellCountOf_0125
     * @tc.desc      cellCountOf(dimension=-57) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0125 begin`);
      const actual: number = cellCountOf(-57);
      logInfo(`cellCountOf(dimension=-57): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0125 end`);
    });
  });
}
