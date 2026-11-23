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

/** Logic checks for ProgressBarState flow (49 cases). */
export default function progressBarStateFlow2Test(): void {
  describe('ProgressBarStateFlow2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0053
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0053
     * @tc.desc      ProgressBarState call flow update > endDrag > togglePlay > endDrag > togglePlay keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0053 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(4814995);
      logInfo(`step1 update(4814995): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`update>endDrag>togglePlay>endDrag>toggleP...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>togglePlay>endDrag>toggleP...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0054
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0054
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0054 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`endDrag>endDrag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0055
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0055
     * @tc.desc      ProgressBarState call flow drag > startDrag > drag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0055 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(58.76);
      logInfo(`step1 drag(58.76): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: string = subject.drag(172);
      logInfo(`step3 drag(172): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(4685517);
      logInfo(`step4 update(4685517): step4=${step4}`);
      expect(step4).assertEqual(-30);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`drag>startDrag>drag>update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>startDrag>drag>update>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>drag>update>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>drag>update>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>drag>update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0056
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0056
     * @tc.desc      ProgressBarState call flow update > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0056 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3420000);
      logInfo(`step1 update(3420000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(1440000);
      logInfo(`step2 update(1440000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: string = subject.drag(25);
      logInfo(`step3 drag(25): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      logInfo(`update>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0057
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0057
     * @tc.desc      ProgressBarState call flow update > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0057 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(3123319.79);
      logInfo(`step1 update(3123319.79): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`update>togglePlay>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0058
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0058
     * @tc.desc      ProgressBarState call flow togglePlay > update > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0058 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(2520000);
      logInfo(`step2 update(2520000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      subject.startDrag();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>update>startDrag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0059
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0059
     * @tc.desc      ProgressBarState call flow drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0059 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(47);
      logInfo(`step1 drag(47): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0060
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0060
     * @tc.desc      ProgressBarState call flow endDrag > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0060 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(52.73);
      logInfo(`step2 drag(52.73): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(3);
      logInfo(`step3 drag(3): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: string = subject.drag(105);
      logInfo(`step4 drag(105): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`endDrag>drag>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>drag>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0061
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0061
     * @tc.desc      ProgressBarState call flow togglePlay > drag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0061 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(139);
      logInfo(`step2 drag(139): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.update(2635790);
      logInfo(`step3 update(2635790): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`togglePlay>drag>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>update>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0062
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0062
     * @tc.desc      ProgressBarState call flow drag > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0062 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(6.49);
      logInfo(`step1 drag(6.49): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      logInfo(`drag>togglePlay>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>togglePlay>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>togglePlay>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0063
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0063
     * @tc.desc      ProgressBarState call flow update > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0063 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(6324438);
      logInfo(`step1 update(6324438): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      logInfo(`update>endDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>endDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0064
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0064
     * @tc.desc      ProgressBarState call flow startDrag > update > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0064 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.update(4140000);
      logInfo(`step2 update(4140000): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`startDrag>update>startDrag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>update>startDrag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>update>startDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0065
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0065
     * @tc.desc      ProgressBarState call flow drag > drag > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0065 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(57);
      logInfo(`step1 drag(57): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(55);
      logInfo(`step2 drag(55): step2=${step2}`);
      expect(step2).assertEqual('00');
      subject.startDrag();
      const step4: number = subject.update(3);
      logInfo(`step4 update(3): step4=${step4}`);
      expect(step4).assertEqual(-29);
      logInfo(`drag>drag>startDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>drag>startDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>drag>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0066
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0066
     * @tc.desc      ProgressBarState call flow togglePlay > drag > update > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0066 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(25.1);
      logInfo(`step2 drag(25.1): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.update(1620000);
      logInfo(`step3 update(1620000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      subject.startDrag();
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>drag>update>endDrag>startDrag ...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0067
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0067
     * @tc.desc      ProgressBarState call flow update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0067 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(3240000);
      logInfo(`step1 update(3240000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: string = subject.drag(19);
      logInfo(`step2 drag(19): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      logInfo(`update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0068
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0068
     * @tc.desc      ProgressBarState call flow update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0068 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(-929416);
      logInfo(`step1 update(-929416): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: string = subject.drag(165);
      logInfo(`step2 drag(165): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      logInfo(`update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0069
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0069
     * @tc.desc      ProgressBarState call flow update > drag > drag > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0069 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(-2648541);
      logInfo(`step1 update(-2648541): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: string = subject.drag(5);
      logInfo(`step2 drag(5): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: string = subject.drag(185);
      logInfo(`step3 drag(185): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`update>drag>drag>endDrag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`update>drag>drag>endDrag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-31);
      logInfo(`update>drag>drag>endDrag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0070
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0070
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0070 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(521648.29);
      logInfo(`step4 update(521648.29): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>endDrag>endDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0071
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0071
     * @tc.desc      ProgressBarState call flow update > endDrag > togglePlay > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0071 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(2635790);
      logInfo(`step1 update(2635790): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.drag(68);
      logInfo(`step5 drag(68): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`update>endDrag>togglePlay>togglePlay>drag...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>endDrag>togglePlay>togglePlay>drag...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>togglePlay>togglePlay>drag...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0072
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0072
     * @tc.desc      ProgressBarState call flow drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0072 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(-15);
      logInfo(`step1 drag(-15): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-31);
      logInfo(`drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0073
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0073
     * @tc.desc      ProgressBarState call flow update > togglePlay > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0073 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(2);
      logInfo(`step1 update(2): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(92.32);
      logInfo(`step3 drag(92.32): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      const step4: string = subject.drag(60.28);
      logInfo(`step4 drag(60.28): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`update>togglePlay>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>togglePlay>drag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`update>togglePlay>drag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0074
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0074
     * @tc.desc      ProgressBarState call flow update > update > update > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0074 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(5940000);
      logInfo(`step1 update(5940000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(360000);
      logInfo(`step2 update(360000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(5760000);
      logInfo(`step3 update(5760000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.update(205080.84);
      logInfo(`step4 update(205080.84): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`update>update>update>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>update>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0075
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0075
     * @tc.desc      ProgressBarState call flow update > endDrag > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0075 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(2880000);
      logInfo(`step1 update(2880000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      const step4: string = subject.drag(71.72);
      logInfo(`step4 drag(71.72): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      logInfo(`update>endDrag>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`update>endDrag>startDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>endDrag>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>endDrag>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0076
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0076
     * @tc.desc      ProgressBarState call flow drag > drag > endDrag > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0076 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(-91);
      logInfo(`step1 drag(-91): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(168);
      logInfo(`step2 drag(168): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`drag>drag>endDrag>togglePlay>togglePlay f...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>drag>endDrag>togglePlay>togglePlay f...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`drag>drag>endDrag>togglePlay>togglePlay f...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>endDrag>togglePlay>togglePlay f...: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0077
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0077
     * @tc.desc      ProgressBarState call flow update > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0077 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(100);
      logInfo(`step1 update(100): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: string = subject.drag(80);
      logInfo(`step2 drag(80): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`update>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`update>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0078
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0078
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > drag > togglePlay > endDrag keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0078 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.drag(51);
      logInfo(`step3 drag(51): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`togglePlay>togglePlay>drag>togglePlay>end...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>togglePlay>drag>togglePlay>end...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-31);
      logInfo(`togglePlay>togglePlay>drag>togglePlay>end...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>togglePlay>drag>togglePlay>end...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`togglePlay>togglePlay>drag>togglePlay>end...: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0079
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0079
     * @tc.desc      ProgressBarState call flow update > startDrag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0079 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(6358311);
      logInfo(`step1 update(6358311): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(2034337);
      logInfo(`step4 update(2034337): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0080
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0080
     * @tc.desc      ProgressBarState call flow update > startDrag > endDrag > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0080 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(-26426);
      logInfo(`step1 update(-26426): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      subject.startDrag();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(-2648541);
      logInfo(`step4 update(-2648541): step4=${step4}`);
      expect(step4).assertEqual(Number.POSITIVE_INFINITY);
      const step5: string = subject.drag(3);
      logInfo(`step5 drag(3): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`update>startDrag>endDrag>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`update>startDrag>endDrag>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>startDrag>endDrag>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0081
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0081
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0081 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0082
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0082
     * @tc.desc      ProgressBarState call flow update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0082 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(6345883);
      logInfo(`step1 update(6345883): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0083
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0083
     * @tc.desc      ProgressBarState call flow update > togglePlay > drag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0083 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(958299);
      logInfo(`step1 update(958299): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(20.11);
      logInfo(`step3 drag(20.11): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      const step4: string = subject.drag(28.14);
      logInfo(`step4 drag(28.14): step4=${step4}`);
      expect(step4).assertEqual('00');
      subject.startDrag();
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>togglePlay>drag>drag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0084
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0084
     * @tc.desc      ProgressBarState call flow endDrag > drag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0084 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(87);
      logInfo(`step2 drag(87): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`endDrag>drag>endDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>drag>endDrag>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`endDrag>drag>endDrag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>drag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`endDrag>drag>endDrag>togglePlay final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0085
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0085
     * @tc.desc      ProgressBarState call flow update > endDrag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0085 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(0);
      logInfo(`step1 update(0): step1=${step1}`);
      expect(step1).assertNaN();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertNaN();
      const step3: number = subject.update(1000);
      logInfo(`step3 update(1000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`update>endDrag>update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>update>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`update>endDrag>update>togglePlay final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertNaN();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0086
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0086
     * @tc.desc      ProgressBarState call flow endDrag > drag > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0086 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(-14);
      logInfo(`step2 drag(-14): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`endDrag>drag>endDrag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`endDrag>drag>endDrag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`endDrag>drag>endDrag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0087
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0087
     * @tc.desc      ProgressBarState call flow drag > togglePlay > update > startDrag > startDrag keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0087 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(30);
      logInfo(`step1 drag(30): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(4680000);
      logInfo(`step3 update(4680000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      subject.startDrag();
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>togglePlay>update>startDrag>startDra...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0088
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0088
     * @tc.desc      ProgressBarState call flow togglePlay > drag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0088 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(6.49);
      logInfo(`step2 drag(6.49): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.update(5220000);
      logInfo(`step4 update(5220000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>endDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>endDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`togglePlay>drag>endDrag>update final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0089
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0089
     * @tc.desc      ProgressBarState call flow drag > startDrag > togglePlay > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0089 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(63);
      logInfo(`step1 drag(63): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`drag>startDrag>togglePlay>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0090
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0090
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > startDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0090 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0091
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0091
     * @tc.desc      ProgressBarState call flow update > update > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0091 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(4736511);
      logInfo(`step1 update(4736511): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(7200000);
      logInfo(`step2 update(7200000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      logInfo(`update>update>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>update>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0092
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0092
     * @tc.desc      ProgressBarState call flow update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0092 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(6848109);
      logInfo(`step1 update(6848109): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(2932637.54);
      logInfo(`step2 update(2932637.54): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0093
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0093
     * @tc.desc      ProgressBarState call flow startDrag > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0093 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: number = subject.update(720000);
      logInfo(`step2 update(720000): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.update(2034337);
      logInfo(`step3 update(2034337): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`startDrag>update>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>update>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0094
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0094
     * @tc.desc      ProgressBarState call flow drag > togglePlay > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0094 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(170);
      logInfo(`step1 drag(170): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`drag>togglePlay>startDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>togglePlay>startDrag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>startDrag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>togglePlay>startDrag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0095
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0095
     * @tc.desc      ProgressBarState call flow drag > drag > drag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0095 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(187);
      logInfo(`step1 drag(187): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(-36);
      logInfo(`step2 drag(-36): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(82);
      logInfo(`step3 drag(82): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(2360457);
      logInfo(`step4 update(2360457): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`drag>drag>drag>update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>drag>drag>update>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>drag>drag>update>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>drag>drag>update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0096
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0096
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0096 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`togglePlay>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0097
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0097
     * @tc.desc      ProgressBarState call flow update > togglePlay > startDrag > update > togglePlay keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0097 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(2);
      logInfo(`step1 update(2): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      const step4: number = subject.update(2880000);
      logInfo(`step4 update(2880000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`update>togglePlay>startDrag>update>toggle...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>update>toggle...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>update>toggle...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>startDrag>update>toggle...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0098
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0098
     * @tc.desc      ProgressBarState call flow update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0098 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(2880000);
      logInfo(`step1 update(2880000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: string = subject.drag(63);
      logInfo(`step2 drag(63): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      logInfo(`update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0099
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0099
     * @tc.desc      ProgressBarState call flow endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0099 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.startDrag();
      logInfo(`endDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0100
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0100
     * @tc.desc      ProgressBarState call flow drag > startDrag > startDrag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0100 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(-25);
      logInfo(`step1 drag(-25): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      subject.startDrag();
      const step4: number = subject.update(3422215);
      logInfo(`step4 update(3422215): step4=${step4}`);
      expect(step4).assertEqual(-29);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`drag>startDrag>startDrag>update>endDrag f...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>startDrag>startDrag>update>endDrag f...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`drag>startDrag>startDrag>update>endDrag f...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>startDrag>update>endDrag f...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>startDrag>update>endDrag f...: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0101
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0101
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0101 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      const step4: string = subject.drag(55);
      logInfo(`step4 drag(55): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>endDrag>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>endDrag>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>endDrag>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>endDrag>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0101 end`);
    });
  });
}
