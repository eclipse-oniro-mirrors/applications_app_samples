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
import { playSecondsOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for playSecondsOf (96 cases). */
export default function playSecondsOf2Test(): void {
  describe('PlaySecondsOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0097
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0097
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=106, totalTime=3600000) returns -47369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0097 begin`);
      const actual: number = playSecondsOf(-1, 106, 3600000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(-47369);
      logInfo(`${BUNDLE}PlaySecondsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0098
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0098
     * @tc.desc      playSecondsOf(offsetX=50, screenW=25, totalTime=500) returns -5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0098 begin`);
      const actual: number = playSecondsOf(50, 25, 500);
      logInfo(`playSecondsOf(offsetX=50, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-5000);
      logInfo(`${BUNDLE}PlaySecondsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0099
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0099
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=15, totalTime=999) returns 6660
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0099 begin`);
      const actual: number = playSecondsOf(-100, 15, 999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=15, t...: actual=${actual}`);
      expect(actual).assertEqual(6660);
      logInfo(`${BUNDLE}PlaySecondsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0100
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0100
     * @tc.desc      playSecondsOf(offsetX=50, screenW=106, totalTime=3599000) returns 2367763
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0100 begin`);
      const actual: number = playSecondsOf(50, 106, 3599000);
      logInfo(`playSecondsOf(offsetX=50, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(2367763);
      logInfo(`${BUNDLE}PlaySecondsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0101
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0101
     * @tc.desc      playSecondsOf(offsetX=34, screenW=0, totalTime=3600000) returns -4080000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0101 begin`);
      const actual: number = playSecondsOf(34, 0, 3600000);
      logInfo(`playSecondsOf(offsetX=34, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-4080000);
      logInfo(`${BUNDLE}PlaySecondsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0102
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0102
     * @tc.desc      playSecondsOf(offsetX=34, screenW=2, totalTime=500) returns -608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0102 begin`);
      const actual: number = playSecondsOf(34, 2, 500);
      logInfo(`playSecondsOf(offsetX=34, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-608);
      logInfo(`${BUNDLE}PlaySecondsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0103
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0103
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=2, totalTime=60000) returns 2142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0103 begin`);
      const actual: number = playSecondsOf(-1, 2, 60000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(2142);
      logInfo(`${BUNDLE}PlaySecondsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0104
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0104
     * @tc.desc      playSecondsOf(offsetX=2, screenW=15, totalTime=60000) returns -8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0104 begin`);
      const actual: number = playSecondsOf(2, 15, 60000);
      logInfo(`playSecondsOf(offsetX=2, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertEqual(-8000);
      logInfo(`${BUNDLE}PlaySecondsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0105
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0105
     * @tc.desc      playSecondsOf(offsetX=15, screenW=20, totalTime=999) returns -1499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0105 begin`);
      const actual: number = playSecondsOf(15, 20, 999);
      logInfo(`playSecondsOf(offsetX=15, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1499);
      logInfo(`${BUNDLE}PlaySecondsOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0106
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0106
     * @tc.desc      playSecondsOf(offsetX=15, screenW=25, totalTime=3600000) returns -10800000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0106 begin`);
      const actual: number = playSecondsOf(15, 25, 3600000);
      logInfo(`playSecondsOf(offsetX=15, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-10800000);
      logInfo(`${BUNDLE}PlaySecondsOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0107
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0107
     * @tc.desc      playSecondsOf(offsetX=2, screenW=106, totalTime=59999) returns 1578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0107 begin`);
      const actual: number = playSecondsOf(2, 106, 59999);
      logInfo(`playSecondsOf(offsetX=2, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(1578);
      logInfo(`${BUNDLE}PlaySecondsOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0108
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0108
     * @tc.desc      playSecondsOf(offsetX=34, screenW=106, totalTime=999) returns 446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0108 begin`);
      const actual: number = playSecondsOf(34, 106, 999);
      logInfo(`playSecondsOf(offsetX=34, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(446);
      logInfo(`${BUNDLE}PlaySecondsOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0109
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0109
     * @tc.desc      playSecondsOf(offsetX=100, screenW=-1, totalTime=999) returns -3223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0109 begin`);
      const actual: number = playSecondsOf(100, -1, 999);
      logInfo(`playSecondsOf(offsetX=100, screenW=-1, to...: actual=${actual}`);
      expect(actual).assertEqual(-3223);
      logInfo(`${BUNDLE}PlaySecondsOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0110
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0110
     * @tc.desc      playSecondsOf(offsetX=5, screenW=106, totalTime=1000) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0110 begin`);
      const actual: number = playSecondsOf(5, 106, 1000);
      logInfo(`playSecondsOf(offsetX=5, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}PlaySecondsOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0111
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0111
     * @tc.desc      playSecondsOf(offsetX=2, screenW=10, totalTime=3600000) returns -360000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0111 begin`);
      const actual: number = playSecondsOf(2, 10, 3600000);
      logInfo(`playSecondsOf(offsetX=2, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(-360000);
      logInfo(`${BUNDLE}PlaySecondsOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0112
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0112
     * @tc.desc      playSecondsOf(offsetX=15, screenW=10, totalTime=3599000) returns -2699250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0112 begin`);
      const actual: number = playSecondsOf(15, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=15, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-2699250);
      logInfo(`${BUNDLE}PlaySecondsOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0113
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0113
     * @tc.desc      playSecondsOf(offsetX=100, screenW=106, totalTime=500) returns 657
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0113 begin`);
      const actual: number = playSecondsOf(100, 106, 500);
      logInfo(`playSecondsOf(offsetX=100, screenW=106, t...: actual=${actual}`);
      expect(actual).assertEqual(657);
      logInfo(`${BUNDLE}PlaySecondsOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0114
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0114
     * @tc.desc      playSecondsOf(offsetX=50, screenW=106, totalTime=500) returns 328
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0114 begin`);
      const actual: number = playSecondsOf(50, 106, 500);
      logInfo(`playSecondsOf(offsetX=50, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(328);
      logInfo(`${BUNDLE}PlaySecondsOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0115
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0115
     * @tc.desc      playSecondsOf(offsetX=10, screenW=0, totalTime=3600000) returns -1200000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0115 begin`);
      const actual: number = playSecondsOf(10, 0, 3600000);
      logInfo(`playSecondsOf(offsetX=10, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1200000);
      logInfo(`${BUNDLE}PlaySecondsOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0116
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0116
     * @tc.desc      playSecondsOf(offsetX=3, screenW=-1, totalTime=3600000) returns -348388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0116 begin`);
      const actual: number = playSecondsOf(3, -1, 3600000);
      logInfo(`playSecondsOf(offsetX=3, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-348388);
      logInfo(`${BUNDLE}PlaySecondsOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0117
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0117
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=15, totalTime=3600000) returns 240000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0117 begin`);
      const actual: number = playSecondsOf(-1, 15, 3600000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(240000);
      logInfo(`${BUNDLE}PlaySecondsOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0118
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0118
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=1, totalTime=3599000) returns 124103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0118 begin`);
      const actual: number = playSecondsOf(-1, 1, 3599000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=1, tota...: actual=${actual}`);
      expect(actual).assertEqual(124103);
      logInfo(`${BUNDLE}PlaySecondsOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0119
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0119
     * @tc.desc      playSecondsOf(offsetX=34, screenW=100, totalTime=1000) returns 485
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0119 begin`);
      const actual: number = playSecondsOf(34, 100, 1000);
      logInfo(`playSecondsOf(offsetX=34, screenW=100, to...: actual=${actual}`);
      expect(actual).assertEqual(485);
      logInfo(`${BUNDLE}PlaySecondsOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0120
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0120
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=0, totalTime=61000) returns 2033
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0120 begin`);
      const actual: number = playSecondsOf(-1, 0, 61000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(2033);
      logInfo(`${BUNDLE}PlaySecondsOf_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0121
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0121
     * @tc.desc      playSecondsOf(offsetX=100, screenW=106, totalTime=1000) returns 1315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0121 begin`);
      const actual: number = playSecondsOf(100, 106, 1000);
      logInfo(`playSecondsOf(offsetX=100, screenW=106, t...: actual=${actual}`);
      expect(actual).assertEqual(1315);
      logInfo(`${BUNDLE}PlaySecondsOf_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0122
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0122
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=25, totalTime=3600000) returns 720000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0122 begin`);
      const actual: number = playSecondsOf(-1, 25, 3600000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(720000);
      logInfo(`${BUNDLE}PlaySecondsOf_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0123
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0123
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=1, totalTime=3600000) returns 12413793
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0123 begin`);
      const actual: number = playSecondsOf(-100, 1, 3600000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=1, to...: actual=${actual}`);
      expect(actual).assertEqual(12413793);
      logInfo(`${BUNDLE}PlaySecondsOf_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0124
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0124
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=20, totalTime=500) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0124 begin`);
      const actual: number = playSecondsOf(-1, 20, 500);
      logInfo(`playSecondsOf(offsetX=-1, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}PlaySecondsOf_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0125
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0125
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=15, totalTime=59999) returns 3999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0125 begin`);
      const actual: number = playSecondsOf(-1, 15, 59999);
      logInfo(`playSecondsOf(offsetX=-1, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(3999);
      logInfo(`${BUNDLE}PlaySecondsOf_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0126
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0126
     * @tc.desc      playSecondsOf(offsetX=100, screenW=5, totalTime=3600000) returns -14400000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0126 begin`);
      const actual: number = playSecondsOf(100, 5, 3600000);
      logInfo(`playSecondsOf(offsetX=100, screenW=5, tot...: actual=${actual}`);
      expect(actual).assertEqual(-14400000);
      logInfo(`${BUNDLE}PlaySecondsOf_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0127
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0127
     * @tc.desc      playSecondsOf(offsetX=15, screenW=-1, totalTime=61000) returns -29517
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0127 begin`);
      const actual: number = playSecondsOf(15, -1, 61000);
      logInfo(`playSecondsOf(offsetX=15, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-29517);
      logInfo(`${BUNDLE}PlaySecondsOf_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0128
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0128
     * @tc.desc      playSecondsOf(offsetX=3, screenW=-1, totalTime=500) returns -49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0128 begin`);
      const actual: number = playSecondsOf(3, -1, 500);
      logInfo(`playSecondsOf(offsetX=3, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-49);
      logInfo(`${BUNDLE}PlaySecondsOf_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0129
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0129
     * @tc.desc      playSecondsOf(offsetX=3, screenW=0, totalTime=59999) returns -6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0129 begin`);
      const actual: number = playSecondsOf(3, 0, 59999);
      logInfo(`playSecondsOf(offsetX=3, screenW=0, total...: actual=${actual}`);
      expect(actual).assertEqual(-6000);
      logInfo(`${BUNDLE}PlaySecondsOf_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0130
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0130
     * @tc.desc      playSecondsOf(offsetX=34, screenW=25, totalTime=61000) returns -414800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0130 begin`);
      const actual: number = playSecondsOf(34, 25, 61000);
      logInfo(`playSecondsOf(offsetX=34, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-414800);
      logInfo(`${BUNDLE}PlaySecondsOf_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0131
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0131
     * @tc.desc      playSecondsOf(offsetX=3, screenW=106, totalTime=61000) returns 2407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0131 begin`);
      const actual: number = playSecondsOf(3, 106, 61000);
      logInfo(`playSecondsOf(offsetX=3, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(2407);
      logInfo(`${BUNDLE}PlaySecondsOf_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0132
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0132
     * @tc.desc      playSecondsOf(offsetX=34, screenW=1, totalTime=999) returns -1172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0132 begin`);
      const actual: number = playSecondsOf(34, 1, 999);
      logInfo(`playSecondsOf(offsetX=34, screenW=1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1172);
      logInfo(`${BUNDLE}PlaySecondsOf_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0133
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0133
     * @tc.desc      playSecondsOf(offsetX=5, screenW=3, totalTime=1000) returns -186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0133 begin`);
      const actual: number = playSecondsOf(5, 3, 1000);
      logInfo(`playSecondsOf(offsetX=5, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(-186);
      logInfo(`${BUNDLE}PlaySecondsOf_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0134
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0134
     * @tc.desc      playSecondsOf(offsetX=2, screenW=5, totalTime=3600000) returns -288000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0134 begin`);
      const actual: number = playSecondsOf(2, 5, 3600000);
      logInfo(`playSecondsOf(offsetX=2, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(-288000);
      logInfo(`${BUNDLE}PlaySecondsOf_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0135
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0135
     * @tc.desc      playSecondsOf(offsetX=3, screenW=1, totalTime=3599000) returns -372311
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0135 begin`);
      const actual: number = playSecondsOf(3, 1, 3599000);
      logInfo(`playSecondsOf(offsetX=3, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-372311);
      logInfo(`${BUNDLE}PlaySecondsOf_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0136
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0136
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=2, totalTime=61000) returns 217857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0136 begin`);
      const actual: number = playSecondsOf(-100, 2, 61000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=2, to...: actual=${actual}`);
      expect(actual).assertEqual(217857);
      logInfo(`${BUNDLE}PlaySecondsOf_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0137
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0137
     * @tc.desc      playSecondsOf(offsetX=10, screenW=5, totalTime=60000) returns -24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0137 begin`);
      const actual: number = playSecondsOf(10, 5, 60000);
      logInfo(`playSecondsOf(offsetX=10, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-24000);
      logInfo(`${BUNDLE}PlaySecondsOf_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0138
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0138
     * @tc.desc      playSecondsOf(offsetX=15, screenW=1, totalTime=1000) returns -518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0138 begin`);
      const actual: number = playSecondsOf(15, 1, 1000);
      logInfo(`playSecondsOf(offsetX=15, screenW=1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-518);
      logInfo(`${BUNDLE}PlaySecondsOf_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0139
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0139
     * @tc.desc      playSecondsOf(offsetX=50, screenW=5, totalTime=61000) returns -122000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0139 begin`);
      const actual: number = playSecondsOf(50, 5, 61000);
      logInfo(`playSecondsOf(offsetX=50, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-122000);
      logInfo(`${BUNDLE}PlaySecondsOf_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0140
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0140
     * @tc.desc      playSecondsOf(offsetX=5, screenW=25, totalTime=3599000) returns -3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0140 begin`);
      const actual: number = playSecondsOf(5, 25, 3599000);
      logInfo(`playSecondsOf(offsetX=5, screenW=25, tota...: actual=${actual}`);
      expect(actual).assertEqual(-3599000);
      logInfo(`${BUNDLE}PlaySecondsOf_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0141
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0141
     * @tc.desc      playSecondsOf(offsetX=34, screenW=15, totalTime=3600000) returns -8160000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0141 begin`);
      const actual: number = playSecondsOf(34, 15, 3600000);
      logInfo(`playSecondsOf(offsetX=34, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(-8160000);
      logInfo(`${BUNDLE}PlaySecondsOf_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0142
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0142
     * @tc.desc      playSecondsOf(offsetX=50, screenW=15, totalTime=61000) returns -203334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0142 begin`);
      const actual: number = playSecondsOf(50, 15, 61000);
      logInfo(`playSecondsOf(offsetX=50, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(-203334);
      logInfo(`${BUNDLE}PlaySecondsOf_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0143
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0143
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=106, totalTime=3599000) returns -4735527
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0143 begin`);
      const actual: number = playSecondsOf(-100, 106, 3599000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=106, ...: actual=${actual}`);
      expect(actual).assertEqual(-4735527);
      logInfo(`${BUNDLE}PlaySecondsOf_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0144
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0144
     * @tc.desc      playSecondsOf(offsetX=5, screenW=106, totalTime=61000) returns 4013
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0144 begin`);
      const actual: number = playSecondsOf(5, 106, 61000);
      logInfo(`playSecondsOf(offsetX=5, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(4013);
      logInfo(`${BUNDLE}PlaySecondsOf_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0145
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0145
     * @tc.desc      playSecondsOf(offsetX=2, screenW=106, totalTime=999) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0145 begin`);
      const actual: number = playSecondsOf(2, 106, 999);
      logInfo(`playSecondsOf(offsetX=2, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}PlaySecondsOf_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0146
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0146
     * @tc.desc      playSecondsOf(offsetX=1, screenW=10, totalTime=3599000) returns -179950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0146 begin`);
      const actual: number = playSecondsOf(1, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=1, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(-179950);
      logInfo(`${BUNDLE}PlaySecondsOf_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0147
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0147
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=10, totalTime=3600000) returns 180000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0147 begin`);
      const actual: number = playSecondsOf(-1, 10, 3600000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(180000);
      logInfo(`${BUNDLE}PlaySecondsOf_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0148
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0148
     * @tc.desc      playSecondsOf(offsetX=50, screenW=1, totalTime=3600000) returns -6206897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0148 begin`);
      const actual: number = playSecondsOf(50, 1, 3600000);
      logInfo(`playSecondsOf(offsetX=50, screenW=1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-6206897);
      logInfo(`${BUNDLE}PlaySecondsOf_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0149
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0149
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=5, totalTime=999) returns 3996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0149 begin`);
      const actual: number = playSecondsOf(-100, 5, 999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=5, to...: actual=${actual}`);
      expect(actual).assertEqual(3996);
      logInfo(`${BUNDLE}PlaySecondsOf_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0150
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0150
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=10, totalTime=3599000) returns 17995000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0150 begin`);
      const actual: number = playSecondsOf(-100, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=10, t...: actual=${actual}`);
      expect(actual).assertEqual(17995000);
      logInfo(`${BUNDLE}PlaySecondsOf_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0151
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0151
     * @tc.desc      playSecondsOf(offsetX=5, screenW=106, totalTime=3600000) returns 236842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0151 begin`);
      const actual: number = playSecondsOf(5, 106, 3600000);
      logInfo(`playSecondsOf(offsetX=5, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(236842);
      logInfo(`${BUNDLE}PlaySecondsOf_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0152
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0152
     * @tc.desc      playSecondsOf(offsetX=1, screenW=15, totalTime=59999) returns -4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0152 begin`);
      const actual: number = playSecondsOf(1, 15, 59999);
      logInfo(`playSecondsOf(offsetX=1, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertEqual(-4000);
      logInfo(`${BUNDLE}PlaySecondsOf_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0153
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0153
     * @tc.desc      playSecondsOf(offsetX=10, screenW=15, totalTime=3600000) returns -2400000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0153 begin`);
      const actual: number = playSecondsOf(10, 15, 3600000);
      logInfo(`playSecondsOf(offsetX=10, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(-2400000);
      logInfo(`${BUNDLE}PlaySecondsOf_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0154
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0154
     * @tc.desc      playSecondsOf(offsetX=10, screenW=100, totalTime=500) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0154 begin`);
      const actual: number = playSecondsOf(10, 100, 500);
      logInfo(`playSecondsOf(offsetX=10, screenW=100, to...: actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}PlaySecondsOf_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0155
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0155
     * @tc.desc      playSecondsOf(offsetX=1, screenW=3, totalTime=999) returns -37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0155 begin`);
      const actual: number = playSecondsOf(1, 3, 999);
      logInfo(`playSecondsOf(offsetX=1, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(-37);
      logInfo(`${BUNDLE}PlaySecondsOf_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0156
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0156
     * @tc.desc      playSecondsOf(offsetX=100, screenW=20, totalTime=61000) returns -610000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0156 begin`);
      const actual: number = playSecondsOf(100, 20, 61000);
      logInfo(`playSecondsOf(offsetX=100, screenW=20, to...: actual=${actual}`);
      expect(actual).assertEqual(-610000);
      logInfo(`${BUNDLE}PlaySecondsOf_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0157
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0157
     * @tc.desc      playSecondsOf(offsetX=34, screenW=20, totalTime=59999) returns -203997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0157 begin`);
      const actual: number = playSecondsOf(34, 20, 59999);
      logInfo(`playSecondsOf(offsetX=34, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-203997);
      logInfo(`${BUNDLE}PlaySecondsOf_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0158
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0158
     * @tc.desc      playSecondsOf(offsetX=1, screenW=1, totalTime=3600000) returns -124138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0158 begin`);
      const actual: number = playSecondsOf(1, 1, 3600000);
      logInfo(`playSecondsOf(offsetX=1, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-124138);
      logInfo(`${BUNDLE}PlaySecondsOf_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0159
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0159
     * @tc.desc      playSecondsOf(offsetX=1, screenW=-1, totalTime=61000) returns -1968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0159 begin`);
      const actual: number = playSecondsOf(1, -1, 61000);
      logInfo(`playSecondsOf(offsetX=1, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1968);
      logInfo(`${BUNDLE}PlaySecondsOf_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0160
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0160
     * @tc.desc      playSecondsOf(offsetX=100, screenW=0, totalTime=500) returns -1667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0160 begin`);
      const actual: number = playSecondsOf(100, 0, 500);
      logInfo(`playSecondsOf(offsetX=100, screenW=0, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1667);
      logInfo(`${BUNDLE}PlaySecondsOf_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0161
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0161
     * @tc.desc      playSecondsOf(offsetX=10, screenW=106, totalTime=60000) returns 7894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0161 begin`);
      const actual: number = playSecondsOf(10, 106, 60000);
      logInfo(`playSecondsOf(offsetX=10, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(7894);
      logInfo(`${BUNDLE}PlaySecondsOf_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0162
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0162
     * @tc.desc      playSecondsOf(offsetX=3, screenW=25, totalTime=60000) returns -36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0162 begin`);
      const actual: number = playSecondsOf(3, 25, 60000);
      logInfo(`playSecondsOf(offsetX=3, screenW=25, tota...: actual=${actual}`);
      expect(actual).assertEqual(-36000);
      logInfo(`${BUNDLE}PlaySecondsOf_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0163
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0163
     * @tc.desc      playSecondsOf(offsetX=10, screenW=3, totalTime=3600000) returns -1333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0163 begin`);
      const actual: number = playSecondsOf(10, 3, 3600000);
      logInfo(`playSecondsOf(offsetX=10, screenW=3, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1333334);
      logInfo(`${BUNDLE}PlaySecondsOf_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0164
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0164
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=25, totalTime=2) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0164 begin`);
      const actual: number = playSecondsOf(-100, 25, 2);
      logInfo(`playSecondsOf(offsetX=-100, screenW=25, t...: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}PlaySecondsOf_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0165
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0165
     * @tc.desc      playSecondsOf(offsetX=34, screenW=2, totalTime=3599000) returns -4370215
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0165 begin`);
      const actual: number = playSecondsOf(34, 2, 3599000);
      logInfo(`playSecondsOf(offsetX=34, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-4370215);
      logInfo(`${BUNDLE}PlaySecondsOf_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0166
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0166
     * @tc.desc      playSecondsOf(offsetX=2, screenW=3, totalTime=3599000) returns -266593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0166 begin`);
      const actual: number = playSecondsOf(2, 3, 3599000);
      logInfo(`playSecondsOf(offsetX=2, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(-266593);
      logInfo(`${BUNDLE}PlaySecondsOf_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0167
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0167
     * @tc.desc      playSecondsOf(offsetX=100, screenW=20, totalTime=60000) returns -600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0167 begin`);
      const actual: number = playSecondsOf(100, 20, 60000);
      logInfo(`playSecondsOf(offsetX=100, screenW=20, to...: actual=${actual}`);
      expect(actual).assertEqual(-600000);
      logInfo(`${BUNDLE}PlaySecondsOf_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0168
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0168
     * @tc.desc      playSecondsOf(offsetX=50, screenW=2, totalTime=1000) returns -1786
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0168 begin`);
      const actual: number = playSecondsOf(50, 2, 1000);
      logInfo(`playSecondsOf(offsetX=50, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1786);
      logInfo(`${BUNDLE}PlaySecondsOf_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0169
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0169
     * @tc.desc      playSecondsOf(offsetX=15, screenW=0, totalTime=61000) returns -30500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0169 begin`);
      const actual: number = playSecondsOf(15, 0, 61000);
      logInfo(`playSecondsOf(offsetX=15, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-30500);
      logInfo(`${BUNDLE}PlaySecondsOf_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0170
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0170
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=3, totalTime=2) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0170 begin`);
      const actual: number = playSecondsOf(-100, 3, 2);
      logInfo(`playSecondsOf(offsetX=-100, screenW=3, to...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}PlaySecondsOf_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0171
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0171
     * @tc.desc      playSecondsOf(offsetX=50, screenW=106, totalTime=3600000) returns 2368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0171 begin`);
      const actual: number = playSecondsOf(50, 106, 3600000);
      logInfo(`playSecondsOf(offsetX=50, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(2368421);
      logInfo(`${BUNDLE}PlaySecondsOf_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0172
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0172
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=0, totalTime=60000) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0172 begin`);
      const actual: number = playSecondsOf(-1, 0, 60000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}PlaySecondsOf_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0173
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0173
     * @tc.desc      playSecondsOf(offsetX=5, screenW=20, totalTime=3600000) returns -1800000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0173 begin`);
      const actual: number = playSecondsOf(5, 20, 3600000);
      logInfo(`playSecondsOf(offsetX=5, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1800000);
      logInfo(`${BUNDLE}PlaySecondsOf_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0174
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0174
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=25, totalTime=1) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0174 begin`);
      const actual: number = playSecondsOf(-100, 25, 1);
      logInfo(`playSecondsOf(offsetX=-100, screenW=25, t...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}PlaySecondsOf_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0175
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0175
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=10, totalTime=61000) returns 3050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0175 begin`);
      const actual: number = playSecondsOf(-1, 10, 61000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(3050);
      logInfo(`${BUNDLE}PlaySecondsOf_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0176
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0176
     * @tc.desc      playSecondsOf(offsetX=50, screenW=-1, totalTime=59999) returns -96773
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0176 begin`);
      const actual: number = playSecondsOf(50, -1, 59999);
      logInfo(`playSecondsOf(offsetX=50, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-96773);
      logInfo(`${BUNDLE}PlaySecondsOf_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0177
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0177
     * @tc.desc      playSecondsOf(offsetX=3, screenW=-1, totalTime=999) returns -97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0177 begin`);
      const actual: number = playSecondsOf(3, -1, 999);
      logInfo(`playSecondsOf(offsetX=3, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}PlaySecondsOf_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0178
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0178
     * @tc.desc      playSecondsOf(offsetX=100, screenW=25, totalTime=3599000) returns -71980000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0178 begin`);
      const actual: number = playSecondsOf(100, 25, 3599000);
      logInfo(`playSecondsOf(offsetX=100, screenW=25, to...: actual=${actual}`);
      expect(actual).assertEqual(-71980000);
      logInfo(`${BUNDLE}PlaySecondsOf_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0179
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0179
     * @tc.desc      playSecondsOf(offsetX=34, screenW=20, totalTime=500) returns -1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0179 begin`);
      const actual: number = playSecondsOf(34, 20, 500);
      logInfo(`playSecondsOf(offsetX=34, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1700);
      logInfo(`${BUNDLE}PlaySecondsOf_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0180
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0180
     * @tc.desc      playSecondsOf(offsetX=50, screenW=3, totalTime=999) returns -1850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0180 begin`);
      const actual: number = playSecondsOf(50, 3, 999);
      logInfo(`playSecondsOf(offsetX=50, screenW=3, tota...: actual=${actual}`);
      expect(actual).assertEqual(-1850);
      logInfo(`${BUNDLE}PlaySecondsOf_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0181
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0181
     * @tc.desc      playSecondsOf(offsetX=34, screenW=10, totalTime=59999) returns -101999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0181 begin`);
      const actual: number = playSecondsOf(34, 10, 59999);
      logInfo(`playSecondsOf(offsetX=34, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-101999);
      logInfo(`${BUNDLE}PlaySecondsOf_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0182
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0182
     * @tc.desc      playSecondsOf(offsetX=1, screenW=25, totalTime=3599000) returns -719800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0182 begin`);
      const actual: number = playSecondsOf(1, 25, 3599000);
      logInfo(`playSecondsOf(offsetX=1, screenW=25, tota...: actual=${actual}`);
      expect(actual).assertEqual(-719800);
      logInfo(`${BUNDLE}PlaySecondsOf_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0183
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0183
     * @tc.desc      playSecondsOf(offsetX=15, screenW=2, totalTime=999) returns -536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0183 begin`);
      const actual: number = playSecondsOf(15, 2, 999);
      logInfo(`playSecondsOf(offsetX=15, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-536);
      logInfo(`${BUNDLE}PlaySecondsOf_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0184
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0184
     * @tc.desc      playSecondsOf(offsetX=34, screenW=-1, totalTime=999) returns -1096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0184 begin`);
      const actual: number = playSecondsOf(34, -1, 999);
      logInfo(`playSecondsOf(offsetX=34, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1096);
      logInfo(`${BUNDLE}PlaySecondsOf_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0185
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0185
     * @tc.desc      playSecondsOf(offsetX=15, screenW=106, totalTime=61000) returns 12039
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0185 begin`);
      const actual: number = playSecondsOf(15, 106, 61000);
      logInfo(`playSecondsOf(offsetX=15, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(12039);
      logInfo(`${BUNDLE}PlaySecondsOf_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0186
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0186
     * @tc.desc      playSecondsOf(offsetX=100, screenW=5, totalTime=59999) returns -239996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0186 begin`);
      const actual: number = playSecondsOf(100, 5, 59999);
      logInfo(`playSecondsOf(offsetX=100, screenW=5, tot...: actual=${actual}`);
      expect(actual).assertEqual(-239996);
      logInfo(`${BUNDLE}PlaySecondsOf_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0187
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0187
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=2, totalTime=3599000) returns 12853571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0187 begin`);
      const actual: number = playSecondsOf(-100, 2, 3599000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=2, to...: actual=${actual}`);
      expect(actual).assertEqual(12853571);
      logInfo(`${BUNDLE}PlaySecondsOf_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0188
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0188
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=-1, totalTime=60000) returns 193548
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0188 begin`);
      const actual: number = playSecondsOf(-100, -1, 60000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=-1, t...: actual=${actual}`);
      expect(actual).assertEqual(193548);
      logInfo(`${BUNDLE}PlaySecondsOf_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0189
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0189
     * @tc.desc      playSecondsOf(offsetX=3, screenW=20, totalTime=59999) returns -18000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0189 begin`);
      const actual: number = playSecondsOf(3, 20, 59999);
      logInfo(`playSecondsOf(offsetX=3, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(-18000);
      logInfo(`${BUNDLE}PlaySecondsOf_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0190
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0190
     * @tc.desc      playSecondsOf(offsetX=100, screenW=100, totalTime=3600000) returns 5142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0190 begin`);
      const actual: number = playSecondsOf(100, 100, 3600000);
      logInfo(`playSecondsOf(offsetX=100, screenW=100, t...: actual=${actual}`);
      expect(actual).assertEqual(5142857);
      logInfo(`${BUNDLE}PlaySecondsOf_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0191
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0191
     * @tc.desc      playSecondsOf(offsetX=2, screenW=20, totalTime=61000) returns -12200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0191 begin`);
      const actual: number = playSecondsOf(2, 20, 61000);
      logInfo(`playSecondsOf(offsetX=2, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(-12200);
      logInfo(`${BUNDLE}PlaySecondsOf_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0192
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0192
     * @tc.desc      playSecondsOf(offsetX=34, screenW=25, totalTime=3599000) returns -24473200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0192 begin`);
      const actual: number = playSecondsOf(34, 25, 3599000);
      logInfo(`playSecondsOf(offsetX=34, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-24473200);
      logInfo(`${BUNDLE}PlaySecondsOf_0192 end`);
    });
  });
}
