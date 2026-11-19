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

/** Logic checks for RefreshButtonState flow (43 cases). */
export default function refreshButtonStateFlow19Test(): void {
  describe('RefreshButtonStateFlow19Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0825
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0825
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0825 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(58.26);
      logInfo(`step1 imageAt(58.26): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(14.1);
      logInfo(`step3 imageAt(14.1): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0825 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0826
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0826
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0826 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(83.48);
      logInfo(`step3 imageAt(83.48): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(-86);
      logInfo(`step5 imageAt(-86): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>click>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0826 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0827
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0827
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0827 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(60);
      logInfo(`step3 imageAt(60): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(24);
      logInfo(`step4 imageAt(24): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(35);
      logInfo(`step5 imageAt(35): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>click>imageAt>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>imageAt>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>imageAt>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0827 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0828
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0828
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0828 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(168);
      logInfo(`step1 imageAt(168): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(45);
      logInfo(`step2 imageAt(45): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0828 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0829
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0829
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0829 begin`);
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
      const step4: string = subject.imageAt(28);
      logInfo(`step4 imageAt(28): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(-28);
      logInfo(`step5 imageAt(-28): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>click>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>imageAt>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>imageAt>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0829 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0830
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0830
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0830 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(167);
      logInfo(`step2 imageAt(167): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0830 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0831
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0831
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0831 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(185);
      logInfo(`step1 imageAt(185): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(130);
      logInfo(`step2 imageAt(130): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(-6);
      logInfo(`step5 imageAt(-6): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>imageAt>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0831 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0832
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0832
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0832 begin`);
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
      const step4: string = subject.imageAt(90.8);
      logInfo(`step4 imageAt(90.8): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0832 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0833
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0833
     * @tc.desc      RefreshButtonState call flow imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0833 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(10);
      logInfo(`step1 imageAt(10): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0833 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0834
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0834
     * @tc.desc      RefreshButtonState call flow click > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0834 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0834 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0835
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0835
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0835 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0835 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0836
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0836
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0836 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(22.12);
      logInfo(`step1 imageAt(22.12): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(70.14);
      logInfo(`step4 imageAt(70.14): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(-49);
      logInfo(`step5 imageAt(-49): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>click>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>imageAt>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>imageAt>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0836 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0837
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0837
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0837 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0837 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0838
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0838
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0838 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(180);
      logInfo(`step2 imageAt(180): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0838 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0839
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0839
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0839 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(70.78);
      logInfo(`step1 imageAt(70.78): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(86);
      logInfo(`step2 imageAt(86): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0839 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0840
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0840
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0840 begin`);
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
      const step4: string = subject.imageAt(24);
      logInfo(`step4 imageAt(24): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0840 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0841
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0841
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0841 begin`);
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
      const step4: string = subject.imageAt(-28);
      logInfo(`step4 imageAt(-28): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(89.44);
      logInfo(`step5 imageAt(89.44): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>click>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>imageAt>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>imageAt>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0841 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0842
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0842
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0842 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(95);
      logInfo(`step2 imageAt(95): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0842 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0843
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0843
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0843 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-12);
      logInfo(`step1 imageAt(-12): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(17.32);
      logInfo(`step4 imageAt(17.32): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0843 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0844
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0844
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0844 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(23.44);
      logInfo(`step1 imageAt(23.44): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(147);
      logInfo(`step2 imageAt(147): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(56);
      logInfo(`step4 imageAt(56): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0844 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0845
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0845
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0845 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(148);
      logInfo(`step2 imageAt(148): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(55);
      logInfo(`step3 imageAt(55): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0845 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0846
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0846
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0846 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(46.1);
      logInfo(`step2 imageAt(46.1): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0846 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0847
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0847
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0847 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0847 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0848
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0848
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0848 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(23.58);
      logInfo(`step2 imageAt(23.58): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0848 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0849
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0849
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0849 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(197);
      logInfo(`step3 imageAt(197): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0849 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0850
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0850
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0850 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(8);
      logInfo(`step1 imageAt(8): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(38);
      logInfo(`step2 imageAt(38): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0850 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0851
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0851
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0851 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(168);
      logInfo(`step1 imageAt(168): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(66.56);
      logInfo(`step2 imageAt(66.56): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0851 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0852
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0852
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0852 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(156);
      logInfo(`step2 imageAt(156): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0852 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0853
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0853
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0853 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(80.33);
      logInfo(`step2 imageAt(80.33): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click final: JSON.stringify(subject.imag...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0853 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0854
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0854
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0854 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-72);
      logInfo(`step1 imageAt(-72): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0854 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0855
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0855
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0855 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-49);
      logInfo(`step1 imageAt(-49): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0855 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0856
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0856
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0856 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(186);
      logInfo(`step1 imageAt(186): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(31.39);
      logInfo(`step3 imageAt(31.39): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(158);
      logInfo(`step4 imageAt(158): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(17);
      logInfo(`step5 imageAt(17): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>click>imageAt>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0856 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0857
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0857
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0857 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(23.44);
      logInfo(`step1 imageAt(23.44): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(51.57);
      logInfo(`step2 imageAt(51.57): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(73.89);
      logInfo(`step3 imageAt(73.89): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0857 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0858
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0858
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0858 begin`);
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
      const step4: string = subject.imageAt(21.47);
      logInfo(`step4 imageAt(21.47): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>click>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>imageAt>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>imageAt>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0858 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0859
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0859
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0859 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0859 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0860
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0860
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0860 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(139);
      logInfo(`step1 imageAt(139): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(90.8);
      logInfo(`step3 imageAt(90.8): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`imageAt>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt>click final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0860 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0861
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0861
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0861 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-73);
      logInfo(`step1 imageAt(-73): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(40);
      logInfo(`step2 imageAt(40): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0861 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0862
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0862
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0862 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(160);
      logInfo(`step1 imageAt(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(94);
      logInfo(`step2 imageAt(94): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0862 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0863
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0863
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0863 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0863 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0864
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0864
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0864 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(10);
      logInfo(`step2 imageAt(10): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0864 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0865
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0865
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0865 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(25);
      logInfo(`step2 imageAt(25): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0865 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0866
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0866
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0866 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(84.64);
      logInfo(`step2 imageAt(84.64): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0866 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0867
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0867
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0867 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(94);
      logInfo(`step1 imageAt(94): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(191);
      logInfo(`step2 imageAt(191): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(146);
      logInfo(`step3 imageAt(146): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(10);
      logInfo(`step4 imageAt(10): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>imageAt>imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>imageAt>imageAt>click final: JSON.stri...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>imageAt>imageAt>click final: JSON.stri...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0867 end`);
    });
  });
}
