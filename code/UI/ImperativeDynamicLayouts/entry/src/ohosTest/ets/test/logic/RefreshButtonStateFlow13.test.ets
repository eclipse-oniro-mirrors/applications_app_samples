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
export default function refreshButtonStateFlow13Test(): void {
  describe('RefreshButtonStateFlow13Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0554
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0554
     * @tc.desc      RefreshButtonState call flow click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0554 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0554 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0555
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0555
     * @tc.desc      RefreshButtonState call flow click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0555 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0555 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0556
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0556
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0556 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(36);
      logInfo(`step1 imageAt(36): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(141);
      logInfo(`step2 imageAt(141): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(69);
      logInfo(`step3 imageAt(69): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0556 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0557
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0557
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0557 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(75);
      logInfo(`step1 imageAt(75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-45);
      logInfo(`step2 imageAt(-45): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0557 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0558
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0558
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0558 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-91);
      logInfo(`step1 imageAt(-91): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(39);
      logInfo(`step2 imageAt(39): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0558 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0559
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0559
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0559 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(112);
      logInfo(`step2 imageAt(112): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(66.56);
      logInfo(`step3 imageAt(66.56): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(-96);
      logInfo(`step5 imageAt(-96): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0559 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0560
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0560
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0560 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(155);
      logInfo(`step1 imageAt(155): step1=${step1}`);
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
      const step5: string = subject.imageAt(152);
      logInfo(`step5 imageAt(152): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>click>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>click>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>click>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>click>click>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>click>click>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0560 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0561
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0561
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0561 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(17.32);
      logInfo(`step2 imageAt(17.32): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(7);
      logInfo(`step4 imageAt(7): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0561 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0562
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0562
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0562 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(6.91);
      logInfo(`step3 imageAt(6.91): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0562 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0563
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0563
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0563 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(109);
      logInfo(`step1 imageAt(109): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0563 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0564
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0564
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0564 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-26);
      logInfo(`step1 imageAt(-26): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0564 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0565
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0565
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0565 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0565 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0566
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0566
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0566 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(177);
      logInfo(`step1 imageAt(177): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(-62);
      logInfo(`step3 imageAt(-62): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0566 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0567
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0567
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0567 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-28);
      logInfo(`step1 imageAt(-28): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(31.44);
      logInfo(`step4 imageAt(31.44): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0567 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0568
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0568
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0568 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(75);
      logInfo(`step2 imageAt(75): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0568 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0569
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0569
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0569 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(81);
      logInfo(`step3 imageAt(81): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0569 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0570
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0570
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0570 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(-9);
      logInfo(`step2 imageAt(-9): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0570 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0571
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0571
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0571 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(86);
      logInfo(`step2 imageAt(86): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-11);
      logInfo(`step3 imageAt(-11): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0571 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0572
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0572
     * @tc.desc      RefreshButtonState call flow click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0572 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(3.47);
      logInfo(`step2 imageAt(3.47): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0572 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0573
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0573
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0573 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0573 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0574
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0574
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0574 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(94.53);
      logInfo(`step1 imageAt(94.53): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(77);
      logInfo(`step2 imageAt(77): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0574 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0575
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0575
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0575 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(200);
      logInfo(`step1 imageAt(200): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(30);
      logInfo(`step2 imageAt(30): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(21.3);
      logInfo(`step5 imageAt(21.3): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0575 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0576
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0576
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0576 begin`);
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
      const step4: string = subject.imageAt(-89);
      logInfo(`step4 imageAt(-89): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0576 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0577
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0577
     * @tc.desc      RefreshButtonState call flow click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0577 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0577 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0578
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0578
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0578 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(48.99);
      logInfo(`step1 imageAt(48.99): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(110);
      logInfo(`step2 imageAt(110): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0578 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0579
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0579
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0579 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(82.88);
      logInfo(`step3 imageAt(82.88): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0579 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0580
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0580
     * @tc.desc      RefreshButtonState call flow click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0580 begin`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0580 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0581
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0581
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0581 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(59);
      logInfo(`step3 imageAt(59): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(184);
      logInfo(`step4 imageAt(184): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.click();
      logInfo(`step5 click(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`click>click>imageAt>imageAt>click final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>click>imageAt>imageAt>click final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>click>imageAt>imageAt>click final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>click>imageAt>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>click>imageAt>imageAt>click final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0581 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0582
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0582
     * @tc.desc      RefreshButtonState call flow imageAt > click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0582 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(97);
      logInfo(`step1 imageAt(97): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(14.1);
      logInfo(`step3 imageAt(14.1): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(53.13);
      logInfo(`step4 imageAt(53.13): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(133);
      logInfo(`step5 imageAt(133): step5=${step5}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0582 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0583
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0583
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0583 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(99);
      logInfo(`step1 imageAt(99): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(191);
      logInfo(`step2 imageAt(191): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0583 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0584
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0584
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0584 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-86);
      logInfo(`step1 imageAt(-86): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(48);
      logInfo(`step2 imageAt(48): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(0.25);
      logInfo(`step3 imageAt(0.25): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0584 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0585
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0585
     * @tc.desc      RefreshButtonState call flow imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0585 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-7);
      logInfo(`step1 imageAt(-7): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0585 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0586
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0586
     * @tc.desc      RefreshButtonState call flow click > imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0586 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(71.93);
      logInfo(`step2 imageAt(71.93): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(83.48);
      logInfo(`step3 imageAt(83.48): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(32.55);
      logInfo(`step4 imageAt(32.55): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0586 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0587
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0587
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0587 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(63);
      logInfo(`step1 imageAt(63): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(41);
      logInfo(`step2 imageAt(41): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0587 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0588
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0588
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0588 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(80.12);
      logInfo(`step1 imageAt(80.12): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(139);
      logInfo(`step2 imageAt(139): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0588 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0589
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0589
     * @tc.desc      RefreshButtonState call flow click > imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0589 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(84.64);
      logInfo(`step2 imageAt(84.64): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.click();
      logInfo(`step4 click(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.imageAt(109);
      logInfo(`step5 imageAt(109): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`click>imageAt>click>click>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`click>imageAt>click>click>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`click>imageAt>click>click>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`click>imageAt>click>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`click>imageAt>click>click>imageAt final: JSON.stringif...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0589 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0590
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0590
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0590 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(23.58);
      logInfo(`step1 imageAt(23.58): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-6);
      logInfo(`step2 imageAt(-6): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-82);
      logInfo(`step3 imageAt(-82): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0590 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0591
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0591
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0591 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-4);
      logInfo(`step1 imageAt(-4): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(106);
      logInfo(`step2 imageAt(106): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.imageAt(-70);
      logInfo(`step3 imageAt(-70): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0591 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0592
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0592
     * @tc.desc      RefreshButtonState call flow click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0592 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.imageAt(101);
      logInfo(`step2 imageAt(101): step2=${step2}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0592 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0593
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0593
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0593 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-70);
      logInfo(`step1 imageAt(-70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(78);
      logInfo(`step4 imageAt(78): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0593 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0594
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0594
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0594 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(23.58);
      logInfo(`step1 imageAt(23.58): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0594 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0595
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0595
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0595 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(50);
      logInfo(`step3 imageAt(50): step3=${step3}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0595 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0596
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0596
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0596 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(48.76);
      logInfo(`step1 imageAt(48.76): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(-26);
      logInfo(`step2 imageAt(-26): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.click();
      logInfo(`step3 click(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.imageAt(0.25);
      logInfo(`step4 imageAt(0.25): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.imageAt(73.89);
      logInfo(`step5 imageAt(73.89): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`imageAt>imageAt>click>imageAt>imageAt final: subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertFalse();
      logInfo(`imageAt>imageAt>click>imageAt>imageAt final: subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(1);
      logInfo(`imageAt>imageAt>click>imageAt>imageAt final: subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`imageAt>imageAt>click>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`imageAt>imageAt>click>imageAt>imageAt final: JSON.stri...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0596 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0597
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0597
     * @tc.desc      RefreshButtonState call flow imageAt > click > click > click keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0597 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(82.88);
      logInfo(`step1 imageAt(82.88): step1=${step1}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0597 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0598
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0598
     * @tc.desc      RefreshButtonState call flow click > click > imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0598 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: number = subject.click();
      logInfo(`step1 click(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.click();
      logInfo(`step2 click(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.imageAt(73.89);
      logInfo(`step3 imageAt(73.89): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.imageAt(-26);
      logInfo(`step4 imageAt(-26): step4=${step4}`);
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
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0598 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_FLOW_0599
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateFlow_0599
     * @tc.desc      RefreshButtonState call flow imageAt > imageAt keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateFlow_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0599 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      const step1: string = subject.imageAt(-62);
      logInfo(`step1 imageAt(-62): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.imageAt(42.54);
      logInfo(`step2 imageAt(42.54): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}RefreshButtonStateFlow_0599 end`);
    });
  });
}
