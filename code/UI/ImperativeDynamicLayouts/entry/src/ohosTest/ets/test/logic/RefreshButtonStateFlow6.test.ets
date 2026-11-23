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

/** Logic checks for RefreshButtonState flow (48 cases). */
export default function refreshButtonStateFlow6Test(): void {
  describe('RefreshButtonStateFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0229
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0229
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0229 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0230
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0230
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0230 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(184);
      logInfo(`step1 imageAt(184): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(-28);
      logInfo(`step3 imageAt(-28): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0231
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0231
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0231 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(182);
      logInfo(`step2 imageAt(182): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0232
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0232
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0232 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(89.44);
      logInfo(`step1 imageAt(89.44): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(66.56);
      logInfo(`step2 imageAt(66.56): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(30);
      logInfo(`step3 imageAt(30): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0233
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0233
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0233 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(102);
      logInfo(`step2 imageAt(102): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(51.57);
      logInfo(`step4 imageAt(51.57): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0234
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0234
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0234 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(35.83);
      logInfo(`step1 imageAt(35.83): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(148);
      logInfo(`step2 imageAt(148): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-18);
      logInfo(`step3 imageAt(-18): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0235
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0235
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0235 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-51);
      logInfo(`step1 imageAt(-51): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0236
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0236
     * @tc.desc      RefreshButtonState call flow click > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0236 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0237
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0237
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0237 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-3);
      logInfo(`step1 imageAt(-3): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0238
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0238
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0238 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-89);
      logInfo(`step1 imageAt(-89): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0239
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0239
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0239 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(133);
      logInfo(`step3 imageAt(133): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0240
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0240
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0240 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(43);
      logInfo(`step1 imageAt(43): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0241
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0241
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0241 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0242
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0242
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0242 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-25);
      logInfo(`step2 imageAt(-25): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0243
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0243
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0243 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(49);
      logInfo(`step1 imageAt(49): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(95);
      logInfo(`step3 imageAt(95): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0244
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0244
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0244 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(151);
      logInfo(`step2 imageAt(151): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0245
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0245
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0245 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-18);
      logInfo(`step1 imageAt(-18): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(45);
      logInfo(`step2 imageAt(45): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(99);
      logInfo(`step3 imageAt(99): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(148);
      logInfo(`step5 imageAt(148): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0246
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0246
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0246 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(25);
      logInfo(`step2 imageAt(25): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0247
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0247
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0247 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(95);
      logInfo(`step1 imageAt(95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-73);
      logInfo(`step2 imageAt(-73): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0248
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0248
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0248 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0249
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0249
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0249 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(56);
      logInfo(`step1 imageAt(56): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-26);
      logInfo(`step2 imageAt(-26): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0250
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0250
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0250 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0251
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0251
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0251 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(73.89);
      logInfo(`step1 imageAt(73.89): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(33.7);
      logInfo(`step2 imageAt(33.7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(43);
      logInfo(`step3 imageAt(43): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0252
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0252
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0252 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(160);
      logInfo(`step1 imageAt(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(196);
      logInfo(`step2 imageAt(196): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0253
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0253
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0253 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(99);
      logInfo(`step1 imageAt(99): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0254
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0254
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0254 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-95);
      logInfo(`step1 imageAt(-95): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0255
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0255
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0255 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-78);
      logInfo(`step1 imageAt(-78): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(197);
      logInfo(`step3 imageAt(197): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0256
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0256
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0256 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0257
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0257
     * @tc.desc      RefreshButtonState call flow click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0257 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0258
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0258
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0258 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(94);
      logInfo(`step1 imageAt(94): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(17.32);
      logInfo(`step3 imageAt(17.32): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(33.47);
      logInfo(`step4 imageAt(33.47): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(-25);
      logInfo(`step5 imageAt(-25): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0259
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0259
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0259 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0260
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0260
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0260 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0261
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0261
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0261 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0262
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0262
     * @tc.desc      RefreshButtonState call flow click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0262 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0263
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0263
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0263 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(21.92);
      logInfo(`step1 imageAt(21.92): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(148);
      logInfo(`step2 imageAt(148): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0264
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0264
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0264 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(58.29);
      logInfo(`step2 imageAt(58.29): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(38);
      logInfo(`step4 imageAt(38): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0265
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0265
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0265 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(14.11);
      logInfo(`step1 imageAt(14.11): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(31.44);
      logInfo(`step2 imageAt(31.44): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0266
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0266
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0266 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(149);
      logInfo(`step1 imageAt(149): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(22.12);
      logInfo(`step2 imageAt(22.12): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0267
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0267
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0267 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(23.44);
      logInfo(`step2 imageAt(23.44): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(102);
      logInfo(`step3 imageAt(102): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0268
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0268
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0268 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(59);
      logInfo(`step1 imageAt(59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-45);
      logInfo(`step2 imageAt(-45): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0269
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0269
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0269 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(78);
      logInfo(`step2 imageAt(78): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(8);
      logInfo(`step3 imageAt(8): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(-53);
      logInfo(`step4 imageAt(-53): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0270
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0270
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0270 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(148);
      logInfo(`step3 imageAt(148): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(10);
      logInfo(`step4 imageAt(10): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(17.32);
      logInfo(`step5 imageAt(17.32): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0271
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0271
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0271 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(28);
      logInfo(`step1 imageAt(28): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(52.33);
      logInfo(`step2 imageAt(52.33): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0272
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0272
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0272 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(65.81);
      logInfo(`step1 imageAt(65.81): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(185);
      logInfo(`step4 imageAt(185): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0273
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0273
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0273 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0274
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0274
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0274 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(21.47);
      logInfo(`step2 imageAt(21.47): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(25);
      logInfo(`step3 imageAt(25): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0275
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0275
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0275 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-9);
      logInfo(`step1 imageAt(-9): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-9);
      logInfo(`step2 imageAt(-9): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0276
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0276
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0276 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(35);
      logInfo(`step1 imageAt(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(26.38);
      logInfo(`step2 imageAt(26.38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(42);
      logInfo(`step3 imageAt(42): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0276 end`);
    });
  });
}
