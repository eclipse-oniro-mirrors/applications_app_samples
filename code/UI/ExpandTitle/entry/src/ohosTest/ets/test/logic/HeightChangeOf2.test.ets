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
import { heightChangeOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heightChangeOf (96 cases). */
export default function heightChangeOf2Test(): void {
  describe('HeightChangeOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0097
     * @tc.name      ExpandTitle_HeightChangeOf_0097
     * @tc.desc      heightChangeOf(offset=50, heightValue=1080, normalTitleHeight=1080, expandTitleHeight=1080) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0097 begin`);
      const actual: number = heightChangeOf(50, 1080, 1080, 1080);
      logInfo(`heightChangeOf(offset=50, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0098
     * @tc.name      ExpandTitle_HeightChangeOf_0098
     * @tc.desc      heightChangeOf(offset=-1, heightValue=360, normalTitleHeight=1080, expandTitleHeight=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0098 begin`);
      const actual: number = heightChangeOf(-1, 360, 1080, 0);
      logInfo(`heightChangeOf(offset=-1, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0099
     * @tc.name      ExpandTitle_HeightChangeOf_0099
     * @tc.desc      heightChangeOf(offset=3, heightValue=100, normalTitleHeight=-1, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0099 begin`);
      const actual: number = heightChangeOf(3, 100, -1, 100);
      logInfo(`heightChangeOf(offset=3, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0100
     * @tc.name      ExpandTitle_HeightChangeOf_0100
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=-1, expandTitleHeight=720) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0100 begin`);
      const actual: number = heightChangeOf(-100, 0, -1, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0101
     * @tc.name      ExpandTitle_HeightChangeOf_0101
     * @tc.desc      heightChangeOf(offset=1, heightValue=1080, normalTitleHeight=720, expandTitleHeight=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0101 begin`);
      const actual: number = heightChangeOf(1, 1080, 720, 1080);
      logInfo(`heightChangeOf(offset=1, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0102
     * @tc.name      ExpandTitle_HeightChangeOf_0102
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1, normalTitleHeight=-1, expandTitleHeight=1920) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0102 begin`);
      const actual: number = heightChangeOf(-1, 1, -1, 1920);
      logInfo(`heightChangeOf(offset=-1, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0103
     * @tc.name      ExpandTitle_HeightChangeOf_0103
     * @tc.desc      heightChangeOf(offset=100, heightValue=100, normalTitleHeight=0, expandTitleHeight=1920) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0103 begin`);
      const actual: number = heightChangeOf(100, 100, 0, 1920);
      logInfo(`heightChangeOf(offset=100, heightValue=10...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightChangeOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0104
     * @tc.name      ExpandTitle_HeightChangeOf_0104
     * @tc.desc      heightChangeOf(offset=0, heightValue=-1, normalTitleHeight=1920, expandTitleHeight=720) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0104 begin`);
      const actual: number = heightChangeOf(0, -1, 1920, 720);
      logInfo(`heightChangeOf(offset=0, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}HeightChangeOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0105
     * @tc.name      ExpandTitle_HeightChangeOf_0105
     * @tc.desc      heightChangeOf(offset=100, heightValue=0, normalTitleHeight=-1, expandTitleHeight=360) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0105 begin`);
      const actual: number = heightChangeOf(100, 0, -1, 360);
      logInfo(`heightChangeOf(offset=100, heightValue=0,...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightChangeOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0106
     * @tc.name      ExpandTitle_HeightChangeOf_0106
     * @tc.desc      heightChangeOf(offset=2, heightValue=-1, normalTitleHeight=1920, expandTitleHeight=1920) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0106 begin`);
      const actual: number = heightChangeOf(2, -1, 1920, 1920);
      logInfo(`heightChangeOf(offset=2, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}HeightChangeOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0107
     * @tc.name      ExpandTitle_HeightChangeOf_0107
     * @tc.desc      heightChangeOf(offset=100, heightValue=1080, normalTitleHeight=1080, expandTitleHeight=100) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0107 begin`);
      const actual: number = heightChangeOf(100, 1080, 1080, 100);
      logInfo(`heightChangeOf(offset=100, heightValue=10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0108
     * @tc.name      ExpandTitle_HeightChangeOf_0108
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=1920, expandTitleHeight=1920) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0108 begin`);
      const actual: number = heightChangeOf(-100, 1080, 1920, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}HeightChangeOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0109
     * @tc.name      ExpandTitle_HeightChangeOf_0109
     * @tc.desc      heightChangeOf(offset=2, heightValue=100, normalTitleHeight=100, expandTitleHeight=1080) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0109 begin`);
      const actual: number = heightChangeOf(2, 100, 100, 1080);
      logInfo(`heightChangeOf(offset=2, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0110
     * @tc.name      ExpandTitle_HeightChangeOf_0110
     * @tc.desc      heightChangeOf(offset=2, heightValue=1080, normalTitleHeight=1920, expandTitleHeight=100) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0110 begin`);
      const actual: number = heightChangeOf(2, 1080, 1920, 100);
      logInfo(`heightChangeOf(offset=2, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}HeightChangeOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0111
     * @tc.name      ExpandTitle_HeightChangeOf_0111
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=1, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0111 begin`);
      const actual: number = heightChangeOf(0, 100, 1, 1920);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0112
     * @tc.name      ExpandTitle_HeightChangeOf_0112
     * @tc.desc      heightChangeOf(offset=2, heightValue=-1, normalTitleHeight=0, expandTitleHeight=360) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0112 begin`);
      const actual: number = heightChangeOf(2, -1, 0, 360);
      logInfo(`heightChangeOf(offset=2, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0113
     * @tc.name      ExpandTitle_HeightChangeOf_0113
     * @tc.desc      heightChangeOf(offset=0, heightValue=1, normalTitleHeight=-1, expandTitleHeight=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0113 begin`);
      const actual: number = heightChangeOf(0, 1, -1, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0114
     * @tc.name      ExpandTitle_HeightChangeOf_0114
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=100, expandTitleHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0114 begin`);
      const actual: number = heightChangeOf(3, 0, 100, 100);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightChangeOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0115
     * @tc.name      ExpandTitle_HeightChangeOf_0115
     * @tc.desc      heightChangeOf(offset=2, heightValue=-1, normalTitleHeight=1920, expandTitleHeight=1080) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0115 begin`);
      const actual: number = heightChangeOf(2, -1, 1920, 1080);
      logInfo(`heightChangeOf(offset=2, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}HeightChangeOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0116
     * @tc.name      ExpandTitle_HeightChangeOf_0116
     * @tc.desc      heightChangeOf(offset=-1, heightValue=360, normalTitleHeight=1080, expandTitleHeight=100) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0116 begin`);
      const actual: number = heightChangeOf(-1, 360, 1080, 100);
      logInfo(`heightChangeOf(offset=-1, heightValue=360...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0117
     * @tc.name      ExpandTitle_HeightChangeOf_0117
     * @tc.desc      heightChangeOf(offset=100, heightValue=1920, normalTitleHeight=360, expandTitleHeight=1080) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0117 begin`);
      const actual: number = heightChangeOf(100, 1920, 360, 1080);
      logInfo(`heightChangeOf(offset=100, heightValue=19...: actual=${actual}`);
      expect(actual).assertEqual(-840);
      logInfo(`${BUNDLE}HeightChangeOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0118
     * @tc.name      ExpandTitle_HeightChangeOf_0118
     * @tc.desc      heightChangeOf(offset=50, heightValue=1, normalTitleHeight=1080, expandTitleHeight=360) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0118 begin`);
      const actual: number = heightChangeOf(50, 1, 1080, 360);
      logInfo(`heightChangeOf(offset=50, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}HeightChangeOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0119
     * @tc.name      ExpandTitle_HeightChangeOf_0119
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1080, normalTitleHeight=100, expandTitleHeight=1080) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0119 begin`);
      const actual: number = heightChangeOf(-1, 1080, 100, 1080);
      logInfo(`heightChangeOf(offset=-1, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0120
     * @tc.name      ExpandTitle_HeightChangeOf_0120
     * @tc.desc      heightChangeOf(offset=50, heightValue=-1, normalTitleHeight=1, expandTitleHeight=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0120 begin`);
      const actual: number = heightChangeOf(50, -1, 1, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0121
     * @tc.name      ExpandTitle_HeightChangeOf_0121
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=360, expandTitleHeight=720) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0121 begin`);
      const actual: number = heightChangeOf(-1, 0, 360, 720);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0122
     * @tc.name      ExpandTitle_HeightChangeOf_0122
     * @tc.desc      heightChangeOf(offset=1, heightValue=720, normalTitleHeight=1, expandTitleHeight=100) returns -620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0122 begin`);
      const actual: number = heightChangeOf(1, 720, 1, 100);
      logInfo(`heightChangeOf(offset=1, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(-620);
      logInfo(`${BUNDLE}HeightChangeOf_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0123
     * @tc.name      ExpandTitle_HeightChangeOf_0123
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=1080, expandTitleHeight=1920) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0123 begin`);
      const actual: number = heightChangeOf(-100, 100, 1080, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}HeightChangeOf_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0124
     * @tc.name      ExpandTitle_HeightChangeOf_0124
     * @tc.desc      heightChangeOf(offset=2, heightValue=360, normalTitleHeight=0, expandTitleHeight=0) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0124 begin`);
      const actual: number = heightChangeOf(2, 360, 0, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}HeightChangeOf_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0125
     * @tc.name      ExpandTitle_HeightChangeOf_0125
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=1080, expandTitleHeight=720) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0125 begin`);
      const actual: number = heightChangeOf(100, 720, 1080, 720);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0126
     * @tc.name      ExpandTitle_HeightChangeOf_0126
     * @tc.desc      heightChangeOf(offset=1, heightValue=1920, normalTitleHeight=-1, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0126 begin`);
      const actual: number = heightChangeOf(1, 1920, -1, 1920);
      logInfo(`heightChangeOf(offset=1, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0127
     * @tc.name      ExpandTitle_HeightChangeOf_0127
     * @tc.desc      heightChangeOf(offset=50, heightValue=1920, normalTitleHeight=100, expandTitleHeight=720) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0127 begin`);
      const actual: number = heightChangeOf(50, 1920, 100, 720);
      logInfo(`heightChangeOf(offset=50, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0128
     * @tc.name      ExpandTitle_HeightChangeOf_0128
     * @tc.desc      heightChangeOf(offset=3, heightValue=360, normalTitleHeight=720, expandTitleHeight=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0128 begin`);
      const actual: number = heightChangeOf(3, 360, 720, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0129
     * @tc.name      ExpandTitle_HeightChangeOf_0129
     * @tc.desc      heightChangeOf(offset=1, heightValue=720, normalTitleHeight=1920, expandTitleHeight=360) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0129 begin`);
      const actual: number = heightChangeOf(1, 720, 1920, 360);
      logInfo(`heightChangeOf(offset=1, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}HeightChangeOf_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0130
     * @tc.name      ExpandTitle_HeightChangeOf_0130
     * @tc.desc      heightChangeOf(offset=50, heightValue=720, normalTitleHeight=-1, expandTitleHeight=-1) returns -721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0130 begin`);
      const actual: number = heightChangeOf(50, 720, -1, -1);
      logInfo(`heightChangeOf(offset=50, heightValue=720...: actual=${actual}`);
      expect(actual).assertEqual(-721);
      logInfo(`${BUNDLE}HeightChangeOf_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0131
     * @tc.name      ExpandTitle_HeightChangeOf_0131
     * @tc.desc      heightChangeOf(offset=0, heightValue=0, normalTitleHeight=720, expandTitleHeight=0) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0131 begin`);
      const actual: number = heightChangeOf(0, 0, 720, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0132
     * @tc.name      ExpandTitle_HeightChangeOf_0132
     * @tc.desc      heightChangeOf(offset=-100, heightValue=-1, normalTitleHeight=0, expandTitleHeight=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0132 begin`);
      const actual: number = heightChangeOf(-100, -1, 0, 100);
      logInfo(`heightChangeOf(offset=-100, heightValue=-...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0133
     * @tc.name      ExpandTitle_HeightChangeOf_0133
     * @tc.desc      heightChangeOf(offset=-1, heightValue=720, normalTitleHeight=360, expandTitleHeight=1080) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0133 begin`);
      const actual: number = heightChangeOf(-1, 720, 360, 1080);
      logInfo(`heightChangeOf(offset=-1, heightValue=720...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0134
     * @tc.name      ExpandTitle_HeightChangeOf_0134
     * @tc.desc      heightChangeOf(offset=1, heightValue=1920, normalTitleHeight=100, expandTitleHeight=1080) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0134 begin`);
      const actual: number = heightChangeOf(1, 1920, 100, 1080);
      logInfo(`heightChangeOf(offset=1, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-840);
      logInfo(`${BUNDLE}HeightChangeOf_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0135
     * @tc.name      ExpandTitle_HeightChangeOf_0135
     * @tc.desc      heightChangeOf(offset=-100, heightValue=-1, normalTitleHeight=720, expandTitleHeight=1) returns 721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0135 begin`);
      const actual: number = heightChangeOf(-100, -1, 720, 1);
      logInfo(`heightChangeOf(offset=-100, heightValue=-...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}HeightChangeOf_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0136
     * @tc.name      ExpandTitle_HeightChangeOf_0136
     * @tc.desc      heightChangeOf(offset=50, heightValue=1080, normalTitleHeight=720, expandTitleHeight=1080) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0136 begin`);
      const actual: number = heightChangeOf(50, 1080, 720, 1080);
      logInfo(`heightChangeOf(offset=50, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0137
     * @tc.name      ExpandTitle_HeightChangeOf_0137
     * @tc.desc      heightChangeOf(offset=0, heightValue=720, normalTitleHeight=1920, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0137 begin`);
      const actual: number = heightChangeOf(0, 720, 1920, -1);
      logInfo(`heightChangeOf(offset=0, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}HeightChangeOf_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0138
     * @tc.name      ExpandTitle_HeightChangeOf_0138
     * @tc.desc      heightChangeOf(offset=3, heightValue=0, normalTitleHeight=720, expandTitleHeight=1080) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0138 begin`);
      const actual: number = heightChangeOf(3, 0, 720, 1080);
      logInfo(`heightChangeOf(offset=3, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0139
     * @tc.name      ExpandTitle_HeightChangeOf_0139
     * @tc.desc      heightChangeOf(offset=2, heightValue=1920, normalTitleHeight=1920, expandTitleHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0139 begin`);
      const actual: number = heightChangeOf(2, 1920, 1920, 1);
      logInfo(`heightChangeOf(offset=2, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0140
     * @tc.name      ExpandTitle_HeightChangeOf_0140
     * @tc.desc      heightChangeOf(offset=-100, heightValue=0, normalTitleHeight=1080, expandTitleHeight=720) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0140 begin`);
      const actual: number = heightChangeOf(-100, 0, 1080, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=0...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0141
     * @tc.name      ExpandTitle_HeightChangeOf_0141
     * @tc.desc      heightChangeOf(offset=50, heightValue=-1, normalTitleHeight=1920, expandTitleHeight=1920) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0141 begin`);
      const actual: number = heightChangeOf(50, -1, 1920, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(1921);
      logInfo(`${BUNDLE}HeightChangeOf_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0142
     * @tc.name      ExpandTitle_HeightChangeOf_0142
     * @tc.desc      heightChangeOf(offset=50, heightValue=1, normalTitleHeight=0, expandTitleHeight=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0142 begin`);
      const actual: number = heightChangeOf(50, 1, 0, 0);
      logInfo(`heightChangeOf(offset=50, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightChangeOf_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0143
     * @tc.name      ExpandTitle_HeightChangeOf_0143
     * @tc.desc      heightChangeOf(offset=0, heightValue=720, normalTitleHeight=1, expandTitleHeight=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0143 begin`);
      const actual: number = heightChangeOf(0, 720, 1, 720);
      logInfo(`heightChangeOf(offset=0, heightValue=720,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0144
     * @tc.name      ExpandTitle_HeightChangeOf_0144
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=720, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0144 begin`);
      const actual: number = heightChangeOf(100, 720, 720, 100);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0145
     * @tc.name      ExpandTitle_HeightChangeOf_0145
     * @tc.desc      heightChangeOf(offset=3, heightValue=100, normalTitleHeight=1, expandTitleHeight=1) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0145 begin`);
      const actual: number = heightChangeOf(3, 100, 1, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}HeightChangeOf_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0146
     * @tc.name      ExpandTitle_HeightChangeOf_0146
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1080, normalTitleHeight=1, expandTitleHeight=360) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0146 begin`);
      const actual: number = heightChangeOf(-100, 1080, 1, 360);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}HeightChangeOf_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0147
     * @tc.name      ExpandTitle_HeightChangeOf_0147
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=360, expandTitleHeight=-1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0147 begin`);
      const actual: number = heightChangeOf(-1, 0, 360, -1);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0148
     * @tc.name      ExpandTitle_HeightChangeOf_0148
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=0, expandTitleHeight=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0148 begin`);
      const actual: number = heightChangeOf(2, 0, 0, 100);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0149
     * @tc.name      ExpandTitle_HeightChangeOf_0149
     * @tc.desc      heightChangeOf(offset=2, heightValue=-1, normalTitleHeight=100, expandTitleHeight=100) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0149 begin`);
      const actual: number = heightChangeOf(2, -1, 100, 100);
      logInfo(`heightChangeOf(offset=2, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0150
     * @tc.name      ExpandTitle_HeightChangeOf_0150
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1, normalTitleHeight=1080, expandTitleHeight=360) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0150 begin`);
      const actual: number = heightChangeOf(-1, 1, 1080, 360);
      logInfo(`heightChangeOf(offset=-1, heightValue=1, ...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}HeightChangeOf_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0151
     * @tc.name      ExpandTitle_HeightChangeOf_0151
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=1920, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0151 begin`);
      const actual: number = heightChangeOf(0, 1080, 1920, -1);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}HeightChangeOf_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0152
     * @tc.name      ExpandTitle_HeightChangeOf_0152
     * @tc.desc      heightChangeOf(offset=3, heightValue=360, normalTitleHeight=1080, expandTitleHeight=1) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0152 begin`);
      const actual: number = heightChangeOf(3, 360, 1080, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0153
     * @tc.name      ExpandTitle_HeightChangeOf_0153
     * @tc.desc      heightChangeOf(offset=100, heightValue=1, normalTitleHeight=-1, expandTitleHeight=720) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0153 begin`);
      const actual: number = heightChangeOf(100, 1, -1, 720);
      logInfo(`heightChangeOf(offset=100, heightValue=1,...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightChangeOf_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0154
     * @tc.name      ExpandTitle_HeightChangeOf_0154
     * @tc.desc      heightChangeOf(offset=1, heightValue=-1, normalTitleHeight=720, expandTitleHeight=100) returns 721
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0154 begin`);
      const actual: number = heightChangeOf(1, -1, 720, 100);
      logInfo(`heightChangeOf(offset=1, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}HeightChangeOf_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0155
     * @tc.name      ExpandTitle_HeightChangeOf_0155
     * @tc.desc      heightChangeOf(offset=0, heightValue=360, normalTitleHeight=720, expandTitleHeight=1080) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0155 begin`);
      const actual: number = heightChangeOf(0, 360, 720, 1080);
      logInfo(`heightChangeOf(offset=0, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightChangeOf_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0156
     * @tc.name      ExpandTitle_HeightChangeOf_0156
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=1920, expandTitleHeight=360) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0156 begin`);
      const actual: number = heightChangeOf(-100, 100, 1920, 360);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}HeightChangeOf_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0157
     * @tc.name      ExpandTitle_HeightChangeOf_0157
     * @tc.desc      heightChangeOf(offset=1, heightValue=-1, normalTitleHeight=100, expandTitleHeight=1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0157 begin`);
      const actual: number = heightChangeOf(1, -1, 100, 1);
      logInfo(`heightChangeOf(offset=1, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0158
     * @tc.name      ExpandTitle_HeightChangeOf_0158
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=1080, expandTitleHeight=-1) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0158 begin`);
      const actual: number = heightChangeOf(-100, 1, 1080, -1);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}HeightChangeOf_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0159
     * @tc.name      ExpandTitle_HeightChangeOf_0159
     * @tc.desc      heightChangeOf(offset=-100, heightValue=-1, normalTitleHeight=100, expandTitleHeight=1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0159 begin`);
      const actual: number = heightChangeOf(-100, -1, 100, 1);
      logInfo(`heightChangeOf(offset=-100, heightValue=-...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}HeightChangeOf_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0160
     * @tc.name      ExpandTitle_HeightChangeOf_0160
     * @tc.desc      heightChangeOf(offset=0, heightValue=100, normalTitleHeight=0, expandTitleHeight=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0160 begin`);
      const actual: number = heightChangeOf(0, 100, 0, 100);
      logInfo(`heightChangeOf(offset=0, heightValue=100,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0161
     * @tc.name      ExpandTitle_HeightChangeOf_0161
     * @tc.desc      heightChangeOf(offset=1, heightValue=-1, normalTitleHeight=1, expandTitleHeight=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0161 begin`);
      const actual: number = heightChangeOf(1, -1, 1, -1);
      logInfo(`heightChangeOf(offset=1, heightValue=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightChangeOf_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0162
     * @tc.name      ExpandTitle_HeightChangeOf_0162
     * @tc.desc      heightChangeOf(offset=-1, heightValue=1080, normalTitleHeight=1, expandTitleHeight=1) returns -1079
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0162 begin`);
      const actual: number = heightChangeOf(-1, 1080, 1, 1);
      logInfo(`heightChangeOf(offset=-1, heightValue=108...: actual=${actual}`);
      expect(actual).assertEqual(-1079);
      logInfo(`${BUNDLE}HeightChangeOf_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0163
     * @tc.name      ExpandTitle_HeightChangeOf_0163
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=720, expandTitleHeight=360) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0163 begin`);
      const actual: number = heightChangeOf(2, 0, 720, 360);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0164
     * @tc.name      ExpandTitle_HeightChangeOf_0164
     * @tc.desc      heightChangeOf(offset=-1, heightValue=-1, normalTitleHeight=360, expandTitleHeight=1) returns 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0164 begin`);
      const actual: number = heightChangeOf(-1, -1, 360, 1);
      logInfo(`heightChangeOf(offset=-1, heightValue=-1,...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}HeightChangeOf_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0165
     * @tc.name      ExpandTitle_HeightChangeOf_0165
     * @tc.desc      heightChangeOf(offset=-100, heightValue=360, normalTitleHeight=-1, expandTitleHeight=1920) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0165 begin`);
      const actual: number = heightChangeOf(-100, 360, -1, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=3...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0166
     * @tc.name      ExpandTitle_HeightChangeOf_0166
     * @tc.desc      heightChangeOf(offset=50, heightValue=0, normalTitleHeight=-1, expandTitleHeight=360) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0166 begin`);
      const actual: number = heightChangeOf(50, 0, -1, 360);
      logInfo(`heightChangeOf(offset=50, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightChangeOf_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0167
     * @tc.name      ExpandTitle_HeightChangeOf_0167
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=0, expandTitleHeight=1080) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0167 begin`);
      const actual: number = heightChangeOf(-1, 0, 0, 1080);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0168
     * @tc.name      ExpandTitle_HeightChangeOf_0168
     * @tc.desc      heightChangeOf(offset=1, heightValue=360, normalTitleHeight=1, expandTitleHeight=720) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0168 begin`);
      const actual: number = heightChangeOf(1, 360, 1, 720);
      logInfo(`heightChangeOf(offset=1, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0169
     * @tc.name      ExpandTitle_HeightChangeOf_0169
     * @tc.desc      heightChangeOf(offset=0, heightValue=1080, normalTitleHeight=1920, expandTitleHeight=0) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0169 begin`);
      const actual: number = heightChangeOf(0, 1080, 1920, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=1080...: actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}HeightChangeOf_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0170
     * @tc.name      ExpandTitle_HeightChangeOf_0170
     * @tc.desc      heightChangeOf(offset=50, heightValue=100, normalTitleHeight=-1, expandTitleHeight=720) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0170 begin`);
      const actual: number = heightChangeOf(50, 100, -1, 720);
      logInfo(`heightChangeOf(offset=50, heightValue=100...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightChangeOf_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0171
     * @tc.name      ExpandTitle_HeightChangeOf_0171
     * @tc.desc      heightChangeOf(offset=2, heightValue=0, normalTitleHeight=1080, expandTitleHeight=0) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0171 begin`);
      const actual: number = heightChangeOf(2, 0, 1080, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=0, n...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0171 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0172
     * @tc.name      ExpandTitle_HeightChangeOf_0172
     * @tc.desc      heightChangeOf(offset=3, heightValue=1920, normalTitleHeight=720, expandTitleHeight=1) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0172 begin`);
      const actual: number = heightChangeOf(3, 1920, 720, 1);
      logInfo(`heightChangeOf(offset=3, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0173
     * @tc.name      ExpandTitle_HeightChangeOf_0173
     * @tc.desc      heightChangeOf(offset=0, heightValue=360, normalTitleHeight=-1, expandTitleHeight=0) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0173 begin`);
      const actual: number = heightChangeOf(0, 360, -1, 0);
      logInfo(`heightChangeOf(offset=0, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}HeightChangeOf_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0174
     * @tc.name      ExpandTitle_HeightChangeOf_0174
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=1080, expandTitleHeight=1920) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0174 begin`);
      const actual: number = heightChangeOf(-1, 0, 1080, 1920);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}HeightChangeOf_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0175
     * @tc.name      ExpandTitle_HeightChangeOf_0175
     * @tc.desc      heightChangeOf(offset=3, heightValue=1, normalTitleHeight=-1, expandTitleHeight=720) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0175 begin`);
      const actual: number = heightChangeOf(3, 1, -1, 720);
      logInfo(`heightChangeOf(offset=3, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}HeightChangeOf_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0176
     * @tc.name      ExpandTitle_HeightChangeOf_0176
     * @tc.desc      heightChangeOf(offset=1, heightValue=360, normalTitleHeight=0, expandTitleHeight=1080) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0176 begin`);
      const actual: number = heightChangeOf(1, 360, 0, 1080);
      logInfo(`heightChangeOf(offset=1, heightValue=360,...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightChangeOf_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0177
     * @tc.name      ExpandTitle_HeightChangeOf_0177
     * @tc.desc      heightChangeOf(offset=-100, heightValue=360, normalTitleHeight=100, expandTitleHeight=1080) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0177 begin`);
      const actual: number = heightChangeOf(-100, 360, 100, 1080);
      logInfo(`heightChangeOf(offset=-100, heightValue=3...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0178
     * @tc.name      ExpandTitle_HeightChangeOf_0178
     * @tc.desc      heightChangeOf(offset=2, heightValue=1920, normalTitleHeight=360, expandTitleHeight=0) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0178 begin`);
      const actual: number = heightChangeOf(2, 1920, 360, 0);
      logInfo(`heightChangeOf(offset=2, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1560);
      logInfo(`${BUNDLE}HeightChangeOf_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0179
     * @tc.name      ExpandTitle_HeightChangeOf_0179
     * @tc.desc      heightChangeOf(offset=100, heightValue=0, normalTitleHeight=1920, expandTitleHeight=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0179 begin`);
      const actual: number = heightChangeOf(100, 0, 1920, -1);
      logInfo(`heightChangeOf(offset=100, heightValue=0,...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}HeightChangeOf_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0180
     * @tc.name      ExpandTitle_HeightChangeOf_0180
     * @tc.desc      heightChangeOf(offset=3, heightValue=1920, normalTitleHeight=720, expandTitleHeight=0) returns -...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0180 begin`);
      const actual: number = heightChangeOf(3, 1920, 720, 0);
      logInfo(`heightChangeOf(offset=3, heightValue=1920...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0181
     * @tc.name      ExpandTitle_HeightChangeOf_0181
     * @tc.desc      heightChangeOf(offset=2, heightValue=1, normalTitleHeight=100, expandTitleHeight=-1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0181 begin`);
      const actual: number = heightChangeOf(2, 1, 100, -1);
      logInfo(`heightChangeOf(offset=2, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}HeightChangeOf_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0182
     * @tc.name      ExpandTitle_HeightChangeOf_0182
     * @tc.desc      heightChangeOf(offset=-1, heightValue=0, normalTitleHeight=720, expandTitleHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0182 begin`);
      const actual: number = heightChangeOf(-1, 0, 720, 720);
      logInfo(`heightChangeOf(offset=-1, heightValue=0, ...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0183
     * @tc.name      ExpandTitle_HeightChangeOf_0183
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1, normalTitleHeight=720, expandTitleHeight=-1) returns 719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0183 begin`);
      const actual: number = heightChangeOf(-100, 1, 720, -1);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(719);
      logInfo(`${BUNDLE}HeightChangeOf_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0184
     * @tc.name      ExpandTitle_HeightChangeOf_0184
     * @tc.desc      heightChangeOf(offset=-100, heightValue=360, normalTitleHeight=1080, expandTitleHeight=1080) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0184 begin`);
      const actual: number = heightChangeOf(-100, 360, 1080, 1080);
      logInfo(`heightChangeOf(offset=-100, heightValue=3...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightChangeOf_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0185
     * @tc.name      ExpandTitle_HeightChangeOf_0185
     * @tc.desc      heightChangeOf(offset=3, heightValue=1, normalTitleHeight=1080, expandTitleHeight=360) returns 1079
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0185 begin`);
      const actual: number = heightChangeOf(3, 1, 1080, 360);
      logInfo(`heightChangeOf(offset=3, heightValue=1, n...: actual=${actual}`);
      expect(actual).assertEqual(1079);
      logInfo(`${BUNDLE}HeightChangeOf_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0186
     * @tc.name      ExpandTitle_HeightChangeOf_0186
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1920, normalTitleHeight=360, expandTitleHeight=720) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0186 begin`);
      const actual: number = heightChangeOf(-100, 1920, 360, 720);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}HeightChangeOf_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0187
     * @tc.name      ExpandTitle_HeightChangeOf_0187
     * @tc.desc      heightChangeOf(offset=50, heightValue=1920, normalTitleHeight=-1, expandTitleHeight=1920) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0187 begin`);
      const actual: number = heightChangeOf(50, 1920, -1, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=192...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0188
     * @tc.name      ExpandTitle_HeightChangeOf_0188
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=100, expandTitleHeight=100) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0188 begin`);
      const actual: number = heightChangeOf(-100, 100, 100, 100);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0189
     * @tc.name      ExpandTitle_HeightChangeOf_0189
     * @tc.desc      heightChangeOf(offset=100, heightValue=720, normalTitleHeight=720, expandTitleHeight=720) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0189 begin`);
      const actual: number = heightChangeOf(100, 720, 720, 720);
      logInfo(`heightChangeOf(offset=100, heightValue=72...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightChangeOf_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0190
     * @tc.name      ExpandTitle_HeightChangeOf_0190
     * @tc.desc      heightChangeOf(offset=-100, heightValue=100, normalTitleHeight=1920, expandTitleHeight=1) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0190 begin`);
      const actual: number = heightChangeOf(-100, 100, 1920, 1);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(1820);
      logInfo(`${BUNDLE}HeightChangeOf_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0191
     * @tc.name      ExpandTitle_HeightChangeOf_0191
     * @tc.desc      heightChangeOf(offset=50, heightValue=720, normalTitleHeight=360, expandTitleHeight=1920) return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_HeightChangeOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0191 begin`);
      const actual: number = heightChangeOf(50, 720, 360, 1920);
      logInfo(`heightChangeOf(offset=50, heightValue=720...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightChangeOf_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_HEIGHT_CHANGE_OF_0192
     * @tc.name      ExpandTitle_HeightChangeOf_0192
     * @tc.desc      heightChangeOf(offset=-100, heightValue=1920, normalTitleHeight=1080, expandTitleHeight=1920) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_HeightChangeOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeightChangeOf_0192 begin`);
      const actual: number = heightChangeOf(-100, 1920, 1080, 1920);
      logInfo(`heightChangeOf(offset=-100, heightValue=1...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}HeightChangeOf_0192 end`);
    });
  });
}
