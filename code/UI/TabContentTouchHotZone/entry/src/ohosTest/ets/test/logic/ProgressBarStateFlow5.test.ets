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

/** Logic checks for ProgressBarState flow (4 cases). */
export default function progressBarStateFlow5Test(): void {
  describe('ProgressBarStateFlow5Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0202
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0202
     * @tc.desc      ProgressBarState call flow update > endDrag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0202 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(5400000);
      logInfo(`step1 update(5400000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(175);
      logInfo(`step3 drag(175): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      subject.startDrag();
      logInfo(`update>endDrag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>endDrag>drag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>endDrag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>endDrag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0203
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0203
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0203 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(5794079);
      logInfo(`step3 update(5794079): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.drag(2);
      logInfo(`step4 drag(2): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>togglePlay>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`startDrag>togglePlay>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>togglePlay>update>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>togglePlay>update>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>togglePlay>update>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0204
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0204
     * @tc.desc      ProgressBarState call flow update > endDrag > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0204 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(2158519);
      logInfo(`step1 update(2158519): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.update(521648.29);
      logInfo(`step3 update(521648.29): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.update(3119641.91);
      logInfo(`step4 update(3119641.91): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0205
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0205
     * @tc.desc      ProgressBarState call flow drag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0205 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(-11);
      logInfo(`step1 drag(-11): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(521648.29);
      logInfo(`step2 update(521648.29): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`drag>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0205 end`);
    });
  });
}
