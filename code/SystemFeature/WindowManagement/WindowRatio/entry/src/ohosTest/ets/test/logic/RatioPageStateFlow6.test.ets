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
import { RatioPageState } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for RatioPageState flow (46 cases). */
export default function ratioPageStateFlow6Test(): void {
  describe('RatioPageStateFlow6Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0227
     * @tc.name      WindowRatio_RatioPageStateFlow_0227
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0227 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(123);
      logInfo(`step1 select(123): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(140);
      logInfo(`step2 select(140): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(140);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0228
     * @tc.name      WindowRatio_RatioPageStateFlow_0228
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0228 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(25);
      logInfo(`step1 select(25): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(100, 1);
      logInfo(`step2 onSizeChange(100, 1): step2=${step2}`);
      expect(step2).assertEqual('100 x 1');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(25);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0229
     * @tc.name      WindowRatio_RatioPageStateFlow_0229
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0229 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(113);
      logInfo(`step1 select(113): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(200);
      logInfo(`step2 select(200): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(200);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0230
     * @tc.name      WindowRatio_RatioPageStateFlow_0230
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0230 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(35.98);
      logInfo(`step1 select(35.98): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-6);
      logInfo(`step2 select(-6): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0231
     * @tc.name      WindowRatio_RatioPageStateFlow_0231
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0231 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1440, 3);
      logInfo(`step1 onSizeChange(1440, 3): step1=${step1}`);
      expect(step1).assertEqual('1440 x 3');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(85.78);
      logInfo(`step3 select(85.78): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(96, 768);
      logInfo(`step4 onSizeChange(96, 768): step4=${step4}`);
      expect(step4).assertEqual('96 x 768');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(85.78, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0232
     * @tc.name      WindowRatio_RatioPageStateFlow_0232
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0232 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(480, 0);
      logInfo(`step1 onSizeChange(480, 0): step1=${step1}`);
      expect(step1).assertEqual('480 x 0');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0233
     * @tc.name      WindowRatio_RatioPageStateFlow_0233
     * @tc.desc      RatioPageState call flow apply > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0233 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(200);
      logInfo(`step2 select(200): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(200);
      logInfo(`apply>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0234
     * @tc.name      WindowRatio_RatioPageStateFlow_0234
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0234 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(175);
      logInfo(`step1 select(175): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(864, 360);
      logInfo(`step2 onSizeChange(864, 360): step2=${step2}`);
      expect(step2).assertEqual('864 x 360');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(175);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0235
     * @tc.name      WindowRatio_RatioPageStateFlow_0235
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0235 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1440);
      logInfo(`step1 onSizeChange(0, 1440): step1=${step1}`);
      expect(step1).assertEqual('0 x 1440');
      const step2: string = subject.select(75);
      logInfo(`step2 select(75): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(28);
      logInfo(`step3 select(28): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(720, 1920);
      logInfo(`step4 onSizeChange(720, 1920): step4=${step4}`);
      expect(step4).assertEqual('720 x 1920');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(28);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0236
     * @tc.name      WindowRatio_RatioPageStateFlow_0236
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0236 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(384, 480);
      logInfo(`step2 onSizeChange(384, 480): step2=${step2}`);
      expect(step2).assertEqual('384 x 480');
      const step3: string = subject.select(110);
      logInfo(`step3 select(110): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.select(52);
      logInfo(`step5 select(52): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(52);
      logInfo(`apply>onSizeChange>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('384');
      logInfo(`apply>onSizeChange>select>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`apply>onSizeChange>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0237
     * @tc.name      WindowRatio_RatioPageStateFlow_0237
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0237 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1632, 0);
      logInfo(`step2 onSizeChange(1632, 0): step2=${step2}`);
      expect(step2).assertEqual('1632 x 0');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`apply>onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0238
     * @tc.name      WindowRatio_RatioPageStateFlow_0238
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0238 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(155);
      logInfo(`step1 select(155): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(4);
      logInfo(`step2 select(4): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 1536);
      logInfo(`step3 onSizeChange(0, 1536): step3=${step3}`);
      expect(step3).assertEqual('0 x 1536');
      const step4: string = subject.select(113);
      logInfo(`step4 select(113): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(113);
      logInfo(`select>select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0239
     * @tc.name      WindowRatio_RatioPageStateFlow_0239
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > onSizeChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0239 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(96, 0);
      logInfo(`step1 onSizeChange(96, 0): step1=${step1}`);
      expect(step1).assertEqual('96 x 0');
      const step2: string = subject.onSizeChange(1344, 1344);
      logInfo(`step2 onSizeChange(1344, 1344): step2=${step2}`);
      expect(step2).assertEqual('1344 x 1344');
      const step3: string = subject.onSizeChange(1056, 0);
      logInfo(`step3 onSizeChange(1056, 0): step3=${step3}`);
      expect(step3).assertEqual('1056 x 0');
      const step4: string = subject.onSizeChange(720, 360);
      logInfo(`step4 onSizeChange(720, 360): step4=${step4}`);
      expect(step4).assertEqual('720 x 360');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0240
     * @tc.name      WindowRatio_RatioPageStateFlow_0240
     * @tc.desc      RatioPageState call flow select > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0240 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(123);
      logInfo(`step1 select(123): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(123);
      logInfo(`select>apply>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0241
     * @tc.name      WindowRatio_RatioPageStateFlow_0241
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0241 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1344, 1344);
      logInfo(`step1 onSizeChange(1344, 1344): step1=${step1}`);
      expect(step1).assertEqual('1344 x 1344');
      const step2: string = subject.onSizeChange(768, 0);
      logInfo(`step2 onSizeChange(768, 0): step2=${step2}`);
      expect(step2).assertEqual('768 x 0');
      const step3: string = subject.select(5);
      logInfo(`step3 select(5): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(576, 864);
      logInfo(`step4 onSizeChange(576, 864): step4=${step4}`);
      expect(step4).assertEqual('576 x 864');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(5);
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0242
     * @tc.name      WindowRatio_RatioPageStateFlow_0242
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0242 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1536, 1728);
      logInfo(`step1 onSizeChange(1536, 1728): step1=${step1}`);
      expect(step1).assertEqual('1536 x 1728');
      const step2: string = subject.onSizeChange(576, 864);
      logInfo(`step2 onSizeChange(576, 864): step2=${step2}`);
      expect(step2).assertEqual('576 x 864');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(-37);
      logInfo(`step4 select(-37): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-37);
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`onSizeChange>onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0243
     * @tc.name      WindowRatio_RatioPageStateFlow_0243
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0243 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1152, 1056);
      logInfo(`step1 onSizeChange(1152, 1056): step1=${step1}`);
      expect(step1).assertEqual('1152 x 1056');
      const step2: string = subject.onSizeChange(0, 100);
      logInfo(`step2 onSizeChange(0, 100): step2=${step2}`);
      expect(step2).assertEqual('0 x 100');
      logInfo(`onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0244
     * @tc.name      WindowRatio_RatioPageStateFlow_0244
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0244 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-4);
      logInfo(`step1 select(-4): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(192, -1);
      logInfo(`step3 onSizeChange(192, -1): step3=${step3}`);
      expect(step3).assertEqual('192 x -1');
      logInfo(`select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-4);
      logInfo(`select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0245
     * @tc.name      WindowRatio_RatioPageStateFlow_0245
     * @tc.desc      RatioPageState call flow select > apply > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0245 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(35);
      logInfo(`step1 select(35): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(35);
      logInfo(`select>apply>apply>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0246
     * @tc.name      WindowRatio_RatioPageStateFlow_0246
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > onSizeChange > onSizeChange keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0246 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(384, 96);
      logInfo(`step1 onSizeChange(384, 96): step1=${step1}`);
      expect(step1).assertEqual('384 x 96');
      const step2: string = subject.select(123);
      logInfo(`step2 select(123): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1080, 100);
      logInfo(`step3 onSizeChange(1080, 100): step3=${step3}`);
      expect(step3).assertEqual('1080 x 100');
      const step4: string = subject.onSizeChange(960, 480);
      logInfo(`step4 onSizeChange(960, 480): step4=${step4}`);
      expect(step4).assertEqual('960 x 480');
      const step5: string = subject.onSizeChange(360, 480);
      logInfo(`step5 onSizeChange(360, 480): step5=${step5}`);
      expect(step5).assertEqual('360 x 480');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(123);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0247
     * @tc.name      WindowRatio_RatioPageStateFlow_0247
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0247 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(10, 1);
      logInfo(`step2 onSizeChange(10, 1): step2=${step2}`);
      expect(step2).assertEqual('10 x 1');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0248
     * @tc.name      WindowRatio_RatioPageStateFlow_0248
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0248 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-86);
      logInfo(`step1 select(-86): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(39);
      logInfo(`step2 select(39): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0249
     * @tc.name      WindowRatio_RatioPageStateFlow_0249
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0249 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(576, 864);
      logInfo(`step1 onSizeChange(576, 864): step1=${step1}`);
      expect(step1).assertEqual('576 x 864');
      const step2: string = subject.onSizeChange(720, 672);
      logInfo(`step2 onSizeChange(720, 672): step2=${step2}`);
      expect(step2).assertEqual('720 x 672');
      const step3: string = subject.select(1);
      logInfo(`step3 select(1): step3=${step3}`);
      expect(step3).assertEqual('1:1');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(1);
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertEqual(1);
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('1:1');
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`onSizeChange>onSizeChange>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0250
     * @tc.name      WindowRatio_RatioPageStateFlow_0250
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0250 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(720, -1);
      logInfo(`step1 onSizeChange(720, -1): step1=${step1}`);
      expect(step1).assertEqual('720 x -1');
      const step2: string = subject.select(75);
      logInfo(`step2 select(75): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(75);
      logInfo(`onSizeChange>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`onSizeChange>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0251
     * @tc.name      WindowRatio_RatioPageStateFlow_0251
     * @tc.desc      RatioPageState call flow apply > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0251 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0252
     * @tc.name      WindowRatio_RatioPageStateFlow_0252
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0252 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(192, 1344);
      logInfo(`step1 onSizeChange(192, 1344): step1=${step1}`);
      expect(step1).assertEqual('192 x 1344');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0253
     * @tc.name      WindowRatio_RatioPageStateFlow_0253
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0253 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(32.62);
      logInfo(`step1 select(32.62): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(5);
      logInfo(`step2 select(5): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(5);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0254
     * @tc.name      WindowRatio_RatioPageStateFlow_0254
     * @tc.desc      RatioPageState call flow apply > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0254 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(157);
      logInfo(`step2 select(157): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(152);
      logInfo(`step3 select(152): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(152);
      logInfo(`apply>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0255
     * @tc.name      WindowRatio_RatioPageStateFlow_0255
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0255 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1152, -1);
      logInfo(`step1 onSizeChange(1152, -1): step1=${step1}`);
      expect(step1).assertEqual('1152 x -1');
      const step2: string = subject.onSizeChange(0, 864);
      logInfo(`step2 onSizeChange(0, 864): step2=${step2}`);
      expect(step2).assertEqual('0 x 864');
      const step3: string = subject.onSizeChange(1440, 360);
      logInfo(`step3 onSizeChange(1440, 360): step3=${step3}`);
      expect(step3).assertEqual('1440 x 360');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0256
     * @tc.name      WindowRatio_RatioPageStateFlow_0256
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0256 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(17.23);
      logInfo(`step1 select(17.23): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-86);
      logInfo(`step2 select(-86): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-86);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0257
     * @tc.name      WindowRatio_RatioPageStateFlow_0257
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > apply > select keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0257 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 2);
      logInfo(`step1 onSizeChange(864, 2): step1=${step1}`);
      expect(step1).assertEqual('864 x 2');
      const step2: string = subject.onSizeChange(0, 768);
      logInfo(`step2 onSizeChange(0, 768): step2=${step2}`);
      expect(step2).assertEqual('0 x 768');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.select(110);
      logInfo(`step5 select(110): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(110);
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`onSizeChange>onSizeChange>apply>apply>sel...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0258
     * @tc.name      WindowRatio_RatioPageStateFlow_0258
     * @tc.desc      RatioPageState call flow apply > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0258 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(135);
      logInfo(`step3 select(135): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1, 480);
      logInfo(`step4 onSizeChange(1, 480): step4=${step4}`);
      expect(step4).assertEqual('1 x 480');
      logInfo(`apply>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(135);
      logInfo(`apply>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`apply>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0259
     * @tc.name      WindowRatio_RatioPageStateFlow_0259
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0259 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(1);
      logInfo(`step1 select(1): step1=${step1}`);
      expect(step1).assertEqual('1:1');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(1);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertEqual(1);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('1:1');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0260
     * @tc.name      WindowRatio_RatioPageStateFlow_0260
     * @tc.desc      RatioPageState call flow select > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0260 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(19);
      logInfo(`step1 select(19): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(24);
      logInfo(`step2 select(24): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(176);
      logInfo(`step3 select(176): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(176);
      logInfo(`select>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0261
     * @tc.name      WindowRatio_RatioPageStateFlow_0261
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0261 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1632, 1152);
      logInfo(`step1 onSizeChange(1632, 1152): step1=${step1}`);
      expect(step1).assertEqual('1632 x 1152');
      const step2: string = subject.select(172);
      logInfo(`step2 select(172): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(48.44);
      logInfo(`step3 select(48.44): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1, 480);
      logInfo(`step4 onSizeChange(1, 480): step4=${step4}`);
      expect(step4).assertEqual('1 x 480');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(48.44, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0262
     * @tc.name      WindowRatio_RatioPageStateFlow_0262
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0262 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(50);
      logInfo(`step1 select(50): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(192, 96);
      logInfo(`step3 onSizeChange(192, 96): step3=${step3}`);
      expect(step3).assertEqual('192 x 96');
      const step4: string = subject.select(175);
      logInfo(`step4 select(175): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(175);
      logInfo(`select>apply>onSizeChange>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`select>apply>onSizeChange>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`select>apply>onSizeChange>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0263
     * @tc.name      WindowRatio_RatioPageStateFlow_0263
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > select > select keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0263 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(768, 960);
      logInfo(`step1 onSizeChange(768, 960): step1=${step1}`);
      expect(step1).assertEqual('768 x 960');
      const step2: string = subject.onSizeChange(672, 0);
      logInfo(`step2 onSizeChange(672, 0): step2=${step2}`);
      expect(step2).assertEqual('672 x 0');
      const step3: string = subject.onSizeChange(0, 576);
      logInfo(`step3 onSizeChange(0, 576): step3=${step3}`);
      expect(step3).assertEqual('0 x 576');
      const step4: string = subject.select(112);
      logInfo(`step4 select(112): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.select(-23);
      logInfo(`step5 select(-23): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-23);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0264
     * @tc.name      WindowRatio_RatioPageStateFlow_0264
     * @tc.desc      RatioPageState call flow apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0264 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(182);
      logInfo(`step3 select(182): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(182);
      logInfo(`apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0265
     * @tc.name      WindowRatio_RatioPageStateFlow_0265
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0265 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1920, 1536);
      logInfo(`step1 onSizeChange(1920, 1536): step1=${step1}`);
      expect(step1).assertEqual('1920 x 1536');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-6);
      logInfo(`step3 select(-6): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0266
     * @tc.name      WindowRatio_RatioPageStateFlow_0266
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0266 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 720);
      logInfo(`step1 onSizeChange(864, 720): step1=${step1}`);
      expect(step1).assertEqual('864 x 720');
      const step2: string = subject.onSizeChange(0, 1920);
      logInfo(`step2 onSizeChange(0, 1920): step2=${step2}`);
      expect(step2).assertEqual('0 x 1920');
      const step3: string = subject.onSizeChange(192, 1344);
      logInfo(`step3 onSizeChange(192, 1344): step3=${step3}`);
      expect(step3).assertEqual('192 x 1344');
      logInfo(`onSizeChange>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`onSizeChange>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0267
     * @tc.name      WindowRatio_RatioPageStateFlow_0267
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0267 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(173);
      logInfo(`step1 select(173): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(128);
      logInfo(`step2 select(128): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(100, 1728);
      logInfo(`step3 onSizeChange(100, 1728): step3=${step3}`);
      expect(step3).assertEqual('100 x 1728');
      const step4: string = subject.select(112);
      logInfo(`step4 select(112): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(112);
      logInfo(`select>select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`select>select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0268
     * @tc.name      WindowRatio_RatioPageStateFlow_0268
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0268 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1440, 288);
      logInfo(`step1 onSizeChange(1440, 288): step1=${step1}`);
      expect(step1).assertEqual('1440 x 288');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-63);
      logInfo(`step3 select(-63): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-63);
      logInfo(`onSizeChange>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`onSizeChange>apply>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`onSizeChange>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0269
     * @tc.name      WindowRatio_RatioPageStateFlow_0269
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0269 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 768);
      logInfo(`step1 onSizeChange(0, 768): step1=${step1}`);
      expect(step1).assertEqual('0 x 768');
      const step2: string = subject.select(200);
      logInfo(`step2 select(200): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(34);
      logInfo(`step3 select(34): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(32.62);
      logInfo(`step4 select(32.62): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>select>apply f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(32.62, PRECISION);
      logInfo(`onSizeChange>select>select>select>apply f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>select>apply f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>select>apply f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>select>select>apply f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`onSizeChange>select>select>select>apply f...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0270
     * @tc.name      WindowRatio_RatioPageStateFlow_0270
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > onSizeChange > select keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0270 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(-1, 0);
      logInfo(`step1 onSizeChange(-1, 0): step1=${step1}`);
      expect(step1).assertEqual('-1 x 0');
      const step2: string = subject.onSizeChange(96, 768);
      logInfo(`step2 onSizeChange(96, 768): step2=${step2}`);
      expect(step2).assertEqual('96 x 768');
      const step3: string = subject.onSizeChange(0, 1920);
      logInfo(`step3 onSizeChange(0, 1920): step3=${step3}`);
      expect(step3).assertEqual('0 x 1920');
      const step4: string = subject.onSizeChange(864, 360);
      logInfo(`step4 onSizeChange(864, 360): step4=${step4}`);
      expect(step4).assertEqual('864 x 360');
      const step5: string = subject.select(169);
      logInfo(`step5 select(169): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(169);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0271
     * @tc.name      WindowRatio_RatioPageStateFlow_0271
     * @tc.desc      RatioPageState call flow apply > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0271 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(42);
      logInfo(`step2 select(42): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(130);
      logInfo(`step4 select(130): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(130);
      logInfo(`apply>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0272
     * @tc.name      WindowRatio_RatioPageStateFlow_0272
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0272 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1, 0);
      logInfo(`step2 onSizeChange(1, 0): step2=${step2}`);
      expect(step2).assertEqual('1 x 0');
      const step3: string = subject.select(-6);
      logInfo(`step3 select(-6): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0272 end`);
    });
  });
}
