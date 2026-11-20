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
import { subWindowWidthPx } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subWindowWidthPx (24 cases). */
export default function subWindowWidthPx2Test(): void {
  describe('SubWindowWidthPx2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0097
     * @tc.name      WindowManage_SubWindowWidthPx_0097
     * @tc.desc      subWindowWidthPx(density=39) returns 12480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0097 begin`);
      const actual: number = subWindowWidthPx(39);
      logInfo(`subWindowWidthPx(density=39): actual=${actual}`);
      expect(actual).assertEqual(12480);
      logInfo(`${BUNDLE}SubWindowWidthPx_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0098
     * @tc.name      WindowManage_SubWindowWidthPx_0098
     * @tc.desc      subWindowWidthPx(density=-40) returns -12800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0098 begin`);
      const actual: number = subWindowWidthPx(-40);
      logInfo(`subWindowWidthPx(density=-40): actual=${actual}`);
      expect(actual).assertEqual(-12800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0099
     * @tc.name      WindowManage_SubWindowWidthPx_0099
     * @tc.desc      subWindowWidthPx(density=30.81) returns 9859.199999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0099 begin`);
      const actual: number = subWindowWidthPx(30.81);
      logInfo(`subWindowWidthPx(density=30.81): actual=${actual}`);
      expect(actual).assertClose(9859.199999999999, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0100
     * @tc.name      WindowManage_SubWindowWidthPx_0100
     * @tc.desc      subWindowWidthPx(density=42.51) returns 13603.199999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0100 begin`);
      const actual: number = subWindowWidthPx(42.51);
      logInfo(`subWindowWidthPx(density=42.51): actual=${actual}`);
      expect(actual).assertClose(13603.199999999999, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0101
     * @tc.name      WindowManage_SubWindowWidthPx_0101
     * @tc.desc      subWindowWidthPx(density=14.5) returns 4640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0101 begin`);
      const actual: number = subWindowWidthPx(14.5);
      logInfo(`subWindowWidthPx(density=14.5): actual=${actual}`);
      expect(actual).assertEqual(4640);
      logInfo(`${BUNDLE}SubWindowWidthPx_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0102
     * @tc.name      WindowManage_SubWindowWidthPx_0102
     * @tc.desc      subWindowWidthPx(density=119) returns 38080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0102 begin`);
      const actual: number = subWindowWidthPx(119);
      logInfo(`subWindowWidthPx(density=119): actual=${actual}`);
      expect(actual).assertEqual(38080);
      logInfo(`${BUNDLE}SubWindowWidthPx_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0103
     * @tc.name      WindowManage_SubWindowWidthPx_0103
     * @tc.desc      subWindowWidthPx(density=94.89) returns 30364.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0103 begin`);
      const actual: number = subWindowWidthPx(94.89);
      logInfo(`subWindowWidthPx(density=94.89): actual=${actual}`);
      expect(actual).assertClose(30364.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0104
     * @tc.name      WindowManage_SubWindowWidthPx_0104
     * @tc.desc      subWindowWidthPx(density=83) returns 26560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0104 begin`);
      const actual: number = subWindowWidthPx(83);
      logInfo(`subWindowWidthPx(density=83): actual=${actual}`);
      expect(actual).assertEqual(26560);
      logInfo(`${BUNDLE}SubWindowWidthPx_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0105
     * @tc.name      WindowManage_SubWindowWidthPx_0105
     * @tc.desc      subWindowWidthPx(density=168) returns 53760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0105 begin`);
      const actual: number = subWindowWidthPx(168);
      logInfo(`subWindowWidthPx(density=168): actual=${actual}`);
      expect(actual).assertEqual(53760);
      logInfo(`${BUNDLE}SubWindowWidthPx_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0106
     * @tc.name      WindowManage_SubWindowWidthPx_0106
     * @tc.desc      subWindowWidthPx(density=128) returns 40960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0106 begin`);
      const actual: number = subWindowWidthPx(128);
      logInfo(`subWindowWidthPx(density=128): actual=${actual}`);
      expect(actual).assertEqual(40960);
      logInfo(`${BUNDLE}SubWindowWidthPx_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0107
     * @tc.name      WindowManage_SubWindowWidthPx_0107
     * @tc.desc      subWindowWidthPx(density=37.81) returns 12099.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0107 begin`);
      const actual: number = subWindowWidthPx(37.81);
      logInfo(`subWindowWidthPx(density=37.81): actual=${actual}`);
      expect(actual).assertClose(12099.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0108
     * @tc.name      WindowManage_SubWindowWidthPx_0108
     * @tc.desc      subWindowWidthPx(density=2.39) returns 764.8000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0108 begin`);
      const actual: number = subWindowWidthPx(2.39);
      logInfo(`subWindowWidthPx(density=2.39): actual=${actual}`);
      expect(actual).assertClose(764.8000000000001, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0109
     * @tc.name      WindowManage_SubWindowWidthPx_0109
     * @tc.desc      subWindowWidthPx(density=132) returns 42240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0109 begin`);
      const actual: number = subWindowWidthPx(132);
      logInfo(`subWindowWidthPx(density=132): actual=${actual}`);
      expect(actual).assertEqual(42240);
      logInfo(`${BUNDLE}SubWindowWidthPx_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0110
     * @tc.name      WindowManage_SubWindowWidthPx_0110
     * @tc.desc      subWindowWidthPx(density=-75) returns -24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0110 begin`);
      const actual: number = subWindowWidthPx(-75);
      logInfo(`subWindowWidthPx(density=-75): actual=${actual}`);
      expect(actual).assertEqual(-24000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0111
     * @tc.name      WindowManage_SubWindowWidthPx_0111
     * @tc.desc      subWindowWidthPx(density=92) returns 29440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0111 begin`);
      const actual: number = subWindowWidthPx(92);
      logInfo(`subWindowWidthPx(density=92): actual=${actual}`);
      expect(actual).assertEqual(29440);
      logInfo(`${BUNDLE}SubWindowWidthPx_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0112
     * @tc.name      WindowManage_SubWindowWidthPx_0112
     * @tc.desc      subWindowWidthPx(density=52.52) returns 16806.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0112 begin`);
      const actual: number = subWindowWidthPx(52.52);
      logInfo(`subWindowWidthPx(density=52.52): actual=${actual}`);
      expect(actual).assertClose(16806.4, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0113
     * @tc.name      WindowManage_SubWindowWidthPx_0113
     * @tc.desc      subWindowWidthPx(density=14.83) returns 4745.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0113 begin`);
      const actual: number = subWindowWidthPx(14.83);
      logInfo(`subWindowWidthPx(density=14.83): actual=${actual}`);
      expect(actual).assertClose(4745.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0114
     * @tc.name      WindowManage_SubWindowWidthPx_0114
     * @tc.desc      subWindowWidthPx(density=32) returns 10240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0114 begin`);
      const actual: number = subWindowWidthPx(32);
      logInfo(`subWindowWidthPx(density=32): actual=${actual}`);
      expect(actual).assertEqual(10240);
      logInfo(`${BUNDLE}SubWindowWidthPx_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0115
     * @tc.name      WindowManage_SubWindowWidthPx_0115
     * @tc.desc      subWindowWidthPx(density=93.23) returns 29833.600000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0115 begin`);
      const actual: number = subWindowWidthPx(93.23);
      logInfo(`subWindowWidthPx(density=93.23): actual=${actual}`);
      expect(actual).assertClose(29833.600000000002, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0116
     * @tc.name      WindowManage_SubWindowWidthPx_0116
     * @tc.desc      subWindowWidthPx(density=158) returns 50560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0116 begin`);
      const actual: number = subWindowWidthPx(158);
      logInfo(`subWindowWidthPx(density=158): actual=${actual}`);
      expect(actual).assertEqual(50560);
      logInfo(`${BUNDLE}SubWindowWidthPx_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0117
     * @tc.name      WindowManage_SubWindowWidthPx_0117
     * @tc.desc      subWindowWidthPx(density=22) returns 7040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0117 begin`);
      const actual: number = subWindowWidthPx(22);
      logInfo(`subWindowWidthPx(density=22): actual=${actual}`);
      expect(actual).assertEqual(7040);
      logInfo(`${BUNDLE}SubWindowWidthPx_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0118
     * @tc.name      WindowManage_SubWindowWidthPx_0118
     * @tc.desc      subWindowWidthPx(density=26) returns 8320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0118 begin`);
      const actual: number = subWindowWidthPx(26);
      logInfo(`subWindowWidthPx(density=26): actual=${actual}`);
      expect(actual).assertEqual(8320);
      logInfo(`${BUNDLE}SubWindowWidthPx_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0119
     * @tc.name      WindowManage_SubWindowWidthPx_0119
     * @tc.desc      subWindowWidthPx(density=-12) returns -3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0119 begin`);
      const actual: number = subWindowWidthPx(-12);
      logInfo(`subWindowWidthPx(density=-12): actual=${actual}`);
      expect(actual).assertEqual(-3840);
      logInfo(`${BUNDLE}SubWindowWidthPx_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0120
     * @tc.name      WindowManage_SubWindowWidthPx_0120
     * @tc.desc      subWindowWidthPx(density=139) returns 44480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0120 begin`);
      const actual: number = subWindowWidthPx(139);
      logInfo(`subWindowWidthPx(density=139): actual=${actual}`);
      expect(actual).assertEqual(44480);
      logInfo(`${BUNDLE}SubWindowWidthPx_0120 end`);
    });
  });
}
