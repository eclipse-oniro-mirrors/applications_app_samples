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

/** Logic checks for ProgressBarState.update (73 cases). */
export default function progressBarStateUpdateTest(): void {
  describe('ProgressBarStateUpdateTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0001
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0001
     * @tc.desc      ProgressBarState.update(time=0) yields NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0001 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(0);
      logInfo(`update(time=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`update(time=0) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertNaN();
      logInfo(`update(time=0) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertNaN();
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0002
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0002
     * @tc.desc      ProgressBarState.update(time=500) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0002 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(500);
      logInfo(`update(time=500): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=500) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=500) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0003
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0003
     * @tc.desc      ProgressBarState.update(time=-1) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0003 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(-1);
      logInfo(`update(time=-1): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-1) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-1) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0004
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0004
     * @tc.desc      ProgressBarState.update(time=-2) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0004 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(-2);
      logInfo(`update(time=-2): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-2) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-2) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0005
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0005
     * @tc.desc      ProgressBarState.update(time=999) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0005 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(999);
      logInfo(`update(time=999): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=999) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=999) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0006
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0006
     * @tc.desc      ProgressBarState.update(time=1000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0006 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(1000);
      logInfo(`update(time=1000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0007
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0007
     * @tc.desc      ProgressBarState.update(time=59999) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0007 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(59999);
      logInfo(`update(time=59999): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=59999) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=59999) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0008
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0008
     * @tc.desc      ProgressBarState.update(time=60000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0008 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(60000);
      logInfo(`update(time=60000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=60000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=60000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0009
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0009
     * @tc.desc      ProgressBarState.update(time=61000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0009 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(61000);
      logInfo(`update(time=61000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=61000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=61000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0010
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0010
     * @tc.desc      ProgressBarState.update(time=3599000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0010 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(3599000);
      logInfo(`update(time=3599000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3599000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3599000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0011
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0011
     * @tc.desc      ProgressBarState.update(time=3600000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0011 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(3600000);
      logInfo(`update(time=3600000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3600000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3600000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0012
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0012
     * @tc.desc      ProgressBarState.update(time=1) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0012 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(1);
      logInfo(`update(time=1): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0013
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0013
     * @tc.desc      ProgressBarState.update(time=2) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0013 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(2);
      logInfo(`update(time=2): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0014
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0014
     * @tc.desc      ProgressBarState.update(time=3) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0014 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(3);
      logInfo(`update(time=3): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0015
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0015
     * @tc.desc      ProgressBarState.update(time=10) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0015 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(10);
      logInfo(`update(time=10): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=10) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=10) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0016
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0016
     * @tc.desc      ProgressBarState.update(time=100) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0016 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(100);
      logInfo(`update(time=100): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=100) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=100) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0017
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0017
     * @tc.desc      ProgressBarState.update(time=180000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0017 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(180000);
      logInfo(`update(time=180000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=180000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=180000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0018
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0018
     * @tc.desc      ProgressBarState.update(time=360000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0018 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(360000);
      logInfo(`update(time=360000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=360000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=360000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0019
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0019
     * @tc.desc      ProgressBarState.update(time=540000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0019 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(540000);
      logInfo(`update(time=540000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=540000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=540000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0020
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0020
     * @tc.desc      ProgressBarState.update(time=720000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0020 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(720000);
      logInfo(`update(time=720000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=720000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=720000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0021
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0021
     * @tc.desc      ProgressBarState.update(time=900000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0021 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(900000);
      logInfo(`update(time=900000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=900000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=900000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0022
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0022
     * @tc.desc      ProgressBarState.update(time=1080000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0022 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(1080000);
      logInfo(`update(time=1080000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1080000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1080000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0023
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0023
     * @tc.desc      ProgressBarState.update(time=1260000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0023 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(1260000);
      logInfo(`update(time=1260000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1260000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1260000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0024
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0024
     * @tc.desc      ProgressBarState.update(time=1440000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0024 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(1440000);
      logInfo(`update(time=1440000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1440000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1440000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0025
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0025
     * @tc.desc      ProgressBarState.update(time=1620000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0025 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(1620000);
      logInfo(`update(time=1620000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1620000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1620000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0026
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0026
     * @tc.desc      ProgressBarState.update(time=1800000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0026 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(1800000);
      logInfo(`update(time=1800000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1800000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1800000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0027
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0027
     * @tc.desc      ProgressBarState.update(time=1980000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0027 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(1980000);
      logInfo(`update(time=1980000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1980000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1980000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0028
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0028
     * @tc.desc      ProgressBarState.update(time=2160000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0028 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(2160000);
      logInfo(`update(time=2160000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2160000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2160000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0029
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0029
     * @tc.desc      ProgressBarState.update(time=2340000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0029 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(2340000);
      logInfo(`update(time=2340000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2340000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2340000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0030
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0030
     * @tc.desc      ProgressBarState.update(time=2520000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0030 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(2520000);
      logInfo(`update(time=2520000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2520000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2520000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0031
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0031
     * @tc.desc      ProgressBarState.update(time=2700000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0031 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(2700000);
      logInfo(`update(time=2700000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2700000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2700000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0032
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0032
     * @tc.desc      ProgressBarState.update(time=2880000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0032 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(2880000);
      logInfo(`update(time=2880000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2880000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2880000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0033
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0033
     * @tc.desc      ProgressBarState.update(time=3060000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0033 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(3060000);
      logInfo(`update(time=3060000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3060000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3060000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0034
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0034
     * @tc.desc      ProgressBarState.update(time=3240000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0034 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(3240000);
      logInfo(`update(time=3240000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3240000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3240000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0035
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0035
     * @tc.desc      ProgressBarState.update(time=3420000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0035 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(3420000);
      logInfo(`update(time=3420000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3420000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3420000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0036
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0036
     * @tc.desc      ProgressBarState.update(time=3780000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0036 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(3780000);
      logInfo(`update(time=3780000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3780000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3780000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0037
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0037
     * @tc.desc      ProgressBarState.update(time=3960000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0037 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(3960000);
      logInfo(`update(time=3960000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3960000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3960000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0038
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0038
     * @tc.desc      ProgressBarState.update(time=4140000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0038 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(4140000);
      logInfo(`update(time=4140000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4140000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4140000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0039
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0039
     * @tc.desc      ProgressBarState.update(time=4320000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0039 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(4320000);
      logInfo(`update(time=4320000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4320000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4320000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0040
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0040
     * @tc.desc      ProgressBarState.update(time=4500000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0040 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(4500000);
      logInfo(`update(time=4500000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4500000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4500000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0041
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0041
     * @tc.desc      ProgressBarState.update(time=4680000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0041 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(4680000);
      logInfo(`update(time=4680000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4680000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4680000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0042
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0042
     * @tc.desc      ProgressBarState.update(time=4860000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0042 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(4860000);
      logInfo(`update(time=4860000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4860000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=4860000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0043
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0043
     * @tc.desc      ProgressBarState.update(time=5040000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0043 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(5040000);
      logInfo(`update(time=5040000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5040000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5040000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0044
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0044
     * @tc.desc      ProgressBarState.update(time=5220000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0044 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(5220000);
      logInfo(`update(time=5220000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5220000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5220000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0045
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0045
     * @tc.desc      ProgressBarState.update(time=5400000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0045 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(5400000);
      logInfo(`update(time=5400000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5400000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5400000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0046
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0046
     * @tc.desc      ProgressBarState.update(time=5580000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0046 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(5580000);
      logInfo(`update(time=5580000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5580000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5580000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0047
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0047
     * @tc.desc      ProgressBarState.update(time=5760000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0047 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(5760000);
      logInfo(`update(time=5760000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5760000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5760000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0048
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0048
     * @tc.desc      ProgressBarState.update(time=5940000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0048 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(5940000);
      logInfo(`update(time=5940000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5940000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=5940000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0049
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0049
     * @tc.desc      ProgressBarState.update(time=6120000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0049 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(6120000);
      logInfo(`update(time=6120000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6120000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6120000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0050
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0050
     * @tc.desc      ProgressBarState.update(time=6300000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0050 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(6300000);
      logInfo(`update(time=6300000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6300000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6300000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0051
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0051
     * @tc.desc      ProgressBarState.update(time=6480000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0051 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(6480000);
      logInfo(`update(time=6480000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6480000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6480000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0052
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0052
     * @tc.desc      ProgressBarState.update(time=6660000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0052 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(6660000);
      logInfo(`update(time=6660000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6660000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6660000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0053
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0053
     * @tc.desc      ProgressBarState.update(time=6840000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0053 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(6840000);
      logInfo(`update(time=6840000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6840000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6840000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0054
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0054
     * @tc.desc      ProgressBarState.update(time=7020000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0054 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(7020000);
      logInfo(`update(time=7020000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7020000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7020000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0055
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0055
     * @tc.desc      ProgressBarState.update(time=7200000) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0055 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(7200000);
      logInfo(`update(time=7200000): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7200000) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7200000) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0056
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0056
     * @tc.desc      ProgressBarState.update(time=3083801) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0056 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(3083801);
      logInfo(`update(time=3083801): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3083801) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3083801) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0057
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0057
     * @tc.desc      ProgressBarState.update(time=-673101) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0057 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(-673101);
      logInfo(`update(time=-673101): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-673101) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-673101) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0058
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0058
     * @tc.desc      ProgressBarState.update(time=2999272.34) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0058 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(2999272.34);
      logInfo(`update(time=2999272.34): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2999272.34) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2999272.34) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0059
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0059
     * @tc.desc      ProgressBarState.update(time=6345883) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0059 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(6345883);
      logInfo(`update(time=6345883): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6345883) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6345883) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0060
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0060
     * @tc.desc      ProgressBarState.update(time=3119641.91) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0060 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(3119641.91);
      logInfo(`update(time=3119641.91): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3119641.91) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=3119641.91) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0061
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0061
     * @tc.desc      ProgressBarState.update(time=6324438) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0061 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(6324438);
      logInfo(`update(time=6324438): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6324438) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6324438) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0062
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0062
     * @tc.desc      ProgressBarState.update(time=7113171) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0062 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(7113171);
      logInfo(`update(time=7113171): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7113171) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=7113171) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0063
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0063
     * @tc.desc      ProgressBarState.update(time=658380.85) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0063 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(658380.85);
      logInfo(`update(time=658380.85): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=658380.85) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=658380.85) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0064
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0064
     * @tc.desc      ProgressBarState.update(time=6358311) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0064 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(6358311);
      logInfo(`update(time=6358311): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6358311) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=6358311) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0065
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0065
     * @tc.desc      ProgressBarState.update(time=713713) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0065 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(713713);
      logInfo(`update(time=713713): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=713713) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=713713) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0066
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0066
     * @tc.desc      ProgressBarState.update(time=2635790) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0066 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(2635790);
      logInfo(`update(time=2635790): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2635790) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2635790) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0067
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0067
     * @tc.desc      ProgressBarState.update(time=2094135) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0067 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(2094135);
      logInfo(`update(time=2094135): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2094135) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2094135) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0068
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0068
     * @tc.desc      ProgressBarState.update(time=2243640) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0068 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(2243640);
      logInfo(`update(time=2243640): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2243640) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2243640) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0069
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0069
     * @tc.desc      ProgressBarState.update(time=-503220) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0069 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(-503220);
      logInfo(`update(time=-503220): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-503220) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-503220) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0070
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0070
     * @tc.desc      ProgressBarState.update(time=-929416) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0070 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(-929416);
      logInfo(`update(time=-929416): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-929416) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-929416) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0071
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0071
     * @tc.desc      ProgressBarState.update(time=-449361) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0071 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(-449361);
      logInfo(`update(time=-449361): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-449361) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-449361) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0072
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0072
     * @tc.desc      ProgressBarState.update(time=1181137) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0072 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(1181137);
      logInfo(`update(time=1181137): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1181137) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=1181137) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0073
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0073
     * @tc.desc      ProgressBarState.update(time=958299) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0073 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: number = subject.update(958299);
      logInfo(`update(time=958299): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=958299) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=958299) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0073 end`);
    });
  });
}
