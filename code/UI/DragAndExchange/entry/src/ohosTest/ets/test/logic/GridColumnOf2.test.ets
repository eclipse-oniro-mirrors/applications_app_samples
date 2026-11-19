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
import { gridColumnOf } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridColumnOf (24 cases). */
export default function gridColumnOf2Test(): void {
  describe('GridColumnOf2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0097
     * @tc.name      DragAndExchange_GridColumnOf_0097
     * @tc.desc      gridColumnOf(index=44.41) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0097 begin`);
      const actual: number = gridColumnOf(44.41);
      logInfo(`gridColumnOf(index=44.41): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0098
     * @tc.name      DragAndExchange_GridColumnOf_0098
     * @tc.desc      gridColumnOf(index=168) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0098 begin`);
      const actual: number = gridColumnOf(168);
      logInfo(`gridColumnOf(index=168): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0099
     * @tc.name      DragAndExchange_GridColumnOf_0099
     * @tc.desc      gridColumnOf(index=21.52) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0099 begin`);
      const actual: number = gridColumnOf(21.52);
      logInfo(`gridColumnOf(index=21.52): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0100
     * @tc.name      DragAndExchange_GridColumnOf_0100
     * @tc.desc      gridColumnOf(index=-56) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0100 begin`);
      const actual: number = gridColumnOf(-56);
      logInfo(`gridColumnOf(index=-56): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0101
     * @tc.name      DragAndExchange_GridColumnOf_0101
     * @tc.desc      gridColumnOf(index=49) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0101 begin`);
      const actual: number = gridColumnOf(49);
      logInfo(`gridColumnOf(index=49): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0102
     * @tc.name      DragAndExchange_GridColumnOf_0102
     * @tc.desc      gridColumnOf(index=39.57) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0102 begin`);
      const actual: number = gridColumnOf(39.57);
      logInfo(`gridColumnOf(index=39.57): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0103
     * @tc.name      DragAndExchange_GridColumnOf_0103
     * @tc.desc      gridColumnOf(index=-17) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0103 begin`);
      const actual: number = gridColumnOf(-17);
      logInfo(`gridColumnOf(index=-17): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0104
     * @tc.name      DragAndExchange_GridColumnOf_0104
     * @tc.desc      gridColumnOf(index=159) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0104 begin`);
      const actual: number = gridColumnOf(159);
      logInfo(`gridColumnOf(index=159): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0105
     * @tc.name      DragAndExchange_GridColumnOf_0105
     * @tc.desc      gridColumnOf(index=-33) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0105 begin`);
      const actual: number = gridColumnOf(-33);
      logInfo(`gridColumnOf(index=-33): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0106
     * @tc.name      DragAndExchange_GridColumnOf_0106
     * @tc.desc      gridColumnOf(index=75.62) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0106 begin`);
      const actual: number = gridColumnOf(75.62);
      logInfo(`gridColumnOf(index=75.62): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0107
     * @tc.name      DragAndExchange_GridColumnOf_0107
     * @tc.desc      gridColumnOf(index=153) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0107 begin`);
      const actual: number = gridColumnOf(153);
      logInfo(`gridColumnOf(index=153): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0108
     * @tc.name      DragAndExchange_GridColumnOf_0108
     * @tc.desc      gridColumnOf(index=114) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0108 begin`);
      const actual: number = gridColumnOf(114);
      logInfo(`gridColumnOf(index=114): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0109
     * @tc.name      DragAndExchange_GridColumnOf_0109
     * @tc.desc      gridColumnOf(index=96.5) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0109 begin`);
      const actual: number = gridColumnOf(96.5);
      logInfo(`gridColumnOf(index=96.5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0110
     * @tc.name      DragAndExchange_GridColumnOf_0110
     * @tc.desc      gridColumnOf(index=31) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0110 begin`);
      const actual: number = gridColumnOf(31);
      logInfo(`gridColumnOf(index=31): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0111
     * @tc.name      DragAndExchange_GridColumnOf_0111
     * @tc.desc      gridColumnOf(index=193) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0111 begin`);
      const actual: number = gridColumnOf(193);
      logInfo(`gridColumnOf(index=193): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0112
     * @tc.name      DragAndExchange_GridColumnOf_0112
     * @tc.desc      gridColumnOf(index=-13) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0112 begin`);
      const actual: number = gridColumnOf(-13);
      logInfo(`gridColumnOf(index=-13): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0113
     * @tc.name      DragAndExchange_GridColumnOf_0113
     * @tc.desc      gridColumnOf(index=40.79) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0113 begin`);
      const actual: number = gridColumnOf(40.79);
      logInfo(`gridColumnOf(index=40.79): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0114
     * @tc.name      DragAndExchange_GridColumnOf_0114
     * @tc.desc      gridColumnOf(index=-25) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridColumnOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0114 begin`);
      const actual: number = gridColumnOf(-25);
      logInfo(`gridColumnOf(index=-25): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0115
     * @tc.name      DragAndExchange_GridColumnOf_0115
     * @tc.desc      gridColumnOf(index=93) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0115 begin`);
      const actual: number = gridColumnOf(93);
      logInfo(`gridColumnOf(index=93): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0116
     * @tc.name      DragAndExchange_GridColumnOf_0116
     * @tc.desc      gridColumnOf(index=167) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0116 begin`);
      const actual: number = gridColumnOf(167);
      logInfo(`gridColumnOf(index=167): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0117
     * @tc.name      DragAndExchange_GridColumnOf_0117
     * @tc.desc      gridColumnOf(index=29.68) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0117 begin`);
      const actual: number = gridColumnOf(29.68);
      logInfo(`gridColumnOf(index=29.68): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0118
     * @tc.name      DragAndExchange_GridColumnOf_0118
     * @tc.desc      gridColumnOf(index=46.82) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0118 begin`);
      const actual: number = gridColumnOf(46.82);
      logInfo(`gridColumnOf(index=46.82): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0119
     * @tc.name      DragAndExchange_GridColumnOf_0119
     * @tc.desc      gridColumnOf(index=53.01) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0119 begin`);
      const actual: number = gridColumnOf(53.01);
      logInfo(`gridColumnOf(index=53.01): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_COLUMN_OF_0120
     * @tc.name      DragAndExchange_GridColumnOf_0120
     * @tc.desc      gridColumnOf(index=82.76) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridColumnOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridColumnOf_0120 begin`);
      const actual: number = gridColumnOf(82.76);
      logInfo(`gridColumnOf(index=82.76): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GridColumnOf_0120 end`);
    });
  });
}
