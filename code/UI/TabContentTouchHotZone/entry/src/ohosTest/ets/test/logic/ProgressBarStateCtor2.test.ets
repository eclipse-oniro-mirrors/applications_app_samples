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
import { ProgressBarState } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ProgressBarState (48 cases). */
export default function progressBarStateCtor2Test(): void {
  describe('ProgressBarStateCtor2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0049
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0049
     * @tc.desc      new ProgressBarState(0, 900000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0049 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 900000);
      logInfo(`new ProgressBarState(0, 900000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 900000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(900000);
      logInfo(`new ProgressBarState(0, 900000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 900000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 900000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 900000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 900000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 900000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 900000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0050
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0050
     * @tc.desc      new ProgressBarState(0, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0050 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1080000);
      logInfo(`new ProgressBarState(0, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(0, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0051
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0051
     * @tc.desc      new ProgressBarState(0, 1260000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0051 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1260000);
      logInfo(`new ProgressBarState(0, 1260000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1260000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1260000);
      logInfo(`new ProgressBarState(0, 1260000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1260000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1260000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1260000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1260000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1260000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1260000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0052
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0052
     * @tc.desc      new ProgressBarState(0, 1440000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0052 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1440000);
      logInfo(`new ProgressBarState(0, 1440000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1440000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1440000);
      logInfo(`new ProgressBarState(0, 1440000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1440000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1440000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1440000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1440000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1440000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1440000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0053
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0053
     * @tc.desc      new ProgressBarState(0, 1620000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0053 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1620000);
      logInfo(`new ProgressBarState(0, 1620000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1620000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1620000);
      logInfo(`new ProgressBarState(0, 1620000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1620000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1620000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1620000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1620000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1620000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1620000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0054
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0054
     * @tc.desc      new ProgressBarState(0, 1800000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0054 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1800000);
      logInfo(`new ProgressBarState(0, 1800000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1800000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1800000);
      logInfo(`new ProgressBarState(0, 1800000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1800000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1800000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1800000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1800000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1800000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1800000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0055
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0055
     * @tc.desc      new ProgressBarState(0, 1980000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0055 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1980000);
      logInfo(`new ProgressBarState(0, 1980000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1980000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1980000);
      logInfo(`new ProgressBarState(0, 1980000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1980000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1980000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1980000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1980000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1980000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1980000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0056
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0056
     * @tc.desc      new ProgressBarState(0, 2160000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0056 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 2160000);
      logInfo(`new ProgressBarState(0, 2160000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2160000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2160000);
      logInfo(`new ProgressBarState(0, 2160000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2160000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2160000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 2160000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 2160000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 2160000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 2160000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0057
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0057
     * @tc.desc      new ProgressBarState(0, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0057 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 2340000);
      logInfo(`new ProgressBarState(0, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(0, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0058
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0058
     * @tc.desc      new ProgressBarState(0, 2520000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0058 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 2520000);
      logInfo(`new ProgressBarState(0, 2520000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2520000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2520000);
      logInfo(`new ProgressBarState(0, 2520000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2520000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2520000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 2520000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 2520000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 2520000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 2520000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0059
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0059
     * @tc.desc      new ProgressBarState(0, 2700000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0059 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 2700000);
      logInfo(`new ProgressBarState(0, 2700000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2700000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2700000);
      logInfo(`new ProgressBarState(0, 2700000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2700000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2700000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 2700000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 2700000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 2700000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 2700000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0060
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0060
     * @tc.desc      new ProgressBarState(80, 2160000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0060 begin`);
      const subject: ProgressBarState = new ProgressBarState(80, 2160000);
      logInfo(`new ProgressBarState(80, 2160000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(80);
      logInfo(`new ProgressBarState(80, 2160000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2160000);
      logInfo(`new ProgressBarState(80, 2160000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(80, 2160000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(80, 2160000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(80, 2160000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(80, 2160000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(80, 2160000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(80, 2160000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0061
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0061
     * @tc.desc      new ProgressBarState(-25, 2520000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0061 begin`);
      const subject: ProgressBarState = new ProgressBarState(-25, 2520000);
      logInfo(`new ProgressBarState(-25, 2520000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-25);
      logInfo(`new ProgressBarState(-25, 2520000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2520000);
      logInfo(`new ProgressBarState(-25, 2520000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 2520000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 2520000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-25, 2520000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-25, 2520000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-25, 2520000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-25, 2520000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0062
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0062
     * @tc.desc      new ProgressBarState(75, 2160000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0062 begin`);
      const subject: ProgressBarState = new ProgressBarState(75, 2160000);
      logInfo(`new ProgressBarState(75, 2160000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(75);
      logInfo(`new ProgressBarState(75, 2160000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2160000);
      logInfo(`new ProgressBarState(75, 2160000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 2160000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 2160000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(75, 2160000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(75, 2160000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(75, 2160000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(75, 2160000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0063
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0063
     * @tc.desc      new ProgressBarState(90, 1440000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0063 begin`);
      const subject: ProgressBarState = new ProgressBarState(90, 1440000);
      logInfo(`new ProgressBarState(90, 1440000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(90);
      logInfo(`new ProgressBarState(90, 1440000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1440000);
      logInfo(`new ProgressBarState(90, 1440000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 1440000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 1440000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(90, 1440000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(90, 1440000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(90, 1440000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(90, 1440000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0064
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0064
     * @tc.desc      new ProgressBarState(90, 1000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0064 begin`);
      const subject: ProgressBarState = new ProgressBarState(90, 1000);
      logInfo(`new ProgressBarState(90, 1000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(90);
      logInfo(`new ProgressBarState(90, 1000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1000);
      logInfo(`new ProgressBarState(90, 1000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 1000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 1000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(90, 1000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(90, 1000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(90, 1000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(90, 1000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0065
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0065
     * @tc.desc      new ProgressBarState(-25, 60000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0065 begin`);
      const subject: ProgressBarState = new ProgressBarState(-25, 60000);
      logInfo(`new ProgressBarState(-25, 60000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-25);
      logInfo(`new ProgressBarState(-25, 60000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(60000);
      logInfo(`new ProgressBarState(-25, 60000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 60000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 60000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-25, 60000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-25, 60000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-25, 60000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-25, 60000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0066
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0066
     * @tc.desc      new ProgressBarState(25, 720000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0066 begin`);
      const subject: ProgressBarState = new ProgressBarState(25, 720000);
      logInfo(`new ProgressBarState(25, 720000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(25);
      logInfo(`new ProgressBarState(25, 720000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(720000);
      logInfo(`new ProgressBarState(25, 720000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 720000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 720000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(25, 720000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(25, 720000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(25, 720000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(25, 720000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0067
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0067
     * @tc.desc      new ProgressBarState(-25, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0067 begin`);
      const subject: ProgressBarState = new ProgressBarState(-25, 1);
      logInfo(`new ProgressBarState(-25, 1): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-25);
      logInfo(`new ProgressBarState(-25, 1): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1);
      logInfo(`new ProgressBarState(-25, 1): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 1): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 1): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-25, 1): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-25, 1): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-25, 1): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-25, 1): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0068
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0068
     * @tc.desc      new ProgressBarState(45, 540000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0068 begin`);
      const subject: ProgressBarState = new ProgressBarState(45, 540000);
      logInfo(`new ProgressBarState(45, 540000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(45);
      logInfo(`new ProgressBarState(45, 540000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(540000);
      logInfo(`new ProgressBarState(45, 540000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 540000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 540000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(45, 540000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(45, 540000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(45, 540000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(45, 540000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0069
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0069
     * @tc.desc      new ProgressBarState(25, 999) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0069 begin`);
      const subject: ProgressBarState = new ProgressBarState(25, 999);
      logInfo(`new ProgressBarState(25, 999): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(25);
      logInfo(`new ProgressBarState(25, 999): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(999);
      logInfo(`new ProgressBarState(25, 999): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 999): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 999): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(25, 999): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(25, 999): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(25, 999): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(25, 999): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0070
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0070
     * @tc.desc      new ProgressBarState(20, 2700000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0070 begin`);
      const subject: ProgressBarState = new ProgressBarState(20, 2700000);
      logInfo(`new ProgressBarState(20, 2700000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(20);
      logInfo(`new ProgressBarState(20, 2700000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2700000);
      logInfo(`new ProgressBarState(20, 2700000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 2700000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 2700000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(20, 2700000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(20, 2700000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(20, 2700000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(20, 2700000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0071
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0071
     * @tc.desc      new ProgressBarState(3, 61000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0071 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 61000);
      logInfo(`new ProgressBarState(3, 61000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 61000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(61000);
      logInfo(`new ProgressBarState(3, 61000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 61000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 61000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 61000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 61000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 61000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 61000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0072
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0072
     * @tc.desc      new ProgressBarState(3, 1980000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0072 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 1980000);
      logInfo(`new ProgressBarState(3, 1980000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 1980000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1980000);
      logInfo(`new ProgressBarState(3, 1980000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 1980000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 1980000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 1980000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 1980000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 1980000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 1980000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0073
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0073
     * @tc.desc      new ProgressBarState(15, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0073 begin`);
      const subject: ProgressBarState = new ProgressBarState(15, 10);
      logInfo(`new ProgressBarState(15, 10): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(15);
      logInfo(`new ProgressBarState(15, 10): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(10);
      logInfo(`new ProgressBarState(15, 10): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 10): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 10): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(15, 10): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(15, 10): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(15, 10): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(15, 10): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0074
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0074
     * @tc.desc      new ProgressBarState(70, 540000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0074 begin`);
      const subject: ProgressBarState = new ProgressBarState(70, 540000);
      logInfo(`new ProgressBarState(70, 540000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(70);
      logInfo(`new ProgressBarState(70, 540000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(540000);
      logInfo(`new ProgressBarState(70, 540000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 540000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 540000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(70, 540000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(70, 540000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(70, 540000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(70, 540000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0075
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0075
     * @tc.desc      new ProgressBarState(75, 60000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0075 begin`);
      const subject: ProgressBarState = new ProgressBarState(75, 60000);
      logInfo(`new ProgressBarState(75, 60000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(75);
      logInfo(`new ProgressBarState(75, 60000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(60000);
      logInfo(`new ProgressBarState(75, 60000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 60000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 60000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(75, 60000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(75, 60000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(75, 60000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(75, 60000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0076
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0076
     * @tc.desc      new ProgressBarState(45, 59999) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0076 begin`);
      const subject: ProgressBarState = new ProgressBarState(45, 59999);
      logInfo(`new ProgressBarState(45, 59999): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(45);
      logInfo(`new ProgressBarState(45, 59999): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(59999);
      logInfo(`new ProgressBarState(45, 59999): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 59999): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 59999): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(45, 59999): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(45, 59999): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(45, 59999): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(45, 59999): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0077
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0077
     * @tc.desc      new ProgressBarState(20, 60000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0077 begin`);
      const subject: ProgressBarState = new ProgressBarState(20, 60000);
      logInfo(`new ProgressBarState(20, 60000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(20);
      logInfo(`new ProgressBarState(20, 60000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(60000);
      logInfo(`new ProgressBarState(20, 60000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 60000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 60000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(20, 60000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(20, 60000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(20, 60000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(20, 60000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0078
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0078
     * @tc.desc      new ProgressBarState(5, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0078 begin`);
      const subject: ProgressBarState = new ProgressBarState(5, -1);
      logInfo(`new ProgressBarState(5, -1): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(5);
      logInfo(`new ProgressBarState(5, -1): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(-1);
      logInfo(`new ProgressBarState(5, -1): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(5, -1): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(5, -1): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(5, -1): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(5, -1): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(5, -1): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(5, -1): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0079
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0079
     * @tc.desc      new ProgressBarState(95, 1980000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0079 begin`);
      const subject: ProgressBarState = new ProgressBarState(95, 1980000);
      logInfo(`new ProgressBarState(95, 1980000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(95);
      logInfo(`new ProgressBarState(95, 1980000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1980000);
      logInfo(`new ProgressBarState(95, 1980000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 1980000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 1980000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(95, 1980000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(95, 1980000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(95, 1980000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(95, 1980000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0080
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0080
     * @tc.desc      new ProgressBarState(10, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0080 begin`);
      const subject: ProgressBarState = new ProgressBarState(10, 3599000);
      logInfo(`new ProgressBarState(10, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(10);
      logInfo(`new ProgressBarState(10, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(10, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(10, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(10, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(10, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(10, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0081
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0081
     * @tc.desc      new ProgressBarState(110, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0081 begin`);
      const subject: ProgressBarState = new ProgressBarState(110, 1080000);
      logInfo(`new ProgressBarState(110, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(110);
      logInfo(`new ProgressBarState(110, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(110, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(110, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(110, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(110, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(110, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(110, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(110, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0082
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0082
     * @tc.desc      new ProgressBarState(-1, 999) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0082 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 999);
      logInfo(`new ProgressBarState(-1, 999): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-1);
      logInfo(`new ProgressBarState(-1, 999): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(999);
      logInfo(`new ProgressBarState(-1, 999): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 999): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 999): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-1, 999): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-1, 999): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-1, 999): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-1, 999): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0083
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0083
     * @tc.desc      new ProgressBarState(30, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0083 begin`);
      const subject: ProgressBarState = new ProgressBarState(30, 2340000);
      logInfo(`new ProgressBarState(30, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(30);
      logInfo(`new ProgressBarState(30, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(30, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(30, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(30, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(30, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(30, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0084
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0084
     * @tc.desc      new ProgressBarState(100, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0084 begin`);
      const subject: ProgressBarState = new ProgressBarState(100, 2);
      logInfo(`new ProgressBarState(100, 2): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(100);
      logInfo(`new ProgressBarState(100, 2): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2);
      logInfo(`new ProgressBarState(100, 2): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 2): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 2): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(100, 2): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(100, 2): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(100, 2): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(100, 2): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0085
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0085
     * @tc.desc      new ProgressBarState(50, 500) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0085 begin`);
      const subject: ProgressBarState = new ProgressBarState(50, 500);
      logInfo(`new ProgressBarState(50, 500): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(50);
      logInfo(`new ProgressBarState(50, 500): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(500);
      logInfo(`new ProgressBarState(50, 500): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 500): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 500): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(50, 500): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(50, 500): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(50, 500): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(50, 500): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0086
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0086
     * @tc.desc      new ProgressBarState(30, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0086 begin`);
      const subject: ProgressBarState = new ProgressBarState(30, 1080000);
      logInfo(`new ProgressBarState(30, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(30);
      logInfo(`new ProgressBarState(30, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(30, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(30, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(30, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(30, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(30, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0087
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0087
     * @tc.desc      new ProgressBarState(50, 61000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0087 begin`);
      const subject: ProgressBarState = new ProgressBarState(50, 61000);
      logInfo(`new ProgressBarState(50, 61000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(50);
      logInfo(`new ProgressBarState(50, 61000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(61000);
      logInfo(`new ProgressBarState(50, 61000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 61000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 61000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(50, 61000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(50, 61000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(50, 61000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(50, 61000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0088
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0088
     * @tc.desc      new ProgressBarState(60, 2700000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0088 begin`);
      const subject: ProgressBarState = new ProgressBarState(60, 2700000);
      logInfo(`new ProgressBarState(60, 2700000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(60);
      logInfo(`new ProgressBarState(60, 2700000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2700000);
      logInfo(`new ProgressBarState(60, 2700000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 2700000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 2700000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(60, 2700000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(60, 2700000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(60, 2700000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(60, 2700000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0089
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0089
     * @tc.desc      new ProgressBarState(-1, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0089 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 10);
      logInfo(`new ProgressBarState(-1, 10): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-1);
      logInfo(`new ProgressBarState(-1, 10): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(10);
      logInfo(`new ProgressBarState(-1, 10): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 10): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 10): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-1, 10): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-1, 10): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-1, 10): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-1, 10): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0090
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0090
     * @tc.desc      new ProgressBarState(3, 1000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0090 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 1000);
      logInfo(`new ProgressBarState(3, 1000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 1000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1000);
      logInfo(`new ProgressBarState(3, 1000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 1000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 1000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 1000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 1000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 1000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 1000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0091
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0091
     * @tc.desc      new ProgressBarState(10, 500) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0091 begin`);
      const subject: ProgressBarState = new ProgressBarState(10, 500);
      logInfo(`new ProgressBarState(10, 500): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(10);
      logInfo(`new ProgressBarState(10, 500): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(500);
      logInfo(`new ProgressBarState(10, 500): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 500): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 500): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(10, 500): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(10, 500): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(10, 500): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(10, 500): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0092
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0092
     * @tc.desc      new ProgressBarState(-1, 1800000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0092 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 1800000);
      logInfo(`new ProgressBarState(-1, 1800000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-1);
      logInfo(`new ProgressBarState(-1, 1800000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1800000);
      logInfo(`new ProgressBarState(-1, 1800000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 1800000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 1800000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-1, 1800000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-1, 1800000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-1, 1800000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-1, 1800000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0093
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0093
     * @tc.desc      new ProgressBarState(35, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0093 begin`);
      const subject: ProgressBarState = new ProgressBarState(35, 2340000);
      logInfo(`new ProgressBarState(35, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(35);
      logInfo(`new ProgressBarState(35, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(35, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(35, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(35, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(35, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(35, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0094
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0094
     * @tc.desc      new ProgressBarState(60, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0094 begin`);
      const subject: ProgressBarState = new ProgressBarState(60, 100);
      logInfo(`new ProgressBarState(60, 100): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(60);
      logInfo(`new ProgressBarState(60, 100): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(100);
      logInfo(`new ProgressBarState(60, 100): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 100): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 100): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(60, 100): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(60, 100): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(60, 100): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(60, 100): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0095
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0095
     * @tc.desc      new ProgressBarState(90, 500) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0095 begin`);
      const subject: ProgressBarState = new ProgressBarState(90, 500);
      logInfo(`new ProgressBarState(90, 500): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(90);
      logInfo(`new ProgressBarState(90, 500): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(500);
      logInfo(`new ProgressBarState(90, 500): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 500): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 500): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(90, 500): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(90, 500): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(90, 500): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(90, 500): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0096
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0096
     * @tc.desc      new ProgressBarState(5, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0096 begin`);
      const subject: ProgressBarState = new ProgressBarState(5, 2340000);
      logInfo(`new ProgressBarState(5, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(5);
      logInfo(`new ProgressBarState(5, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(5, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(5, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(5, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(5, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(5, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0096 end`);
    });
  });
}
