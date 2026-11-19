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
import { subWindowHeightPx } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subWindowHeightPx (24 cases). */
export default function subWindowHeightPx2Test(): void {
  describe('SubWindowHeightPx2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0097
     * @tc.name      WindowManage_SubWindowHeightPx_0097
     * @tc.desc      subWindowHeightPx(density=19) returns 4560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0097 begin`);
      const actual: number = subWindowHeightPx(19);
      logInfo(`subWindowHeightPx(density=19): actual=${actual}`);
      expect(actual).assertEqual(4560);
      logInfo(`${BUNDLE}SubWindowHeightPx_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0098
     * @tc.name      WindowManage_SubWindowHeightPx_0098
     * @tc.desc      subWindowHeightPx(density=176) returns 42240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0098 begin`);
      const actual: number = subWindowHeightPx(176);
      logInfo(`subWindowHeightPx(density=176): actual=${actual}`);
      expect(actual).assertEqual(42240);
      logInfo(`${BUNDLE}SubWindowHeightPx_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0099
     * @tc.name      WindowManage_SubWindowHeightPx_0099
     * @tc.desc      subWindowHeightPx(density=-44) returns -10560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0099 begin`);
      const actual: number = subWindowHeightPx(-44);
      logInfo(`subWindowHeightPx(density=-44): actual=${actual}`);
      expect(actual).assertEqual(-10560);
      logInfo(`${BUNDLE}SubWindowHeightPx_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0100
     * @tc.name      WindowManage_SubWindowHeightPx_0100
     * @tc.desc      subWindowHeightPx(density=192) returns 46080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0100 begin`);
      const actual: number = subWindowHeightPx(192);
      logInfo(`subWindowHeightPx(density=192): actual=${actual}`);
      expect(actual).assertEqual(46080);
      logInfo(`${BUNDLE}SubWindowHeightPx_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0101
     * @tc.name      WindowManage_SubWindowHeightPx_0101
     * @tc.desc      subWindowHeightPx(density=17) returns 4080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0101 begin`);
      const actual: number = subWindowHeightPx(17);
      logInfo(`subWindowHeightPx(density=17): actual=${actual}`);
      expect(actual).assertEqual(4080);
      logInfo(`${BUNDLE}SubWindowHeightPx_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0102
     * @tc.name      WindowManage_SubWindowHeightPx_0102
     * @tc.desc      subWindowHeightPx(density=22) returns 5280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0102 begin`);
      const actual: number = subWindowHeightPx(22);
      logInfo(`subWindowHeightPx(density=22): actual=${actual}`);
      expect(actual).assertEqual(5280);
      logInfo(`${BUNDLE}SubWindowHeightPx_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0103
     * @tc.name      WindowManage_SubWindowHeightPx_0103
     * @tc.desc      subWindowHeightPx(density=9) returns 2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0103 begin`);
      const actual: number = subWindowHeightPx(9);
      logInfo(`subWindowHeightPx(density=9): actual=${actual}`);
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}SubWindowHeightPx_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0104
     * @tc.name      WindowManage_SubWindowHeightPx_0104
     * @tc.desc      subWindowHeightPx(density=26) returns 6240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0104 begin`);
      const actual: number = subWindowHeightPx(26);
      logInfo(`subWindowHeightPx(density=26): actual=${actual}`);
      expect(actual).assertEqual(6240);
      logInfo(`${BUNDLE}SubWindowHeightPx_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0105
     * @tc.name      WindowManage_SubWindowHeightPx_0105
     * @tc.desc      subWindowHeightPx(density=157) returns 37680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0105 begin`);
      const actual: number = subWindowHeightPx(157);
      logInfo(`subWindowHeightPx(density=157): actual=${actual}`);
      expect(actual).assertEqual(37680);
      logInfo(`${BUNDLE}SubWindowHeightPx_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0106
     * @tc.name      WindowManage_SubWindowHeightPx_0106
     * @tc.desc      subWindowHeightPx(density=86.88) returns 20851.199999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0106 begin`);
      const actual: number = subWindowHeightPx(86.88);
      logInfo(`subWindowHeightPx(density=86.88): actual=${actual}`);
      expect(actual).assertClose(20851.199999999997, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0107
     * @tc.name      WindowManage_SubWindowHeightPx_0107
     * @tc.desc      subWindowHeightPx(density=55.9) returns 13416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0107 begin`);
      const actual: number = subWindowHeightPx(55.9);
      logInfo(`subWindowHeightPx(density=55.9): actual=${actual}`);
      expect(actual).assertEqual(13416);
      logInfo(`${BUNDLE}SubWindowHeightPx_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0108
     * @tc.name      WindowManage_SubWindowHeightPx_0108
     * @tc.desc      subWindowHeightPx(density=40.93) returns 9823.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0108 begin`);
      const actual: number = subWindowHeightPx(40.93);
      logInfo(`subWindowHeightPx(density=40.93): actual=${actual}`);
      expect(actual).assertClose(9823.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0109
     * @tc.name      WindowManage_SubWindowHeightPx_0109
     * @tc.desc      subWindowHeightPx(density=161) returns 38640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0109 begin`);
      const actual: number = subWindowHeightPx(161);
      logInfo(`subWindowHeightPx(density=161): actual=${actual}`);
      expect(actual).assertEqual(38640);
      logInfo(`${BUNDLE}SubWindowHeightPx_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0110
     * @tc.name      WindowManage_SubWindowHeightPx_0110
     * @tc.desc      subWindowHeightPx(density=96.19) returns 23085.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0110 begin`);
      const actual: number = subWindowHeightPx(96.19);
      logInfo(`subWindowHeightPx(density=96.19): actual=${actual}`);
      expect(actual).assertClose(23085.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0111
     * @tc.name      WindowManage_SubWindowHeightPx_0111
     * @tc.desc      subWindowHeightPx(density=199) returns 47760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0111 begin`);
      const actual: number = subWindowHeightPx(199);
      logInfo(`subWindowHeightPx(density=199): actual=${actual}`);
      expect(actual).assertEqual(47760);
      logInfo(`${BUNDLE}SubWindowHeightPx_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0112
     * @tc.name      WindowManage_SubWindowHeightPx_0112
     * @tc.desc      subWindowHeightPx(density=153) returns 36720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0112 begin`);
      const actual: number = subWindowHeightPx(153);
      logInfo(`subWindowHeightPx(density=153): actual=${actual}`);
      expect(actual).assertEqual(36720);
      logInfo(`${BUNDLE}SubWindowHeightPx_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0113
     * @tc.name      WindowManage_SubWindowHeightPx_0113
     * @tc.desc      subWindowHeightPx(density=31.07) returns 7456.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0113 begin`);
      const actual: number = subWindowHeightPx(31.07);
      logInfo(`subWindowHeightPx(density=31.07): actual=${actual}`);
      expect(actual).assertClose(7456.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0114
     * @tc.name      WindowManage_SubWindowHeightPx_0114
     * @tc.desc      subWindowHeightPx(density=141) returns 33840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0114 begin`);
      const actual: number = subWindowHeightPx(141);
      logInfo(`subWindowHeightPx(density=141): actual=${actual}`);
      expect(actual).assertEqual(33840);
      logInfo(`${BUNDLE}SubWindowHeightPx_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0115
     * @tc.name      WindowManage_SubWindowHeightPx_0115
     * @tc.desc      subWindowHeightPx(density=134) returns 32160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0115 begin`);
      const actual: number = subWindowHeightPx(134);
      logInfo(`subWindowHeightPx(density=134): actual=${actual}`);
      expect(actual).assertEqual(32160);
      logInfo(`${BUNDLE}SubWindowHeightPx_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0116
     * @tc.name      WindowManage_SubWindowHeightPx_0116
     * @tc.desc      subWindowHeightPx(density=189) returns 45360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0116 begin`);
      const actual: number = subWindowHeightPx(189);
      logInfo(`subWindowHeightPx(density=189): actual=${actual}`);
      expect(actual).assertEqual(45360);
      logInfo(`${BUNDLE}SubWindowHeightPx_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0117
     * @tc.name      WindowManage_SubWindowHeightPx_0117
     * @tc.desc      subWindowHeightPx(density=106) returns 25440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0117 begin`);
      const actual: number = subWindowHeightPx(106);
      logInfo(`subWindowHeightPx(density=106): actual=${actual}`);
      expect(actual).assertEqual(25440);
      logInfo(`${BUNDLE}SubWindowHeightPx_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0118
     * @tc.name      WindowManage_SubWindowHeightPx_0118
     * @tc.desc      subWindowHeightPx(density=21.05) returns 5052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0118 begin`);
      const actual: number = subWindowHeightPx(21.05);
      logInfo(`subWindowHeightPx(density=21.05): actual=${actual}`);
      expect(actual).assertEqual(5052);
      logInfo(`${BUNDLE}SubWindowHeightPx_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0119
     * @tc.name      WindowManage_SubWindowHeightPx_0119
     * @tc.desc      subWindowHeightPx(density=98) returns 23520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0119 begin`);
      const actual: number = subWindowHeightPx(98);
      logInfo(`subWindowHeightPx(density=98): actual=${actual}`);
      expect(actual).assertEqual(23520);
      logInfo(`${BUNDLE}SubWindowHeightPx_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0120
     * @tc.name      WindowManage_SubWindowHeightPx_0120
     * @tc.desc      subWindowHeightPx(density=-36) returns -8640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0120 begin`);
      const actual: number = subWindowHeightPx(-36);
      logInfo(`subWindowHeightPx(density=-36): actual=${actual}`);
      expect(actual).assertEqual(-8640);
      logInfo(`${BUNDLE}SubWindowHeightPx_0120 end`);
    });
  });
}
