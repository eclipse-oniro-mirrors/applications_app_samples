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
export default function playSecondsOfTest(): void {
  describe('PlaySecondsOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0001
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0001
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0001 begin`);
      const actual: number = playSecondsOf(-100, 0, 0);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PlaySecondsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0002
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0002
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=500) returns 1666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0002 begin`);
      const actual: number = playSecondsOf(-100, 0, 500);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(1666);
      logInfo(`${BUNDLE}PlaySecondsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0003
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0003
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=999) returns 3330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0003 begin`);
      const actual: number = playSecondsOf(-100, 0, 999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(3330);
      logInfo(`${BUNDLE}PlaySecondsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0004
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0004
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=1000) returns 3333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0004 begin`);
      const actual: number = playSecondsOf(-100, 0, 1000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(3333);
      logInfo(`${BUNDLE}PlaySecondsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0005
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0005
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=59999) returns 199996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0005 begin`);
      const actual: number = playSecondsOf(-100, 0, 59999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(199996);
      logInfo(`${BUNDLE}PlaySecondsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0006
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0006
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=60000) returns 200000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0006 begin`);
      const actual: number = playSecondsOf(-100, 0, 60000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(200000);
      logInfo(`${BUNDLE}PlaySecondsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0007
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0007
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=61000) returns 203333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0007 begin`);
      const actual: number = playSecondsOf(-100, 0, 61000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(203333);
      logInfo(`${BUNDLE}PlaySecondsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0008
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0008
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=3599000) returns 11996666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0008 begin`);
      const actual: number = playSecondsOf(-100, 0, 3599000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(11996666);
      logInfo(`${BUNDLE}PlaySecondsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0009
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0009
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=3600000) returns 12000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0009 begin`);
      const actual: number = playSecondsOf(-100, 0, 3600000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(12000000);
      logInfo(`${BUNDLE}PlaySecondsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0010
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0010
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0010 begin`);
      const actual: number = playSecondsOf(-100, 0, 1);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PlaySecondsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0011
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0011
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=-1) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0011 begin`);
      const actual: number = playSecondsOf(-100, 0, -1);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}PlaySecondsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0012
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0012
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=0, totalTime=2) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0012 begin`);
      const actual: number = playSecondsOf(-100, 0, 2);
      logInfo(`playSecondsOf(offsetX=-100, screenW=0, to...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}PlaySecondsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0013
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0013
     * @tc.desc      playSecondsOf(offsetX=2, screenW=1, totalTime=2) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0013 begin`);
      const actual: number = playSecondsOf(2, 1, 2);
      logInfo(`playSecondsOf(offsetX=2, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}PlaySecondsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0014
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0014
     * @tc.desc      playSecondsOf(offsetX=3, screenW=15, totalTime=999) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0014 begin`);
      const actual: number = playSecondsOf(3, 15, 999);
      logInfo(`playSecondsOf(offsetX=3, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}PlaySecondsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0015
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0015
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=10, totalTime=61000) returns 305000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0015 begin`);
      const actual: number = playSecondsOf(-100, 10, 61000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=10, t...: actual=${actual}`);
      expect(actual).assertEqual(305000);
      logInfo(`${BUNDLE}PlaySecondsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0016
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0016
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=3, totalTime=500) returns 1851
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0016 begin`);
      const actual: number = playSecondsOf(-100, 3, 500);
      logInfo(`playSecondsOf(offsetX=-100, screenW=3, to...: actual=${actual}`);
      expect(actual).assertEqual(1851);
      logInfo(`${BUNDLE}PlaySecondsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0017
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0017
     * @tc.desc      playSecondsOf(offsetX=10, screenW=25, totalTime=3599000) returns -7198000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0017 begin`);
      const actual: number = playSecondsOf(10, 25, 3599000);
      logInfo(`playSecondsOf(offsetX=10, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-7198000);
      logInfo(`${BUNDLE}PlaySecondsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0018
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0018
     * @tc.desc      playSecondsOf(offsetX=34, screenW=15, totalTime=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0018 begin`);
      const actual: number = playSecondsOf(34, 15, -1);
      logInfo(`playSecondsOf(offsetX=34, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PlaySecondsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0019
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0019
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=3, totalTime=59999) returns 222218
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0019 begin`);
      const actual: number = playSecondsOf(-100, 3, 59999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=3, to...: actual=${actual}`);
      expect(actual).assertEqual(222218);
      logInfo(`${BUNDLE}PlaySecondsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0020
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0020
     * @tc.desc      playSecondsOf(offsetX=5, screenW=25, totalTime=3600000) returns -3600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0020 begin`);
      const actual: number = playSecondsOf(5, 25, 3600000);
      logInfo(`playSecondsOf(offsetX=5, screenW=25, tota...: actual=${actual}`);
      expect(actual).assertEqual(-3600000);
      logInfo(`${BUNDLE}PlaySecondsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0021
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0021
     * @tc.desc      playSecondsOf(offsetX=2, screenW=1, totalTime=500) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0021 begin`);
      const actual: number = playSecondsOf(2, 1, 500);
      logInfo(`playSecondsOf(offsetX=2, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}PlaySecondsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0022
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0022
     * @tc.desc      playSecondsOf(offsetX=10, screenW=0, totalTime=60000) returns -20000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0022 begin`);
      const actual: number = playSecondsOf(10, 0, 60000);
      logInfo(`playSecondsOf(offsetX=10, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-20000);
      logInfo(`${BUNDLE}PlaySecondsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0023
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0023
     * @tc.desc      playSecondsOf(offsetX=1, screenW=2, totalTime=60000) returns -2143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0023 begin`);
      const actual: number = playSecondsOf(1, 2, 60000);
      logInfo(`playSecondsOf(offsetX=1, screenW=2, total...: actual=${actual}`);
      expect(actual).assertEqual(-2143);
      logInfo(`${BUNDLE}PlaySecondsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0024
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0024
     * @tc.desc      playSecondsOf(offsetX=100, screenW=25, totalTime=59999) returns -1199980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0024 begin`);
      const actual: number = playSecondsOf(100, 25, 59999);
      logInfo(`playSecondsOf(offsetX=100, screenW=25, to...: actual=${actual}`);
      expect(actual).assertEqual(-1199980);
      logInfo(`${BUNDLE}PlaySecondsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0025
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0025
     * @tc.desc      playSecondsOf(offsetX=2, screenW=2, totalTime=3599000) returns -257072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0025 begin`);
      const actual: number = playSecondsOf(2, 2, 3599000);
      logInfo(`playSecondsOf(offsetX=2, screenW=2, total...: actual=${actual}`);
      expect(actual).assertEqual(-257072);
      logInfo(`${BUNDLE}PlaySecondsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0026
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0026
     * @tc.desc      playSecondsOf(offsetX=1, screenW=20, totalTime=61000) returns -6100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0026 begin`);
      const actual: number = playSecondsOf(1, 20, 61000);
      logInfo(`playSecondsOf(offsetX=1, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(-6100);
      logInfo(`${BUNDLE}PlaySecondsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0027
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0027
     * @tc.desc      playSecondsOf(offsetX=50, screenW=0, totalTime=61000) returns -101667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0027 begin`);
      const actual: number = playSecondsOf(50, 0, 61000);
      logInfo(`playSecondsOf(offsetX=50, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-101667);
      logInfo(`${BUNDLE}PlaySecondsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0028
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0028
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=20, totalTime=3600000) returns 36000000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0028 begin`);
      const actual: number = playSecondsOf(-100, 20, 3600000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=20, t...: actual=${actual}`);
      expect(actual).assertEqual(36000000);
      logInfo(`${BUNDLE}PlaySecondsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0029
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0029
     * @tc.desc      playSecondsOf(offsetX=34, screenW=0, totalTime=500) returns -567
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0029 begin`);
      const actual: number = playSecondsOf(34, 0, 500);
      logInfo(`playSecondsOf(offsetX=34, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-567);
      logInfo(`${BUNDLE}PlaySecondsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0030
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0030
     * @tc.desc      playSecondsOf(offsetX=15, screenW=5, totalTime=61000) returns -36600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0030 begin`);
      const actual: number = playSecondsOf(15, 5, 61000);
      logInfo(`playSecondsOf(offsetX=15, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-36600);
      logInfo(`${BUNDLE}PlaySecondsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0031
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0031
     * @tc.desc      playSecondsOf(offsetX=10, screenW=106, totalTime=3600000) returns 473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0031 begin`);
      const actual: number = playSecondsOf(10, 106, 3600000);
      logInfo(`playSecondsOf(offsetX=10, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(473684);
      logInfo(`${BUNDLE}PlaySecondsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0032
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0032
     * @tc.desc      playSecondsOf(offsetX=5, screenW=5, totalTime=500) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0032 begin`);
      const actual: number = playSecondsOf(5, 5, 500);
      logInfo(`playSecondsOf(offsetX=5, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}PlaySecondsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0033
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0033
     * @tc.desc      playSecondsOf(offsetX=100, screenW=15, totalTime=59999) returns -399994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0033 begin`);
      const actual: number = playSecondsOf(100, 15, 59999);
      logInfo(`playSecondsOf(offsetX=100, screenW=15, to...: actual=${actual}`);
      expect(actual).assertEqual(-399994);
      logInfo(`${BUNDLE}PlaySecondsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0034
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0034
     * @tc.desc      playSecondsOf(offsetX=1, screenW=1, totalTime=61000) returns -2104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0034 begin`);
      const actual: number = playSecondsOf(1, 1, 61000);
      logInfo(`playSecondsOf(offsetX=1, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-2104);
      logInfo(`${BUNDLE}PlaySecondsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0035
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0035
     * @tc.desc      playSecondsOf(offsetX=1, screenW=-1, totalTime=3600000) returns -116130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0035 begin`);
      const actual: number = playSecondsOf(1, -1, 3600000);
      logInfo(`playSecondsOf(offsetX=1, screenW=-1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-116130);
      logInfo(`${BUNDLE}PlaySecondsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0036
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0036
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=20, totalTime=999) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0036 begin`);
      const actual: number = playSecondsOf(-1, 20, 999);
      logInfo(`playSecondsOf(offsetX=-1, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}PlaySecondsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0037
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0037
     * @tc.desc      playSecondsOf(offsetX=34, screenW=2, totalTime=61000) returns -74072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0037 begin`);
      const actual: number = playSecondsOf(34, 2, 61000);
      logInfo(`playSecondsOf(offsetX=34, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-74072);
      logInfo(`${BUNDLE}PlaySecondsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0038
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0038
     * @tc.desc      playSecondsOf(offsetX=15, screenW=5, totalTime=500) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0038 begin`);
      const actual: number = playSecondsOf(15, 5, 500);
      logInfo(`playSecondsOf(offsetX=15, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-300);
      logInfo(`${BUNDLE}PlaySecondsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0039
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0039
     * @tc.desc      playSecondsOf(offsetX=10, screenW=5, totalTime=1000) returns -400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0039 begin`);
      const actual: number = playSecondsOf(10, 5, 1000);
      logInfo(`playSecondsOf(offsetX=10, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-400);
      logInfo(`${BUNDLE}PlaySecondsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0040
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0040
     * @tc.desc      playSecondsOf(offsetX=34, screenW=1, totalTime=3599000) returns -4219518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0040 begin`);
      const actual: number = playSecondsOf(34, 1, 3599000);
      logInfo(`playSecondsOf(offsetX=34, screenW=1, tota...: actual=${actual}`);
      expect(actual).assertEqual(-4219518);
      logInfo(`${BUNDLE}PlaySecondsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0041
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0041
     * @tc.desc      playSecondsOf(offsetX=50, screenW=10, totalTime=1) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0041 begin`);
      const actual: number = playSecondsOf(50, 10, 1);
      logInfo(`playSecondsOf(offsetX=50, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}PlaySecondsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0042
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0042
     * @tc.desc      playSecondsOf(offsetX=1, screenW=10, totalTime=999) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0042 begin`);
      const actual: number = playSecondsOf(1, 10, 999);
      logInfo(`playSecondsOf(offsetX=1, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}PlaySecondsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0043
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0043
     * @tc.desc      playSecondsOf(offsetX=50, screenW=3, totalTime=3600000) returns -6666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0043 begin`);
      const actual: number = playSecondsOf(50, 3, 3600000);
      logInfo(`playSecondsOf(offsetX=50, screenW=3, tota...: actual=${actual}`);
      expect(actual).assertEqual(-6666667);
      logInfo(`${BUNDLE}PlaySecondsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0044
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0044
     * @tc.desc      playSecondsOf(offsetX=50, screenW=15, totalTime=999) returns -3330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0044 begin`);
      const actual: number = playSecondsOf(50, 15, 999);
      logInfo(`playSecondsOf(offsetX=50, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(-3330);
      logInfo(`${BUNDLE}PlaySecondsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0045
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0045
     * @tc.desc      playSecondsOf(offsetX=2, screenW=106, totalTime=61000) returns 1605
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0045 begin`);
      const actual: number = playSecondsOf(2, 106, 61000);
      logInfo(`playSecondsOf(offsetX=2, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(1605);
      logInfo(`${BUNDLE}PlaySecondsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0046
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0046
     * @tc.desc      playSecondsOf(offsetX=100, screenW=106, totalTime=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0046 begin`);
      const actual: number = playSecondsOf(100, 106, -1);
      logInfo(`playSecondsOf(offsetX=100, screenW=106, t...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}PlaySecondsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0047
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0047
     * @tc.desc      playSecondsOf(offsetX=50, screenW=0, totalTime=500) returns -834
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0047 begin`);
      const actual: number = playSecondsOf(50, 0, 500);
      logInfo(`playSecondsOf(offsetX=50, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-834);
      logInfo(`${BUNDLE}PlaySecondsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0048
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0048
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=5, totalTime=3599000) returns 143960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0048 begin`);
      const actual: number = playSecondsOf(-1, 5, 3599000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(143960);
      logInfo(`${BUNDLE}PlaySecondsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0049
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0049
     * @tc.desc      playSecondsOf(offsetX=100, screenW=10, totalTime=999) returns -4995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0049 begin`);
      const actual: number = playSecondsOf(100, 10, 999);
      logInfo(`playSecondsOf(offsetX=100, screenW=10, to...: actual=${actual}`);
      expect(actual).assertEqual(-4995);
      logInfo(`${BUNDLE}PlaySecondsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0050
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0050
     * @tc.desc      playSecondsOf(offsetX=2, screenW=5, totalTime=500) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0050 begin`);
      const actual: number = playSecondsOf(2, 5, 500);
      logInfo(`playSecondsOf(offsetX=2, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}PlaySecondsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0051
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0051
     * @tc.desc      playSecondsOf(offsetX=10, screenW=20, totalTime=999) returns -999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0051 begin`);
      const actual: number = playSecondsOf(10, 20, 999);
      logInfo(`playSecondsOf(offsetX=10, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-999);
      logInfo(`${BUNDLE}PlaySecondsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0052
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0052
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=20, totalTime=3599000) returns 359900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0052 begin`);
      const actual: number = playSecondsOf(-1, 20, 3599000);
      logInfo(`playSecondsOf(offsetX=-1, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(359900);
      logInfo(`${BUNDLE}PlaySecondsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0053
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0053
     * @tc.desc      playSecondsOf(offsetX=5, screenW=1, totalTime=999) returns -173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0053 begin`);
      const actual: number = playSecondsOf(5, 1, 999);
      logInfo(`playSecondsOf(offsetX=5, screenW=1, total...: actual=${actual}`);
      expect(actual).assertEqual(-173);
      logInfo(`${BUNDLE}PlaySecondsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0054
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0054
     * @tc.desc      playSecondsOf(offsetX=100, screenW=25, totalTime=999) returns -19980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0054 begin`);
      const actual: number = playSecondsOf(100, 25, 999);
      logInfo(`playSecondsOf(offsetX=100, screenW=25, to...: actual=${actual}`);
      expect(actual).assertEqual(-19980);
      logInfo(`${BUNDLE}PlaySecondsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0055
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0055
     * @tc.desc      playSecondsOf(offsetX=100, screenW=2, totalTime=2) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0055 begin`);
      const actual: number = playSecondsOf(100, 2, 2);
      logInfo(`playSecondsOf(offsetX=100, screenW=2, tot...: actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}PlaySecondsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0056
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0056
     * @tc.desc      playSecondsOf(offsetX=10, screenW=15, totalTime=500) returns -334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0056 begin`);
      const actual: number = playSecondsOf(10, 15, 500);
      logInfo(`playSecondsOf(offsetX=10, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(-334);
      logInfo(`${BUNDLE}PlaySecondsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0057
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0057
     * @tc.desc      playSecondsOf(offsetX=10, screenW=106, totalTime=999) returns 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0057 begin`);
      const actual: number = playSecondsOf(10, 106, 999);
      logInfo(`playSecondsOf(offsetX=10, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(131);
      logInfo(`${BUNDLE}PlaySecondsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0058
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0058
     * @tc.desc      playSecondsOf(offsetX=5, screenW=10, totalTime=1000) returns -250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0058 begin`);
      const actual: number = playSecondsOf(5, 10, 1000);
      logInfo(`playSecondsOf(offsetX=5, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(-250);
      logInfo(`${BUNDLE}PlaySecondsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0059
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0059
     * @tc.desc      playSecondsOf(offsetX=34, screenW=0, totalTime=59999) returns -67999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0059 begin`);
      const actual: number = playSecondsOf(34, 0, 59999);
      logInfo(`playSecondsOf(offsetX=34, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-67999);
      logInfo(`${BUNDLE}PlaySecondsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0060
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0060
     * @tc.desc      playSecondsOf(offsetX=15, screenW=106, totalTime=999) returns 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0060 begin`);
      const actual: number = playSecondsOf(15, 106, 999);
      logInfo(`playSecondsOf(offsetX=15, screenW=106, to...: actual=${actual}`);
      expect(actual).assertEqual(197);
      logInfo(`${BUNDLE}PlaySecondsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0061
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0061
     * @tc.desc      playSecondsOf(offsetX=1, screenW=15, totalTime=3600000) returns -240000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0061 begin`);
      const actual: number = playSecondsOf(1, 15, 3600000);
      logInfo(`playSecondsOf(offsetX=1, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertEqual(-240000);
      logInfo(`${BUNDLE}PlaySecondsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0062
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0062
     * @tc.desc      playSecondsOf(offsetX=34, screenW=2, totalTime=60000) returns -72858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0062 begin`);
      const actual: number = playSecondsOf(34, 2, 60000);
      logInfo(`playSecondsOf(offsetX=34, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-72858);
      logInfo(`${BUNDLE}PlaySecondsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0063
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0063
     * @tc.desc      playSecondsOf(offsetX=15, screenW=25, totalTime=2) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0063 begin`);
      const actual: number = playSecondsOf(15, 25, 2);
      logInfo(`playSecondsOf(offsetX=15, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}PlaySecondsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0064
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0064
     * @tc.desc      playSecondsOf(offsetX=10, screenW=10, totalTime=60000) returns -30000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0064 begin`);
      const actual: number = playSecondsOf(10, 10, 60000);
      logInfo(`playSecondsOf(offsetX=10, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-30000);
      logInfo(`${BUNDLE}PlaySecondsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0065
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0065
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=25, totalTime=61000) returns 1220000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0065 begin`);
      const actual: number = playSecondsOf(-100, 25, 61000);
      logInfo(`playSecondsOf(offsetX=-100, screenW=25, t...: actual=${actual}`);
      expect(actual).assertEqual(1220000);
      logInfo(`${BUNDLE}PlaySecondsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0066
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0066
     * @tc.desc      playSecondsOf(offsetX=100, screenW=15, totalTime=1) returns -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0066 begin`);
      const actual: number = playSecondsOf(100, 15, 1);
      logInfo(`playSecondsOf(offsetX=100, screenW=15, to...: actual=${actual}`);
      expect(actual).assertEqual(-7);
      logInfo(`${BUNDLE}PlaySecondsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0067
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0067
     * @tc.desc      playSecondsOf(offsetX=50, screenW=20, totalTime=1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0067 begin`);
      const actual: number = playSecondsOf(50, 20, 1);
      logInfo(`playSecondsOf(offsetX=50, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}PlaySecondsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0068
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0068
     * @tc.desc      playSecondsOf(offsetX=3, screenW=3, totalTime=3599000) returns -399889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0068 begin`);
      const actual: number = playSecondsOf(3, 3, 3599000);
      logInfo(`playSecondsOf(offsetX=3, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(-399889);
      logInfo(`${BUNDLE}PlaySecondsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0069
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0069
     * @tc.desc      playSecondsOf(offsetX=100, screenW=1, totalTime=500) returns -1725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0069 begin`);
      const actual: number = playSecondsOf(100, 1, 500);
      logInfo(`playSecondsOf(offsetX=100, screenW=1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1725);
      logInfo(`${BUNDLE}PlaySecondsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0070
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0070
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=100, totalTime=59999) returns -858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0070 begin`);
      const actual: number = playSecondsOf(-1, 100, 59999);
      logInfo(`playSecondsOf(offsetX=-1, screenW=100, to...: actual=${actual}`);
      expect(actual).assertEqual(-858);
      logInfo(`${BUNDLE}PlaySecondsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0071
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0071
     * @tc.desc      playSecondsOf(offsetX=50, screenW=5, totalTime=1000) returns -2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0071 begin`);
      const actual: number = playSecondsOf(50, 5, 1000);
      logInfo(`playSecondsOf(offsetX=50, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-2000);
      logInfo(`${BUNDLE}PlaySecondsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0072
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0072
     * @tc.desc      playSecondsOf(offsetX=3, screenW=100, totalTime=1000) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0072 begin`);
      const actual: number = playSecondsOf(3, 100, 1000);
      logInfo(`playSecondsOf(offsetX=3, screenW=100, tot...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PlaySecondsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0073
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0073
     * @tc.desc      playSecondsOf(offsetX=15, screenW=0, totalTime=1000) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0073 begin`);
      const actual: number = playSecondsOf(15, 0, 1000);
      logInfo(`playSecondsOf(offsetX=15, screenW=0, tota...: actual=${actual}`);
      expect(actual).assertEqual(-500);
      logInfo(`${BUNDLE}PlaySecondsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0074
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0074
     * @tc.desc      playSecondsOf(offsetX=15, screenW=20, totalTime=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0074 begin`);
      const actual: number = playSecondsOf(15, 20, -1);
      logInfo(`playSecondsOf(offsetX=15, screenW=20, tot...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PlaySecondsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0075
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0075
     * @tc.desc      playSecondsOf(offsetX=10, screenW=2, totalTime=999) returns -357
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0075 begin`);
      const actual: number = playSecondsOf(10, 2, 999);
      logInfo(`playSecondsOf(offsetX=10, screenW=2, tota...: actual=${actual}`);
      expect(actual).assertEqual(-357);
      logInfo(`${BUNDLE}PlaySecondsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0076
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0076
     * @tc.desc      playSecondsOf(offsetX=34, screenW=10, totalTime=3599000) returns -6118300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0076 begin`);
      const actual: number = playSecondsOf(34, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=34, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-6118300);
      logInfo(`${BUNDLE}PlaySecondsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0077
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0077
     * @tc.desc      playSecondsOf(offsetX=1, screenW=106, totalTime=999) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0077 begin`);
      const actual: number = playSecondsOf(1, 106, 999);
      logInfo(`playSecondsOf(offsetX=1, screenW=106, tot...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}PlaySecondsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0078
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0078
     * @tc.desc      playSecondsOf(offsetX=100, screenW=15, totalTime=500) returns -3334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0078 begin`);
      const actual: number = playSecondsOf(100, 15, 500);
      logInfo(`playSecondsOf(offsetX=100, screenW=15, to...: actual=${actual}`);
      expect(actual).assertEqual(-3334);
      logInfo(`${BUNDLE}PlaySecondsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0079
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0079
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=106, totalTime=999) returns -1315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0079 begin`);
      const actual: number = playSecondsOf(-100, 106, 999);
      logInfo(`playSecondsOf(offsetX=-100, screenW=106, ...: actual=${actual}`);
      expect(actual).assertEqual(-1315);
      logInfo(`${BUNDLE}PlaySecondsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0080
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0080
     * @tc.desc      playSecondsOf(offsetX=-100, screenW=5, totalTime=2) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0080 begin`);
      const actual: number = playSecondsOf(-100, 5, 2);
      logInfo(`playSecondsOf(offsetX=-100, screenW=5, to...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}PlaySecondsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0081
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0081
     * @tc.desc      playSecondsOf(offsetX=50, screenW=100, totalTime=60000) returns 42857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0081 begin`);
      const actual: number = playSecondsOf(50, 100, 60000);
      logInfo(`playSecondsOf(offsetX=50, screenW=100, to...: actual=${actual}`);
      expect(actual).assertEqual(42857);
      logInfo(`${BUNDLE}PlaySecondsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0082
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0082
     * @tc.desc      playSecondsOf(offsetX=50, screenW=-1, totalTime=61000) returns -98388
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0082 begin`);
      const actual: number = playSecondsOf(50, -1, 61000);
      logInfo(`playSecondsOf(offsetX=50, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-98388);
      logInfo(`${BUNDLE}PlaySecondsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0083
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0083
     * @tc.desc      playSecondsOf(offsetX=10, screenW=25, totalTime=999) returns -1998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0083 begin`);
      const actual: number = playSecondsOf(10, 25, 999);
      logInfo(`playSecondsOf(offsetX=10, screenW=25, tot...: actual=${actual}`);
      expect(actual).assertEqual(-1998);
      logInfo(`${BUNDLE}PlaySecondsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0084
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0084
     * @tc.desc      playSecondsOf(offsetX=3, screenW=15, totalTime=59999) returns -12000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0084 begin`);
      const actual: number = playSecondsOf(3, 15, 59999);
      logInfo(`playSecondsOf(offsetX=3, screenW=15, tota...: actual=${actual}`);
      expect(actual).assertEqual(-12000);
      logInfo(`${BUNDLE}PlaySecondsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0085
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0085
     * @tc.desc      playSecondsOf(offsetX=2, screenW=0, totalTime=3599000) returns -239934
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0085 begin`);
      const actual: number = playSecondsOf(2, 0, 3599000);
      logInfo(`playSecondsOf(offsetX=2, screenW=0, total...: actual=${actual}`);
      expect(actual).assertEqual(-239934);
      logInfo(`${BUNDLE}PlaySecondsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0086
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0086
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=15, totalTime=500) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0086 begin`);
      const actual: number = playSecondsOf(-1, 15, 500);
      logInfo(`playSecondsOf(offsetX=-1, screenW=15, tot...: actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}PlaySecondsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0087
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0087
     * @tc.desc      playSecondsOf(offsetX=2, screenW=10, totalTime=3599000) returns -359900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0087 begin`);
      const actual: number = playSecondsOf(2, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=2, screenW=10, tota...: actual=${actual}`);
      expect(actual).assertEqual(-359900);
      logInfo(`${BUNDLE}PlaySecondsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0088
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0088
     * @tc.desc      playSecondsOf(offsetX=100, screenW=25, totalTime=1) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0088 begin`);
      const actual: number = playSecondsOf(100, 25, 1);
      logInfo(`playSecondsOf(offsetX=100, screenW=25, to...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}PlaySecondsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0089
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0089
     * @tc.desc      playSecondsOf(offsetX=1, screenW=3, totalTime=59999) returns -2223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0089 begin`);
      const actual: number = playSecondsOf(1, 3, 59999);
      logInfo(`playSecondsOf(offsetX=1, screenW=3, total...: actual=${actual}`);
      expect(actual).assertEqual(-2223);
      logInfo(`${BUNDLE}PlaySecondsOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0090
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0090
     * @tc.desc      playSecondsOf(offsetX=10, screenW=-1, totalTime=61000) returns -19678
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0090 begin`);
      const actual: number = playSecondsOf(10, -1, 61000);
      logInfo(`playSecondsOf(offsetX=10, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(-19678);
      logInfo(`${BUNDLE}PlaySecondsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0091
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0091
     * @tc.desc      playSecondsOf(offsetX=50, screenW=10, totalTime=3599000) returns -8997500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0091 begin`);
      const actual: number = playSecondsOf(50, 10, 3599000);
      logInfo(`playSecondsOf(offsetX=50, screenW=10, tot...: actual=${actual}`);
      expect(actual).assertEqual(-8997500);
      logInfo(`${BUNDLE}PlaySecondsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0092
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0092
     * @tc.desc      playSecondsOf(offsetX=100, screenW=-1, totalTime=500) returns -1613
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0092 begin`);
      const actual: number = playSecondsOf(100, -1, 500);
      logInfo(`playSecondsOf(offsetX=100, screenW=-1, to...: actual=${actual}`);
      expect(actual).assertEqual(-1613);
      logInfo(`${BUNDLE}PlaySecondsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0093
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0093
     * @tc.desc      playSecondsOf(offsetX=1, screenW=5, totalTime=61000) returns -2440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0093 begin`);
      const actual: number = playSecondsOf(1, 5, 61000);
      logInfo(`playSecondsOf(offsetX=1, screenW=5, total...: actual=${actual}`);
      expect(actual).assertEqual(-2440);
      logInfo(`${BUNDLE}PlaySecondsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0094
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0094
     * @tc.desc      playSecondsOf(offsetX=3, screenW=20, totalTime=500) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0094 begin`);
      const actual: number = playSecondsOf(3, 20, 500);
      logInfo(`playSecondsOf(offsetX=3, screenW=20, tota...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}PlaySecondsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0095
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0095
     * @tc.desc      playSecondsOf(offsetX=-1, screenW=-1, totalTime=500) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0095 begin`);
      const actual: number = playSecondsOf(-1, -1, 500);
      logInfo(`playSecondsOf(offsetX=-1, screenW=-1, tot...: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}PlaySecondsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_SECONDS_OF_0096
     * @tc.name      TabContentTouchHotZone_PlaySecondsOf_0096
     * @tc.desc      playSecondsOf(offsetX=15, screenW=5, totalTime=3599000) returns -2159400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlaySecondsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlaySecondsOf_0096 begin`);
      const actual: number = playSecondsOf(15, 5, 3599000);
      logInfo(`playSecondsOf(offsetX=15, screenW=5, tota...: actual=${actual}`);
      expect(actual).assertEqual(-2159400);
      logInfo(`${BUNDLE}PlaySecondsOf_0096 end`);
    });
  });
}
