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

/** Logic checks for ProgressBarState flow (50 cases). */
export default function progressBarStateFlow4Test(): void {
  describe('ProgressBarStateFlow4Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0152
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0152
     * @tc.desc      ProgressBarState call flow endDrag > startDrag > startDrag > update > togglePlay keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0152 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.startDrag();
      subject.startDrag();
      const step4: number = subject.update(658380.85);
      logInfo(`step4 update(658380.85): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`endDrag>startDrag>startDrag>update>toggle...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>startDrag>startDrag>update>toggle...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`endDrag>startDrag>startDrag>update>toggle...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0153
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0153
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0153 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`startDrag>togglePlay>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>togglePlay>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0154
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0154
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > drag > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0154 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(28.82);
      logInfo(`step3 drag(28.82): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(2158519);
      logInfo(`step4 update(2158519): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: string = subject.drag(30);
      logInfo(`step5 drag(30): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`startDrag>endDrag>drag>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`startDrag>endDrag>drag>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>drag>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0155
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0155
     * @tc.desc      ProgressBarState call flow update > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0155 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3420000);
      logInfo(`step1 update(3420000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(61000);
      logInfo(`step2 update(61000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(4885480);
      logInfo(`step3 update(4885480): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0156
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0156
     * @tc.desc      ProgressBarState call flow drag > drag > drag > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0156 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(30);
      logInfo(`step1 drag(30): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(145);
      logInfo(`step2 drag(145): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(180);
      logInfo(`step3 drag(180): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.startDrag();
      logInfo(`drag>drag>drag>togglePlay>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>drag>drag>togglePlay>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>drag>togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>drag>drag>togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>drag>drag>togglePlay>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0157
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0157
     * @tc.desc      ProgressBarState call flow endDrag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0157 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(-36);
      logInfo(`step2 drag(-36): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(5);
      logInfo(`step3 drag(5): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`endDrag>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0158
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0158
     * @tc.desc      ProgressBarState call flow update > endDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0158 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(1);
      logInfo(`step1 update(1): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(195);
      logInfo(`step3 drag(195): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      logInfo(`update>endDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>endDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0159
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0159
     * @tc.desc      ProgressBarState call flow update > endDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0159 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3083801);
      logInfo(`step1 update(3083801): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(55);
      logInfo(`step3 drag(55): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      logInfo(`update>endDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>endDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0160
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0160
     * @tc.desc      ProgressBarState call flow drag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0160 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(15);
      logInfo(`step1 drag(15): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`drag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0161
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0161
     * @tc.desc      ProgressBarState call flow endDrag > startDrag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0161 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.startDrag();
      const step3: string = subject.drag(3);
      logInfo(`step3 drag(3): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: string = subject.drag(82);
      logInfo(`step4 drag(82): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`endDrag>startDrag>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`endDrag>startDrag>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>startDrag>drag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>startDrag>drag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0162
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0162
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0162 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0163
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0163
     * @tc.desc      ProgressBarState call flow togglePlay > drag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0163 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(187);
      logInfo(`step2 drag(187): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(-99);
      logInfo(`step3 drag(-99): step3=${step3}`);
      expect(step3).assertEqual('00');
      subject.startDrag();
      logInfo(`togglePlay>drag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>drag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>drag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>drag>drag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0164
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0164
     * @tc.desc      ProgressBarState call flow drag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0164 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(71.72);
      logInfo(`step1 drag(71.72): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`drag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0165
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0165
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0165 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(28.14);
      logInfo(`step3 drag(28.14): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`endDrag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0166
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0166
     * @tc.desc      ProgressBarState call flow drag > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0166 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(168);
      logInfo(`step1 drag(168): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(135);
      logInfo(`step2 drag(135): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`drag>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`drag>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0167
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0167
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > startDrag > update > endDrag keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0167 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      subject.startDrag();
      subject.startDrag();
      const step4: number = subject.update(7020000);
      logInfo(`step4 update(7020000): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0168
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0168
     * @tc.desc      ProgressBarState call flow update > togglePlay > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0168 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(6228629);
      logInfo(`step1 update(6228629): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(2955838.55);
      logInfo(`step3 update(2955838.55): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: string = subject.drag(160);
      logInfo(`step4 drag(160): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      logInfo(`update>togglePlay>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>togglePlay>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>togglePlay>update>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0169
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0169
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0169 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.drag(165);
      logInfo(`step4 drag(165): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>startDrag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`startDrag>startDrag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>startDrag>togglePlay>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>startDrag>togglePlay>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>startDrag>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0170
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0170
     * @tc.desc      ProgressBarState call flow drag > togglePlay > drag > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0170 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(45);
      logInfo(`step1 drag(45): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(130);
      logInfo(`step3 drag(130): step3=${step3}`);
      expect(step3).assertEqual('00');
      subject.startDrag();
      const step5: number = subject.update(3228771.9);
      logInfo(`step5 update(3228771.9): step5=${step5}`);
      expect(step5).assertEqual(-31);
      logInfo(`drag>togglePlay>drag>startDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>togglePlay>drag>startDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>drag>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>togglePlay>drag>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>togglePlay>drag>startDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0171
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0171
     * @tc.desc      ProgressBarState call flow endDrag > startDrag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0171 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.startDrag();
      const step3: string = subject.drag(106);
      logInfo(`step3 drag(106): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: string = subject.drag(98);
      logInfo(`step4 drag(98): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`endDrag>startDrag>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>startDrag>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>startDrag>drag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>startDrag>drag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0172
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0172
     * @tc.desc      ProgressBarState call flow update > startDrag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0172 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(439489.85);
      logInfo(`step1 update(439489.85): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.drag(26);
      logInfo(`step4 drag(26): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      logInfo(`update>startDrag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>startDrag>togglePlay>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>startDrag>togglePlay>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>startDrag>togglePlay>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>startDrag>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0173
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0173
     * @tc.desc      ProgressBarState call flow drag > drag > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0173 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(-76);
      logInfo(`step1 drag(-76): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(6.49);
      logInfo(`step2 drag(6.49): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.startDrag();
      logInfo(`drag>drag>endDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>drag>endDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`drag>drag>endDrag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>endDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>drag>endDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>drag>endDrag>startDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0174
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0174
     * @tc.desc      ProgressBarState call flow drag > startDrag > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0174 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(65);
      logInfo(`step1 drag(65): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      subject.startDrag();
      const step4: number = subject.update(3600000);
      logInfo(`step4 update(3600000): step4=${step4}`);
      expect(step4).assertEqual(-31);
      logInfo(`drag>startDrag>startDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>startDrag>startDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0175
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0175
     * @tc.desc      ProgressBarState call flow togglePlay > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0175 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(6);
      logInfo(`step2 drag(6): step2=${step2}`);
      expect(step2).assertEqual('00');
      subject.startDrag();
      logInfo(`togglePlay>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>drag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0176
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0176
     * @tc.desc      ProgressBarState call flow startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0176 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: string = subject.drag(144);
      logInfo(`step2 drag(144): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0177
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0177
     * @tc.desc      ProgressBarState call flow togglePlay > drag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0177 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(-58);
      logInfo(`step2 drag(-58): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.drag(-45);
      logInfo(`step4 drag(-45): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`togglePlay>drag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>drag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0178
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0178
     * @tc.desc      ProgressBarState call flow startDrag > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0178 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: string = subject.drag(84.57);
      logInfo(`step2 drag(84.57): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`startDrag>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`startDrag>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`startDrag>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag>endDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0179
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0179
     * @tc.desc      ProgressBarState call flow update > startDrag > togglePlay > togglePlay > startDrag keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0179 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3060000);
      logInfo(`step1 update(3060000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      subject.startDrag();
      logInfo(`update>startDrag>togglePlay>togglePlay>st...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>togglePlay>togglePlay>st...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>togglePlay>togglePlay>st...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>startDrag>togglePlay>togglePlay>st...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0180
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0180
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0180 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(-929416);
      logInfo(`step4 update(-929416): step4=${step4}`);
      expect(step4).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0181
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0181
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0181 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.drag(135);
      logInfo(`step3 drag(135): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`togglePlay>togglePlay>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>togglePlay>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`togglePlay>togglePlay>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>togglePlay>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0182
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0182
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0182 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      subject.startDrag();
      logInfo(`togglePlay>togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0183
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0183
     * @tc.desc      ProgressBarState call flow update > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0183 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(-503220);
      logInfo(`step1 update(-503220): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`update>endDrag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>endDrag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0184
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0184
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > startDrag > togglePlay > startDrag keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0184 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      subject.startDrag();
      logInfo(`startDrag>endDrag>startDrag>togglePlay>st...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>endDrag>startDrag>togglePlay>st...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>endDrag>startDrag>togglePlay>st...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0185
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0185
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > update > togglePlay > update keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0185 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: number = subject.update(4814995);
      logInfo(`step3 update(4814995): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.update(5220000);
      logInfo(`step5 update(5220000): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`togglePlay>startDrag>update>togglePlay>up...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag>update>togglePlay>up...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0186
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0186
     * @tc.desc      ProgressBarState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0186 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(52.73);
      logInfo(`step1 drag(52.73): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(98.74);
      logInfo(`step2 drag(98.74): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0187
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0187
     * @tc.desc      ProgressBarState call flow endDrag > update > update > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0187 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.update(5940000);
      logInfo(`step2 update(5940000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(3228771.9);
      logInfo(`step3 update(3228771.9): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: string = subject.drag(75);
      logInfo(`step4 drag(75): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`endDrag>update>update>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>update>update>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`endDrag>update>update>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`endDrag>update>update>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0188
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0188
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > drag > togglePlay > togglePlay keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0188 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(-60);
      logInfo(`step3 drag(-60): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`startDrag>togglePlay>drag>togglePlay>togg...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>togglePlay>drag>togglePlay>togg...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>togglePlay>drag>togglePlay>togg...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>togglePlay>drag>togglePlay>togg...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>togglePlay>drag>togglePlay>togg...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0189
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0189
     * @tc.desc      ProgressBarState call flow togglePlay > update > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0189 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(-990647);
      logInfo(`step2 update(-990647): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      subject.startDrag();
      subject.startDrag();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0190
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0190
     * @tc.desc      ProgressBarState call flow drag > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0190 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(106);
      logInfo(`step1 drag(106): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: string = subject.drag(165);
      logInfo(`step3 drag(165): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`drag>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0191
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0191
     * @tc.desc      ProgressBarState call flow startDrag > drag > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0191 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: string = subject.drag(-3);
      logInfo(`step2 drag(-3): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      subject.startDrag();
      logInfo(`startDrag>drag>togglePlay>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>drag>togglePlay>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag>togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>drag>togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>drag>togglePlay>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0192
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0192
     * @tc.desc      ProgressBarState call flow togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0192 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(900000);
      logInfo(`step2 update(900000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0193
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0193
     * @tc.desc      ProgressBarState call flow drag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0193 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(123);
      logInfo(`step1 drag(123): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(10);
      logInfo(`step3 drag(10): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`drag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0194
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0194
     * @tc.desc      ProgressBarState call flow togglePlay > drag > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0194 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(1);
      logInfo(`step2 drag(1): step2=${step2}`);
      expect(step2).assertEqual('00');
      subject.startDrag();
      const step4: number = subject.update(4814995);
      logInfo(`step4 update(4814995): step4=${step4}`);
      expect(step4).assertEqual(-29);
      logInfo(`togglePlay>drag>startDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`togglePlay>drag>startDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>drag>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>drag>startDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0195
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0195
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0195 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`endDrag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0196
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0196
     * @tc.desc      ProgressBarState call flow update > togglePlay > startDrag > startDrag > drag keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0196 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(3003536);
      logInfo(`step1 update(3003536): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      subject.startDrag();
      const step5: string = subject.drag(25);
      logInfo(`step5 drag(25): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>togglePlay>startDrag>startDrag>dra...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0197
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0197
     * @tc.desc      ProgressBarState call flow update > togglePlay > togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0197 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(6480000);
      logInfo(`step1 update(6480000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.update(3228771.9);
      logInfo(`step4 update(3228771.9): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0198
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0198
     * @tc.desc      ProgressBarState call flow update > togglePlay > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0198 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(6334042);
      logInfo(`step1 update(6334042): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      const step4: string = subject.drag(50);
      logInfo(`step4 drag(50): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      logInfo(`update>togglePlay>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>togglePlay>startDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>togglePlay>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>togglePlay>startDrag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0199
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0199
     * @tc.desc      ProgressBarState call flow update > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0199 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(4500000);
      logInfo(`step1 update(4500000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(1181137);
      logInfo(`step2 update(1181137): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(-891742);
      logInfo(`step3 update(-891742): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0200
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0200
     * @tc.desc      ProgressBarState call flow endDrag > drag > drag > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0200 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(49);
      logInfo(`step2 drag(49): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(170);
      logInfo(`step3 drag(170): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(5430142);
      logInfo(`step4 update(5430142): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: string = subject.drag(-38);
      logInfo(`step5 drag(-38): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`endDrag>drag>drag>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>drag>drag>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>drag>drag>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0201
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0201
     * @tc.desc      ProgressBarState call flow drag > update > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0201 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(82.39);
      logInfo(`step1 drag(82.39): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(2360457);
      logInfo(`step2 update(2360457): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      subject.startDrag();
      logInfo(`drag>update>startDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>startDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>startDrag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>update>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>update>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0201 end`);
    });
  });
}
