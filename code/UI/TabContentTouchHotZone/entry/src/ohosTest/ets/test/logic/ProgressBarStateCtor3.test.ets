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

/** Logic checks for new ProgressBarState (33 cases). */
export default function progressBarStateCtor3Test(): void {
  describe('ProgressBarStateCtor3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0097
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0097
     * @tc.desc      new ProgressBarState(3, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0097 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 3599000);
      logInfo(`new ProgressBarState(3, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(3, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0098
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0098
     * @tc.desc      new ProgressBarState(15, 1260000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0098 begin`);
      const subject: ProgressBarState = new ProgressBarState(15, 1260000);
      logInfo(`new ProgressBarState(15, 1260000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(15);
      logInfo(`new ProgressBarState(15, 1260000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1260000);
      logInfo(`new ProgressBarState(15, 1260000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 1260000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 1260000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(15, 1260000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(15, 1260000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(15, 1260000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(15, 1260000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0099
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0099
     * @tc.desc      new ProgressBarState(3, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0099 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 2340000);
      logInfo(`new ProgressBarState(3, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(3, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0100
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0100
     * @tc.desc      new ProgressBarState(115, 3600000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0100 begin`);
      const subject: ProgressBarState = new ProgressBarState(115, 3600000);
      logInfo(`new ProgressBarState(115, 3600000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(115);
      logInfo(`new ProgressBarState(115, 3600000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3600000);
      logInfo(`new ProgressBarState(115, 3600000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 3600000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 3600000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(115, 3600000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(115, 3600000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(115, 3600000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(115, 3600000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0101
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0101
     * @tc.desc      new ProgressBarState(55, 1440000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0101 begin`);
      const subject: ProgressBarState = new ProgressBarState(55, 1440000);
      logInfo(`new ProgressBarState(55, 1440000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(55);
      logInfo(`new ProgressBarState(55, 1440000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1440000);
      logInfo(`new ProgressBarState(55, 1440000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 1440000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 1440000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(55, 1440000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(55, 1440000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(55, 1440000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(55, 1440000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0102
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0102
     * @tc.desc      new ProgressBarState(5, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0102 begin`);
      const subject: ProgressBarState = new ProgressBarState(5, 3599000);
      logInfo(`new ProgressBarState(5, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(5);
      logInfo(`new ProgressBarState(5, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(5, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(5, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(5, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(5, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(5, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0103
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0103
     * @tc.desc      new ProgressBarState(90, 61000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0103 begin`);
      const subject: ProgressBarState = new ProgressBarState(90, 61000);
      logInfo(`new ProgressBarState(90, 61000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(90);
      logInfo(`new ProgressBarState(90, 61000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(61000);
      logInfo(`new ProgressBarState(90, 61000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 61000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 61000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(90, 61000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(90, 61000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(90, 61000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(90, 61000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0104
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0104
     * @tc.desc      new ProgressBarState(50, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0104 begin`);
      const subject: ProgressBarState = new ProgressBarState(50, 10);
      logInfo(`new ProgressBarState(50, 10): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(50);
      logInfo(`new ProgressBarState(50, 10): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(10);
      logInfo(`new ProgressBarState(50, 10): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 10): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 10): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(50, 10): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(50, 10): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(50, 10): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(50, 10): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0105
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0105
     * @tc.desc      new ProgressBarState(70, 720000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0105 begin`);
      const subject: ProgressBarState = new ProgressBarState(70, 720000);
      logInfo(`new ProgressBarState(70, 720000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(70);
      logInfo(`new ProgressBarState(70, 720000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(720000);
      logInfo(`new ProgressBarState(70, 720000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 720000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 720000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(70, 720000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(70, 720000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(70, 720000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(70, 720000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0106
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0106
     * @tc.desc      new ProgressBarState(10, 540000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0106 begin`);
      const subject: ProgressBarState = new ProgressBarState(10, 540000);
      logInfo(`new ProgressBarState(10, 540000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(10);
      logInfo(`new ProgressBarState(10, 540000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(540000);
      logInfo(`new ProgressBarState(10, 540000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 540000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 540000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(10, 540000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(10, 540000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(10, 540000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(10, 540000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0107
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0107
     * @tc.desc      new ProgressBarState(23, 2700000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0107 begin`);
      const subject: ProgressBarState = new ProgressBarState(23, 2700000);
      logInfo(`new ProgressBarState(23, 2700000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(23);
      logInfo(`new ProgressBarState(23, 2700000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2700000);
      logInfo(`new ProgressBarState(23, 2700000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(23, 2700000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(23, 2700000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(23, 2700000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(23, 2700000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(23, 2700000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(23, 2700000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0108
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0108
     * @tc.desc      new ProgressBarState(15, 60000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0108 begin`);
      const subject: ProgressBarState = new ProgressBarState(15, 60000);
      logInfo(`new ProgressBarState(15, 60000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(15);
      logInfo(`new ProgressBarState(15, 60000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(60000);
      logInfo(`new ProgressBarState(15, 60000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 60000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 60000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(15, 60000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(15, 60000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(15, 60000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(15, 60000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0109
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0109
     * @tc.desc      new ProgressBarState(100, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0109 begin`);
      const subject: ProgressBarState = new ProgressBarState(100, 1080000);
      logInfo(`new ProgressBarState(100, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(100);
      logInfo(`new ProgressBarState(100, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(100, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(100, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(100, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(100, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(100, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0110
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0110
     * @tc.desc      new ProgressBarState(95, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0110 begin`);
      const subject: ProgressBarState = new ProgressBarState(95, 2340000);
      logInfo(`new ProgressBarState(95, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(95);
      logInfo(`new ProgressBarState(95, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(95, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(95, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(95, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(95, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(95, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0111
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0111
     * @tc.desc      new ProgressBarState(5, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0111 begin`);
      const subject: ProgressBarState = new ProgressBarState(5, 1080000);
      logInfo(`new ProgressBarState(5, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(5);
      logInfo(`new ProgressBarState(5, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(5, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(5, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(5, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(5, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(5, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0112
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0112
     * @tc.desc      new ProgressBarState(55, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0112 begin`);
      const subject: ProgressBarState = new ProgressBarState(55, 1080000);
      logInfo(`new ProgressBarState(55, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(55);
      logInfo(`new ProgressBarState(55, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(55, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(55, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(55, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(55, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(55, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0113
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0113
     * @tc.desc      new ProgressBarState(50, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0113 begin`);
      const subject: ProgressBarState = new ProgressBarState(50, 3);
      logInfo(`new ProgressBarState(50, 3): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(50);
      logInfo(`new ProgressBarState(50, 3): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3);
      logInfo(`new ProgressBarState(50, 3): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 3): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 3): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(50, 3): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(50, 3): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(50, 3): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(50, 3): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0114
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0114
     * @tc.desc      new ProgressBarState(35, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0114 begin`);
      const subject: ProgressBarState = new ProgressBarState(35, 3599000);
      logInfo(`new ProgressBarState(35, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(35);
      logInfo(`new ProgressBarState(35, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(35, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(35, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(35, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(35, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(35, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0115
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0115
     * @tc.desc      new ProgressBarState(115, 1620000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0115 begin`);
      const subject: ProgressBarState = new ProgressBarState(115, 1620000);
      logInfo(`new ProgressBarState(115, 1620000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(115);
      logInfo(`new ProgressBarState(115, 1620000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1620000);
      logInfo(`new ProgressBarState(115, 1620000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 1620000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 1620000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(115, 1620000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(115, 1620000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(115, 1620000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(115, 1620000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0116
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0116
     * @tc.desc      new ProgressBarState(60, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0116 begin`);
      const subject: ProgressBarState = new ProgressBarState(60, 3599000);
      logInfo(`new ProgressBarState(60, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(60);
      logInfo(`new ProgressBarState(60, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(60, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(60, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(60, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(60, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(60, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0117
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0117
     * @tc.desc      new ProgressBarState(60, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0117 begin`);
      const subject: ProgressBarState = new ProgressBarState(60, 2340000);
      logInfo(`new ProgressBarState(60, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(60);
      logInfo(`new ProgressBarState(60, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(60, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(60, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(60, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(60, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(60, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0118
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0118
     * @tc.desc      new ProgressBarState(15, 720000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0118 begin`);
      const subject: ProgressBarState = new ProgressBarState(15, 720000);
      logInfo(`new ProgressBarState(15, 720000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(15);
      logInfo(`new ProgressBarState(15, 720000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(720000);
      logInfo(`new ProgressBarState(15, 720000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 720000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 720000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(15, 720000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(15, 720000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(15, 720000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(15, 720000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0119
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0119
     * @tc.desc      new ProgressBarState(2, 180000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0119 begin`);
      const subject: ProgressBarState = new ProgressBarState(2, 180000);
      logInfo(`new ProgressBarState(2, 180000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(2);
      logInfo(`new ProgressBarState(2, 180000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(180000);
      logInfo(`new ProgressBarState(2, 180000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 180000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 180000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(2, 180000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(2, 180000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(2, 180000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(2, 180000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0120
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0120
     * @tc.desc      new ProgressBarState(2, 1620000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0120 begin`);
      const subject: ProgressBarState = new ProgressBarState(2, 1620000);
      logInfo(`new ProgressBarState(2, 1620000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(2);
      logInfo(`new ProgressBarState(2, 1620000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1620000);
      logInfo(`new ProgressBarState(2, 1620000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 1620000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 1620000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(2, 1620000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(2, 1620000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(2, 1620000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(2, 1620000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0121
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0121
     * @tc.desc      new ProgressBarState(70, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0121 begin`);
      const subject: ProgressBarState = new ProgressBarState(70, 3);
      logInfo(`new ProgressBarState(70, 3): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(70);
      logInfo(`new ProgressBarState(70, 3): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3);
      logInfo(`new ProgressBarState(70, 3): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 3): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 3): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(70, 3): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(70, 3): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(70, 3): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(70, 3): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0122
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0122
     * @tc.desc      new ProgressBarState(20, 1800000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0122 begin`);
      const subject: ProgressBarState = new ProgressBarState(20, 1800000);
      logInfo(`new ProgressBarState(20, 1800000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(20);
      logInfo(`new ProgressBarState(20, 1800000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1800000);
      logInfo(`new ProgressBarState(20, 1800000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 1800000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 1800000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(20, 1800000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(20, 1800000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(20, 1800000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(20, 1800000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0123
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0123
     * @tc.desc      new ProgressBarState(20, 2340000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0123 begin`);
      const subject: ProgressBarState = new ProgressBarState(20, 2340000);
      logInfo(`new ProgressBarState(20, 2340000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(20);
      logInfo(`new ProgressBarState(20, 2340000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2340000);
      logInfo(`new ProgressBarState(20, 2340000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 2340000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 2340000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(20, 2340000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(20, 2340000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(20, 2340000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(20, 2340000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0124
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0124
     * @tc.desc      new ProgressBarState(-25, 1000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0124 begin`);
      const subject: ProgressBarState = new ProgressBarState(-25, 1000);
      logInfo(`new ProgressBarState(-25, 1000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-25);
      logInfo(`new ProgressBarState(-25, 1000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1000);
      logInfo(`new ProgressBarState(-25, 1000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 1000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 1000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-25, 1000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-25, 1000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-25, 1000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-25, 1000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0125
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0125
     * @tc.desc      new ProgressBarState(65, 900000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0125 begin`);
      const subject: ProgressBarState = new ProgressBarState(65, 900000);
      logInfo(`new ProgressBarState(65, 900000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(65);
      logInfo(`new ProgressBarState(65, 900000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(900000);
      logInfo(`new ProgressBarState(65, 900000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(65, 900000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(65, 900000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(65, 900000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(65, 900000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(65, 900000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(65, 900000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0126
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0126
     * @tc.desc      new ProgressBarState(40, 2160000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0126 begin`);
      const subject: ProgressBarState = new ProgressBarState(40, 2160000);
      logInfo(`new ProgressBarState(40, 2160000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(40);
      logInfo(`new ProgressBarState(40, 2160000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2160000);
      logInfo(`new ProgressBarState(40, 2160000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(40, 2160000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(40, 2160000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(40, 2160000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(40, 2160000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(40, 2160000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(40, 2160000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0127
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0127
     * @tc.desc      new ProgressBarState(25, 360000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0127 begin`);
      const subject: ProgressBarState = new ProgressBarState(25, 360000);
      logInfo(`new ProgressBarState(25, 360000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(25);
      logInfo(`new ProgressBarState(25, 360000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(360000);
      logInfo(`new ProgressBarState(25, 360000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 360000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 360000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(25, 360000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(25, 360000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(25, 360000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(25, 360000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0128
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0128
     * @tc.desc      new ProgressBarState(75, 180000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0128 begin`);
      const subject: ProgressBarState = new ProgressBarState(75, 180000);
      logInfo(`new ProgressBarState(75, 180000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(75);
      logInfo(`new ProgressBarState(75, 180000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(180000);
      logInfo(`new ProgressBarState(75, 180000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 180000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 180000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(75, 180000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(75, 180000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(75, 180000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(75, 180000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0129
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0129
     * @tc.desc      new ProgressBarState(10, 1080000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0129 begin`);
      const subject: ProgressBarState = new ProgressBarState(10, 1080000);
      logInfo(`new ProgressBarState(10, 1080000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(10);
      logInfo(`new ProgressBarState(10, 1080000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1080000);
      logInfo(`new ProgressBarState(10, 1080000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 1080000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 1080000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(10, 1080000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(10, 1080000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(10, 1080000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(10, 1080000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0129 end`);
    });
  });
}
