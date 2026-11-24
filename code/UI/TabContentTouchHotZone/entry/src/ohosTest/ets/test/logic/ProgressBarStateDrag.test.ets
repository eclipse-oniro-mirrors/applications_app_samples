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

/** Logic checks for ProgressBarState.drag (73 cases). */
export default function progressBarStateDragTest(): void {
  describe('ProgressBarStateDragTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0001
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0001
     * @tc.desc      ProgressBarState.drag(deltaX=-100) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0001 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(-100);
      logInfo(`drag(deltaX=-100): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-100) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=-100) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0002
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0002
     * @tc.desc      ProgressBarState.drag(deltaX=-1) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0002 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(-1);
      logInfo(`drag(deltaX=-1): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-1) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=-1) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0003
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0003
     * @tc.desc      ProgressBarState.drag(deltaX=-2) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0003 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-2);
      logInfo(`drag(deltaX=-2): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-2) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-2) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0004
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0004
     * @tc.desc      ProgressBarState.drag(deltaX=0) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0004 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(0);
      logInfo(`drag(deltaX=0): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=0) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=0) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0005
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0005
     * @tc.desc      ProgressBarState.drag(deltaX=1) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0005 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(1);
      logInfo(`drag(deltaX=1): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=1) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=1) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0006
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0006
     * @tc.desc      ProgressBarState.drag(deltaX=50) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0006 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(50);
      logInfo(`drag(deltaX=50): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=50) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=50) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0007
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0007
     * @tc.desc      ProgressBarState.drag(deltaX=100) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0007 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(100);
      logInfo(`drag(deltaX=100): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=100) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=100) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0008
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0008
     * @tc.desc      ProgressBarState.drag(deltaX=2) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0008 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(2);
      logInfo(`drag(deltaX=2): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=2) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=2) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0009
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0009
     * @tc.desc      ProgressBarState.drag(deltaX=3) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0009 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(3);
      logInfo(`drag(deltaX=3): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=3) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=3) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0010
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0010
     * @tc.desc      ProgressBarState.drag(deltaX=10) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0010 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(10);
      logInfo(`drag(deltaX=10): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=10) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=10) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0011
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0011
     * @tc.desc      ProgressBarState.drag(deltaX=5) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0011 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(5);
      logInfo(`drag(deltaX=5): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=5) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=5) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0012
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0012
     * @tc.desc      ProgressBarState.drag(deltaX=15) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0012 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(15);
      logInfo(`drag(deltaX=15): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=15) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=15) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0013
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0013
     * @tc.desc      ProgressBarState.drag(deltaX=20) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0013 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(20);
      logInfo(`drag(deltaX=20): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=20) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=20) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0014
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0014
     * @tc.desc      ProgressBarState.drag(deltaX=25) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0014 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(25);
      logInfo(`drag(deltaX=25): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=25) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=25) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0015
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0015
     * @tc.desc      ProgressBarState.drag(deltaX=30) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0015 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(30);
      logInfo(`drag(deltaX=30): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=30) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=30) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0016
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0016
     * @tc.desc      ProgressBarState.drag(deltaX=35) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0016 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(35);
      logInfo(`drag(deltaX=35): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=35) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=35) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0017
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0017
     * @tc.desc      ProgressBarState.drag(deltaX=40) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0017 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(40);
      logInfo(`drag(deltaX=40): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=40) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=40) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0018
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0018
     * @tc.desc      ProgressBarState.drag(deltaX=45) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0018 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(45);
      logInfo(`drag(deltaX=45): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=45) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=45) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0019
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0019
     * @tc.desc      ProgressBarState.drag(deltaX=55) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0019 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(55);
      logInfo(`drag(deltaX=55): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=55) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=55) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0020
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0020
     * @tc.desc      ProgressBarState.drag(deltaX=60) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0020 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(60);
      logInfo(`drag(deltaX=60): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=60) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=60) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0021
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0021
     * @tc.desc      ProgressBarState.drag(deltaX=65) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0021 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(65);
      logInfo(`drag(deltaX=65): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=65) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=65) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0022
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0022
     * @tc.desc      ProgressBarState.drag(deltaX=70) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0022 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(70);
      logInfo(`drag(deltaX=70): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=70) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=70) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0023
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0023
     * @tc.desc      ProgressBarState.drag(deltaX=75) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0023 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(75);
      logInfo(`drag(deltaX=75): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=75) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=75) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0024
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0024
     * @tc.desc      ProgressBarState.drag(deltaX=80) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0024 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(80);
      logInfo(`drag(deltaX=80): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=80) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=80) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0025
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0025
     * @tc.desc      ProgressBarState.drag(deltaX=85) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0025 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(85);
      logInfo(`drag(deltaX=85): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=85) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=85) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0026
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0026
     * @tc.desc      ProgressBarState.drag(deltaX=90) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0026 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(90);
      logInfo(`drag(deltaX=90): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=90) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=90) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0027
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0027
     * @tc.desc      ProgressBarState.drag(deltaX=95) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0027 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(95);
      logInfo(`drag(deltaX=95): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=95) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=95) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0028
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0028
     * @tc.desc      ProgressBarState.drag(deltaX=105) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0028 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(105);
      logInfo(`drag(deltaX=105): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=105) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=105) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0029
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0029
     * @tc.desc      ProgressBarState.drag(deltaX=110) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0029 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(110);
      logInfo(`drag(deltaX=110): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=110) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=110) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0030
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0030
     * @tc.desc      ProgressBarState.drag(deltaX=115) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0030 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(115);
      logInfo(`drag(deltaX=115): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=115) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=115) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0031
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0031
     * @tc.desc      ProgressBarState.drag(deltaX=120) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0031 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(120);
      logInfo(`drag(deltaX=120): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=120) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=120) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0032
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0032
     * @tc.desc      ProgressBarState.drag(deltaX=125) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0032 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(125);
      logInfo(`drag(deltaX=125): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=125) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=125) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0033
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0033
     * @tc.desc      ProgressBarState.drag(deltaX=130) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0033 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(130);
      logInfo(`drag(deltaX=130): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=130) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=130) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0034
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0034
     * @tc.desc      ProgressBarState.drag(deltaX=135) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0034 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(135);
      logInfo(`drag(deltaX=135): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=135) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=135) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0035
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0035
     * @tc.desc      ProgressBarState.drag(deltaX=140) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0035 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(140);
      logInfo(`drag(deltaX=140): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=140) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=140) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0036
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0036
     * @tc.desc      ProgressBarState.drag(deltaX=145) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0036 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(145);
      logInfo(`drag(deltaX=145): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=145) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=145) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0037
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0037
     * @tc.desc      ProgressBarState.drag(deltaX=150) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0037 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(150);
      logInfo(`drag(deltaX=150): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=150) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=150) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0038
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0038
     * @tc.desc      ProgressBarState.drag(deltaX=155) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0038 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(155);
      logInfo(`drag(deltaX=155): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=155) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=155) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0039
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0039
     * @tc.desc      ProgressBarState.drag(deltaX=160) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0039 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(160);
      logInfo(`drag(deltaX=160): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=160) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=160) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0040
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0040
     * @tc.desc      ProgressBarState.drag(deltaX=165) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0040 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(165);
      logInfo(`drag(deltaX=165): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=165) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=165) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0041
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0041
     * @tc.desc      ProgressBarState.drag(deltaX=170) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0041 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(170);
      logInfo(`drag(deltaX=170): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=170) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=170) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0042
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0042
     * @tc.desc      ProgressBarState.drag(deltaX=175) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0042 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(175);
      logInfo(`drag(deltaX=175): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=175) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=175) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0043
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0043
     * @tc.desc      ProgressBarState.drag(deltaX=180) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0043 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(180);
      logInfo(`drag(deltaX=180): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=180) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=180) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0044
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0044
     * @tc.desc      ProgressBarState.drag(deltaX=185) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0044 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(185);
      logInfo(`drag(deltaX=185): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=185) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=185) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0045
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0045
     * @tc.desc      ProgressBarState.drag(deltaX=190) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0045 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(190);
      logInfo(`drag(deltaX=190): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=190) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=190) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0046
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0046
     * @tc.desc      ProgressBarState.drag(deltaX=195) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0046 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(195);
      logInfo(`drag(deltaX=195): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=195) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=195) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0047
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0047
     * @tc.desc      ProgressBarState.drag(deltaX=200) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0047 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(200);
      logInfo(`drag(deltaX=200): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=200) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=200) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0048
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0048
     * @tc.desc      ProgressBarState.drag(deltaX=-3) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0048 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-3);
      logInfo(`drag(deltaX=-3): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-3) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-3) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0049
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0049
     * @tc.desc      ProgressBarState.drag(deltaX=-76) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0049 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(-76);
      logInfo(`drag(deltaX=-76): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-76) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=-76) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0050
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0050
     * @tc.desc      ProgressBarState.drag(deltaX=47) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0050 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(47);
      logInfo(`drag(deltaX=47): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=47) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=47) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0051
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0051
     * @tc.desc      ProgressBarState.drag(deltaX=-99) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0051 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-99);
      logInfo(`drag(deltaX=-99): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-99) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-99) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0052
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0052
     * @tc.desc      ProgressBarState.drag(deltaX=34) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0052 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(34);
      logInfo(`drag(deltaX=34): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=34) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=34) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0053
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0053
     * @tc.desc      ProgressBarState.drag(deltaX=-73) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0053 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(-73);
      logInfo(`drag(deltaX=-73): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-73) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=-73) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0054
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0054
     * @tc.desc      ProgressBarState.drag(deltaX=153) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0054 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(153);
      logInfo(`drag(deltaX=153): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=153) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=153) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0055
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0055
     * @tc.desc      ProgressBarState.drag(deltaX=6) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0055 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(6);
      logInfo(`drag(deltaX=6): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=6) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=6) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0056
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0056
     * @tc.desc      ProgressBarState.drag(deltaX=63) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0056 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(63);
      logInfo(`drag(deltaX=63): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=63) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=63) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0057
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0057
     * @tc.desc      ProgressBarState.drag(deltaX=87) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0057 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(87);
      logInfo(`drag(deltaX=87): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=87) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=87) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0058
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0058
     * @tc.desc      ProgressBarState.drag(deltaX=24.33) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0058 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(24.33);
      logInfo(`drag(deltaX=24.33): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=24.33) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=24.33) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0059
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0059
     * @tc.desc      ProgressBarState.drag(deltaX=-71) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0059 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(-71);
      logInfo(`drag(deltaX=-71): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-71) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=-71) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0060
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0060
     * @tc.desc      ProgressBarState.drag(deltaX=82) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0060 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(82);
      logInfo(`drag(deltaX=82): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=82) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=82) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0061
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0061
     * @tc.desc      ProgressBarState.drag(deltaX=25.1) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0061 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(25.1);
      logInfo(`drag(deltaX=25.1): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=25.1) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=25.1) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0062
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0062
     * @tc.desc      ProgressBarState.drag(deltaX=73.89) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0062 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(73.89);
      logInfo(`drag(deltaX=73.89): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=73.89) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=73.89) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0063
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0063
     * @tc.desc      ProgressBarState.drag(deltaX=-45) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0063 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-45);
      logInfo(`drag(deltaX=-45): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-45) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-45) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0064
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0064
     * @tc.desc      ProgressBarState.drag(deltaX=52.73) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0064 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(52.73);
      logInfo(`drag(deltaX=52.73): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=52.73) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=52.73) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0065
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0065
     * @tc.desc      ProgressBarState.drag(deltaX=-60) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0065 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(-60);
      logInfo(`drag(deltaX=-60): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-60) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=-60) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0066
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0066
     * @tc.desc      ProgressBarState.drag(deltaX=-46) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0066 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-46);
      logInfo(`drag(deltaX=-46): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-46) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-46) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0067
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0067
     * @tc.desc      ProgressBarState.drag(deltaX=-25) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0067 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(-25);
      logInfo(`drag(deltaX=-25): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-25) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=-25) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0068
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0068
     * @tc.desc      ProgressBarState.drag(deltaX=15.65) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0068 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(15.65);
      logInfo(`drag(deltaX=15.65): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=15.65) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=15.65) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0069
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0069
     * @tc.desc      ProgressBarState.drag(deltaX=37) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0069 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(37);
      logInfo(`drag(deltaX=37): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=37) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=37) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0070
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0070
     * @tc.desc      ProgressBarState.drag(deltaX=-56) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0070 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(-56);
      logInfo(`drag(deltaX=-56): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-56) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=-56) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0071
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0071
     * @tc.desc      ProgressBarState.drag(deltaX=-91) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0071 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(-91);
      logInfo(`drag(deltaX=-91): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-91) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=-91) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0072
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0072
     * @tc.desc      ProgressBarState.drag(deltaX=-58) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0072 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(-58);
      logInfo(`drag(deltaX=-58): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=-58) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=-58) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0073
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0073
     * @tc.desc      ProgressBarState.drag(deltaX=58.76) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0073 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: string = subject.drag(58.76);
      logInfo(`drag(deltaX=58.76): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=58.76) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag(deltaX=58.76) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0073 end`);
    });
  });
}
