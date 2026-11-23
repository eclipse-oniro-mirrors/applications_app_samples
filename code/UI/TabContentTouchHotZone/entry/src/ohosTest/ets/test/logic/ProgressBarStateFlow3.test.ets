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
export default function progressBarStateFlow3Test(): void {
  describe('ProgressBarStateFlow3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0102
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0102
     * @tc.desc      ProgressBarState call flow update > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0102 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(3083801);
      logInfo(`step1 update(3083801): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      logInfo(`update>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0103
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0103
     * @tc.desc      ProgressBarState call flow update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0103 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(6120000);
      logInfo(`step1 update(6120000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0104
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0104
     * @tc.desc      ProgressBarState call flow drag > togglePlay > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0104 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(26);
      logInfo(`step1 drag(26): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(-26426);
      logInfo(`step3 update(-26426): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      const step4: string = subject.drag(50);
      logInfo(`step4 drag(50): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      logInfo(`drag>togglePlay>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>togglePlay>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`drag>togglePlay>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`drag>togglePlay>update>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0105
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0105
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > drag > startDrag > togglePlay keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0105 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(15.65);
      logInfo(`step3 drag(15.65): step3=${step3}`);
      expect(step3).assertEqual('00');
      subject.startDrag();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`togglePlay>endDrag>drag>startDrag>toggleP...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`togglePlay>endDrag>drag>startDrag>toggleP...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>endDrag>drag>startDrag>toggleP...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>endDrag>drag>startDrag>toggleP...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0106
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0106
     * @tc.desc      ProgressBarState call flow startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0106 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: string = subject.drag(37);
      logInfo(`step2 drag(37): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0107
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0107
     * @tc.desc      ProgressBarState call flow update > drag > update > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0107 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(2700000);
      logInfo(`step1 update(2700000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: string = subject.drag(-58);
      logInfo(`step2 drag(-58): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: number = subject.update(4685517);
      logInfo(`step3 update(4685517): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: string = subject.drag(100);
      logInfo(`step4 drag(100): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      const step5: string = subject.drag(20);
      logInfo(`step5 drag(20): step5=${step5}`);
      expect(step5).assertEqual('00');
      logInfo(`update>drag>update>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>drag>update>drag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag>update>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0108
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0108
     * @tc.desc      ProgressBarState call flow togglePlay > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0108 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(4320000);
      logInfo(`step2 update(4320000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(1);
      logInfo(`step3 update(1): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0109
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0109
     * @tc.desc      ProgressBarState call flow startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0109 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.update(-929416);
      logInfo(`step2 update(-929416): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0110
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0110
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > togglePlay > togglePlay > togglePlay keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0110 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`togglePlay>togglePlay>togglePlay>togglePl...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0111
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0111
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0111 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      subject.startDrag();
      logInfo(`togglePlay>startDrag>togglePlay>startDrag...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag>togglePlay>startDrag...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0112
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0112
     * @tc.desc      ProgressBarState call flow update > togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0112 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(59999);
      logInfo(`step1 update(59999): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(713713);
      logInfo(`step3 update(713713): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0113
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0113
     * @tc.desc      ProgressBarState call flow drag > startDrag > togglePlay > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0113 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(90);
      logInfo(`step1 drag(90): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.drag(55);
      logInfo(`step4 drag(55): step4=${step4}`);
      expect(step4).assertEqual('00');
      const step5: string = subject.drag(10);
      logInfo(`step5 drag(10): step5=${step5}`);
      expect(step5).assertEqual('00');
      logInfo(`drag>startDrag>togglePlay>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>startDrag>togglePlay>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>togglePlay>drag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>togglePlay>drag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>togglePlay>drag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0114
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0114
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0114 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      subject.startDrag();
      subject.startDrag();
      const step4: string = subject.drag(60.28);
      logInfo(`step4 drag(60.28): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>startDrag>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>startDrag>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>startDrag>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>startDrag>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0115
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0115
     * @tc.desc      ProgressBarState call flow update > drag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0115 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(-891742);
      logInfo(`step1 update(-891742): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: string = subject.drag(123);
      logInfo(`step2 drag(123): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: number = subject.update(-1);
      logInfo(`step3 update(-1): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`update>drag>update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>drag>update>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>drag>update>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>drag>update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0116
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0116
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > update > endDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0116 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.update(7020000);
      logInfo(`step3 update(7020000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.drag(6);
      logInfo(`step5 drag(6): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`togglePlay>endDrag>update>endDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>endDrag>update>endDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>endDrag>update>endDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`togglePlay>endDrag>update>endDrag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0117
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0117
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0117 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: string = subject.drag(-77);
      logInfo(`step3 drag(-77): step3=${step3}`);
      expect(step3).assertEqual('00');
      subject.startDrag();
      logInfo(`togglePlay>startDrag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>startDrag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>startDrag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>startDrag>drag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0118
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0118
     * @tc.desc      ProgressBarState call flow update > update > startDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0118 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(6480000);
      logInfo(`step1 update(6480000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(2158519);
      logInfo(`step2 update(2158519): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`update>update>startDrag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>startDrag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0119
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0119
     * @tc.desc      ProgressBarState call flow startDrag > update > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0119 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: number = subject.update(-26426);
      logInfo(`step2 update(-26426): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.drag(63);
      logInfo(`step3 drag(63): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: string = subject.drag(-91);
      logInfo(`step4 drag(-91): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>update>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>update>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>update>drag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>update>drag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0120
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0120
     * @tc.desc      ProgressBarState call flow update > togglePlay > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0120 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(6059069);
      logInfo(`step1 update(6059069): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      const step4: number = subject.update(2383657.89);
      logInfo(`step4 update(2383657.89): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>togglePlay>startDrag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0121
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0121
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0121 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.drag(-14);
      logInfo(`step3 drag(-14): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`togglePlay>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`togglePlay>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0122
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0122
     * @tc.desc      ProgressBarState call flow drag > togglePlay > togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0122 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(180);
      logInfo(`step1 drag(180): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.update(5400000);
      logInfo(`step4 update(5400000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>togglePlay>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0123
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0123
     * @tc.desc      ProgressBarState call flow drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0123 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(82.39);
      logInfo(`step1 drag(82.39): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: string = subject.drag(35);
      logInfo(`step2 drag(35): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0124
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0124
     * @tc.desc      ProgressBarState call flow update > endDrag > endDrag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0124 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(2501256.95);
      logInfo(`step1 update(2501256.95): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.update(540000);
      logInfo(`step5 update(540000): step5=${step5}`);
      expect(step5).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>endDrag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>endDrag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0125
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0125
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0125 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.startDrag();
      logInfo(`togglePlay>startDrag>endDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag>endDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>startDrag>endDrag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0126
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0126
     * @tc.desc      ProgressBarState call flow update > endDrag > drag > drag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0126 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(-673101);
      logInfo(`step1 update(-673101): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(153);
      logInfo(`step3 drag(153): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      const step4: string = subject.drag(15);
      logInfo(`step4 drag(15): step4=${step4}`);
      expect(step4).assertEqual('00');
      const step5: number = subject.update(4320000);
      logInfo(`step5 update(4320000): step5=${step5}`);
      expect(step5).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag>drag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag>drag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>endDrag>drag>drag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0127
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0127
     * @tc.desc      ProgressBarState call flow drag > togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0127 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(-11);
      logInfo(`step1 drag(-11): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(4860000);
      logInfo(`step3 update(4860000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>togglePlay>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>togglePlay>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0128
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0128
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0128 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`startDrag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0129
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0129
     * @tc.desc      ProgressBarState call flow togglePlay > update > endDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0129 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(2955838.55);
      logInfo(`step2 update(2955838.55): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.startDrag();
      logInfo(`togglePlay>update>endDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>endDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>endDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>update>endDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>update>endDrag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0130
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0130
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > update > startDrag > drag keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0130 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: number = subject.update(4860000);
      logInfo(`step3 update(4860000): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.startDrag();
      const step5: string = subject.drag(161);
      logInfo(`step5 drag(161): step5=${step5}`);
      expect(step5).assertEqual('00');
      logInfo(`togglePlay>startDrag>update>startDrag>dra...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>startDrag>update>startDrag>dra...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>startDrag>update>startDrag>dra...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag>update>startDrag>dra...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>startDrag>update>startDrag>dra...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0131
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0131
     * @tc.desc      ProgressBarState call flow drag > update > update > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0131 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(-73);
      logInfo(`step1 drag(-73): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(-503220);
      logInfo(`step2 update(-503220): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      const step3: number = subject.update(-929416);
      logInfo(`step3 update(-929416): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      const step4: string = subject.drag(-15);
      logInfo(`step4 drag(-15): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      const step5: string = subject.drag(160);
      logInfo(`step5 drag(160): step5=${step5}`);
      expect(step5).assertEqual('00');
      logInfo(`drag>update>update>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>update>update>drag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`drag>update>update>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0132
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0132
     * @tc.desc      ProgressBarState call flow update > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0132 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(6840000);
      logInfo(`step1 update(6840000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(24.33);
      logInfo(`step3 drag(24.33): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      logInfo(`update>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`update>togglePlay>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0133
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0133
     * @tc.desc      ProgressBarState call flow update > drag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0133 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(7020000);
      logInfo(`step1 update(7020000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: string = subject.drag(-56);
      logInfo(`step2 drag(-56): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`update>drag>endDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`update>drag>endDrag>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`update>drag>endDrag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>drag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`update>drag>endDrag>togglePlay final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0134
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0134
     * @tc.desc      ProgressBarState call flow endDrag > drag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0134 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(70);
      logInfo(`step2 drag(70): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(92.09);
      logInfo(`step3 drag(92.09): step3=${step3}`);
      expect(step3).assertEqual('00');
      subject.startDrag();
      logInfo(`endDrag>drag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>drag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>drag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>drag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0135
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0135
     * @tc.desc      ProgressBarState call flow drag > endDrag > endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0135 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(73.89);
      logInfo(`step1 drag(73.89): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`drag>endDrag>endDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>endDrag>endDrag>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`drag>endDrag>endDrag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>endDrag>endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0136
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0136
     * @tc.desc      ProgressBarState call flow drag > endDrag > update > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0136 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(-15);
      logInfo(`step1 drag(-15): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.update(2999272.34);
      logInfo(`step3 update(2999272.34): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.update(1080000);
      logInfo(`step5 update(1080000): step5=${step5}`);
      expect(step5).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update>endDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0137
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0137
     * @tc.desc      ProgressBarState call flow startDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0137 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0138
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0138
     * @tc.desc      ProgressBarState call flow togglePlay > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0138 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(720000);
      logInfo(`step2 update(720000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`togglePlay>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0139
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0139
     * @tc.desc      ProgressBarState call flow startDrag > drag > drag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0139 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: string = subject.drag(92);
      logInfo(`step2 drag(92): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(123);
      logInfo(`step3 drag(123): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(6660000);
      logInfo(`step4 update(6660000): step4=${step4}`);
      expect(step4).assertEqual(-31);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`startDrag>drag>drag>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>drag>drag>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-31);
      logInfo(`startDrag>drag>drag>update>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag>drag>update>endDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>drag>drag>update>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0140
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0140
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag > togglePlay > endDrag > togglePlay keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0140 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`togglePlay>startDrag>togglePlay>endDrag>t...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0141
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0141
     * @tc.desc      ProgressBarState call flow drag > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0141 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(-91);
      logInfo(`step1 drag(-91): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(958299);
      logInfo(`step2 update(958299): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: string = subject.drag(30);
      logInfo(`step3 drag(30): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      logInfo(`drag>update>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>update>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0142
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0142
     * @tc.desc      ProgressBarState call flow togglePlay > update > update > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0142 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(1620000);
      logInfo(`step2 update(1620000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(3119641.91);
      logInfo(`step3 update(3119641.91): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      logInfo(`togglePlay>update>update>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>update>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>update>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>update>update>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>update>update>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0143
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0143
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > drag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0143 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.drag(51.83);
      logInfo(`step3 drag(51.83): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: number = subject.update(4320000);
      logInfo(`step4 update(4320000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`startDrag>endDrag>drag>update>togglePlay ...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>drag>update>togglePlay ...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>drag>update>togglePlay ...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>endDrag>drag>update>togglePlay ...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0144
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0144
     * @tc.desc      ProgressBarState call flow endDrag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0144 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.update(59999);
      logInfo(`step2 update(59999): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`endDrag>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0145
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0145
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0145 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(51);
      logInfo(`step3 drag(51): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`endDrag>togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0146
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0146
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > togglePlay > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0146 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`startDrag>startDrag>togglePlay>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0147
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0147
     * @tc.desc      ProgressBarState call flow update > update > endDrag > startDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0147 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3780000);
      logInfo(`step1 update(3780000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(3060000);
      logInfo(`step2 update(3060000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.startDrag();
      const step5: string = subject.drag(135);
      logInfo(`step5 drag(135): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`update>update>endDrag>startDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>update>endDrag>startDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>endDrag>startDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>update>endDrag>startDrag>drag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>update>endDrag>startDrag>drag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0148
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0148
     * @tc.desc      ProgressBarState call flow update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0148 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(205080.84);
      logInfo(`step1 update(205080.84): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(-891742);
      logInfo(`step2 update(-891742): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0149
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0149
     * @tc.desc      ProgressBarState call flow drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0149 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: string = subject.drag(187);
      logInfo(`step1 drag(187): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      logInfo(`drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0150
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0150
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > update > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0150 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.update(6848109);
      logInfo(`step3 update(6848109): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      logInfo(`endDrag>endDrag>update>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>endDrag>update>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>endDrag>update>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>endDrag>update>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0151
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0151
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > endDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0151 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      subject.startDrag();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.drag(-11);
      logInfo(`step4 drag(-11): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`startDrag>startDrag>endDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`startDrag>startDrag>endDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0151 end`);
    });
  });
}
