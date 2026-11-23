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

/** Logic checks for playSecondsOf (13 cases). */
export default function playSecondsOf3Test(): void {
  describe('PlaySecondsOf3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0193
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0193
     * @tc.desc      playSecondsOf(offsetX=1, screenW=-1, totalTime=500) returns -17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0193 begin`);
      const actual: number = playSecondsOf(1, -1, 500);
      logInfo(`playSecondsOf(offsetX=1, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-17);
      logInfo(`${BUNDLE}PlaySecondsOf_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0194
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0194
     * @tc.desc      playSecondsOf(offsetX=34, screenW=-1, totalTime=60000) returns -65807
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0194 begin`);
      const actual: number = playSecondsOf(34, -1, 60000);
      logInfo(`playSecondsOf(offsetX=34, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-65807);
      logInfo(`${BUNDLE}PlaySecondsOf_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0195
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0195
     * @tc.desc      playSecondsOf(offsetX=15, screenW=20, totalTime=500) returns -750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0195 begin`);
      const actual: number = playSecondsOf(15, 20, 500);
      logInfo(`playSecondsOf(offsetX=15, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-750);
      logInfo(`${BUNDLE}PlaySecondsOf_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0196
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0196
     * @tc.desc      playSecondsOf(offsetX=50, screenW=100, totalTime=3600000) returns 2571428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0196 begin`);
      const actual: number = playSecondsOf(50, 100, 3600000);
      logInfo(`playSecondsOf(offsetX=50, screenW=100, to...: actual=${actual}`);
      expect(actual).assertEqual(2571428);
      logInfo(`${BUNDLE}PlaySecondsOf_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0197
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0197
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=25, totalTime=1000) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0197 begin`);
      const actual: number = playSecondsOf(-1, 25, 1000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}PlaySecondsOf_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0198
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0198
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=15, totalTime=61000) returns 406666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0198 begin`);
      const actual: number = playSecondsOf(-100, 15, 61000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=15, t...: actual=${actual}`);
      expect(actual).assertEqual(406666);
      logInfo(`${BUNDLE}PlaySecondsOf_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0199
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0199
     * @tc.desc      playSecondsOf(offsetX=50, screenW=3, totalTime=500) returns -926
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0199 begin`);
      const actual: number = playSecondsOf(50, 3, 500);
      logInfo(`playSecondsOf(offsetX=50, screenW=3, tota...: actual=${actual}`);
      expect(actual).assertEqual(-926);
      logInfo(`${BUNDLE}PlaySecondsOf_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0200
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0200
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=15, totalTime=999) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0200 begin`);
      const actual: number = playSecondsOf(-1, 15, 999);
      logInfo(`playSecondsOf(offsetX=-1, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}PlaySecondsOf_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0201
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0201
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=106, totalTime=61000) returns -803
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0201 begin`);
      const actual: number = playSecondsOf(-1, 106, 61000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(-803);
      logInfo(`${BUNDLE}PlaySecondsOf_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0202
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0202
     * @tc.desc      playSecondsOf(offsetX=100, screenW=3, totalTime=3600000) returns -13333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0202 begin`);
      const actual: number = playSecondsOf(100, 3, 3600000);
      logInfo(`playSecondsOf(offsetX=100, screenW=3, tot...: actual=${actual}`);
      expect(actual).assertEqual(-13333334);
      logInfo(`${BUNDLE}PlaySecondsOf_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0203
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0203
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=3, totalTime=500) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0203 begin`);
      const actual: number = playSecondsOf(-1, 3, 500);
      logInfo(`playSecondsOf(offsetX=-1, screenW=3, tota...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}PlaySecondsOf_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0204
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0204
     * @tc.desc      playSecondsOf(offsetX=5, screenW=2, totalTime=59999) returns -10715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0204 begin`);
      const actual: number = playSecondsOf(5, 2, 59999);
      logInfo(`playSecondsOf(offsetX=5, screenW=2, total...: actual=${actual}`);
      expect(actual).assertEqual(-10715);
      logInfo(`${BUNDLE}PlaySecondsOf_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0205
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0205
     * @tc.desc      playSecondsOf(offsetX=3, screenW=5, totalTime=60000) returns -7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0205 begin`);
      const actual: number = playSecondsOf(3, 5, 60000);
      logInfo(`playSecondsOf(offsetX=3, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(-7200);
      logInfo(`${BUNDLE}PlaySecondsOf_0205 end`);
    });
  });
}
