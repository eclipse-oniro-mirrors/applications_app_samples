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

/** Logic checks for RefreshButtonState flow (47 cases). */
export default function refreshButtonStateFlow7Test(): void {
  describe('RefreshButtonStateFlow7Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0277
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0277
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0277 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0278
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0278
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0278 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(42.83);
      logInfo(`step2 imageAt(42.83): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0279
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0279
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0279 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(41);
      logInfo(`step2 imageAt(41): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(56);
      logInfo(`step4 imageAt(56): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0280
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0280
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0280 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(156);
      logInfo(`step2 imageAt(156): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-91);
      logInfo(`step3 imageAt(-91): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(89.44);
      logInfo(`step4 imageAt(89.44): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0281
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0281
     * @tc.desc      RefreshButtonState call flow click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0281 begin`);
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
      logInfo(`click>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>click final: JSON.stringify(subject....${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>click final: JSON.stringify(subject....${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0282
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0282
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0282 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(176);
      logInfo(`step1 imageAt(176): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(187);
      logInfo(`step4 imageAt(187): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`imageAt>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0283
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0283
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0283 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(43);
      logInfo(`step1 imageAt(43): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(182);
      logInfo(`step2 imageAt(182): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(3.47);
      logInfo(`step4 imageAt(3.47): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>imageAt>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>imageAt>click final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>imageAt>click final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0284
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0284
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0284 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(48);
      logInfo(`step3 imageAt(48): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0285
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0285
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0285 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(69);
      logInfo(`step1 imageAt(69): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(94);
      logInfo(`step2 imageAt(94): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(48.76);
      logInfo(`step3 imageAt(48.76): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`imageAt>imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>imageAt>click final: JSON.stringify(su...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>imageAt>click final: JSON.stringify(su...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0286
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0286
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0286 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(70.14);
      logInfo(`step1 imageAt(70.14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(14.11);
      logInfo(`step2 imageAt(14.11): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0287
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0287
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0287 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(63);
      logInfo(`step1 imageAt(63): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0288
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0288
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0288 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(106);
      logInfo(`step1 imageAt(106): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(54);
      logInfo(`step2 imageAt(54): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(46.1);
      logInfo(`step3 imageAt(46.1): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(36);
      logInfo(`step4 imageAt(36): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0289
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0289
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0289 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(64.29);
      logInfo(`step1 imageAt(64.29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(49.88);
      logInfo(`step2 imageAt(49.88): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0290
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0290
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0290 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(147);
      logInfo(`step3 imageAt(147): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0291
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0291
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0291 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(30);
      logInfo(`step2 imageAt(30): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0292
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0292
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0292 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(77);
      logInfo(`step2 imageAt(77): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-45);
      logInfo(`step3 imageAt(-45): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0293
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0293
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0293 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(90);
      logInfo(`step1 imageAt(90): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0294
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0294
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0294 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(70);
      logInfo(`step2 imageAt(70): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0295
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0295
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0295 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(92);
      logInfo(`step1 imageAt(92): step1=${step1}`);
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
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>click>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0296
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0296
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0296 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(46.1);
      logInfo(`step1 imageAt(46.1): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(27.04);
      logInfo(`step2 imageAt(27.04): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(195);
      logInfo(`step4 imageAt(195): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0297
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0297
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0297 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(0.73);
      logInfo(`step2 imageAt(0.73): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-24);
      logInfo(`step3 imageAt(-24): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(-69);
      logInfo(`step4 imageAt(-69): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(23.44);
      logInfo(`step5 imageAt(23.44): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>imageAt>imageAt>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0298
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0298
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0298 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0299
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0299
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0299 begin`);
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
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`click>click>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>click final: JSON.stringify(subjec...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0300
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0300
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0300 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0301
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0301
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0301 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(125);
      logInfo(`step2 imageAt(125): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0302
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0302
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0302 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(21.92);
      logInfo(`step1 imageAt(21.92): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(-4);
      logInfo(`step4 imageAt(-4): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`imageAt>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>imageAt final: JSON.stringify(subj...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0303
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0303
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0303 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(55.61);
      logInfo(`step1 imageAt(55.61): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0304
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0304
     * @tc.desc      RefreshButtonState call flow imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0304 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(185);
      logInfo(`step1 imageAt(185): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0305
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0305
     * @tc.desc      RefreshButtonState call flow click > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0305 begin`);
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
      const step4: string = subject.imageAt(-46);
      logInfo(`step4 imageAt(-46): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0306
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0306
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0306 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(101);
      logInfo(`step1 imageAt(101): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0307
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0307
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0307 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(4.9);
      logInfo(`step1 imageAt(4.9): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0308
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0308
     * @tc.desc      RefreshButtonState call flow imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0308 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(114);
      logInfo(`step1 imageAt(114): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0309
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0309
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0309 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(184);
      logInfo(`step1 imageAt(184): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0310
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0310
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0310 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0311
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0311
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0311 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(145);
      logInfo(`step1 imageAt(145): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(84.64);
      logInfo(`step2 imageAt(84.64): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(115);
      logInfo(`step3 imageAt(115): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0312
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0312
     * @tc.desc      RefreshButtonState call flow click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0312 begin`);
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
      logInfo(`click>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>click>click final: JSON.stringify(subject....${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>click>click final: JSON.stringify(subject....${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0313
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0313
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0313 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(35);
      logInfo(`step3 imageAt(35): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(140);
      logInfo(`step5 imageAt(140): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0314
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0314
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0314 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(156);
      logInfo(`step1 imageAt(156): step1=${step1}`);
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
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`imageAt>click>click>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>click>click final: JSON.stringify(...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0315
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0315
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0315 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-73);
      logInfo(`step1 imageAt(-73): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(84.64);
      logInfo(`step2 imageAt(84.64): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0316
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0316
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0316 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-78);
      logInfo(`step1 imageAt(-78): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(23.44);
      logInfo(`step2 imageAt(23.44): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(40);
      logInfo(`step3 imageAt(40): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0317
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0317
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0317 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(23.44);
      logInfo(`step3 imageAt(23.44): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(0.73);
      logInfo(`step5 imageAt(0.73): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0318
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0318
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0318 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(21.3);
      logInfo(`step1 imageAt(21.3): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(64);
      logInfo(`step3 imageAt(64): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(45);
      logInfo(`step5 imageAt(45): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>click>imageAt>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>imageAt>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>imageAt>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>imageAt>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>imageAt>click>imageAt final: JSON.string...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0319
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0319
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0319 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(76.72);
      logInfo(`step2 imageAt(76.72): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0320
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0320
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0320 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(18);
      logInfo(`step2 imageAt(18): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(65.81);
      logInfo(`step3 imageAt(65.81): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>imageAt>click>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>imageAt>click>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>imageAt>click>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>imageAt>click>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0321
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0321
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0321 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(65);
      logInfo(`step1 imageAt(65): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(43);
      logInfo(`step2 imageAt(43): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(33.53);
      logInfo(`step3 imageAt(33.53): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0322
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0322
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0322 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(95);
      logInfo(`step1 imageAt(95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(107);
      logInfo(`step2 imageAt(107): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0323
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0323
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0323 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0323 end`);
    });
  });
}
