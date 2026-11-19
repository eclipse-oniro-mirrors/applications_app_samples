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
import { displayMoveYOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for displayMoveYOf (24 cases). */
export default function displayMoveYOf2Test(): void {
  describe('DisplayMoveYOf2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0097
     * @tc.name      WindowManage_DisplayMoveYOf_0097
     * @tc.desc      displayMoveYOf(windowHeight=-777) returns -388.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0097 begin`);
      const actual: number = displayMoveYOf(-777);
      logInfo(`displayMoveYOf(windowHeight=-777): actual=${actual}`);
      expect(actual).assertClose(-388.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0098
     * @tc.name      WindowManage_DisplayMoveYOf_0098
     * @tc.desc      displayMoveYOf(windowHeight=1343.84) returns 671.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0098 begin`);
      const actual: number = displayMoveYOf(1343.84);
      logInfo(`displayMoveYOf(windowHeight=1343.84): actual=${actual}`);
      expect(actual).assertClose(671.92, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0099
     * @tc.name      WindowManage_DisplayMoveYOf_0099
     * @tc.desc      displayMoveYOf(windowHeight=-1189) returns -594.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0099 begin`);
      const actual: number = displayMoveYOf(-1189);
      logInfo(`displayMoveYOf(windowHeight=-1189): actual=${actual}`);
      expect(actual).assertClose(-594.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0100
     * @tc.name      WindowManage_DisplayMoveYOf_0100
     * @tc.desc      displayMoveYOf(windowHeight=229.4) returns 114.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0100 begin`);
      const actual: number = displayMoveYOf(229.4);
      logInfo(`displayMoveYOf(windowHeight=229.4): actual=${actual}`);
      expect(actual).assertClose(114.7, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0101
     * @tc.name      WindowManage_DisplayMoveYOf_0101
     * @tc.desc      displayMoveYOf(windowHeight=2857) returns 1428.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0101 begin`);
      const actual: number = displayMoveYOf(2857);
      logInfo(`displayMoveYOf(windowHeight=2857): actual=${actual}`);
      expect(actual).assertClose(1428.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0102
     * @tc.name      WindowManage_DisplayMoveYOf_0102
     * @tc.desc      displayMoveYOf(windowHeight=2661) returns 1330.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0102 begin`);
      const actual: number = displayMoveYOf(2661);
      logInfo(`displayMoveYOf(windowHeight=2661): actual=${actual}`);
      expect(actual).assertClose(1330.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0103
     * @tc.name      WindowManage_DisplayMoveYOf_0103
     * @tc.desc      displayMoveYOf(windowHeight=-1536) returns -768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0103 begin`);
      const actual: number = displayMoveYOf(-1536);
      logInfo(`displayMoveYOf(windowHeight=-1536): actual=${actual}`);
      expect(actual).assertEqual(-768);
      logInfo(`${BUNDLE}DisplayMoveYOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0104
     * @tc.name      WindowManage_DisplayMoveYOf_0104
     * @tc.desc      displayMoveYOf(windowHeight=173.72) returns 86.86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0104 begin`);
      const actual: number = displayMoveYOf(173.72);
      logInfo(`displayMoveYOf(windowHeight=173.72): actual=${actual}`);
      expect(actual).assertClose(86.86, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0105
     * @tc.name      WindowManage_DisplayMoveYOf_0105
     * @tc.desc      displayMoveYOf(windowHeight=2163) returns 1081.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0105 begin`);
      const actual: number = displayMoveYOf(2163);
      logInfo(`displayMoveYOf(windowHeight=2163): actual=${actual}`);
      expect(actual).assertClose(1081.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0106
     * @tc.name      WindowManage_DisplayMoveYOf_0106
     * @tc.desc      displayMoveYOf(windowHeight=2508) returns 1254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0106 begin`);
      const actual: number = displayMoveYOf(2508);
      logInfo(`displayMoveYOf(windowHeight=2508): actual=${actual}`);
      expect(actual).assertEqual(1254);
      logInfo(`${BUNDLE}DisplayMoveYOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0107
     * @tc.name      WindowManage_DisplayMoveYOf_0107
     * @tc.desc      displayMoveYOf(windowHeight=2671) returns 1335.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0107 begin`);
      const actual: number = displayMoveYOf(2671);
      logInfo(`displayMoveYOf(windowHeight=2671): actual=${actual}`);
      expect(actual).assertClose(1335.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0108
     * @tc.name      WindowManage_DisplayMoveYOf_0108
     * @tc.desc      displayMoveYOf(windowHeight=3290) returns 1645
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0108 begin`);
      const actual: number = displayMoveYOf(3290);
      logInfo(`displayMoveYOf(windowHeight=3290): actual=${actual}`);
      expect(actual).assertEqual(1645);
      logInfo(`${BUNDLE}DisplayMoveYOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0109
     * @tc.name      WindowManage_DisplayMoveYOf_0109
     * @tc.desc      displayMoveYOf(windowHeight=693) returns 346.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0109 begin`);
      const actual: number = displayMoveYOf(693);
      logInfo(`displayMoveYOf(windowHeight=693): actual=${actual}`);
      expect(actual).assertClose(346.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0110
     * @tc.name      WindowManage_DisplayMoveYOf_0110
     * @tc.desc      displayMoveYOf(windowHeight=894.68) returns 447.34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0110 begin`);
      const actual: number = displayMoveYOf(894.68);
      logInfo(`displayMoveYOf(windowHeight=894.68): actual=${actual}`);
      expect(actual).assertClose(447.34, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0111
     * @tc.name      WindowManage_DisplayMoveYOf_0111
     * @tc.desc      displayMoveYOf(windowHeight=2970) returns 1485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0111 begin`);
      const actual: number = displayMoveYOf(2970);
      logInfo(`displayMoveYOf(windowHeight=2970): actual=${actual}`);
      expect(actual).assertEqual(1485);
      logInfo(`${BUNDLE}DisplayMoveYOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0112
     * @tc.name      WindowManage_DisplayMoveYOf_0112
     * @tc.desc      displayMoveYOf(windowHeight=-19) returns -9.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0112 begin`);
      const actual: number = displayMoveYOf(-19);
      logInfo(`displayMoveYOf(windowHeight=-19): actual=${actual}`);
      expect(actual).assertClose(-9.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0113
     * @tc.name      WindowManage_DisplayMoveYOf_0113
     * @tc.desc      displayMoveYOf(windowHeight=1906) returns 953
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0113 begin`);
      const actual: number = displayMoveYOf(1906);
      logInfo(`displayMoveYOf(windowHeight=1906): actual=${actual}`);
      expect(actual).assertEqual(953);
      logInfo(`${BUNDLE}DisplayMoveYOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0114
     * @tc.name      WindowManage_DisplayMoveYOf_0114
     * @tc.desc      displayMoveYOf(windowHeight=-859) returns -429.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0114 begin`);
      const actual: number = displayMoveYOf(-859);
      logInfo(`displayMoveYOf(windowHeight=-859): actual=${actual}`);
      expect(actual).assertClose(-429.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0115
     * @tc.name      WindowManage_DisplayMoveYOf_0115
     * @tc.desc      displayMoveYOf(windowHeight=529.57) returns 264.785
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0115 begin`);
      const actual: number = displayMoveYOf(529.57);
      logInfo(`displayMoveYOf(windowHeight=529.57): actual=${actual}`);
      expect(actual).assertClose(264.785, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0116
     * @tc.name      WindowManage_DisplayMoveYOf_0116
     * @tc.desc      displayMoveYOf(windowHeight=1437) returns 718.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0116 begin`);
      const actual: number = displayMoveYOf(1437);
      logInfo(`displayMoveYOf(windowHeight=1437): actual=${actual}`);
      expect(actual).assertClose(718.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0117
     * @tc.name      WindowManage_DisplayMoveYOf_0117
     * @tc.desc      displayMoveYOf(windowHeight=-210) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0117 begin`);
      const actual: number = displayMoveYOf(-210);
      logInfo(`displayMoveYOf(windowHeight=-210): actual=${actual}`);
      expect(actual).assertEqual(-105);
      logInfo(`${BUNDLE}DisplayMoveYOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0118
     * @tc.name      WindowManage_DisplayMoveYOf_0118
     * @tc.desc      displayMoveYOf(windowHeight=-1388) returns -694
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0118 begin`);
      const actual: number = displayMoveYOf(-1388);
      logInfo(`displayMoveYOf(windowHeight=-1388): actual=${actual}`);
      expect(actual).assertEqual(-694);
      logInfo(`${BUNDLE}DisplayMoveYOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0119
     * @tc.name      WindowManage_DisplayMoveYOf_0119
     * @tc.desc      displayMoveYOf(windowHeight=3016) returns 1508
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_DisplayMoveYOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0119 begin`);
      const actual: number = displayMoveYOf(3016);
      logInfo(`displayMoveYOf(windowHeight=3016): actual=${actual}`);
      expect(actual).assertEqual(1508);
      logInfo(`${BUNDLE}DisplayMoveYOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_DISPLAY_MOVE_YOF_0120
     * @tc.name      WindowManage_DisplayMoveYOf_0120
     * @tc.desc      displayMoveYOf(windowHeight=-395) returns -197.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_DisplayMoveYOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DisplayMoveYOf_0120 begin`);
      const actual: number = displayMoveYOf(-395);
      logInfo(`displayMoveYOf(windowHeight=-395): actual=${actual}`);
      expect(actual).assertClose(-197.5, PRECISION);
      logInfo(`${BUNDLE}DisplayMoveYOf_0120 end`);
    });
  });
}
