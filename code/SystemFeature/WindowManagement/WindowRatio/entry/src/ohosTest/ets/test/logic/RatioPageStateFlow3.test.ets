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

/** Logic checks for RatioPageState flow (44 cases). */
export default function ratioPageStateFlow3Test(): void {
  describe('RatioPageStateFlow3Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0093
     * @tc.name      WindowRatio_RatioPageStateFlow_0093
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0093 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(27);
      logInfo(`step1 select(27): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 864);
      logInfo(`step2 onSizeChange(0, 864): step2=${step2}`);
      expect(step2).assertEqual('0 x 864');
      const step3: string = subject.select(50);
      logInfo(`step3 select(50): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(-17);
      logInfo(`step4 select(-17): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-17);
      logInfo(`select>onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0094
     * @tc.name      WindowRatio_RatioPageStateFlow_0094
     * @tc.desc      RatioPageState call flow select > apply > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0094 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(125);
      logInfo(`step1 select(125): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(160);
      logInfo(`step3 select(160): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(157);
      logInfo(`step4 select(157): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(157);
      logInfo(`select>apply>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0095
     * @tc.name      WindowRatio_RatioPageStateFlow_0095
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0095 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(10, 0);
      logInfo(`step1 onSizeChange(10, 0): step1=${step1}`);
      expect(step1).assertEqual('10 x 0');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0096
     * @tc.name      WindowRatio_RatioPageStateFlow_0096
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0096 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(192, 1056);
      logInfo(`step1 onSizeChange(192, 1056): step1=${step1}`);
      expect(step1).assertEqual('192 x 1056');
      const step2: string = subject.onSizeChange(1152, 0);
      logInfo(`step2 onSizeChange(1152, 0): step2=${step2}`);
      expect(step2).assertEqual('1152 x 0');
      const step3: string = subject.select(42);
      logInfo(`step3 select(42): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(173);
      logInfo(`step4 select(173): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>select f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(173);
      logInfo(`onSizeChange>onSizeChange>select>select f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>select>select f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>select>select f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1152');
      logInfo(`onSizeChange>onSizeChange>select>select f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0097
     * @tc.name      WindowRatio_RatioPageStateFlow_0097
     * @tc.desc      RatioPageState call flow apply > select > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0097 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(144);
      logInfo(`step2 select(144): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(144);
      logInfo(`apply>select>apply>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0098
     * @tc.name      WindowRatio_RatioPageStateFlow_0098
     * @tc.desc      RatioPageState call flow select > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0098 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(172);
      logInfo(`step1 select(172): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(135);
      logInfo(`step4 select(135): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(135);
      logInfo(`select>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0099
     * @tc.name      WindowRatio_RatioPageStateFlow_0099
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0099 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1824, 1344);
      logInfo(`step1 onSizeChange(1824, 1344): step1=${step1}`);
      expect(step1).assertEqual('1824 x 1344');
      const step2: string = subject.select(172);
      logInfo(`step2 select(172): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1920, 10);
      logInfo(`step3 onSizeChange(1920, 10): step3=${step3}`);
      expect(step3).assertEqual('1920 x 10');
      const step4: string = subject.select(42);
      logInfo(`step4 select(42): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(42);
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>select>onSizeChange>select f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0100
     * @tc.name      WindowRatio_RatioPageStateFlow_0100
     * @tc.desc      RatioPageState call flow apply > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0100 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-86);
      logInfo(`step2 select(-86): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(123);
      logInfo(`step3 select(123): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(123);
      logInfo(`apply>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0101
     * @tc.name      WindowRatio_RatioPageStateFlow_0101
     * @tc.desc      RatioPageState call flow select > apply > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0101 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(165);
      logInfo(`step1 select(165): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(172);
      logInfo(`step3 select(172): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(178);
      logInfo(`step4 select(178): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>apply>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(178);
      logInfo(`select>apply>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0102
     * @tc.name      WindowRatio_RatioPageStateFlow_0102
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0102 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1, 10);
      logInfo(`step2 onSizeChange(1, 10): step2=${step2}`);
      expect(step2).assertEqual('1 x 10');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(-6);
      logInfo(`step4 select(-6): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-6);
      logInfo(`apply>onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`apply>onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`apply>onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0103
     * @tc.name      WindowRatio_RatioPageStateFlow_0103
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0103 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1536, 720);
      logInfo(`step1 onSizeChange(1536, 720): step1=${step1}`);
      expect(step1).assertEqual('1536 x 720');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0104
     * @tc.name      WindowRatio_RatioPageStateFlow_0104
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > onSizeChange > select keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0104 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(70);
      logInfo(`step1 select(70): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1, 96);
      logInfo(`step2 onSizeChange(1, 96): step2=${step2}`);
      expect(step2).assertEqual('1 x 96');
      const step3: string = subject.select(76);
      logInfo(`step3 select(76): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(1440, 0);
      logInfo(`step4 onSizeChange(1440, 0): step4=${step4}`);
      expect(step4).assertEqual('1440 x 0');
      const step5: string = subject.select(48.44);
      logInfo(`step5 select(48.44): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>onSizeChange>s...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(48.44, PRECISION);
      logInfo(`select>onSizeChange>select>onSizeChange>s...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>onSizeChange>s...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>onSizeChange>s...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`select>onSizeChange>select>onSizeChange>s...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0105
     * @tc.name      WindowRatio_RatioPageStateFlow_0105
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > onSizeChange > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0105 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 1440);
      logInfo(`step2 onSizeChange(0, 1440): step2=${step2}`);
      expect(step2).assertEqual('0 x 1440');
      const step3: string = subject.select(-91);
      logInfo(`step3 select(-91): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(0, 960);
      logInfo(`step4 onSizeChange(0, 960): step4=${step4}`);
      expect(step4).assertEqual('0 x 960');
      const step5: string = subject.select(100);
      logInfo(`step5 select(100): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(100);
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`apply>onSizeChange>select>onSizeChange>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0106
     * @tc.name      WindowRatio_RatioPageStateFlow_0106
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0106 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(130);
      logInfo(`step1 select(130): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(2, 1632);
      logInfo(`step2 onSizeChange(2, 1632): step2=${step2}`);
      expect(step2).assertEqual('2 x 1632');
      const step3: string = subject.onSizeChange(1632, 1632);
      logInfo(`step3 onSizeChange(1632, 1632): step3=${step3}`);
      expect(step3).assertEqual('1632 x 1632');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(130);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0107
     * @tc.name      WindowRatio_RatioPageStateFlow_0107
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > select > onSizeChange keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0107 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(109);
      logInfo(`step1 select(109): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(576, 360);
      logInfo(`step3 onSizeChange(576, 360): step3=${step3}`);
      expect(step3).assertEqual('576 x 360');
      const step4: string = subject.select(135);
      logInfo(`step4 select(135): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(1152, 0);
      logInfo(`step5 onSizeChange(1152, 0): step5=${step5}`);
      expect(step5).assertEqual('1152 x 0');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(135);
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1152');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0108
     * @tc.name      WindowRatio_RatioPageStateFlow_0108
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0108 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(155);
      logInfo(`step1 select(155): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 1080);
      logInfo(`step2 onSizeChange(0, 1080): step2=${step2}`);
      expect(step2).assertEqual('0 x 1080');
      const step3: string = subject.onSizeChange(1632, 1632);
      logInfo(`step3 onSizeChange(1632, 1632): step3=${step3}`);
      expect(step3).assertEqual('1632 x 1632');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(155);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`select>onSizeChange>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0109
     * @tc.name      WindowRatio_RatioPageStateFlow_0109
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0109 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1920, 3);
      logInfo(`step2 onSizeChange(1920, 3): step2=${step2}`);
      expect(step2).assertEqual('1920 x 3');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      const step5: string = subject.select(34);
      logInfo(`step5 select(34): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(34);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`apply>onSizeChange>apply>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0110
     * @tc.name      WindowRatio_RatioPageStateFlow_0110
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0110 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(3, 1056);
      logInfo(`step1 onSizeChange(3, 1056): step1=${step1}`);
      expect(step1).assertEqual('3 x 1056');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(-86);
      logInfo(`step3 select(-86): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-86);
      logInfo(`onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0111
     * @tc.name      WindowRatio_RatioPageStateFlow_0111
     * @tc.desc      RatioPageState call flow apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0111 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(113);
      logInfo(`step2 select(113): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(113);
      logInfo(`apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0112
     * @tc.name      WindowRatio_RatioPageStateFlow_0112
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0112 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(768, 960);
      logInfo(`step2 onSizeChange(768, 960): step2=${step2}`);
      expect(step2).assertEqual('768 x 960');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('768');
      logInfo(`apply>onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('960');
      logInfo(`apply>onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0113
     * @tc.name      WindowRatio_RatioPageStateFlow_0113
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0113 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1248, 192);
      logInfo(`step2 onSizeChange(1248, 192): step2=${step2}`);
      expect(step2).assertEqual('1248 x 192');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1248');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0114
     * @tc.name      WindowRatio_RatioPageStateFlow_0114
     * @tc.desc      RatioPageState call flow select > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0114 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(24);
      logInfo(`step1 select(24): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(17);
      logInfo(`step2 select(17): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(17);
      logInfo(`select>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0115
     * @tc.name      WindowRatio_RatioPageStateFlow_0115
     * @tc.desc      RatioPageState call flow onSizeChange > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0115 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(3, 480);
      logInfo(`step1 onSizeChange(3, 480): step1=${step1}`);
      expect(step1).assertEqual('3 x 480');
      const step2: string = subject.select(77.16);
      logInfo(`step2 select(77.16): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(-78);
      logInfo(`step3 select(-78): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(672, 0);
      logInfo(`step4 onSizeChange(672, 0): step4=${step4}`);
      expect(step4).assertEqual('672 x 0');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-78);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('672');
      logInfo(`onSizeChange>select>select>onSizeChange f...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0116
     * @tc.name      WindowRatio_RatioPageStateFlow_0116
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0116 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(1, 1920);
      logInfo(`step2 onSizeChange(1, 1920): step2=${step2}`);
      expect(step2).assertEqual('1 x 1920');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1920');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0117
     * @tc.name      WindowRatio_RatioPageStateFlow_0117
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0117 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(2, 0);
      logInfo(`step1 onSizeChange(2, 0): step1=${step1}`);
      expect(step1).assertEqual('2 x 0');
      const step2: string = subject.select(180);
      logInfo(`step2 select(180): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1920, 3);
      logInfo(`step3 onSizeChange(1920, 3): step3=${step3}`);
      expect(step3).assertEqual('1920 x 3');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(180);
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1920');
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('3');
      logInfo(`onSizeChange>select>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0118
     * @tc.name      WindowRatio_RatioPageStateFlow_0118
     * @tc.desc      RatioPageState call flow apply > onSizeChange > onSizeChange > select > onSizeChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0118 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 672);
      logInfo(`step2 onSizeChange(0, 672): step2=${step2}`);
      expect(step2).assertEqual('0 x 672');
      const step3: string = subject.onSizeChange(2, 1920);
      logInfo(`step3 onSizeChange(2, 1920): step3=${step3}`);
      expect(step3).assertEqual('2 x 1920');
      const step4: string = subject.select(39);
      logInfo(`step4 select(39): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(3, 1440);
      logInfo(`step5 onSizeChange(3, 1440): step5=${step5}`);
      expect(step5).assertEqual('3 x 1440');
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(39);
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('3');
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1440');
      logInfo(`apply>onSizeChange>onSizeChange>select>on...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0119
     * @tc.name      WindowRatio_RatioPageStateFlow_0119
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0119 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1728);
      logInfo(`step1 onSizeChange(0, 1728): step1=${step1}`);
      expect(step1).assertEqual('0 x 1728');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(0, 96);
      logInfo(`step3 onSizeChange(0, 96): step3=${step3}`);
      expect(step3).assertEqual('0 x 96');
      const step4: string = subject.onSizeChange(360, 480);
      logInfo(`step4 onSizeChange(360, 480): step4=${step4}`);
      expect(step4).assertEqual('360 x 480');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('360');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`onSizeChange>apply>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0120
     * @tc.name      WindowRatio_RatioPageStateFlow_0120
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0120 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(480, 96);
      logInfo(`step2 onSizeChange(480, 96): step2=${step2}`);
      expect(step2).assertEqual('480 x 96');
      const step3: string = subject.select(35.98);
      logInfo(`step3 select(35.98): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(35.98, PRECISION);
      logInfo(`apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0121
     * @tc.name      WindowRatio_RatioPageStateFlow_0121
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange > apply > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0121 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(100, 1728);
      logInfo(`step1 onSizeChange(100, 1728): step1=${step1}`);
      expect(step1).assertEqual('100 x 1728');
      const step2: string = subject.select(-4);
      logInfo(`step2 select(-4): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1632, 0);
      logInfo(`step3 onSizeChange(1632, 0): step3=${step3}`);
      expect(step3).assertEqual('1632 x 0');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.select(109);
      logInfo(`step5 select(109): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`onSizeChange>select>onSizeChange>apply>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0122
     * @tc.name      WindowRatio_RatioPageStateFlow_0122
     * @tc.desc      RatioPageState call flow onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0122 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 288);
      logInfo(`step1 onSizeChange(0, 288): step1=${step1}`);
      expect(step1).assertEqual('0 x 288');
      const step2: string = subject.select(180);
      logInfo(`step2 select(180): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(180);
      logInfo(`onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('288');
      logInfo(`${BUNDLE}RatioPageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0123
     * @tc.name      WindowRatio_RatioPageStateFlow_0123
     * @tc.desc      RatioPageState call flow select > select > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0123 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(105);
      logInfo(`step1 select(105): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(49.7);
      logInfo(`step2 select(49.7): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(14);
      logInfo(`step3 select(14): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(0, 1056);
      logInfo(`step4 onSizeChange(0, 1056): step4=${step4}`);
      expect(step4).assertEqual('0 x 1056');
      logInfo(`select>select>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(14);
      logInfo(`select>select>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>select>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1056');
      logInfo(`${BUNDLE}RatioPageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0124
     * @tc.name      WindowRatio_RatioPageStateFlow_0124
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > select > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0124 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(384, 0);
      logInfo(`step1 onSizeChange(384, 0): step1=${step1}`);
      expect(step1).assertEqual('384 x 0');
      const step2: string = subject.onSizeChange(1824, 192);
      logInfo(`step2 onSizeChange(1824, 192): step2=${step2}`);
      expect(step2).assertEqual('1824 x 192');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.select(193);
      logInfo(`step4 select(193): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(193);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1824');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`onSizeChange>onSizeChange>apply>select>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0125
     * @tc.name      WindowRatio_RatioPageStateFlow_0125
     * @tc.desc      RatioPageState call flow apply > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0125 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(100, 1);
      logInfo(`step2 onSizeChange(100, 1): step2=${step2}`);
      expect(step2).assertEqual('100 x 1');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('100');
      logInfo(`apply>onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`apply>onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0126
     * @tc.name      WindowRatio_RatioPageStateFlow_0126
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0126 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(200);
      logInfo(`step1 select(200): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(17.23);
      logInfo(`step2 select(17.23): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(17.23, PRECISION);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0127
     * @tc.name      WindowRatio_RatioPageStateFlow_0127
     * @tc.desc      RatioPageState call flow apply > onSizeChange > select > onSizeChange > apply keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0127 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 192);
      logInfo(`step2 onSizeChange(0, 192): step2=${step2}`);
      expect(step2).assertEqual('0 x 192');
      const step3: string = subject.select(-63);
      logInfo(`step3 select(-63): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.onSizeChange(864, 10);
      logInfo(`step4 onSizeChange(864, 10): step4=${step4}`);
      expect(step4).assertEqual('864 x 10');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-63);
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`apply>onSizeChange>select>onSizeChange>ap...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0128
     * @tc.name      WindowRatio_RatioPageStateFlow_0128
     * @tc.desc      RatioPageState call flow select > select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0128 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(17);
      logInfo(`step1 select(17): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(100);
      logInfo(`step2 select(100): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(384, 192);
      logInfo(`step4 onSizeChange(384, 192): step4=${step4}`);
      expect(step4).assertEqual('384 x 192');
      logInfo(`select>select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(100);
      logInfo(`select>select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('384');
      logInfo(`select>select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`select>select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0129
     * @tc.name      WindowRatio_RatioPageStateFlow_0129
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > select > onSizeChange keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0129 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(96, 768);
      logInfo(`step2 onSizeChange(96, 768): step2=${step2}`);
      expect(step2).assertEqual('96 x 768');
      const step3: string = subject.select(-20);
      logInfo(`step3 select(-20): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(110);
      logInfo(`step4 select(110): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(0, 1728);
      logInfo(`step5 onSizeChange(0, 1728): step5=${step5}`);
      expect(step5).assertEqual('0 x 1728');
      logInfo(`select>onSizeChange>select>select>onSizeC...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(110);
      logInfo(`select>onSizeChange>select>select>onSizeC...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>select>onSizeC...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select>onSizeC...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>select>select>onSizeC...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0130
     * @tc.name      WindowRatio_RatioPageStateFlow_0130
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0130 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-15);
      logInfo(`step2 select(-15): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-15);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0131
     * @tc.name      WindowRatio_RatioPageStateFlow_0131
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange > select > onSizeChange keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0131 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(32.62);
      logInfo(`step1 select(32.62): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(3, 1056);
      logInfo(`step2 onSizeChange(3, 1056): step2=${step2}`);
      expect(step2).assertEqual('3 x 1056');
      const step3: string = subject.onSizeChange(1632, 1152);
      logInfo(`step3 onSizeChange(1632, 1152): step3=${step3}`);
      expect(step3).assertEqual('1632 x 1152');
      const step4: string = subject.select(-11);
      logInfo(`step4 select(-11): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(864, 10);
      logInfo(`step5 onSizeChange(864, 10): step5=${step5}`);
      expect(step5).assertEqual('864 x 10');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-11);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>onSizeChange>onSizeChange>select>o...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`${BUNDLE}RatioPageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0132
     * @tc.name      WindowRatio_RatioPageStateFlow_0132
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply > onSizeChange > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0132 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(200);
      logInfo(`step1 select(200): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(10, 1248);
      logInfo(`step2 onSizeChange(10, 1248): step2=${step2}`);
      expect(step2).assertEqual('10 x 1248');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.onSizeChange(1, 96);
      logInfo(`step4 onSizeChange(1, 96): step4=${step4}`);
      expect(step4).assertEqual('1 x 96');
      const step5: string = subject.select(126);
      logInfo(`step5 select(126): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(126);
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('96');
      logInfo(`select>onSizeChange>apply>onSizeChange>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0133
     * @tc.name      WindowRatio_RatioPageStateFlow_0133
     * @tc.desc      RatioPageState call flow apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0133 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(10, 2);
      logInfo(`step2 onSizeChange(10, 2): step2=${step2}`);
      expect(step2).assertEqual('10 x 2');
      const step3: string = subject.onSizeChange(96, 0);
      logInfo(`step3 onSizeChange(96, 0): step3=${step3}`);
      expect(step3).assertEqual('96 x 0');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0134
     * @tc.name      WindowRatio_RatioPageStateFlow_0134
     * @tc.desc      RatioPageState call flow apply > apply > select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0134 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(176);
      logInfo(`step3 select(176): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.select(77.16);
      logInfo(`step5 select(77.16): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(77.16, PRECISION);
      logInfo(`apply>apply>select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0135
     * @tc.name      WindowRatio_RatioPageStateFlow_0135
     * @tc.desc      RatioPageState call flow apply > onSizeChange > onSizeChange > onSizeChange > onSizeChange keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0135 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 864);
      logInfo(`step2 onSizeChange(0, 864): step2=${step2}`);
      expect(step2).assertEqual('0 x 864');
      const step3: string = subject.onSizeChange(1632, 0);
      logInfo(`step3 onSizeChange(1632, 0): step3=${step3}`);
      expect(step3).assertEqual('1632 x 0');
      const step4: string = subject.onSizeChange(0, 960);
      logInfo(`step4 onSizeChange(0, 960): step4=${step4}`);
      expect(step4).assertEqual('0 x 960');
      const step5: string = subject.onSizeChange(1536, 720);
      logInfo(`step5 onSizeChange(1536, 720): step5=${step5}`);
      expect(step5).assertEqual('1536 x 720');
      logInfo(`apply>onSizeChange>onSizeChange>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`apply>onSizeChange>onSizeChange>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`apply>onSizeChange>onSizeChange>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0136
     * @tc.name      WindowRatio_RatioPageStateFlow_0136
     * @tc.desc      RatioPageState call flow onSizeChange > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0136 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1248, 1824);
      logInfo(`step1 onSizeChange(1248, 1824): step1=${step1}`);
      expect(step1).assertEqual('1248 x 1824');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(0, 192);
      logInfo(`step3 onSizeChange(0, 192): step3=${step3}`);
      expect(step3).assertEqual('0 x 192');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`onSizeChange>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0136 end`);
    });
  });
}
