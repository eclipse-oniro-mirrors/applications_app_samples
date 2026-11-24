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
import { playTimeTextOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for playTimeTextOf (96 cases). */
export default function playTimeTextOfTest(): void {
  describe('PlayTimeTextOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0001
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0001
     * @tc.desc      playTimeTextOf(playTime=0) returns "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0001 begin`);
      const actual: string = playTimeTextOf(0);
      logInfo(`playTimeTextOf(playTime=0): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`${BUNDLE}PlayTimeTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0002
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0002
     * @tc.desc      playTimeTextOf(playTime=500) returns "500"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0002 begin`);
      const actual: string = playTimeTextOf(500);
      logInfo(`playTimeTextOf(playTime=500): actual=${actual}`);
      expect(actual).assertEqual('500');
      logInfo(`${BUNDLE}PlayTimeTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0003
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0003
     * @tc.desc      playTimeTextOf(playTime=999) returns "999"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0003 begin`);
      const actual: string = playTimeTextOf(999);
      logInfo(`playTimeTextOf(playTime=999): actual=${actual}`);
      expect(actual).assertEqual('999');
      logInfo(`${BUNDLE}PlayTimeTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0004
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0004
     * @tc.desc      playTimeTextOf(playTime=1000) returns "1000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0004 begin`);
      const actual: string = playTimeTextOf(1000);
      logInfo(`playTimeTextOf(playTime=1000): actual=${actual}`);
      expect(actual).assertEqual('1000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0005
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0005
     * @tc.desc      playTimeTextOf(playTime=59999) returns "59999"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0005 begin`);
      const actual: string = playTimeTextOf(59999);
      logInfo(`playTimeTextOf(playTime=59999): actual=${actual}`);
      expect(actual).assertEqual('59999');
      logInfo(`${BUNDLE}PlayTimeTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0006
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0006
     * @tc.desc      playTimeTextOf(playTime=60000) returns "60000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0006 begin`);
      const actual: string = playTimeTextOf(60000);
      logInfo(`playTimeTextOf(playTime=60000): actual=${actual}`);
      expect(actual).assertEqual('60000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0007
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0007
     * @tc.desc      playTimeTextOf(playTime=61000) returns "61000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0007 begin`);
      const actual: string = playTimeTextOf(61000);
      logInfo(`playTimeTextOf(playTime=61000): actual=${actual}`);
      expect(actual).assertEqual('61000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0008
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0008
     * @tc.desc      playTimeTextOf(playTime=3599000) returns "3599000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0008 begin`);
      const actual: string = playTimeTextOf(3599000);
      logInfo(`playTimeTextOf(playTime=3599000): actual=${actual}`);
      expect(actual).assertEqual('3599000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0009
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0009
     * @tc.desc      playTimeTextOf(playTime=3600000) returns "3600000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0009 begin`);
      const actual: string = playTimeTextOf(3600000);
      logInfo(`playTimeTextOf(playTime=3600000): actual=${actual}`);
      expect(actual).assertEqual('3600000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0010
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0010
     * @tc.desc      playTimeTextOf(playTime=1) returns "01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0010 begin`);
      const actual: string = playTimeTextOf(1);
      logInfo(`playTimeTextOf(playTime=1): actual=${actual}`);
      expect(actual).assertEqual('01');
      logInfo(`${BUNDLE}PlayTimeTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0011
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0011
     * @tc.desc      playTimeTextOf(playTime=-1) returns "0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0011 begin`);
      const actual: string = playTimeTextOf(-1);
      logInfo(`playTimeTextOf(playTime=-1): actual=${actual}`);
      expect(actual).assertEqual('0-1');
      logInfo(`${BUNDLE}PlayTimeTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0012
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0012
     * @tc.desc      playTimeTextOf(playTime=2) returns "02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0012 begin`);
      const actual: string = playTimeTextOf(2);
      logInfo(`playTimeTextOf(playTime=2): actual=${actual}`);
      expect(actual).assertEqual('02');
      logInfo(`${BUNDLE}PlayTimeTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0013
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0013
     * @tc.desc      playTimeTextOf(playTime=3) returns "03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0013 begin`);
      const actual: string = playTimeTextOf(3);
      logInfo(`playTimeTextOf(playTime=3): actual=${actual}`);
      expect(actual).assertEqual('03');
      logInfo(`${BUNDLE}PlayTimeTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0014
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0014
     * @tc.desc      playTimeTextOf(playTime=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0014 begin`);
      const actual: string = playTimeTextOf(10);
      logInfo(`playTimeTextOf(playTime=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}PlayTimeTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0015
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0015
     * @tc.desc      playTimeTextOf(playTime=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0015 begin`);
      const actual: string = playTimeTextOf(100);
      logInfo(`playTimeTextOf(playTime=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}PlayTimeTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0016
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0016
     * @tc.desc      playTimeTextOf(playTime=180000) returns "180000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0016 begin`);
      const actual: string = playTimeTextOf(180000);
      logInfo(`playTimeTextOf(playTime=180000): actual=${actual}`);
      expect(actual).assertEqual('180000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0017
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0017
     * @tc.desc      playTimeTextOf(playTime=360000) returns "360000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0017 begin`);
      const actual: string = playTimeTextOf(360000);
      logInfo(`playTimeTextOf(playTime=360000): actual=${actual}`);
      expect(actual).assertEqual('360000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0018
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0018
     * @tc.desc      playTimeTextOf(playTime=540000) returns "540000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0018 begin`);
      const actual: string = playTimeTextOf(540000);
      logInfo(`playTimeTextOf(playTime=540000): actual=${actual}`);
      expect(actual).assertEqual('540000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0019
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0019
     * @tc.desc      playTimeTextOf(playTime=720000) returns "720000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0019 begin`);
      const actual: string = playTimeTextOf(720000);
      logInfo(`playTimeTextOf(playTime=720000): actual=${actual}`);
      expect(actual).assertEqual('720000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0020
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0020
     * @tc.desc      playTimeTextOf(playTime=900000) returns "900000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0020 begin`);
      const actual: string = playTimeTextOf(900000);
      logInfo(`playTimeTextOf(playTime=900000): actual=${actual}`);
      expect(actual).assertEqual('900000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0021
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0021
     * @tc.desc      playTimeTextOf(playTime=1080000) returns "1080000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0021 begin`);
      const actual: string = playTimeTextOf(1080000);
      logInfo(`playTimeTextOf(playTime=1080000): actual=${actual}`);
      expect(actual).assertEqual('1080000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0022
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0022
     * @tc.desc      playTimeTextOf(playTime=1260000) returns "1260000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0022 begin`);
      const actual: string = playTimeTextOf(1260000);
      logInfo(`playTimeTextOf(playTime=1260000): actual=${actual}`);
      expect(actual).assertEqual('1260000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0023
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0023
     * @tc.desc      playTimeTextOf(playTime=1440000) returns "1440000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0023 begin`);
      const actual: string = playTimeTextOf(1440000);
      logInfo(`playTimeTextOf(playTime=1440000): actual=${actual}`);
      expect(actual).assertEqual('1440000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0024
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0024
     * @tc.desc      playTimeTextOf(playTime=1620000) returns "1620000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0024 begin`);
      const actual: string = playTimeTextOf(1620000);
      logInfo(`playTimeTextOf(playTime=1620000): actual=${actual}`);
      expect(actual).assertEqual('1620000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0025
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0025
     * @tc.desc      playTimeTextOf(playTime=1800000) returns "1800000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0025 begin`);
      const actual: string = playTimeTextOf(1800000);
      logInfo(`playTimeTextOf(playTime=1800000): actual=${actual}`);
      expect(actual).assertEqual('1800000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0026
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0026
     * @tc.desc      playTimeTextOf(playTime=1980000) returns "1980000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0026 begin`);
      const actual: string = playTimeTextOf(1980000);
      logInfo(`playTimeTextOf(playTime=1980000): actual=${actual}`);
      expect(actual).assertEqual('1980000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0027
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0027
     * @tc.desc      playTimeTextOf(playTime=2160000) returns "2160000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0027 begin`);
      const actual: string = playTimeTextOf(2160000);
      logInfo(`playTimeTextOf(playTime=2160000): actual=${actual}`);
      expect(actual).assertEqual('2160000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0028
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0028
     * @tc.desc      playTimeTextOf(playTime=2340000) returns "2340000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0028 begin`);
      const actual: string = playTimeTextOf(2340000);
      logInfo(`playTimeTextOf(playTime=2340000): actual=${actual}`);
      expect(actual).assertEqual('2340000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0029
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0029
     * @tc.desc      playTimeTextOf(playTime=2520000) returns "2520000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0029 begin`);
      const actual: string = playTimeTextOf(2520000);
      logInfo(`playTimeTextOf(playTime=2520000): actual=${actual}`);
      expect(actual).assertEqual('2520000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0030
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0030
     * @tc.desc      playTimeTextOf(playTime=2700000) returns "2700000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0030 begin`);
      const actual: string = playTimeTextOf(2700000);
      logInfo(`playTimeTextOf(playTime=2700000): actual=${actual}`);
      expect(actual).assertEqual('2700000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0031
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0031
     * @tc.desc      playTimeTextOf(playTime=2880000) returns "2880000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0031 begin`);
      const actual: string = playTimeTextOf(2880000);
      logInfo(`playTimeTextOf(playTime=2880000): actual=${actual}`);
      expect(actual).assertEqual('2880000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0032
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0032
     * @tc.desc      playTimeTextOf(playTime=3060000) returns "3060000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0032 begin`);
      const actual: string = playTimeTextOf(3060000);
      logInfo(`playTimeTextOf(playTime=3060000): actual=${actual}`);
      expect(actual).assertEqual('3060000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0033
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0033
     * @tc.desc      playTimeTextOf(playTime=3240000) returns "3240000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0033 begin`);
      const actual: string = playTimeTextOf(3240000);
      logInfo(`playTimeTextOf(playTime=3240000): actual=${actual}`);
      expect(actual).assertEqual('3240000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0034
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0034
     * @tc.desc      playTimeTextOf(playTime=3420000) returns "3420000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0034 begin`);
      const actual: string = playTimeTextOf(3420000);
      logInfo(`playTimeTextOf(playTime=3420000): actual=${actual}`);
      expect(actual).assertEqual('3420000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0035
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0035
     * @tc.desc      playTimeTextOf(playTime=3780000) returns "3780000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0035 begin`);
      const actual: string = playTimeTextOf(3780000);
      logInfo(`playTimeTextOf(playTime=3780000): actual=${actual}`);
      expect(actual).assertEqual('3780000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0036
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0036
     * @tc.desc      playTimeTextOf(playTime=3960000) returns "3960000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0036 begin`);
      const actual: string = playTimeTextOf(3960000);
      logInfo(`playTimeTextOf(playTime=3960000): actual=${actual}`);
      expect(actual).assertEqual('3960000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0037
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0037
     * @tc.desc      playTimeTextOf(playTime=4140000) returns "4140000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0037 begin`);
      const actual: string = playTimeTextOf(4140000);
      logInfo(`playTimeTextOf(playTime=4140000): actual=${actual}`);
      expect(actual).assertEqual('4140000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0038
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0038
     * @tc.desc      playTimeTextOf(playTime=4320000) returns "4320000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0038 begin`);
      const actual: string = playTimeTextOf(4320000);
      logInfo(`playTimeTextOf(playTime=4320000): actual=${actual}`);
      expect(actual).assertEqual('4320000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0039
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0039
     * @tc.desc      playTimeTextOf(playTime=4500000) returns "4500000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0039 begin`);
      const actual: string = playTimeTextOf(4500000);
      logInfo(`playTimeTextOf(playTime=4500000): actual=${actual}`);
      expect(actual).assertEqual('4500000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0040
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0040
     * @tc.desc      playTimeTextOf(playTime=4680000) returns "4680000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0040 begin`);
      const actual: string = playTimeTextOf(4680000);
      logInfo(`playTimeTextOf(playTime=4680000): actual=${actual}`);
      expect(actual).assertEqual('4680000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0041
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0041
     * @tc.desc      playTimeTextOf(playTime=4860000) returns "4860000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0041 begin`);
      const actual: string = playTimeTextOf(4860000);
      logInfo(`playTimeTextOf(playTime=4860000): actual=${actual}`);
      expect(actual).assertEqual('4860000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0042
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0042
     * @tc.desc      playTimeTextOf(playTime=5040000) returns "5040000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0042 begin`);
      const actual: string = playTimeTextOf(5040000);
      logInfo(`playTimeTextOf(playTime=5040000): actual=${actual}`);
      expect(actual).assertEqual('5040000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0043
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0043
     * @tc.desc      playTimeTextOf(playTime=5220000) returns "5220000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0043 begin`);
      const actual: string = playTimeTextOf(5220000);
      logInfo(`playTimeTextOf(playTime=5220000): actual=${actual}`);
      expect(actual).assertEqual('5220000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0044
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0044
     * @tc.desc      playTimeTextOf(playTime=5400000) returns "5400000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0044 begin`);
      const actual: string = playTimeTextOf(5400000);
      logInfo(`playTimeTextOf(playTime=5400000): actual=${actual}`);
      expect(actual).assertEqual('5400000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0045
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0045
     * @tc.desc      playTimeTextOf(playTime=5580000) returns "5580000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0045 begin`);
      const actual: string = playTimeTextOf(5580000);
      logInfo(`playTimeTextOf(playTime=5580000): actual=${actual}`);
      expect(actual).assertEqual('5580000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0046
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0046
     * @tc.desc      playTimeTextOf(playTime=5760000) returns "5760000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0046 begin`);
      const actual: string = playTimeTextOf(5760000);
      logInfo(`playTimeTextOf(playTime=5760000): actual=${actual}`);
      expect(actual).assertEqual('5760000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0047
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0047
     * @tc.desc      playTimeTextOf(playTime=5940000) returns "5940000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0047 begin`);
      const actual: string = playTimeTextOf(5940000);
      logInfo(`playTimeTextOf(playTime=5940000): actual=${actual}`);
      expect(actual).assertEqual('5940000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0048
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0048
     * @tc.desc      playTimeTextOf(playTime=6120000) returns "6120000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0048 begin`);
      const actual: string = playTimeTextOf(6120000);
      logInfo(`playTimeTextOf(playTime=6120000): actual=${actual}`);
      expect(actual).assertEqual('6120000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0049
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0049
     * @tc.desc      playTimeTextOf(playTime=6300000) returns "6300000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0049 begin`);
      const actual: string = playTimeTextOf(6300000);
      logInfo(`playTimeTextOf(playTime=6300000): actual=${actual}`);
      expect(actual).assertEqual('6300000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0050
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0050
     * @tc.desc      playTimeTextOf(playTime=6480000) returns "6480000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0050 begin`);
      const actual: string = playTimeTextOf(6480000);
      logInfo(`playTimeTextOf(playTime=6480000): actual=${actual}`);
      expect(actual).assertEqual('6480000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0051
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0051
     * @tc.desc      playTimeTextOf(playTime=6660000) returns "6660000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0051 begin`);
      const actual: string = playTimeTextOf(6660000);
      logInfo(`playTimeTextOf(playTime=6660000): actual=${actual}`);
      expect(actual).assertEqual('6660000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0052
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0052
     * @tc.desc      playTimeTextOf(playTime=6840000) returns "6840000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0052 begin`);
      const actual: string = playTimeTextOf(6840000);
      logInfo(`playTimeTextOf(playTime=6840000): actual=${actual}`);
      expect(actual).assertEqual('6840000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0053
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0053
     * @tc.desc      playTimeTextOf(playTime=7020000) returns "7020000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0053 begin`);
      const actual: string = playTimeTextOf(7020000);
      logInfo(`playTimeTextOf(playTime=7020000): actual=${actual}`);
      expect(actual).assertEqual('7020000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0054
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0054
     * @tc.desc      playTimeTextOf(playTime=7200000) returns "7200000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0054 begin`);
      const actual: string = playTimeTextOf(7200000);
      logInfo(`playTimeTextOf(playTime=7200000): actual=${actual}`);
      expect(actual).assertEqual('7200000');
      logInfo(`${BUNDLE}PlayTimeTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0055
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0055
     * @tc.desc      playTimeTextOf(playTime=595494) returns "595494"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0055 begin`);
      const actual: string = playTimeTextOf(595494);
      logInfo(`playTimeTextOf(playTime=595494): actual=${actual}`);
      expect(actual).assertEqual('595494');
      logInfo(`${BUNDLE}PlayTimeTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0056
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0056
     * @tc.desc      playTimeTextOf(playTime=92395) returns "92395"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0056 begin`);
      const actual: string = playTimeTextOf(92395);
      logInfo(`playTimeTextOf(playTime=92395): actual=${actual}`);
      expect(actual).assertEqual('92395');
      logInfo(`${BUNDLE}PlayTimeTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0057
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0057
     * @tc.desc      playTimeTextOf(playTime=-107918) returns "0-107918"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0057 begin`);
      const actual: string = playTimeTextOf(-107918);
      logInfo(`playTimeTextOf(playTime=-107918): actual=${actual}`);
      expect(actual).assertEqual('0-107918');
      logInfo(`${BUNDLE}PlayTimeTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0058
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0058
     * @tc.desc      playTimeTextOf(playTime=-698134) returns "0-698134"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0058 begin`);
      const actual: string = playTimeTextOf(-698134);
      logInfo(`playTimeTextOf(playTime=-698134): actual=${actual}`);
      expect(actual).assertEqual('0-698134');
      logInfo(`${BUNDLE}PlayTimeTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0059
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0059
     * @tc.desc      playTimeTextOf(playTime=5038712) returns "5038712"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0059 begin`);
      const actual: string = playTimeTextOf(5038712);
      logInfo(`playTimeTextOf(playTime=5038712): actual=${actual}`);
      expect(actual).assertEqual('5038712');
      logInfo(`${BUNDLE}PlayTimeTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0060
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0060
     * @tc.desc      playTimeTextOf(playTime=6385544) returns "6385544"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0060 begin`);
      const actual: string = playTimeTextOf(6385544);
      logInfo(`playTimeTextOf(playTime=6385544): actual=${actual}`);
      expect(actual).assertEqual('6385544');
      logInfo(`${BUNDLE}PlayTimeTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0061
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0061
     * @tc.desc      playTimeTextOf(playTime=5664351) returns "5664351"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0061 begin`);
      const actual: string = playTimeTextOf(5664351);
      logInfo(`playTimeTextOf(playTime=5664351): actual=${actual}`);
      expect(actual).assertEqual('5664351');
      logInfo(`${BUNDLE}PlayTimeTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0062
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0062
     * @tc.desc      playTimeTextOf(playTime=1514601) returns "1514601"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0062 begin`);
      const actual: string = playTimeTextOf(1514601);
      logInfo(`playTimeTextOf(playTime=1514601): actual=${actual}`);
      expect(actual).assertEqual('1514601');
      logInfo(`${BUNDLE}PlayTimeTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0063
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0063
     * @tc.desc      playTimeTextOf(playTime=6577566) returns "6577566"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0063 begin`);
      const actual: string = playTimeTextOf(6577566);
      logInfo(`playTimeTextOf(playTime=6577566): actual=${actual}`);
      expect(actual).assertEqual('6577566');
      logInfo(`${BUNDLE}PlayTimeTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0064
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0064
     * @tc.desc      playTimeTextOf(playTime=-418655) returns "0-418655"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0064 begin`);
      const actual: string = playTimeTextOf(-418655);
      logInfo(`playTimeTextOf(playTime=-418655): actual=${actual}`);
      expect(actual).assertEqual('0-418655');
      logInfo(`${BUNDLE}PlayTimeTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0065
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0065
     * @tc.desc      playTimeTextOf(playTime=3596563.37) returns "3596563.37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0065 begin`);
      const actual: string = playTimeTextOf(3596563.37);
      logInfo(`playTimeTextOf(playTime=3596563.37): actual=${actual}`);
      expect(actual).assertEqual('3596563.37');
      logInfo(`${BUNDLE}PlayTimeTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0066
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0066
     * @tc.desc      playTimeTextOf(playTime=-164098) returns "0-164098"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0066 begin`);
      const actual: string = playTimeTextOf(-164098);
      logInfo(`playTimeTextOf(playTime=-164098): actual=${actual}`);
      expect(actual).assertEqual('0-164098');
      logInfo(`${BUNDLE}PlayTimeTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0067
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0067
     * @tc.desc      playTimeTextOf(playTime=3257838.1) returns "3257838.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0067 begin`);
      const actual: string = playTimeTextOf(3257838.1);
      logInfo(`playTimeTextOf(playTime=3257838.1): actual=${actual}`);
      expect(actual).assertEqual('3257838.1');
      logInfo(`${BUNDLE}PlayTimeTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0068
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0068
     * @tc.desc      playTimeTextOf(playTime=1132586.84) returns "1132586.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0068 begin`);
      const actual: string = playTimeTextOf(1132586.84);
      logInfo(`playTimeTextOf(playTime=1132586.84): actual=${actual}`);
      expect(actual).assertEqual('1132586.84');
      logInfo(`${BUNDLE}PlayTimeTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0069
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0069
     * @tc.desc      playTimeTextOf(playTime=3319931) returns "3319931"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0069 begin`);
      const actual: string = playTimeTextOf(3319931);
      logInfo(`playTimeTextOf(playTime=3319931): actual=${actual}`);
      expect(actual).assertEqual('3319931');
      logInfo(`${BUNDLE}PlayTimeTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0070
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0070
     * @tc.desc      playTimeTextOf(playTime=4707698) returns "4707698"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0070 begin`);
      const actual: string = playTimeTextOf(4707698);
      logInfo(`playTimeTextOf(playTime=4707698): actual=${actual}`);
      expect(actual).assertEqual('4707698');
      logInfo(`${BUNDLE}PlayTimeTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0071
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0071
     * @tc.desc      playTimeTextOf(playTime=6473506) returns "6473506"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0071 begin`);
      const actual: string = playTimeTextOf(6473506);
      logInfo(`playTimeTextOf(playTime=6473506): actual=${actual}`);
      expect(actual).assertEqual('6473506');
      logInfo(`${BUNDLE}PlayTimeTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0072
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0072
     * @tc.desc      playTimeTextOf(playTime=701700) returns "701700"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0072 begin`);
      const actual: string = playTimeTextOf(701700);
      logInfo(`playTimeTextOf(playTime=701700): actual=${actual}`);
      expect(actual).assertEqual('701700');
      logInfo(`${BUNDLE}PlayTimeTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0073
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0073
     * @tc.desc      playTimeTextOf(playTime=5271759) returns "5271759"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0073 begin`);
      const actual: string = playTimeTextOf(5271759);
      logInfo(`playTimeTextOf(playTime=5271759): actual=${actual}`);
      expect(actual).assertEqual('5271759');
      logInfo(`${BUNDLE}PlayTimeTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0074
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0074
     * @tc.desc      playTimeTextOf(playTime=-3001039) returns "0-3001039"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0074 begin`);
      const actual: string = playTimeTextOf(-3001039);
      logInfo(`playTimeTextOf(playTime=-3001039): actual=${actual}`);
      expect(actual).assertEqual('0-3001039');
      logInfo(`${BUNDLE}PlayTimeTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0075
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0075
     * @tc.desc      playTimeTextOf(playTime=-151198) returns "0-151198"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0075 begin`);
      const actual: string = playTimeTextOf(-151198);
      logInfo(`playTimeTextOf(playTime=-151198): actual=${actual}`);
      expect(actual).assertEqual('0-151198');
      logInfo(`${BUNDLE}PlayTimeTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0076
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0076
     * @tc.desc      playTimeTextOf(playTime=1547281.2) returns "1547281.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0076 begin`);
      const actual: string = playTimeTextOf(1547281.2);
      logInfo(`playTimeTextOf(playTime=1547281.2): actual=${actual}`);
      expect(actual).assertEqual('1547281.2');
      logInfo(`${BUNDLE}PlayTimeTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0077
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0077
     * @tc.desc      playTimeTextOf(playTime=2345136) returns "2345136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0077 begin`);
      const actual: string = playTimeTextOf(2345136);
      logInfo(`playTimeTextOf(playTime=2345136): actual=${actual}`);
      expect(actual).assertEqual('2345136');
      logInfo(`${BUNDLE}PlayTimeTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0078
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0078
     * @tc.desc      playTimeTextOf(playTime=1647292) returns "1647292"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0078 begin`);
      const actual: string = playTimeTextOf(1647292);
      logInfo(`playTimeTextOf(playTime=1647292): actual=${actual}`);
      expect(actual).assertEqual('1647292');
      logInfo(`${BUNDLE}PlayTimeTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0079
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0079
     * @tc.desc      playTimeTextOf(playTime=4181464) returns "4181464"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0079 begin`);
      const actual: string = playTimeTextOf(4181464);
      logInfo(`playTimeTextOf(playTime=4181464): actual=${actual}`);
      expect(actual).assertEqual('4181464');
      logInfo(`${BUNDLE}PlayTimeTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0080
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0080
     * @tc.desc      playTimeTextOf(playTime=5477345) returns "5477345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0080 begin`);
      const actual: string = playTimeTextOf(5477345);
      logInfo(`playTimeTextOf(playTime=5477345): actual=${actual}`);
      expect(actual).assertEqual('5477345');
      logInfo(`${BUNDLE}PlayTimeTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0081
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0081
     * @tc.desc      playTimeTextOf(playTime=4597811) returns "4597811"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0081 begin`);
      const actual: string = playTimeTextOf(4597811);
      logInfo(`playTimeTextOf(playTime=4597811): actual=${actual}`);
      expect(actual).assertEqual('4597811');
      logInfo(`${BUNDLE}PlayTimeTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0082
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0082
     * @tc.desc      playTimeTextOf(playTime=1513125.63) returns "1513125.63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0082 begin`);
      const actual: string = playTimeTextOf(1513125.63);
      logInfo(`playTimeTextOf(playTime=1513125.63): actual=${actual}`);
      expect(actual).assertEqual('1513125.63');
      logInfo(`${BUNDLE}PlayTimeTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0083
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0083
     * @tc.desc      playTimeTextOf(playTime=6240986) returns "6240986"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0083 begin`);
      const actual: string = playTimeTextOf(6240986);
      logInfo(`playTimeTextOf(playTime=6240986): actual=${actual}`);
      expect(actual).assertEqual('6240986');
      logInfo(`${BUNDLE}PlayTimeTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0084
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0084
     * @tc.desc      playTimeTextOf(playTime=2241322) returns "2241322"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0084 begin`);
      const actual: string = playTimeTextOf(2241322);
      logInfo(`playTimeTextOf(playTime=2241322): actual=${actual}`);
      expect(actual).assertEqual('2241322');
      logInfo(`${BUNDLE}PlayTimeTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0085
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0085
     * @tc.desc      playTimeTextOf(playTime=1840184.6) returns "1840184.6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0085 begin`);
      const actual: string = playTimeTextOf(1840184.6);
      logInfo(`playTimeTextOf(playTime=1840184.6): actual=${actual}`);
      expect(actual).assertEqual('1840184.6');
      logInfo(`${BUNDLE}PlayTimeTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0086
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0086
     * @tc.desc      playTimeTextOf(playTime=-639011) returns "0-639011"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0086 begin`);
      const actual: string = playTimeTextOf(-639011);
      logInfo(`playTimeTextOf(playTime=-639011): actual=${actual}`);
      expect(actual).assertEqual('0-639011');
      logInfo(`${BUNDLE}PlayTimeTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0087
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0087
     * @tc.desc      playTimeTextOf(playTime=3586385.91) returns "3586385.91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0087 begin`);
      const actual: string = playTimeTextOf(3586385.91);
      logInfo(`playTimeTextOf(playTime=3586385.91): actual=${actual}`);
      expect(actual).assertEqual('3586385.91');
      logInfo(`${BUNDLE}PlayTimeTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0088
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0088
     * @tc.desc      playTimeTextOf(playTime=2700924) returns "2700924"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0088 begin`);
      const actual: string = playTimeTextOf(2700924);
      logInfo(`playTimeTextOf(playTime=2700924): actual=${actual}`);
      expect(actual).assertEqual('2700924');
      logInfo(`${BUNDLE}PlayTimeTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0089
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0089
     * @tc.desc      playTimeTextOf(playTime=1014970.51) returns "1014970.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0089 begin`);
      const actual: string = playTimeTextOf(1014970.51);
      logInfo(`playTimeTextOf(playTime=1014970.51): actual=${actual}`);
      expect(actual).assertEqual('1014970.51');
      logInfo(`${BUNDLE}PlayTimeTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0090
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0090
     * @tc.desc      playTimeTextOf(playTime=2217993) returns "2217993"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0090 begin`);
      const actual: string = playTimeTextOf(2217993);
      logInfo(`playTimeTextOf(playTime=2217993): actual=${actual}`);
      expect(actual).assertEqual('2217993');
      logInfo(`${BUNDLE}PlayTimeTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0091
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0091
     * @tc.desc      playTimeTextOf(playTime=-726016) returns "0-726016"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0091 begin`);
      const actual: string = playTimeTextOf(-726016);
      logInfo(`playTimeTextOf(playTime=-726016): actual=${actual}`);
      expect(actual).assertEqual('0-726016');
      logInfo(`${BUNDLE}PlayTimeTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0092
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0092
     * @tc.desc      playTimeTextOf(playTime=991553.12) returns "991553.12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0092 begin`);
      const actual: string = playTimeTextOf(991553.12);
      logInfo(`playTimeTextOf(playTime=991553.12): actual=${actual}`);
      expect(actual).assertEqual('991553.12');
      logInfo(`${BUNDLE}PlayTimeTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0093
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0093
     * @tc.desc      playTimeTextOf(playTime=-263463) returns "0-263463"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0093 begin`);
      const actual: string = playTimeTextOf(-263463);
      logInfo(`playTimeTextOf(playTime=-263463): actual=${actual}`);
      expect(actual).assertEqual('0-263463');
      logInfo(`${BUNDLE}PlayTimeTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0094
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0094
     * @tc.desc      playTimeTextOf(playTime=4181721) returns "4181721"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0094 begin`);
      const actual: string = playTimeTextOf(4181721);
      logInfo(`playTimeTextOf(playTime=4181721): actual=${actual}`);
      expect(actual).assertEqual('4181721');
      logInfo(`${BUNDLE}PlayTimeTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0095
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0095
     * @tc.desc      playTimeTextOf(playTime=-545804) returns "0-545804"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0095 begin`);
      const actual: string = playTimeTextOf(-545804);
      logInfo(`playTimeTextOf(playTime=-545804): actual=${actual}`);
      expect(actual).assertEqual('0-545804');
      logInfo(`${BUNDLE}PlayTimeTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0096
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0096
     * @tc.desc      playTimeTextOf(playTime=3189414) returns "3189414"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0096 begin`);
      const actual: string = playTimeTextOf(3189414);
      logInfo(`playTimeTextOf(playTime=3189414): actual=${actual}`);
      expect(actual).assertEqual('3189414');
      logInfo(`${BUNDLE}PlayTimeTextOf_0096 end`);
    });
  });
}
