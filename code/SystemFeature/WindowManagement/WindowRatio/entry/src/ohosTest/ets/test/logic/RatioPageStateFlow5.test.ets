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

/** Logic checks for RatioPageState flow (45 cases). */
export default function ratioPageStateFlow5Test(): void {
  describe('RatioPageStateFlow5Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0182
     * @tc.name      WindowRatio_RatioPageStateFlow_0182
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0182 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1080, 2);
      logInfo(`step1 onSizeChange(1080, 2): step1=${step1}`);
      expect(step1).assertEqual('1080 x 2');
      const step2: string = subject.select(2);
      logInfo(`step2 select(2): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 3);
      logInfo(`step3 onSizeChange(0, 3): step3=${step3}`);
      expect(step3).assertEqual('0 x 3');
      const step4: string = subject.onSizeChange(720, 1344);
      logInfo(`step4 onSizeChange(720, 1344): step4=${step4}`);
      expect(step4).assertEqual('720 x 1344');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(2);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>onSizeChange>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0183
     * @tc.name      WindowRatio_RatioPageStateFlow_0183
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > onSizeChange > apply keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0183 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 100);
      logInfo(`step1 onSizeChange(0, 100): step1=${step1}`);
      expect(step1).assertEqual('0 x 100');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(720, 360);
      logInfo(`step3 onSizeChange(720, 360): step3=${step3}`);
      expect(step3).assertEqual('720 x 360');
      const step4: string = subject.onSizeChange(192, 0);
      logInfo(`step4 onSizeChange(192, 0): step4=${step4}`);
      expect(step4).assertEqual('192 x 0');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0184
     * @tc.name      WindowRatio_RatioPageStateFlow_0184
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0184 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(2, 1632);
      logInfo(`step1 onSizeChange(2, 1632): step1=${step1}`);
      expect(step1).assertEqual('2 x 1632');
      const step2: string = subject.select(78);
      logInfo(`step2 select(78): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(-37);
      logInfo(`step3 select(-37): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-37);
      logInfo(`onSizeChange>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('2');
      logInfo(`onSizeChange>select>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`onSizeChange>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0185
     * @tc.name      WindowRatio_RatioPageStateFlow_0185
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > select > onSizeChange keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0185 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 384);
      logInfo(`step2 onSizeChange(0, 384): step2=${step2}`);
      expect(step2).assertEqual('0 x 384');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(48.44);
      logInfo(`step4 select(48.44): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(10, 1920);
      logInfo(`step5 onSizeChange(10, 1920): step5=${step5}`);
      expect(step5).assertEqual('10 x 1920');
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(48.44, PRECISION);
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`apply>onSizeChange>apply>select>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0186
     * @tc.name      WindowRatio_RatioPageStateFlow_0186
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > select > select keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0186 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1152, 0);
      logInfo(`step1 onSizeChange(1152, 0): step1=${step1}`);
      expect(step1).assertEqual('1152 x 0');
      const step2: string = subject.onSizeChange(10, 1920);
      logInfo(`step2 onSizeChange(10, 1920): step2=${step2}`);
      expect(step2).assertEqual('10 x 1920');
      const step3: string = subject.select(35.98);
      logInfo(`step3 select(35.98): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(40);
      logInfo(`step4 select(40): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.select(42);
      logInfo(`step5 select(42): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>select>s...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(42);
      logInfo(`onSizeChange>onSizeChange>select>select>s...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>select>s...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>select>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange>onSizeChange>select>select>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0187
     * @tc.name      WindowRatio_RatioPageStateFlow_0187
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0187 begin`);
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
      const step4: string = subject.onSizeChange(0, 1080);
      logInfo(`step4 onSizeChange(0, 1080): step4=${step4}`);
      expect(step4).assertEqual('0 x 1080');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply>onSizeChange>app...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>onSizeChange>apply>onSizeChange>app...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`apply>onSizeChange>apply>onSizeChange>app...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0188
     * @tc.name      WindowRatio_RatioPageStateFlow_0188
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0188 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(85.78, PRECISION);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0189
     * @tc.name      WindowRatio_RatioPageStateFlow_0189
     * @tc.desc      RatioPageState call flow apply > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0189 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(165);
      logInfo(`step3 select(165): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(0, 960);
      logInfo(`step4 onSizeChange(0, 960): step4=${step4}`);
      expect(step4).assertEqual('0 x 960');
      logInfo(`apply>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(165);
      logInfo(`apply>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`apply>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0190
     * @tc.name      WindowRatio_RatioPageStateFlow_0190
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0190 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 480);
      logInfo(`step1 onSizeChange(960, 480): step1=${step1}`);
      expect(step1).assertEqual('960 x 480');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(720, 720);
      logInfo(`step3 onSizeChange(720, 720): step3=${step3}`);
      expect(step3).assertEqual('720 x 720');
      const step4: string = subject.onSizeChange(1344, 96);
      logInfo(`step4 onSizeChange(1344, 96): step4=${step4}`);
      expect(step4).assertEqual('1344 x 96');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1344');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0191
     * @tc.name      WindowRatio_RatioPageStateFlow_0191
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0191 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(125);
      logInfo(`step1 select(125): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(45);
      logInfo(`step2 select(45): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(45);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0192
     * @tc.name      WindowRatio_RatioPageStateFlow_0192
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0192 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(-1, 768);
      logInfo(`step1 onSizeChange(-1, 768): step1=${step1}`);
      expect(step1).assertEqual('-1 x 768');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(960, 1344);
      logInfo(`step3 onSizeChange(960, 1344): step3=${step3}`);
      expect(step3).assertEqual('960 x 1344');
      const step4: string = subject.select(115);
      logInfo(`step4 select(115): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(115);
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`onSizeChange>apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0193
     * @tc.name      WindowRatio_RatioPageStateFlow_0193
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0193 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(1);
      logInfo(`step1 select(1): step1=${step1}`);
      expect(step1).assertEqual('1:1');
      const step2: string = subject.onSizeChange(1080, 0);
      logInfo(`step2 onSizeChange(1080, 0): step2=${step2}`);
      expect(step2).assertEqual('1080 x 0');
      const step3: string = subject.onSizeChange(0, 960);
      logInfo(`step3 onSizeChange(0, 960): step3=${step3}`);
      expect(step3).assertEqual('0 x 960');
      const step4: string = subject.onSizeChange(-1, 1632);
      logInfo(`step4 onSizeChange(-1, 1632): step4=${step4}`);
      expect(step4).assertEqual('-1 x 1632');
      logInfo(`select>onSizeChange>onSizeChange>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(1);
      logInfo(`select>onSizeChange>onSizeChange>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertEqual(1);
      logInfo(`select>onSizeChange>onSizeChange>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('1:1');
      logInfo(`select>onSizeChange>onSizeChange>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('-1');
      logInfo(`select>onSizeChange>onSizeChange>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0194
     * @tc.name      WindowRatio_RatioPageStateFlow_0194
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0194 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(288, 0);
      logInfo(`step2 onSizeChange(288, 0): step2=${step2}`);
      expect(step2).assertEqual('288 x 0');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('288');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0195
     * @tc.name      WindowRatio_RatioPageStateFlow_0195
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0195 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 2);
      logInfo(`step1 onSizeChange(0, 2): step1=${step1}`);
      expect(step1).assertEqual('0 x 2');
      const step2: string = subject.select(147);
      logInfo(`step2 select(147): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(27);
      logInfo(`step3 select(27): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(27);
      logInfo(`onSizeChange>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`onSizeChange>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0196
     * @tc.name      WindowRatio_RatioPageStateFlow_0196
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0196 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1, 96);
      logInfo(`step1 onSizeChange(1, 96): step1=${step1}`);
      expect(step1).assertEqual('1 x 96');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(16.18);
      logInfo(`step3 select(16.18): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(35.98);
      logInfo(`step4 select(35.98): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`onSizeChange>apply>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0197
     * @tc.name      WindowRatio_RatioPageStateFlow_0197
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0197 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1, 672);
      logInfo(`step1 onSizeChange(1, 672): step1=${step1}`);
      expect(step1).assertEqual('1 x 672');
      const step2: string = subject.onSizeChange(480, 96);
      logInfo(`step2 onSizeChange(480, 96): step2=${step2}`);
      expect(step2).assertEqual('480 x 96');
      const step3: string = subject.select(27);
      logInfo(`step3 select(27): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(480, -1);
      logInfo(`step4 onSizeChange(480, -1): step4=${step4}`);
      expect(step4).assertEqual('480 x -1');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(27);
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`onSizeChange>onSizeChange>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`${BUNDLE}RatioPageStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0198
     * @tc.name      WindowRatio_RatioPageStateFlow_0198
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0198 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(1632, 1632);
      logInfo(`step3 onSizeChange(1632, 1632): step3=${step3}`);
      expect(step3).assertEqual('1632 x 1632');
      logInfo(`apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0199
     * @tc.name      WindowRatio_RatioPageStateFlow_0199
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0199 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(720, 672);
      logInfo(`step1 onSizeChange(720, 672): step1=${step1}`);
      expect(step1).assertEqual('720 x 672');
      const step2: string = subject.onSizeChange(1056, 0);
      logInfo(`step2 onSizeChange(1056, 0): step2=${step2}`);
      expect(step2).assertEqual('1056 x 0');
      logInfo(`onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1056');
      logInfo(`onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0200
     * @tc.name      WindowRatio_RatioPageStateFlow_0200
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0200 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(2);
      logInfo(`step1 select(2): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(39);
      logInfo(`step2 select(39): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0201
     * @tc.name      WindowRatio_RatioPageStateFlow_0201
     * @tc.desc      RatioPageState call flow select > apply > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0201 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(65.28);
      logInfo(`step1 select(65.28): step1=${step1}`);
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
      expect(subject.numbers).assertClose(65.28, PRECISION);
      logInfo(`select>apply>apply>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0202
     * @tc.name      WindowRatio_RatioPageStateFlow_0202
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0202 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 768);
      logInfo(`step1 onSizeChange(0, 768): step1=${step1}`);
      expect(step1).assertEqual('0 x 768');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(288, 0);
      logInfo(`step3 onSizeChange(288, 0): step3=${step3}`);
      expect(step3).assertEqual('288 x 0');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('288');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0203
     * @tc.name      WindowRatio_RatioPageStateFlow_0203
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0203 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-91);
      logInfo(`step1 select(-91): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(864, 360);
      logInfo(`step2 onSizeChange(864, 360): step2=${step2}`);
      expect(step2).assertEqual('864 x 360');
      const step3: string = subject.select(79);
      logInfo(`step3 select(79): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(2);
      logInfo(`step4 select(2): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(2);
      logInfo(`select>onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0204
     * @tc.name      WindowRatio_RatioPageStateFlow_0204
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0204 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-52);
      logInfo(`step1 select(-52): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-52);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0205
     * @tc.name      WindowRatio_RatioPageStateFlow_0205
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0205 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-39);
      logInfo(`step1 select(-39): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(864, 2);
      logInfo(`step2 onSizeChange(864, 2): step2=${step2}`);
      expect(step2).assertEqual('864 x 2');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-39);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0206
     * @tc.name      WindowRatio_RatioPageStateFlow_0206
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0206 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1440, 3);
      logInfo(`step2 onSizeChange(1440, 3): step2=${step2}`);
      expect(step2).assertEqual('1440 x 3');
      const step3: string = subject.select(65.16);
      logInfo(`step3 select(65.16): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(20);
      logInfo(`step4 select(20): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(20);
      logInfo(`apply>onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`apply>onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`apply>onSizeChange>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0207
     * @tc.name      WindowRatio_RatioPageStateFlow_0207
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0207 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(130);
      logInfo(`step2 select(130): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(130);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0208
     * @tc.name      WindowRatio_RatioPageStateFlow_0208
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > select > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0208 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(768, 0);
      logInfo(`step1 onSizeChange(768, 0): step1=${step1}`);
      expect(step1).assertEqual('768 x 0');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(1632, 960);
      logInfo(`step3 onSizeChange(1632, 960): step3=${step3}`);
      expect(step3).assertEqual('1632 x 960');
      const step4: string = subject.select(-63);
      logInfo(`step4 select(-63): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-63);
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`onSizeChange>apply>onSizeChange>select>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0209
     * @tc.name      WindowRatio_RatioPageStateFlow_0209
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0209 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 960);
      logInfo(`step1 onSizeChange(0, 960): step1=${step1}`);
      expect(step1).assertEqual('0 x 960');
      const step2: string = subject.onSizeChange(720, 672);
      logInfo(`step2 onSizeChange(720, 672): step2=${step2}`);
      expect(step2).assertEqual('720 x 672');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`onSizeChange>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0210
     * @tc.name      WindowRatio_RatioPageStateFlow_0210
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0210 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1536, 0);
      logInfo(`step1 onSizeChange(1536, 0): step1=${step1}`);
      expect(step1).assertEqual('1536 x 0');
      const step2: string = subject.select(62);
      logInfo(`step2 select(62): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(576, 360);
      logInfo(`step4 onSizeChange(576, 360): step4=${step4}`);
      expect(step4).assertEqual('576 x 360');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(62);
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0211
     * @tc.name      WindowRatio_RatioPageStateFlow_0211
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0211 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(125);
      logInfo(`step1 select(125): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(576, 1728);
      logInfo(`step2 onSizeChange(576, 1728): step2=${step2}`);
      expect(step2).assertEqual('576 x 1728');
      const step3: string = subject.onSizeChange(768, 0);
      logInfo(`step3 onSizeChange(768, 0): step3=${step3}`);
      expect(step3).assertEqual('768 x 0');
      logInfo(`select>onSizeChange>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(125);
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('768');
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0212
     * @tc.name      WindowRatio_RatioPageStateFlow_0212
     * @tc.desc      RatioPageState call flow select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0212 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-37);
      logInfo(`step1 select(-37): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(3);
      logInfo(`step2 select(3): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(25);
      logInfo(`step3 select(25): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(25);
      logInfo(`select>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0213
     * @tc.name      WindowRatio_RatioPageStateFlow_0213
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0213 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(0, -1);
      logInfo(`step3 onSizeChange(0, -1): step3=${step3}`);
      expect(step3).assertEqual('0 x -1');
      logInfo(`apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('-1');
      logInfo(`apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0214
     * @tc.name      WindowRatio_RatioPageStateFlow_0214
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > apply > onSizeChange keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0214 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(96, 0);
      logInfo(`step1 onSizeChange(96, 0): step1=${step1}`);
      expect(step1).assertEqual('96 x 0');
      const step2: string = subject.onSizeChange(192, 0);
      logInfo(`step2 onSizeChange(192, 0): step2=${step2}`);
      expect(step2).assertEqual('192 x 0');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.onSizeChange(1056, 0);
      logInfo(`step5 onSizeChange(1056, 0): step5=${step5}`);
      expect(step5).assertEqual('1056 x 0');
      logInfo(`onSizeChange>onSizeChange>apply>apply>onS...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1056');
      logInfo(`onSizeChange>onSizeChange>apply>apply>onS...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange>apply>apply>onS...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0215
     * @tc.name      WindowRatio_RatioPageStateFlow_0215
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > onSizeChange > select keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0215 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(576, 1536);
      logInfo(`step1 onSizeChange(576, 1536): step1=${step1}`);
      expect(step1).assertEqual('576 x 1536');
      const step2: string = subject.onSizeChange(1248, 192);
      logInfo(`step2 onSizeChange(1248, 192): step2=${step2}`);
      expect(step2).assertEqual('1248 x 192');
      const step3: string = subject.onSizeChange(1344, 0);
      logInfo(`step3 onSizeChange(1344, 0): step3=${step3}`);
      expect(step3).assertEqual('1344 x 0');
      const step4: string = subject.onSizeChange(1440, 360);
      logInfo(`step4 onSizeChange(1440, 360): step4=${step4}`);
      expect(step4).assertEqual('1440 x 360');
      const step5: string = subject.select(65);
      logInfo(`step5 select(65): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(65);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`${BUNDLE}RatioPageStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0216
     * @tc.name      WindowRatio_RatioPageStateFlow_0216
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0216 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1920, 480);
      logInfo(`step1 onSizeChange(1920, 480): step1=${step1}`);
      expect(step1).assertEqual('1920 x 480');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(60.46);
      logInfo(`step4 select(60.46): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(60.46, PRECISION);
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`onSizeChange>apply>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0217
     * @tc.name      WindowRatio_RatioPageStateFlow_0217
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0217 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 384);
      logInfo(`step1 onSizeChange(0, 384): step1=${step1}`);
      expect(step1).assertEqual('0 x 384');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(480, 1344);
      logInfo(`step3 onSizeChange(480, 1344): step3=${step3}`);
      expect(step3).assertEqual('480 x 1344');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0218
     * @tc.name      WindowRatio_RatioPageStateFlow_0218
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange > onSizeChange > select keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0218 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(2, 720);
      logInfo(`step3 onSizeChange(2, 720): step3=${step3}`);
      expect(step3).assertEqual('2 x 720');
      const step4: string = subject.onSizeChange(1920, 0);
      logInfo(`step4 onSizeChange(1920, 0): step4=${step4}`);
      expect(step4).assertEqual('1920 x 0');
      const step5: string = subject.select(-91);
      logInfo(`step5 select(-91): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-91);
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>apply>onSizeChange>onSizeChange>sel...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0219
     * @tc.name      WindowRatio_RatioPageStateFlow_0219
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0219 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1080, 100);
      logInfo(`step2 onSizeChange(1080, 100): step2=${step2}`);
      expect(step2).assertEqual('1080 x 100');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0220
     * @tc.name      WindowRatio_RatioPageStateFlow_0220
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0220 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-37);
      logInfo(`step2 select(-37): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-37);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0221
     * @tc.name      WindowRatio_RatioPageStateFlow_0221
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0221 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(96, 1248);
      logInfo(`step2 onSizeChange(96, 1248): step2=${step2}`);
      expect(step2).assertEqual('96 x 1248');
      const step3: string = subject.select(-54);
      logInfo(`step3 select(-54): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1, 672);
      logInfo(`step4 onSizeChange(1, 672): step4=${step4}`);
      expect(step4).assertEqual('1 x 672');
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-54);
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`apply>onSizeChange>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0222
     * @tc.name      WindowRatio_RatioPageStateFlow_0222
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > select > onSizeChange keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0222 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(27);
      logInfo(`step1 select(27): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 672);
      logInfo(`step2 onSizeChange(0, 672): step2=${step2}`);
      expect(step2).assertEqual('0 x 672');
      const step3: string = subject.onSizeChange(96, 0);
      logInfo(`step3 onSizeChange(96, 0): step3=${step3}`);
      expect(step3).assertEqual('96 x 0');
      const step4: string = subject.select(4);
      logInfo(`step4 select(4): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 1536);
      logInfo(`step5 onSizeChange(0, 1536): step5=${step5}`);
      expect(step5).assertEqual('0 x 1536');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(4);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`${BUNDLE}RatioPageStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0223
     * @tc.name      WindowRatio_RatioPageStateFlow_0223
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0223 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(960, 1344);
      logInfo(`step1 onSizeChange(960, 1344): step1=${step1}`);
      expect(step1).assertEqual('960 x 1344');
      const step2: string = subject.select(15);
      logInfo(`step2 select(15): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(720, 1920);
      logInfo(`step3 onSizeChange(720, 1920): step3=${step3}`);
      expect(step3).assertEqual('720 x 1920');
      const step4: string = subject.select(193);
      logInfo(`step4 select(193): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(193);
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`${BUNDLE}RatioPageStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0224
     * @tc.name      WindowRatio_RatioPageStateFlow_0224
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0224 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(3, 480);
      logInfo(`step3 onSizeChange(3, 480): step3=${step3}`);
      expect(step3).assertEqual('3 x 480');
      logInfo(`apply>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`apply>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`apply>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0225
     * @tc.name      WindowRatio_RatioPageStateFlow_0225
     * @tc.desc      RatioPageState call flow apply > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0225 begin`);
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
      const step4: string = subject.select(106);
      logInfo(`step4 select(106): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(106);
      logInfo(`apply>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0226
     * @tc.name      WindowRatio_RatioPageStateFlow_0226
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0226 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(96, 1248);
      logInfo(`step1 onSizeChange(96, 1248): step1=${step1}`);
      expect(step1).assertEqual('96 x 1248');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(0, 1152);
      logInfo(`step3 onSizeChange(0, 1152): step3=${step3}`);
      expect(step3).assertEqual('0 x 1152');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`onSizeChange>apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0226 end`);
    });
  });
}
