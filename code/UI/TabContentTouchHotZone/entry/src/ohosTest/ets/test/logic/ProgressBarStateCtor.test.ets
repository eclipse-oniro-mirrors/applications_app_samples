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
export default function progressBarStateCtorTest(): void {
  describe('ProgressBarStateCtorTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0001
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0001
     * @tc.desc      new ProgressBarState(0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0001 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      logInfo(`new ProgressBarState(0, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(0, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0002
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0002
     * @tc.desc      new ProgressBarState(1, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0002 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      logInfo(`new ProgressBarState(1, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(1);
      logInfo(`new ProgressBarState(1, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(1, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(1, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(1, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(1, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(1, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(1, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(1, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0003
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0003
     * @tc.desc      new ProgressBarState(-1, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0003 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      logInfo(`new ProgressBarState(-1, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-1);
      logInfo(`new ProgressBarState(-1, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-1, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-1, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-1, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-1, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-1, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0004
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0004
     * @tc.desc      new ProgressBarState(2, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0004 begin`);
      const subject: ProgressBarState = new ProgressBarState(2, 0);
      logInfo(`new ProgressBarState(2, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(2);
      logInfo(`new ProgressBarState(2, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(2, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(2, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(2, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(2, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(2, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(2, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0005
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0005
     * @tc.desc      new ProgressBarState(3, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0005 begin`);
      const subject: ProgressBarState = new ProgressBarState(3, 0);
      logInfo(`new ProgressBarState(3, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(3);
      logInfo(`new ProgressBarState(3, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(3, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(3, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(3, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(3, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(3, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(3, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0006
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0006
     * @tc.desc      new ProgressBarState(10, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0006 begin`);
      const subject: ProgressBarState = new ProgressBarState(10, 0);
      logInfo(`new ProgressBarState(10, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(10);
      logInfo(`new ProgressBarState(10, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(10, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(10, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(10, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(10, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(10, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(10, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0007
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0007
     * @tc.desc      new ProgressBarState(100, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0007 begin`);
      const subject: ProgressBarState = new ProgressBarState(100, 0);
      logInfo(`new ProgressBarState(100, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(100);
      logInfo(`new ProgressBarState(100, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(100, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(100, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(100, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(100, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(100, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(100, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0008
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0008
     * @tc.desc      new ProgressBarState(5, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0008 begin`);
      const subject: ProgressBarState = new ProgressBarState(5, 0);
      logInfo(`new ProgressBarState(5, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(5);
      logInfo(`new ProgressBarState(5, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(5, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(5, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(5, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(5, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(5, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(5, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0009
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0009
     * @tc.desc      new ProgressBarState(15, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0009 begin`);
      const subject: ProgressBarState = new ProgressBarState(15, 0);
      logInfo(`new ProgressBarState(15, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(15);
      logInfo(`new ProgressBarState(15, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(15, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(15, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(15, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(15, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(15, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(15, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0010
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0010
     * @tc.desc      new ProgressBarState(20, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0010 begin`);
      const subject: ProgressBarState = new ProgressBarState(20, 0);
      logInfo(`new ProgressBarState(20, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(20);
      logInfo(`new ProgressBarState(20, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(20, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(20, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(20, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(20, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(20, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(20, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0011
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0011
     * @tc.desc      new ProgressBarState(25, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0011 begin`);
      const subject: ProgressBarState = new ProgressBarState(25, 0);
      logInfo(`new ProgressBarState(25, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(25);
      logInfo(`new ProgressBarState(25, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(25, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(25, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(25, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(25, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(25, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(25, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0012
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0012
     * @tc.desc      new ProgressBarState(30, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0012 begin`);
      const subject: ProgressBarState = new ProgressBarState(30, 0);
      logInfo(`new ProgressBarState(30, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(30);
      logInfo(`new ProgressBarState(30, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(30, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(30, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(30, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(30, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(30, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(30, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0013
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0013
     * @tc.desc      new ProgressBarState(35, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0013 begin`);
      const subject: ProgressBarState = new ProgressBarState(35, 0);
      logInfo(`new ProgressBarState(35, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(35);
      logInfo(`new ProgressBarState(35, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(35, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(35, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(35, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(35, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(35, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(35, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0014
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0014
     * @tc.desc      new ProgressBarState(40, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0014 begin`);
      const subject: ProgressBarState = new ProgressBarState(40, 0);
      logInfo(`new ProgressBarState(40, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(40);
      logInfo(`new ProgressBarState(40, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(40, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(40, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(40, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(40, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(40, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(40, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(40, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0015
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0015
     * @tc.desc      new ProgressBarState(45, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0015 begin`);
      const subject: ProgressBarState = new ProgressBarState(45, 0);
      logInfo(`new ProgressBarState(45, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(45);
      logInfo(`new ProgressBarState(45, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(45, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(45, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(45, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(45, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(45, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(45, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0016
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0016
     * @tc.desc      new ProgressBarState(50, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0016 begin`);
      const subject: ProgressBarState = new ProgressBarState(50, 0);
      logInfo(`new ProgressBarState(50, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(50);
      logInfo(`new ProgressBarState(50, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(50, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(50, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(50, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(50, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(50, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(50, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0017
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0017
     * @tc.desc      new ProgressBarState(55, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0017 begin`);
      const subject: ProgressBarState = new ProgressBarState(55, 0);
      logInfo(`new ProgressBarState(55, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(55);
      logInfo(`new ProgressBarState(55, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(55, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(55, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(55, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(55, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(55, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(55, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0018
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0018
     * @tc.desc      new ProgressBarState(60, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0018 begin`);
      const subject: ProgressBarState = new ProgressBarState(60, 0);
      logInfo(`new ProgressBarState(60, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(60);
      logInfo(`new ProgressBarState(60, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(60, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(60, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(60, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(60, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(60, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(60, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0019
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0019
     * @tc.desc      new ProgressBarState(65, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0019 begin`);
      const subject: ProgressBarState = new ProgressBarState(65, 0);
      logInfo(`new ProgressBarState(65, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(65);
      logInfo(`new ProgressBarState(65, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(65, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(65, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(65, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(65, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(65, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(65, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(65, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0020
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0020
     * @tc.desc      new ProgressBarState(70, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0020 begin`);
      const subject: ProgressBarState = new ProgressBarState(70, 0);
      logInfo(`new ProgressBarState(70, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(70);
      logInfo(`new ProgressBarState(70, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(70, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(70, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(70, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(70, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(70, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(70, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0021
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0021
     * @tc.desc      new ProgressBarState(75, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0021 begin`);
      const subject: ProgressBarState = new ProgressBarState(75, 0);
      logInfo(`new ProgressBarState(75, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(75);
      logInfo(`new ProgressBarState(75, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(75, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(75, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(75, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(75, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(75, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(75, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0022
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0022
     * @tc.desc      new ProgressBarState(80, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0022 begin`);
      const subject: ProgressBarState = new ProgressBarState(80, 0);
      logInfo(`new ProgressBarState(80, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(80);
      logInfo(`new ProgressBarState(80, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(80, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(80, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(80, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(80, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(80, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(80, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(80, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0023
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0023
     * @tc.desc      new ProgressBarState(85, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0023 begin`);
      const subject: ProgressBarState = new ProgressBarState(85, 0);
      logInfo(`new ProgressBarState(85, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(85);
      logInfo(`new ProgressBarState(85, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(85, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(85, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(85, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(85, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(85, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(85, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(85, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0024
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0024
     * @tc.desc      new ProgressBarState(90, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0024 begin`);
      const subject: ProgressBarState = new ProgressBarState(90, 0);
      logInfo(`new ProgressBarState(90, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(90);
      logInfo(`new ProgressBarState(90, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(90, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(90, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(90, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(90, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(90, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(90, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0025
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0025
     * @tc.desc      new ProgressBarState(95, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0025 begin`);
      const subject: ProgressBarState = new ProgressBarState(95, 0);
      logInfo(`new ProgressBarState(95, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(95);
      logInfo(`new ProgressBarState(95, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(95, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(95, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(95, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(95, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(95, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(95, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0026
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0026
     * @tc.desc      new ProgressBarState(105, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0026 begin`);
      const subject: ProgressBarState = new ProgressBarState(105, 0);
      logInfo(`new ProgressBarState(105, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(105);
      logInfo(`new ProgressBarState(105, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(105, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(105, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(105, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(105, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(105, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(105, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(105, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0027
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0027
     * @tc.desc      new ProgressBarState(110, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0027 begin`);
      const subject: ProgressBarState = new ProgressBarState(110, 0);
      logInfo(`new ProgressBarState(110, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(110);
      logInfo(`new ProgressBarState(110, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(110, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(110, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(110, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(110, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(110, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(110, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(110, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0028
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0028
     * @tc.desc      new ProgressBarState(115, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0028 begin`);
      const subject: ProgressBarState = new ProgressBarState(115, 0);
      logInfo(`new ProgressBarState(115, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(115);
      logInfo(`new ProgressBarState(115, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(115, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(115, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(115, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(115, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(115, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(115, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0029
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0029
     * @tc.desc      new ProgressBarState(23, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0029 begin`);
      const subject: ProgressBarState = new ProgressBarState(23, 0);
      logInfo(`new ProgressBarState(23, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(23);
      logInfo(`new ProgressBarState(23, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(23, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(23, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(23, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(23, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(23, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(23, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(23, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0030
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0030
     * @tc.desc      new ProgressBarState(-25, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0030 begin`);
      const subject: ProgressBarState = new ProgressBarState(-25, 0);
      logInfo(`new ProgressBarState(-25, 0): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(-25);
      logInfo(`new ProgressBarState(-25, 0): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 0): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 0): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(-25, 0): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(-25, 0): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(-25, 0): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(-25, 0): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(-25, 0): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0031
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0031
     * @tc.desc      new ProgressBarState(0, 500) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0031 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 500);
      logInfo(`new ProgressBarState(0, 500): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 500): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(500);
      logInfo(`new ProgressBarState(0, 500): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 500): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 500): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 500): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 500): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 500): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 500): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0032
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0032
     * @tc.desc      new ProgressBarState(0, 999) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0032 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 999);
      logInfo(`new ProgressBarState(0, 999): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 999): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(999);
      logInfo(`new ProgressBarState(0, 999): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 999): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 999): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 999): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 999): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 999): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 999): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0033
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0033
     * @tc.desc      new ProgressBarState(0, 1000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0033 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1000);
      logInfo(`new ProgressBarState(0, 1000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1000);
      logInfo(`new ProgressBarState(0, 1000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0034
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0034
     * @tc.desc      new ProgressBarState(0, 59999) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0034 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 59999);
      logInfo(`new ProgressBarState(0, 59999): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 59999): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(59999);
      logInfo(`new ProgressBarState(0, 59999): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 59999): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 59999): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 59999): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 59999): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 59999): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 59999): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0035
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0035
     * @tc.desc      new ProgressBarState(0, 60000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0035 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 60000);
      logInfo(`new ProgressBarState(0, 60000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 60000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(60000);
      logInfo(`new ProgressBarState(0, 60000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 60000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 60000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 60000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 60000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 60000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 60000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0036
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0036
     * @tc.desc      new ProgressBarState(0, 61000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0036 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 61000);
      logInfo(`new ProgressBarState(0, 61000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 61000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(61000);
      logInfo(`new ProgressBarState(0, 61000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 61000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 61000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 61000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 61000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 61000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 61000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0037
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0037
     * @tc.desc      new ProgressBarState(0, 3599000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0037 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 3599000);
      logInfo(`new ProgressBarState(0, 3599000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3599000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3599000);
      logInfo(`new ProgressBarState(0, 3599000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3599000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3599000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 3599000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 3599000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 3599000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 3599000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0038
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0038
     * @tc.desc      new ProgressBarState(0, 3600000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0038 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 3600000);
      logInfo(`new ProgressBarState(0, 3600000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3600000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3600000);
      logInfo(`new ProgressBarState(0, 3600000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3600000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3600000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 3600000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 3600000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 3600000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 3600000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0039
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0039
     * @tc.desc      new ProgressBarState(0, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0039 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 1);
      logInfo(`new ProgressBarState(0, 1): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(1);
      logInfo(`new ProgressBarState(0, 1): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 1): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 1): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 1): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 1): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 1): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0040
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0040
     * @tc.desc      new ProgressBarState(0, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0040 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, -1);
      logInfo(`new ProgressBarState(0, -1): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, -1): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(-1);
      logInfo(`new ProgressBarState(0, -1): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, -1): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, -1): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, -1): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, -1): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, -1): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, -1): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0041
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0041
     * @tc.desc      new ProgressBarState(0, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0041 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 2);
      logInfo(`new ProgressBarState(0, 2): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(2);
      logInfo(`new ProgressBarState(0, 2): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 2): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 2): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 2): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 2): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 2): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0042
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0042
     * @tc.desc      new ProgressBarState(0, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0042 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 3);
      logInfo(`new ProgressBarState(0, 3): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(3);
      logInfo(`new ProgressBarState(0, 3): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 3): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 3): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 3): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 3): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 3): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0043
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0043
     * @tc.desc      new ProgressBarState(0, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0043 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 10);
      logInfo(`new ProgressBarState(0, 10): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 10): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(10);
      logInfo(`new ProgressBarState(0, 10): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 10): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 10): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 10): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 10): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 10): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 10): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0044
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0044
     * @tc.desc      new ProgressBarState(0, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0044 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 100);
      logInfo(`new ProgressBarState(0, 100): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 100): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(100);
      logInfo(`new ProgressBarState(0, 100): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 100): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 100): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 100): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 100): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 100): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 100): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0045
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0045
     * @tc.desc      new ProgressBarState(0, 180000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0045 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 180000);
      logInfo(`new ProgressBarState(0, 180000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 180000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(180000);
      logInfo(`new ProgressBarState(0, 180000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 180000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 180000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 180000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 180000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 180000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 180000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0046
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0046
     * @tc.desc      new ProgressBarState(0, 360000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0046 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 360000);
      logInfo(`new ProgressBarState(0, 360000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 360000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(360000);
      logInfo(`new ProgressBarState(0, 360000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 360000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 360000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 360000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 360000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 360000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 360000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0047
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0047
     * @tc.desc      new ProgressBarState(0, 540000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0047 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 540000);
      logInfo(`new ProgressBarState(0, 540000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 540000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(540000);
      logInfo(`new ProgressBarState(0, 540000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 540000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 540000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 540000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 540000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 540000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 540000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_CTOR_0048
     * @tc.name      TabContentTouchHotZone_ProgressBarStateCtor_0048
     * @tc.desc      new ProgressBarState(0, 720000) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateCtor_0048 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 720000);
      logInfo(`new ProgressBarState(0, 720000): subject.screenW=${subject.screenW}`);
      expect(subject.screenW).assertEqual(0);
      logInfo(`new ProgressBarState(0, 720000): subject.totalTime=${subject.totalTime}`);
      expect(subject.totalTime).assertEqual(720000);
      logInfo(`new ProgressBarState(0, 720000): subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 720000): subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(0);
      logInfo(`new ProgressBarState(0, 720000): subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('');
      logInfo(`new ProgressBarState(0, 720000): subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertFalse();
      logInfo(`new ProgressBarState(0, 720000): subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertFalse();
      logInfo(`new ProgressBarState(0, 720000): subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertFalse();
      logInfo(`new ProgressBarState(0, 720000): subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateCtor_0048 end`);
    });
  });
}
