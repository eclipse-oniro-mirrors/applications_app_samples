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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RefreshButtonState } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RefreshButtonState flow (46 cases). */
export default function refreshButtonStateFlow14Test(): void {
  describe('RefreshButtonStateFlow14Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0600
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0600
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0600 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(80);
      logInfo(`step2 imageAt(80): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0600 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0601
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0601
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0601 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-93);
      logInfo(`step2 imageAt(-93): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(151);
      logInfo(`step3 imageAt(151): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0601 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0602
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0602
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0602 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(28);
      logInfo(`step1 imageAt(28): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-86);
      logInfo(`step2 imageAt(-86): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0602 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0603
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0603
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0603 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(71.93);
      logInfo(`step2 imageAt(71.93): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0603 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0604
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0604
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0604 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(165);
      logInfo(`step1 imageAt(165): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(14.1);
      logInfo(`step2 imageAt(14.1): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0604 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0605
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0605
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0605 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(8);
      logInfo(`step1 imageAt(8): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0605 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0606
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0606
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0606 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(144);
      logInfo(`step1 imageAt(144): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(17);
      logInfo(`step3 imageAt(17): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(85.51);
      logInfo(`step4 imageAt(85.51): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`imageAt>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0606 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0607
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0607
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0607 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0607 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0608
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0608
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0608 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-15);
      logInfo(`step2 imageAt(-15): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(48);
      logInfo(`step3 imageAt(48): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0608 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0609
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0609
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0609 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(129);
      logInfo(`step1 imageAt(129): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(28);
      logInfo(`step2 imageAt(28): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0609 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0610
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0610
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0610 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-7);
      logInfo(`step2 imageAt(-7): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0610 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0611
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0611
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0611 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(160);
      logInfo(`step1 imageAt(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(133);
      logInfo(`step2 imageAt(133): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0611 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0612
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0612
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0612 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(17);
      logInfo(`step3 imageAt(17): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0612 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0613
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0613
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0613 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(123);
      logInfo(`step1 imageAt(123): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-14);
      logInfo(`step2 imageAt(-14): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`imageAt>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0613 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0614
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0614
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0614 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(78);
      logInfo(`step2 imageAt(78): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>imageAt>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0614 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0615
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0615
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0615 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(12.43);
      logInfo(`step1 imageAt(12.43): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(48.76);
      logInfo(`step2 imageAt(48.76): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(129);
      logInfo(`step3 imageAt(129): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0615 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0616
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0616
     * @tc.desc      RefreshButtonState call flow click > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0616 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>click>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>click>click final: JSON.stringify(su...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>click>click final: JSON.stringify(su...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0616 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0617
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0617
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0617 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-95);
      logInfo(`step2 imageAt(-95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(30.19);
      logInfo(`step3 imageAt(30.19): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(3.47);
      logInfo(`step4 imageAt(3.47): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`click>imageAt>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0617 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0618
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0618
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0618 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click final: JSON.stringify(subject.images.slice...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click final: JSON.stringify(subject.images.slice...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0618 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0619
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0619
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0619 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-62);
      logInfo(`step1 imageAt(-62): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(190);
      logInfo(`step2 imageAt(190): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(200);
      logInfo(`step4 imageAt(200): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`imageAt>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>imageAt final: JSON.stringify(su...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0619 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0620
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0620
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0620 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-13);
      logInfo(`step2 imageAt(-13): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(143);
      logInfo(`step3 imageAt(143): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0620 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0621
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0621
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0621 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(-58);
      logInfo(`step4 imageAt(-58): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`click>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>imageAt final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>imageAt final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0621 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0622
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0622
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0622 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(18);
      logInfo(`step1 imageAt(18): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(160);
      logInfo(`step2 imageAt(160): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`imageAt>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0622 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0623
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0623
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0623 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0623 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0624
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0624
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0624 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-14);
      logInfo(`step1 imageAt(-14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(53);
      logInfo(`step2 imageAt(53): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(170);
      logInfo(`step3 imageAt(170): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(55.61);
      logInfo(`step5 imageAt(55.61): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>imageAt>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>imageAt>click>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>imageAt>click>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0624 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0625
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0625
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0625 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(31.44);
      logInfo(`step1 imageAt(31.44): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(17.32);
      logInfo(`step3 imageAt(17.32): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>click>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt>click>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt>click>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0625 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0626
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0626
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0626 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(48.99);
      logInfo(`step1 imageAt(48.99): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0626 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0627
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0627
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0627 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(120);
      logInfo(`step2 imageAt(120): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt final: JSON.stringify(subject.images.sli...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0627 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0628
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0628
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0628 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-3);
      logInfo(`step1 imageAt(-3): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(-25);
      logInfo(`step3 imageAt(-25): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0628 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0629
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0629
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0629 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-58);
      logInfo(`step2 imageAt(-58): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(28);
      logInfo(`step4 imageAt(28): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`click>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0629 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0630
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0630
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0630 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click final: JSON.stringify(subject.images...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0630 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0631
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0631
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0631 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(83);
      logInfo(`step2 imageAt(83): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(65);
      logInfo(`step4 imageAt(65): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>imageAt>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0631 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0632
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0632
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0632 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(21.3);
      logInfo(`step1 imageAt(21.3): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(63);
      logInfo(`step2 imageAt(63): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(144);
      logInfo(`step3 imageAt(144): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(80);
      logInfo(`step4 imageAt(80): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0632 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0633
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0633
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0633 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(160);
      logInfo(`step3 imageAt(160): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>click>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0633 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0634
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0634
     * @tc.desc      RefreshButtonState call flow imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0634 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(130);
      logInfo(`step1 imageAt(130): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0634 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0635
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0635
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0635 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(53);
      logInfo(`step2 imageAt(53): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(125);
      logInfo(`step3 imageAt(125): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0635 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0636
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0636
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0636 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(23.32);
      logInfo(`step1 imageAt(23.32): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`imageAt>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0636 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0637
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0637
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0637 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-58);
      logInfo(`step1 imageAt(-58): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(133);
      logInfo(`step4 imageAt(133): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0637 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0638
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0638
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0638 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(141);
      logInfo(`step1 imageAt(141): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-69);
      logInfo(`step2 imageAt(-69): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0638 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0639
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0639
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0639 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(165);
      logInfo(`step3 imageAt(165): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(44.96);
      logInfo(`step4 imageAt(44.96): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`click>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0639 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0640
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0640
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0640 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(21.3);
      logInfo(`step1 imageAt(21.3): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(85);
      logInfo(`step4 imageAt(85): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0640 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0641
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0641
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0641 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(80);
      logInfo(`step1 imageAt(80): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(55);
      logInfo(`step2 imageAt(55): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(55.61);
      logInfo(`step3 imageAt(55.61): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0641 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0642
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0642
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0642 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(161);
      logInfo(`step1 imageAt(161): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(83);
      logInfo(`step2 imageAt(83): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0642 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0643
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0643
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0643 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-26);
      logInfo(`step1 imageAt(-26): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(123);
      logInfo(`step2 imageAt(123): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0643 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0644
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0644
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0644 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(164);
      logInfo(`step2 imageAt(164): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(14.79);
      logInfo(`step3 imageAt(14.79): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(-86);
      logInfo(`step5 imageAt(-86): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>imageAt>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0644 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0645
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0645
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0645 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-7);
      logInfo(`step1 imageAt(-7): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(99);
      logInfo(`step3 imageAt(99): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt final: JSON.stringify(subject.im...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0645 end`);
    });
  });
}
