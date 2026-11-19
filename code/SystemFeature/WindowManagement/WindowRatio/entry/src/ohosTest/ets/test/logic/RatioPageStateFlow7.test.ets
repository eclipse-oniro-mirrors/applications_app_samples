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

/** Logic checks for RatioPageState flow (42 cases). */
export default function ratioPageStateFlow7Test(): void {
  describe('RatioPageStateFlow7Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0273
     * @tc.name      WindowRatio_RatioPageStateFlow_0273
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0273 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(96, 0);
      logInfo(`step2 onSizeChange(96, 0): step2=${step2}`);
      expect(step2).assertEqual('96 x 0');
      const step3: string = subject.select(91);
      logInfo(`step3 select(91): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(91);
      logInfo(`apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0274
     * @tc.name      WindowRatio_RatioPageStateFlow_0274
     * @tc.desc      RatioPageState call flow apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0274 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-19);
      logInfo(`step3 select(-19): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-19);
      logInfo(`apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0275
     * @tc.name      WindowRatio_RatioPageStateFlow_0275
     * @tc.desc      RatioPageState call flow apply > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0275 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(98.51);
      logInfo(`step2 select(98.51): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(99);
      logInfo(`step3 select(99): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(99);
      logInfo(`apply>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0276
     * @tc.name      WindowRatio_RatioPageStateFlow_0276
     * @tc.desc      RatioPageState call flow onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0276 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1728, 0);
      logInfo(`step1 onSizeChange(1728, 0): step1=${step1}`);
      expect(step1).assertEqual('1728 x 0');
      const step2: string = subject.select(105);
      logInfo(`step2 select(105): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(105);
      logInfo(`onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1728');
      logInfo(`onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0277
     * @tc.name      WindowRatio_RatioPageStateFlow_0277
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0277 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(960, 2);
      logInfo(`step2 onSizeChange(960, 2): step2=${step2}`);
      expect(step2).assertEqual('960 x 2');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0278
     * @tc.name      WindowRatio_RatioPageStateFlow_0278
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0278 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1344, 96);
      logInfo(`step1 onSizeChange(1344, 96): step1=${step1}`);
      expect(step1).assertEqual('1344 x 96');
      const step2: string = subject.select(19);
      logInfo(`step2 select(19): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(19);
      logInfo(`onSizeChange>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1344');
      logInfo(`onSizeChange>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`onSizeChange>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0279
     * @tc.name      WindowRatio_RatioPageStateFlow_0279
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0279 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(87.89);
      logInfo(`step1 select(87.89): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(672, 672);
      logInfo(`step2 onSizeChange(672, 672): step2=${step2}`);
      expect(step2).assertEqual('672 x 672');
      const step3: string = subject.onSizeChange(288, 10);
      logInfo(`step3 onSizeChange(288, 10): step3=${step3}`);
      expect(step3).assertEqual('288 x 10');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(87.89, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('288');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0280
     * @tc.name      WindowRatio_RatioPageStateFlow_0280
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0280 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(96, 768);
      logInfo(`step2 onSizeChange(96, 768): step2=${step2}`);
      expect(step2).assertEqual('96 x 768');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0281
     * @tc.name      WindowRatio_RatioPageStateFlow_0281
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > select > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0281 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 10);
      logInfo(`step1 onSizeChange(864, 10): step1=${step1}`);
      expect(step1).assertEqual('864 x 10');
      const step2: string = subject.onSizeChange(192, 0);
      logInfo(`step2 onSizeChange(192, 0): step2=${step2}`);
      expect(step2).assertEqual('192 x 0');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(170);
      logInfo(`step4 select(170): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.select(-6);
      logInfo(`step5 select(-6): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('192');
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>onSizeChange>apply>select>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0282
     * @tc.name      WindowRatio_RatioPageStateFlow_0282
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0282 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(112);
      logInfo(`step1 select(112): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-54);
      logInfo(`step2 select(-54): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-54);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0283
     * @tc.name      WindowRatio_RatioPageStateFlow_0283
     * @tc.desc      RatioPageState call flow apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0283 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(17.23);
      logInfo(`step3 select(17.23): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(17.23, PRECISION);
      logInfo(`apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0284
     * @tc.name      WindowRatio_RatioPageStateFlow_0284
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > select > onSizeChange keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0284 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(1);
      logInfo(`step1 select(1): step1=${step1}`);
      expect(step1).assertEqual('1:1');
      const step2: string = subject.onSizeChange(96, 0);
      logInfo(`step2 onSizeChange(96, 0): step2=${step2}`);
      expect(step2).assertEqual('96 x 0');
      const step3: string = subject.onSizeChange(192, 1344);
      logInfo(`step3 onSizeChange(192, 1344): step3=${step3}`);
      expect(step3).assertEqual('192 x 1344');
      const step4: string = subject.select(56.11);
      logInfo(`step4 select(56.11): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 1248);
      logInfo(`step5 onSizeChange(0, 1248): step5=${step5}`);
      expect(step5).assertEqual('0 x 1248');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(56.11, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`${BUNDLE}RatioPageStateFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0285
     * @tc.name      WindowRatio_RatioPageStateFlow_0285
     * @tc.desc      RatioPageState call flow apply > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0285 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-6);
      logInfo(`step2 select(-6): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1920, 768);
      logInfo(`step3 onSizeChange(1920, 768): step3=${step3}`);
      expect(step3).assertEqual('1920 x 768');
      const step4: string = subject.select(80);
      logInfo(`step4 select(80): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(80);
      logInfo(`apply>select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`apply>select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`apply>select>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0286
     * @tc.name      WindowRatio_RatioPageStateFlow_0286
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > select > onSizeChange keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0286 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(864, 10);
      logInfo(`step2 onSizeChange(864, 10): step2=${step2}`);
      expect(step2).assertEqual('864 x 10');
      const step3: string = subject.select(197);
      logInfo(`step3 select(197): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(110);
      logInfo(`step4 select(110): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(960, 1824);
      logInfo(`step5 onSizeChange(960, 1824): step5=${step5}`);
      expect(step5).assertEqual('960 x 1824');
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(110);
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`apply>onSizeChange>select>select>onSizeCh...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0287
     * @tc.name      WindowRatio_RatioPageStateFlow_0287
     * @tc.desc      RatioPageState call flow select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0287 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(34);
      logInfo(`step1 select(34): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(85.78);
      logInfo(`step2 select(85.78): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(10, 1);
      logInfo(`step3 onSizeChange(10, 1): step3=${step3}`);
      expect(step3).assertEqual('10 x 1');
      logInfo(`select>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(85.78, PRECISION);
      logInfo(`select>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`select>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`${BUNDLE}RatioPageStateFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0288
     * @tc.name      WindowRatio_RatioPageStateFlow_0288
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0288 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(80);
      logInfo(`step1 select(80): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(192, -1);
      logInfo(`step2 onSizeChange(192, -1): step2=${step2}`);
      expect(step2).assertEqual('192 x -1');
      const step3: string = subject.onSizeChange(1632, 960);
      logInfo(`step3 onSizeChange(1632, 960): step3=${step3}`);
      expect(step3).assertEqual('1632 x 960');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(80);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0289
     * @tc.name      WindowRatio_RatioPageStateFlow_0289
     * @tc.desc      RatioPageState call flow select > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0289 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-39);
      logInfo(`step1 select(-39): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(4);
      logInfo(`step2 select(4): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(56.11);
      logInfo(`step3 select(56.11): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(864, 0);
      logInfo(`step4 onSizeChange(864, 0): step4=${step4}`);
      expect(step4).assertEqual('864 x 0');
      logInfo(`select>select>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(56.11, PRECISION);
      logInfo(`select>select>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>select>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0290
     * @tc.name      WindowRatio_RatioPageStateFlow_0290
     * @tc.desc      RatioPageState call flow apply > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0290 begin`);
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
      const step4: string = subject.select(42);
      logInfo(`step4 select(42): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(42);
      logInfo(`apply>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0291
     * @tc.name      WindowRatio_RatioPageStateFlow_0291
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0291 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(100, 96);
      logInfo(`step1 onSizeChange(100, 96): step1=${step1}`);
      expect(step1).assertEqual('100 x 96');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-4);
      logInfo(`step3 select(-4): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-4);
      logInfo(`onSizeChange>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange>apply>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`onSizeChange>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0292
     * @tc.name      WindowRatio_RatioPageStateFlow_0292
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0292 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(171);
      logInfo(`step1 select(171): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(48.44);
      logInfo(`step2 select(48.44): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(48.44, PRECISION);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0293
     * @tc.name      WindowRatio_RatioPageStateFlow_0293
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0293 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 1440);
      logInfo(`step2 onSizeChange(0, 1440): step2=${step2}`);
      expect(step2).assertEqual('0 x 1440');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0294
     * @tc.name      WindowRatio_RatioPageStateFlow_0294
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0294 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(128);
      logInfo(`step1 select(128): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(96, 768);
      logInfo(`step2 onSizeChange(96, 768): step2=${step2}`);
      expect(step2).assertEqual('96 x 768');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(128);
      logInfo(`select>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`select>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('768');
      logInfo(`select>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0295
     * @tc.name      WindowRatio_RatioPageStateFlow_0295
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0295 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(768, 960);
      logInfo(`step1 onSizeChange(768, 960): step1=${step1}`);
      expect(step1).assertEqual('768 x 960');
      const step2: string = subject.select(77.16);
      logInfo(`step2 select(77.16): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(147);
      logInfo(`step3 select(147): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(360, 2);
      logInfo(`step4 onSizeChange(360, 2): step4=${step4}`);
      expect(step4).assertEqual('360 x 2');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(147);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0296
     * @tc.name      WindowRatio_RatioPageStateFlow_0296
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > select > onSizeChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0296 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1632, 960);
      logInfo(`step1 onSizeChange(1632, 960): step1=${step1}`);
      expect(step1).assertEqual('1632 x 960');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(960, 768);
      logInfo(`step3 onSizeChange(960, 768): step3=${step3}`);
      expect(step3).assertEqual('960 x 768');
      const step4: string = subject.select(-91);
      logInfo(`step4 select(-91): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 1536);
      logInfo(`step5 onSizeChange(0, 1536): step5=${step5}`);
      expect(step5).assertEqual('0 x 1536');
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-91);
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`onSizeChange>apply>onSizeChange>select>on...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0297
     * @tc.name      WindowRatio_RatioPageStateFlow_0297
     * @tc.desc      RatioPageState call flow select > apply > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0297 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(48.44);
      logInfo(`step1 select(48.44): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(19);
      logInfo(`step3 select(19): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(85.78);
      logInfo(`step4 select(85.78): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 864);
      logInfo(`step5 onSizeChange(0, 864): step5=${step5}`);
      expect(step5).assertEqual('0 x 864');
      logInfo(`select>apply>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(85.78, PRECISION);
      logInfo(`select>apply>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>apply>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`select>apply>select>select>onSizeChange f...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0298
     * @tc.name      WindowRatio_RatioPageStateFlow_0298
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0298 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(480, -1);
      logInfo(`step1 onSizeChange(480, -1): step1=${step1}`);
      expect(step1).assertEqual('480 x -1');
      const step2: string = subject.select(-91);
      logInfo(`step2 select(-91): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(100, 0);
      logInfo(`step4 onSizeChange(100, 0): step4=${step4}`);
      expect(step4).assertEqual('100 x 0');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-91);
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0299
     * @tc.name      WindowRatio_RatioPageStateFlow_0299
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0299 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1536, 1728);
      logInfo(`step2 onSizeChange(1536, 1728): step2=${step2}`);
      expect(step2).assertEqual('1536 x 1728');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0300
     * @tc.name      WindowRatio_RatioPageStateFlow_0300
     * @tc.desc      RatioPageState call flow apply > select > apply > onSizeChange > onSizeChange keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0300 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(140);
      logInfo(`step2 select(140): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(2, 3);
      logInfo(`step4 onSizeChange(2, 3): step4=${step4}`);
      expect(step4).assertEqual('2 x 3');
      const step5: string = subject.onSizeChange(360, 480);
      logInfo(`step5 onSizeChange(360, 480): step5=${step5}`);
      expect(step5).assertEqual('360 x 480');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(140);
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`apply>select>apply>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0301
     * @tc.name      WindowRatio_RatioPageStateFlow_0301
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0301 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(2, 720);
      logInfo(`step1 onSizeChange(2, 720): step1=${step1}`);
      expect(step1).assertEqual('2 x 720');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(42);
      logInfo(`step3 select(42): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1080, 0);
      logInfo(`step4 onSizeChange(1080, 0): step4=${step4}`);
      expect(step4).assertEqual('1080 x 0');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(42);
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>select>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0302
     * @tc.name      WindowRatio_RatioPageStateFlow_0302
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0302 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(576, 360);
      logInfo(`step1 onSizeChange(576, 360): step1=${step1}`);
      expect(step1).assertEqual('576 x 360');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('360');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0303
     * @tc.name      WindowRatio_RatioPageStateFlow_0303
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0303 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(576, 1728);
      logInfo(`step2 onSizeChange(576, 1728): step2=${step2}`);
      expect(step2).assertEqual('576 x 1728');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0304
     * @tc.name      WindowRatio_RatioPageStateFlow_0304
     * @tc.desc      RatioPageState call flow select > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0304 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-64);
      logInfo(`step1 select(-64): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-48);
      logInfo(`step2 select(-48): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(-6);
      logInfo(`step3 select(-6): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`select>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0305
     * @tc.name      WindowRatio_RatioPageStateFlow_0305
     * @tc.desc      RatioPageState call flow onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0305 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 10);
      logInfo(`step1 onSizeChange(0, 10): step1=${step1}`);
      expect(step1).assertEqual('0 x 10');
      const step2: string = subject.select(3);
      logInfo(`step2 select(3): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(3);
      logInfo(`onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0306
     * @tc.name      WindowRatio_RatioPageStateFlow_0306
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0306 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 672);
      logInfo(`step1 onSizeChange(0, 672): step1=${step1}`);
      expect(step1).assertEqual('0 x 672');
      const step2: string = subject.onSizeChange(1440, 3);
      logInfo(`step2 onSizeChange(1440, 3): step2=${step2}`);
      expect(step2).assertEqual('1440 x 3');
      const step3: string = subject.onSizeChange(720, 1344);
      logInfo(`step3 onSizeChange(720, 1344): step3=${step3}`);
      expect(step3).assertEqual('720 x 1344');
      const step4: string = subject.select(144);
      logInfo(`step4 select(144): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(144);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0307
     * @tc.name      WindowRatio_RatioPageStateFlow_0307
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0307 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(10, 1248);
      logInfo(`step2 onSizeChange(10, 1248): step2=${step2}`);
      expect(step2).assertEqual('10 x 1248');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0308
     * @tc.name      WindowRatio_RatioPageStateFlow_0308
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange > onSizeChange keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0308 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(192, 0);
      logInfo(`step1 onSizeChange(192, 0): step1=${step1}`);
      expect(step1).assertEqual('192 x 0');
      const step2: string = subject.select(-6);
      logInfo(`step2 select(-6): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(85);
      logInfo(`step3 select(85): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(576, 360);
      logInfo(`step4 onSizeChange(576, 360): step4=${step4}`);
      expect(step4).assertEqual('576 x 360');
      const step5: string = subject.onSizeChange(720, 0);
      logInfo(`step5 onSizeChange(720, 0): step5=${step5}`);
      expect(step5).assertEqual('720 x 0');
      logInfo(`onSizeChange>select>select>onSizeChange>o...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(85);
      logInfo(`onSizeChange>select>select>onSizeChange>o...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange>o...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange>o...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>select>onSizeChange>o...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0309
     * @tc.name      WindowRatio_RatioPageStateFlow_0309
     * @tc.desc      RatioPageState call flow apply > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0309 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-23);
      logInfo(`step2 select(-23): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(77.16);
      logInfo(`step3 select(77.16): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(77.16, PRECISION);
      logInfo(`apply>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0310
     * @tc.name      WindowRatio_RatioPageStateFlow_0310
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0310 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(87.89);
      logInfo(`step1 select(87.89): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(1440, 0);
      logInfo(`step3 onSizeChange(1440, 0): step3=${step3}`);
      expect(step3).assertEqual('1440 x 0');
      logInfo(`select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(87.89, PRECISION);
      logInfo(`select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0311
     * @tc.name      WindowRatio_RatioPageStateFlow_0311
     * @tc.desc      RatioPageState call flow onSizeChange > select > apply > onSizeChange > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0311 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 480);
      logInfo(`step1 onSizeChange(864, 480): step1=${step1}`);
      expect(step1).assertEqual('864 x 480');
      const step2: string = subject.select(65);
      logInfo(`step2 select(65): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(0, 1080);
      logInfo(`step4 onSizeChange(0, 1080): step4=${step4}`);
      expect(step4).assertEqual('0 x 1080');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(65);
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1080');
      logInfo(`onSizeChange>select>apply>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0312
     * @tc.name      WindowRatio_RatioPageStateFlow_0312
     * @tc.desc      RatioPageState call flow onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0312 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(720, 0);
      logInfo(`step1 onSizeChange(720, 0): step1=${step1}`);
      expect(step1).assertEqual('720 x 0');
      const step2: string = subject.select(16.18);
      logInfo(`step2 select(16.18): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(35.98);
      logInfo(`step3 select(35.98): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0313
     * @tc.name      WindowRatio_RatioPageStateFlow_0313
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0313 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(39);
      logInfo(`step1 select(39): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(360, 2);
      logInfo(`step2 onSizeChange(360, 2): step2=${step2}`);
      expect(step2).assertEqual('360 x 2');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0314
     * @tc.name      WindowRatio_RatioPageStateFlow_0314
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0314 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-6);
      logInfo(`step1 select(-6): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(14);
      logInfo(`step2 select(14): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(720, 720);
      logInfo(`step3 onSizeChange(720, 720): step3=${step3}`);
      expect(step3).assertEqual('720 x 720');
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
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`select>select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`${BUNDLE}RatioPageStateFlow_0314 end`);
    });
  });
}
