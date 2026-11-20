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

/** Logic checks for ProgressBarState flow (52 cases). */
export default function progressBarStateFlowTest(): void {
  describe('ProgressBarStateFlowTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0001
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0001
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0001 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.update(-1687121);
      logInfo(`step3 update(-1687121): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      const step4: number = subject.update(3123319.79);
      logInfo(`step4 update(3123319.79): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>togglePlay>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>togglePlay>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0002
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0002
     * @tc.desc      ProgressBarState call flow update > drag > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0002 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(-891742);
      logInfo(`step1 update(-891742): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: string = subject.drag(6.49);
      logInfo(`step2 drag(6.49): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      subject.startDrag();
      subject.startDrag();
      logInfo(`update>drag>startDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>drag>startDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>drag>startDrag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>drag>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>drag>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0003
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0003
     * @tc.desc      ProgressBarState call flow drag > startDrag > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0003 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(98.74);
      logInfo(`step1 drag(98.74): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: number = subject.update(3086794.57);
      logInfo(`step3 update(3086794.57): step3=${step3}`);
      expect(step3).assertEqual(-31);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`drag>startDrag>update>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>startDrag>update>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>update>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>update>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>update>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0004
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0004
     * @tc.desc      ProgressBarState call flow drag > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0004 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(-17);
      logInfo(`step1 drag(-17): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.update(958299);
      logInfo(`step3 update(958299): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>endDrag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>endDrag>update final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0005
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0005
     * @tc.desc      ProgressBarState call flow endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0005 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0006
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0006
     * @tc.desc      ProgressBarState call flow update > update > togglePlay > endDrag > togglePlay keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0006 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.update(2700000);
      logInfo(`step1 update(2700000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(3294908);
      logInfo(`step2 update(3294908): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`update>update>togglePlay>endDrag>togglePl...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>togglePlay>endDrag>togglePl...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0007
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0007
     * @tc.desc      ProgressBarState call flow update > update > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0007 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(2340000);
      logInfo(`step1 update(2340000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(-673101);
      logInfo(`step2 update(-673101): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(2158519);
      logInfo(`step4 update(2158519): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>update>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0008
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0008
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > togglePlay > update > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0008 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.update(5794079);
      logInfo(`step4 update(5794079): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: string = subject.drag(87.94);
      logInfo(`step5 drag(87.94): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`startDrag>endDrag>togglePlay>update>drag ...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`startDrag>endDrag>togglePlay>update>drag ...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>togglePlay>update>drag ...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`startDrag>endDrag>togglePlay>update>drag ...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0009
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0009
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0009 begin`);
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
      logInfo(`${BUNDLE}ProgressBarStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0010
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0010
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > startDrag > togglePlay > endDrag keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0010 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0011
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0011
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0011 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0012
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0012
     * @tc.desc      ProgressBarState call flow togglePlay > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0012 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(87.94);
      logInfo(`step2 drag(87.94): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(82.39);
      logInfo(`step3 drag(82.39): step3=${step3}`);
      expect(step3).assertEqual('00');
      logInfo(`togglePlay>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0013
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0013
     * @tc.desc      ProgressBarState call flow togglePlay > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0013 begin`);
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
      logInfo(`togglePlay>endDrag>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0014
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0014
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0014 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`endDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0015
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0015
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > togglePlay > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0015 begin`);
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
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`endDrag>endDrag>togglePlay>endDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0016
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0016
     * @tc.desc      ProgressBarState call flow startDrag > update > endDrag > togglePlay > endDrag keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0016 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.update(2955838.55);
      logInfo(`step2 update(2955838.55): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`startDrag>update>endDrag>togglePlay>endDr...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0017
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0017
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0017 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`startDrag>startDrag>togglePlay>togglePlay...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>startDrag>togglePlay>togglePlay...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0018
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0018
     * @tc.desc      ProgressBarState call flow togglePlay > drag > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0018 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(115);
      logInfo(`step2 drag(115): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: string = subject.drag(-91);
      logInfo(`step3 drag(-91): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: string = subject.drag(71.72);
      logInfo(`step4 drag(71.72): step4=${step4}`);
      expect(step4).assertEqual('00');
      logInfo(`togglePlay>drag>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>drag>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>drag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0019
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0019
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > endDrag > togglePlay > togglePlay keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0019 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`startDrag>togglePlay>endDrag>togglePlay>t...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0020
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0020
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > update > startDrag > togglePlay keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0020 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.update(3003536);
      logInfo(`step3 update(3003536): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`startDrag>endDrag>update>startDrag>toggle...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>update>startDrag>toggle...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`startDrag>endDrag>update>startDrag>toggle...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>endDrag>update>startDrag>toggle...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>endDrag>update>startDrag>toggle...: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0021
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0021
     * @tc.desc      ProgressBarState call flow drag > update > startDrag > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0021 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(145);
      logInfo(`step1 drag(145): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(-1274991);
      logInfo(`step2 update(-1274991): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      subject.startDrag();
      const step4: string = subject.drag(30);
      logInfo(`step4 drag(30): step4=${step4}`);
      expect(step4).assertEqual('0NaN');
      subject.startDrag();
      logInfo(`drag>update>startDrag>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>update>startDrag>drag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`drag>update>startDrag>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`drag>update>startDrag>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>update>startDrag>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0022
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0022
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0022 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      logInfo(`startDrag>togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>togglePlay>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0023
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0023
     * @tc.desc      ProgressBarState call flow drag > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0023 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(-76);
      logInfo(`step1 drag(-76): step1=${step1}`);
      expect(step1).assertEqual('00');
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`drag>startDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag>startDrag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>startDrag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`drag>startDrag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`drag>startDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0024
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0024
     * @tc.desc      ProgressBarState call flow update > togglePlay > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0024 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(2160000);
      logInfo(`step1 update(2160000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      subject.startDrag();
      logInfo(`update>togglePlay>startDrag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>togglePlay>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`update>togglePlay>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`update>togglePlay>startDrag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0025
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0025
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > togglePlay > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0025 begin`);
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
      const step4: number = subject.update(6660000);
      logInfo(`step4 update(6660000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>togglePlay>togglePlay>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>togglePlay>togglePlay>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0026
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0026
     * @tc.desc      ProgressBarState call flow togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0026 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(-38);
      logInfo(`step2 drag(-38): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0027
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0027
     * @tc.desc      ProgressBarState call flow startDrag > drag > startDrag > endDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0027 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: string = subject.drag(60.28);
      logInfo(`step2 drag(60.28): step2=${step2}`);
      expect(step2).assertEqual('00');
      subject.startDrag();
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.endDrag();
      logInfo(`step5 endDrag(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`startDrag>drag>startDrag>endDrag>endDrag ...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`startDrag>drag>startDrag>endDrag>endDrag ...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`startDrag>drag>startDrag>endDrag>endDrag ...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0028
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0028
     * @tc.desc      ProgressBarState call flow endDrag > drag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0028 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.drag(24.33);
      logInfo(`step2 drag(24.33): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`endDrag>drag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>drag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-29);
      logInfo(`endDrag>drag>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>drag>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0029
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0029
     * @tc.desc      ProgressBarState call flow endDrag > update > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0029 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.update(60000);
      logInfo(`step2 update(60000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: string = subject.drag(139);
      logInfo(`step3 drag(139): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      subject.startDrag();
      logInfo(`endDrag>update>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>update>drag>startDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>update>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`endDrag>update>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>update>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0030
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0030
     * @tc.desc      ProgressBarState call flow togglePlay > togglePlay > endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0030 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.update(1077745);
      logInfo(`step4 update(1077745): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>togglePlay>endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>togglePlay>endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0031
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0031
     * @tc.desc      ProgressBarState call flow startDrag > togglePlay > drag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0031 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      subject.startDrag();
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.drag(68);
      logInfo(`step3 drag(68): step3=${step3}`);
      expect(step3).assertEqual('00');
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`startDrag>togglePlay>drag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`startDrag>togglePlay>drag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>togglePlay>drag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>togglePlay>drag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0032
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0032
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0032 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`endDrag>togglePlay>startDrag>togglePlay f...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>togglePlay>startDrag>togglePlay f...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0033
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0033
     * @tc.desc      ProgressBarState call flow startDrag > endDrag > update > startDrag > startDrag keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0033 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.update(-1274991);
      logInfo(`step3 update(-1274991): step3=${step3}`);
      expect(step3).assertEqual(Number.POSITIVE_INFINITY);
      subject.startDrag();
      subject.startDrag();
      logInfo(`startDrag>endDrag>update>startDrag>startD...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`startDrag>endDrag>update>startDrag>startD...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`startDrag>endDrag>update>startDrag>startD...: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>endDrag>update>startDrag>startD...: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0034
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0034
     * @tc.desc      ProgressBarState call flow togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0034 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(-100);
      logInfo(`step2 drag(-100): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0035
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0035
     * @tc.desc      ProgressBarState call flow endDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0035 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.update(958299);
      logInfo(`step2 update(958299): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0036
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0036
     * @tc.desc      ProgressBarState call flow drag > update > togglePlay > update > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0036 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(71.72);
      logInfo(`step1 drag(71.72): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(958299);
      logInfo(`step2 update(958299): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.update(1080000);
      logInfo(`step4 update(1080000): step4=${step4}`);
      expect(step4).assertEqual(Number.NEGATIVE_INFINITY);
      const step5: boolean = subject.togglePlay();
      logInfo(`step5 togglePlay(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`drag>update>togglePlay>update>togglePlay ...: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>togglePlay>update>togglePlay ...: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>togglePlay>update>togglePlay ...: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0037
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0037
     * @tc.desc      ProgressBarState call flow togglePlay > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0037 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      subject.startDrag();
      logInfo(`togglePlay>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0038
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0038
     * @tc.desc      ProgressBarState call flow togglePlay > drag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0038 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(106);
      logInfo(`step2 drag(106): step2=${step2}`);
      expect(step2).assertEqual('00');
      subject.startDrag();
      logInfo(`togglePlay>drag>startDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`togglePlay>drag>startDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>drag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`togglePlay>drag>startDrag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0039
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0039
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > startDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0039 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      subject.startDrag();
      subject.startDrag();
      logInfo(`startDrag>startDrag>startDrag final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>startDrag>startDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0040
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0040
     * @tc.desc      ProgressBarState call flow update > startDrag > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0040 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(3600000);
      logInfo(`step1 update(3600000): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step3: number = subject.endDrag();
      logInfo(`step3 endDrag(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`update>startDrag>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>startDrag>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0041
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0041
     * @tc.desc      ProgressBarState call flow drag > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0041 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: string = subject.drag(98);
      logInfo(`step1 drag(98): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.update(6120000);
      logInfo(`step2 update(6120000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      const step3: number = subject.update(100);
      logInfo(`step3 update(100): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`drag>update>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0042
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0042
     * @tc.desc      ProgressBarState call flow startDrag > startDrag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0042 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      subject.startDrag();
      subject.startDrag();
      const step3: number = subject.update(-1687121);
      logInfo(`step3 update(-1687121): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`startDrag>startDrag>update final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`startDrag>startDrag>update final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0043
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0043
     * @tc.desc      ProgressBarState call flow update > update > drag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0043 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.update(4814995);
      logInfo(`step1 update(4814995): step1=${step1}`);
      expect(step1).assertEqual(Number.NEGATIVE_INFINITY);
      const step2: number = subject.update(-929416);
      logInfo(`step2 update(-929416): step2=${step2}`);
      expect(step2).assertEqual(Number.POSITIVE_INFINITY);
      const step3: string = subject.drag(155);
      logInfo(`step3 drag(155): step3=${step3}`);
      expect(step3).assertEqual('0NaN');
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`update>update>drag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`update>update>drag>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update>update>drag>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`update>update>drag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0044
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0044
     * @tc.desc      ProgressBarState call flow drag > endDrag > togglePlay > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0044 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: string = subject.drag(53.88);
      logInfo(`step1 drag(53.88): step1=${step1}`);
      expect(step1).assertEqual('00');
      const step2: number = subject.endDrag();
      logInfo(`step2 endDrag(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`drag>endDrag>togglePlay>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`drag>endDrag>togglePlay>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-30);
      logInfo(`drag>endDrag>togglePlay>togglePlay final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`drag>endDrag>togglePlay>togglePlay final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0045
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0045
     * @tc.desc      ProgressBarState call flow togglePlay > drag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0045 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(95);
      logInfo(`step2 drag(95): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.update(720000);
      logInfo(`step3 update(720000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>drag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag>update final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0046
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0046
     * @tc.desc      ProgressBarState call flow togglePlay > update > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0046 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.update(6660000);
      logInfo(`step2 update(6660000): step2=${step2}`);
      expect(step2).assertEqual(Number.NEGATIVE_INFINITY);
      subject.startDrag();
      const step4: boolean = subject.togglePlay();
      logInfo(`step4 togglePlay(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`togglePlay>update>startDrag>togglePlay final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>togglePlay final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`togglePlay>update>startDrag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`togglePlay>update>startDrag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0047
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0047
     * @tc.desc      ProgressBarState call flow endDrag > endDrag > togglePlay > drag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0047 begin`);
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
      const step4: string = subject.drag(0);
      logInfo(`step4 drag(0): step4=${step4}`);
      expect(step4).assertEqual('00');
      const step5: string = subject.drag(134);
      logInfo(`step5 drag(134): step5=${step5}`);
      expect(step5).assertEqual('00');
      logInfo(`endDrag>endDrag>togglePlay>drag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`endDrag>endDrag>togglePlay>drag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`endDrag>endDrag>togglePlay>drag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0048
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0048
     * @tc.desc      ProgressBarState call flow update > drag > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0048 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: number = subject.update(-1687121);
      logInfo(`step1 update(-1687121): step1=${step1}`);
      expect(step1).assertEqual(Number.POSITIVE_INFINITY);
      const step2: string = subject.drag(200);
      logInfo(`step2 drag(200): step2=${step2}`);
      expect(step2).assertEqual('0NaN');
      const step3: number = subject.update(3599000);
      logInfo(`step3 update(3599000): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag>update final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag>update final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update>drag>update final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`${BUNDLE}ProgressBarStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0049
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0049
     * @tc.desc      ProgressBarState call flow startDrag > drag > update > endDrag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0049 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      subject.startDrag();
      const step2: string = subject.drag(134);
      logInfo(`step2 drag(134): step2=${step2}`);
      expect(step2).assertEqual('00');
      const step3: number = subject.update(2340000);
      logInfo(`step3 update(2340000): step3=${step3}`);
      expect(step3).assertEqual(-31);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`startDrag>drag>update>endDrag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`startDrag>drag>update>endDrag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(-31);
      logInfo(`startDrag>drag>update>endDrag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`startDrag>drag>update>endDrag final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`startDrag>drag>update>endDrag final: subject.lastSeek=${subject.lastSeek}`);
      expect(subject.lastSeek).assertEqual(0);
      logInfo(`${BUNDLE}ProgressBarStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0050
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0050
     * @tc.desc      ProgressBarState call flow togglePlay > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0050 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const step1: boolean = subject.togglePlay();
      logInfo(`step1 togglePlay(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.drag(-17);
      logInfo(`step2 drag(-17): step2=${step2}`);
      expect(step2).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-30);
      logInfo(`togglePlay>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`togglePlay>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0051
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0051
     * @tc.desc      ProgressBarState call flow endDrag > togglePlay > update > endDrag > drag keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0051 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.togglePlay();
      logInfo(`step2 togglePlay(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.update(2999272.34);
      logInfo(`step3 update(2999272.34): step3=${step3}`);
      expect(step3).assertEqual(Number.NEGATIVE_INFINITY);
      const step4: number = subject.endDrag();
      logInfo(`step4 endDrag(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.drag(123);
      logInfo(`step5 drag(123): step5=${step5}`);
      expect(step5).assertEqual('0NaN');
      logInfo(`endDrag>togglePlay>update>endDrag>drag final: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`endDrag>togglePlay>update>endDrag>drag final: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`endDrag>togglePlay>update>endDrag>drag final: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('0NaN');
      logInfo(`endDrag>togglePlay>update>endDrag>drag final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_FLOW_0052
     * @tc.name      TabContentTouchHotZone_ProgressBarStateFlow_0052
     * @tc.desc      ProgressBarState call flow endDrag > startDrag > togglePlay keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateFlow_0052 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const step1: number = subject.endDrag();
      logInfo(`step1 endDrag(): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.startDrag();
      const step3: boolean = subject.togglePlay();
      logInfo(`step3 togglePlay(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`endDrag>startDrag>togglePlay final: subject.isTouch=${subject.isTouch}`);
      expect(subject.isTouch).assertTrue();
      logInfo(`endDrag>startDrag>togglePlay final: subject.isSeek=${subject.isSeek}`);
      expect(subject.isSeek).assertTrue();
      logInfo(`endDrag>startDrag>togglePlay final: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateFlow_0052 end`);
    });
  });
}
