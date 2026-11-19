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

/** Logic checks for RatioPageState flow (47 cases). */
export default function ratioPageStateFlowTest(): void {
  describe('RatioPageStateFlowTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0001
     * @tc.name      WindowRatio_RatioPageStateFlow_0001
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0001 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(0, 1728);
      logInfo(`step2 onSizeChange(0, 1728): step2=${step2}`);
      expect(step2).assertEqual('0 x 1728');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0002
     * @tc.name      WindowRatio_RatioPageStateFlow_0002
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RatioPageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0002 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(0, 1);
      logInfo(`step3 onSizeChange(0, 1): step3=${step3}`);
      expect(step3).assertEqual('0 x 1');
      const step4: string = subject.select(-15);
      logInfo(`step4 select(-15): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-15);
      logInfo(`apply>apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`apply>apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1');
      logInfo(`apply>apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0003
     * @tc.name      WindowRatio_RatioPageStateFlow_0003
     * @tc.desc      RatioPageState call flow select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0003 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(65.16);
      logInfo(`step1 select(65.16): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(109);
      logInfo(`step2 select(109): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0004
     * @tc.name      WindowRatio_RatioPageStateFlow_0004
     * @tc.desc      RatioPageState call flow apply > select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0004 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(14);
      logInfo(`step2 select(14): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(123);
      logInfo(`step3 select(123): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(-64);
      logInfo(`step4 select(-64): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`apply>select>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-64);
      logInfo(`apply>select>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0005
     * @tc.name      WindowRatio_RatioPageStateFlow_0005
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0005 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(864, 2);
      logInfo(`step3 onSizeChange(864, 2): step3=${step3}`);
      expect(step3).assertEqual('864 x 2');
      const step4: string = subject.select(32.62);
      logInfo(`step4 select(32.62): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(32.62, PRECISION);
      logInfo(`select>apply>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`select>apply>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`select>apply>onSizeChange>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0006
     * @tc.name      WindowRatio_RatioPageStateFlow_0006
     * @tc.desc      RatioPageState call flow apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0006 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0007
     * @tc.name      WindowRatio_RatioPageStateFlow_0007
     * @tc.desc      RatioPageState call flow apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0007 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.onSizeChange(768, 0);
      logInfo(`step2 onSizeChange(768, 0): step2=${step2}`);
      expect(step2).assertEqual('768 x 0');
      logInfo(`apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('768');
      logInfo(`apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0008
     * @tc.name      WindowRatio_RatioPageStateFlow_0008
     * @tc.desc      RatioPageState call flow apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0008 begin`);
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
      logInfo(`apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(140);
      logInfo(`apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0009
     * @tc.name      WindowRatio_RatioPageStateFlow_0009
     * @tc.desc      RatioPageState call flow apply > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0009 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-86);
      logInfo(`step2 select(-86): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(112);
      logInfo(`step3 select(112): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(112);
      logInfo(`apply>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0010
     * @tc.name      WindowRatio_RatioPageStateFlow_0010
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange > onSizeChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0010 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1, 1920);
      logInfo(`step1 onSizeChange(1, 1920): step1=${step1}`);
      expect(step1).assertEqual('1 x 1920');
      const step2: string = subject.onSizeChange(0, 192);
      logInfo(`step2 onSizeChange(0, 192): step2=${step2}`);
      expect(step2).assertEqual('0 x 192');
      const step3: string = subject.onSizeChange(1248, 192);
      logInfo(`step3 onSizeChange(1248, 192): step3=${step3}`);
      expect(step3).assertEqual('1248 x 192');
      const step4: string = subject.onSizeChange(96, 0);
      logInfo(`step4 onSizeChange(96, 0): step4=${step4}`);
      expect(step4).assertEqual('96 x 0');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`onSizeChange>onSizeChange>onSizeChange>on...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0011
     * @tc.name      WindowRatio_RatioPageStateFlow_0011
     * @tc.desc      RatioPageState call flow apply > apply > select > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0011 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(171);
      logInfo(`step3 select(171): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(171);
      logInfo(`apply>apply>select>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>apply>select>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>apply>select>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(4);
      logInfo(`${BUNDLE}RatioPageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0012
     * @tc.name      WindowRatio_RatioPageStateFlow_0012
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0012 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(62);
      logInfo(`step1 select(62): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(150);
      logInfo(`step2 select(150): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(150);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0013
     * @tc.name      WindowRatio_RatioPageStateFlow_0013
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0013 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(50);
      logInfo(`step1 select(50): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 100);
      logInfo(`step2 onSizeChange(0, 100): step2=${step2}`);
      expect(step2).assertEqual('0 x 100');
      const step3: string = subject.select(-52);
      logInfo(`step3 select(-52): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(34);
      logInfo(`step4 select(34): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(34);
      logInfo(`select>onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('100');
      logInfo(`${BUNDLE}RatioPageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0014
     * @tc.name      WindowRatio_RatioPageStateFlow_0014
     * @tc.desc      RatioPageState call flow select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0014 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(135);
      logInfo(`step1 select(135): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(108);
      logInfo(`step3 select(108): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(108);
      logInfo(`select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0015
     * @tc.name      WindowRatio_RatioPageStateFlow_0015
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0015 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1632, 1152);
      logInfo(`step1 onSizeChange(1632, 1152): step1=${step1}`);
      expect(step1).assertEqual('1632 x 1152');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1152');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0016
     * @tc.name      WindowRatio_RatioPageStateFlow_0016
     * @tc.desc      RatioPageState call flow select > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0016 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85);
      logInfo(`step1 select(85): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 480);
      logInfo(`step2 onSizeChange(0, 480): step2=${step2}`);
      expect(step2).assertEqual('0 x 480');
      const step3: string = subject.select(65.16);
      logInfo(`step3 select(65.16): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: string = subject.select(40);
      logInfo(`step4 select(40): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(40);
      logInfo(`select>onSizeChange>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>select>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('480');
      logInfo(`${BUNDLE}RatioPageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0017
     * @tc.name      WindowRatio_RatioPageStateFlow_0017
     * @tc.desc      RatioPageState call flow select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0017 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(60);
      logInfo(`step1 select(60): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1728, 1824);
      logInfo(`step2 onSizeChange(1728, 1824): step2=${step2}`);
      expect(step2).assertEqual('1728 x 1824');
      const step3: string = subject.select(140);
      logInfo(`step3 select(140): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(140);
      logInfo(`select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1728');
      logInfo(`select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`${BUNDLE}RatioPageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0018
     * @tc.name      WindowRatio_RatioPageStateFlow_0018
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange > select > onSizeChange keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0018 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-54);
      logInfo(`step1 select(-54): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(1080, 100);
      logInfo(`step3 onSizeChange(1080, 100): step3=${step3}`);
      expect(step3).assertEqual('1080 x 100');
      const step4: string = subject.select(-99);
      logInfo(`step4 select(-99): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(1080, 0);
      logInfo(`step5 onSizeChange(1080, 0): step5=${step5}`);
      expect(step5).assertEqual('1080 x 0');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-99);
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`select>apply>onSizeChange>select>onSizeCh...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0019
     * @tc.name      WindowRatio_RatioPageStateFlow_0019
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange > onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0019 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(480, 576);
      logInfo(`step3 onSizeChange(480, 576): step3=${step3}`);
      expect(step3).assertEqual('480 x 576');
      const step4: string = subject.onSizeChange(1536, 720);
      logInfo(`step4 onSizeChange(1536, 720): step4=${step4}`);
      expect(step4).assertEqual('1536 x 720');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.3333333333333333, PRECISION);
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1536');
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('720');
      logInfo(`apply>apply>onSizeChange>onSizeChange>app...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0020
     * @tc.name      WindowRatio_RatioPageStateFlow_0020
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0020 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1080);
      logInfo(`step1 onSizeChange(0, 1080): step1=${step1}`);
      expect(step1).assertEqual('0 x 1080');
      const step2: string = subject.onSizeChange(720, 1728);
      logInfo(`step2 onSizeChange(720, 1728): step2=${step2}`);
      expect(step2).assertEqual('720 x 1728');
      logInfo(`onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`${BUNDLE}RatioPageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0021
     * @tc.name      WindowRatio_RatioPageStateFlow_0021
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0021 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(65.28);
      logInfo(`step1 select(65.28): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(20);
      logInfo(`step2 select(20): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(480, 1344);
      logInfo(`step3 onSizeChange(480, 1344): step3=${step3}`);
      expect(step3).assertEqual('480 x 1344');
      const step4: string = subject.select(160);
      logInfo(`step4 select(160): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.select(20);
      logInfo(`step5 select(20): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select>select ...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(20);
      logInfo(`select>select>onSizeChange>select>select ...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>select>select ...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>select>select ...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('480');
      logInfo(`select>select>onSizeChange>select>select ...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1344');
      logInfo(`${BUNDLE}RatioPageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0022
     * @tc.name      WindowRatio_RatioPageStateFlow_0022
     * @tc.desc      RatioPageState call flow apply > select > onSizeChange > onSizeChange > select keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0022 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(77.16);
      logInfo(`step2 select(77.16): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 384);
      logInfo(`step3 onSizeChange(0, 384): step3=${step3}`);
      expect(step3).assertEqual('0 x 384');
      const step4: string = subject.onSizeChange(10, 2);
      logInfo(`step4 onSizeChange(10, 2): step4=${step4}`);
      expect(step4).assertEqual('10 x 2');
      const step5: string = subject.select(65);
      logInfo(`step5 select(65): step5=${step5}`);
      expect(step5).assertEqual('16:9');
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(65);
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('10');
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`apply>select>onSizeChange>onSizeChange>se...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0023
     * @tc.name      WindowRatio_RatioPageStateFlow_0023
     * @tc.desc      RatioPageState call flow select > select > onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0023 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(17.23);
      logInfo(`step1 select(17.23): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(109);
      logInfo(`step2 select(109): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(1080, 2);
      logInfo(`step3 onSizeChange(1080, 2): step3=${step3}`);
      expect(step3).assertEqual('1080 x 2');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`select>select>onSizeChange>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>onSizeChange>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1080');
      logInfo(`select>select>onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`select>select>onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0024
     * @tc.name      WindowRatio_RatioPageStateFlow_0024
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0024 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(2, 720);
      logInfo(`step1 onSizeChange(2, 720): step1=${step1}`);
      expect(step1).assertEqual('2 x 720');
      const step2: string = subject.onSizeChange(96, 1248);
      logInfo(`step2 onSizeChange(96, 1248): step2=${step2}`);
      expect(step2).assertEqual('96 x 1248');
      const step3: string = subject.onSizeChange(720, 0);
      logInfo(`step3 onSizeChange(720, 0): step3=${step3}`);
      expect(step3).assertEqual('720 x 0');
      logInfo(`onSizeChange>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`onSizeChange>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0025
     * @tc.name      WindowRatio_RatioPageStateFlow_0025
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange > apply > onSizeChange > apply keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0025 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(1152, 1056);
      logInfo(`step1 onSizeChange(1152, 1056): step1=${step1}`);
      expect(step1).assertEqual('1152 x 1056');
      const step2: string = subject.onSizeChange(864, 10);
      logInfo(`step2 onSizeChange(864, 10): step2=${step2}`);
      expect(step2).assertEqual('864 x 10');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      const step4: string = subject.onSizeChange(672, 672);
      logInfo(`step4 onSizeChange(672, 672): step4=${step4}`);
      expect(step4).assertEqual('672 x 672');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>onSizeChange>apply>onSizeCha...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('672');
      logInfo(`onSizeChange>onSizeChange>apply>onSizeCha...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('672');
      logInfo(`onSizeChange>onSizeChange>apply>onSizeCha...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0026
     * @tc.name      WindowRatio_RatioPageStateFlow_0026
     * @tc.desc      RatioPageState call flow select > onSizeChange > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0026 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(155);
      logInfo(`step1 select(155): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1632, 1632);
      logInfo(`step2 onSizeChange(1632, 1632): step2=${step2}`);
      expect(step2).assertEqual('1632 x 1632');
      const step3: string = subject.select(70);
      logInfo(`step3 select(70): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(70);
      logInfo(`select>onSizeChange>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1632');
      logInfo(`select>onSizeChange>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1632');
      logInfo(`${BUNDLE}RatioPageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0027
     * @tc.name      WindowRatio_RatioPageStateFlow_0027
     * @tc.desc      RatioPageState call flow onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0027 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 768);
      logInfo(`step1 onSizeChange(0, 768): step1=${step1}`);
      expect(step1).assertEqual('0 x 768');
      const step2: string = subject.onSizeChange(1, 0);
      logInfo(`step2 onSizeChange(1, 0): step2=${step2}`);
      expect(step2).assertEqual('1 x 0');
      logInfo(`onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1');
      logInfo(`onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0028
     * @tc.name      WindowRatio_RatioPageStateFlow_0028
     * @tc.desc      RatioPageState call flow onSizeChange > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0028 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 10);
      logInfo(`step1 onSizeChange(0, 10): step1=${step1}`);
      expect(step1).assertEqual('0 x 10');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('10');
      logInfo(`onSizeChange>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0029
     * @tc.name      WindowRatio_RatioPageStateFlow_0029
     * @tc.desc      RatioPageState call flow select > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0029 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(56.11);
      logInfo(`step1 select(56.11): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 576);
      logInfo(`step2 onSizeChange(0, 576): step2=${step2}`);
      expect(step2).assertEqual('0 x 576');
      const step3: string = subject.onSizeChange(0, 2);
      logInfo(`step3 onSizeChange(0, 2): step3=${step3}`);
      expect(step3).assertEqual('0 x 2');
      logInfo(`select>onSizeChange>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(56.11, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`select>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('2');
      logInfo(`${BUNDLE}RatioPageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0030
     * @tc.name      WindowRatio_RatioPageStateFlow_0030
     * @tc.desc      RatioPageState call flow onSizeChange > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0030 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 192);
      logInfo(`step1 onSizeChange(0, 192): step1=${step1}`);
      expect(step1).assertEqual('0 x 192');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.select(10);
      logInfo(`step3 select(10): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(10);
      logInfo(`onSizeChange>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>apply>select final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>select final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('192');
      logInfo(`onSizeChange>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0031
     * @tc.name      WindowRatio_RatioPageStateFlow_0031
     * @tc.desc      RatioPageState call flow select > apply > select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0031 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(48.44);
      logInfo(`step1 select(48.44): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(150);
      logInfo(`step3 select(150): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      const step5: string = subject.onSizeChange(96, 1248);
      logInfo(`step5 onSizeChange(96, 1248): step5=${step5}`);
      expect(step5).assertEqual('96 x 1248');
      logInfo(`select>apply>select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(150);
      logInfo(`select>apply>select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('96');
      logInfo(`select>apply>select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`select>apply>select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0032
     * @tc.name      WindowRatio_RatioPageStateFlow_0032
     * @tc.desc      RatioPageState call flow apply > apply > onSizeChange > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0032 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: string = subject.onSizeChange(1920, 720);
      logInfo(`step3 onSizeChange(1920, 720): step3=${step3}`);
      expect(step3).assertEqual('1920 x 720');
      const step4: string = subject.onSizeChange(960, 0);
      logInfo(`step4 onSizeChange(960, 0): step4=${step4}`);
      expect(step4).assertEqual('960 x 0');
      logInfo(`apply>apply>onSizeChange>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`apply>apply>onSizeChange>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`apply>apply>onSizeChange>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0033
     * @tc.name      WindowRatio_RatioPageStateFlow_0033
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0033 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(864, 1536);
      logInfo(`step1 onSizeChange(864, 1536): step1=${step1}`);
      expect(step1).assertEqual('864 x 1536');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('864');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1536');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0034
     * @tc.name      WindowRatio_RatioPageStateFlow_0034
     * @tc.desc      RatioPageState call flow apply > select > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0034 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(-64);
      logInfo(`step2 select(-64): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(100);
      logInfo(`step3 select(100): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      const step4: number = subject.apply();
      logInfo(`step4 apply(): step4=${step4}`);
      expect(step4).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(100);
      logInfo(`apply>select>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0035
     * @tc.name      WindowRatio_RatioPageStateFlow_0035
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0035 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-20);
      logInfo(`step1 select(-20): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(576, 864);
      logInfo(`step2 onSizeChange(576, 864): step2=${step2}`);
      expect(step2).assertEqual('576 x 864');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-20);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('576');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('864');
      logInfo(`${BUNDLE}RatioPageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0036
     * @tc.name      WindowRatio_RatioPageStateFlow_0036
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply > select > onSizeChange keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0036 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(130);
      logInfo(`step1 select(130): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(0, 1728);
      logInfo(`step2 onSizeChange(0, 1728): step2=${step2}`);
      expect(step2).assertEqual('0 x 1728');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(173);
      logInfo(`step4 select(173): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: string = subject.onSizeChange(960, 1824);
      logInfo(`step5 onSizeChange(960, 1824): step5=${step5}`);
      expect(step5).assertEqual('960 x 1824');
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(173);
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('960');
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1824');
      logInfo(`select>onSizeChange>apply>select>onSizeCh...: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0037
     * @tc.name      WindowRatio_RatioPageStateFlow_0037
     * @tc.desc      RatioPageState call flow select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0037 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(-4);
      logInfo(`step1 select(-4): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1440, 0);
      logInfo(`step2 onSizeChange(1440, 0): step2=${step2}`);
      expect(step2).assertEqual('1440 x 0');
      logInfo(`select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-4);
      logInfo(`select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1440');
      logInfo(`select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`${BUNDLE}RatioPageStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0038
     * @tc.name      WindowRatio_RatioPageStateFlow_0038
     * @tc.desc      RatioPageState call flow onSizeChange > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0038 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(0, 1248);
      logInfo(`step1 onSizeChange(0, 1248): step1=${step1}`);
      expect(step1).assertEqual('0 x 1248');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.3333333333333333, PRECISION);
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.3333333333333333, PRECISION);
      logInfo(`onSizeChange>apply>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>apply>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1248');
      logInfo(`onSizeChange>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0039
     * @tc.name      WindowRatio_RatioPageStateFlow_0039
     * @tc.desc      RatioPageState call flow onSizeChange > select > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0039 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.onSizeChange(10, 2);
      logInfo(`step1 onSizeChange(10, 2): step1=${step1}`);
      expect(step1).assertEqual('10 x 2');
      const step2: string = subject.select(5);
      logInfo(`step2 select(5): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.onSizeChange(0, 576);
      logInfo(`step3 onSizeChange(0, 576): step3=${step3}`);
      expect(step3).assertEqual('0 x 576');
      logInfo(`onSizeChange>select>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(5);
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`onSizeChange>select>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('0');
      logInfo(`onSizeChange>select>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('576');
      logInfo(`${BUNDLE}RatioPageStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0040
     * @tc.name      WindowRatio_RatioPageStateFlow_0040
     * @tc.desc      RatioPageState call flow select > apply > onSizeChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0040 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(182);
      logInfo(`step1 select(182): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.onSizeChange(720, 1728);
      logInfo(`step3 onSizeChange(720, 1728): step3=${step3}`);
      expect(step3).assertEqual('720 x 1728');
      logInfo(`select>apply>onSizeChange final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(182);
      logInfo(`select>apply>onSizeChange final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>onSizeChange final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>onSizeChange final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('720');
      logInfo(`select>apply>onSizeChange final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('1728');
      logInfo(`select>apply>onSizeChange final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0041
     * @tc.name      WindowRatio_RatioPageStateFlow_0041
     * @tc.desc      RatioPageState call flow select > apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0041 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(39);
      logInfo(`step1 select(39): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      const step3: string = subject.select(-78);
      logInfo(`step3 select(-78): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(-78);
      logInfo(`select>apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0042
     * @tc.name      WindowRatio_RatioPageStateFlow_0042
     * @tc.desc      RatioPageState call flow apply > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0042 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: number = subject.apply();
      logInfo(`step1 apply(): step1=${step1}`);
      expect(step1).assertClose(1.3333333333333333, PRECISION);
      const step2: string = subject.select(109);
      logInfo(`step2 select(109): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`apply>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`apply>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`apply>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`apply>select final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0043
     * @tc.name      WindowRatio_RatioPageStateFlow_0043
     * @tc.desc      RatioPageState call flow select > onSizeChange > apply > select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0043 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(126);
      logInfo(`step1 select(126): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.onSizeChange(1728, 0);
      logInfo(`step2 onSizeChange(1728, 0): step2=${step2}`);
      expect(step2).assertEqual('1728 x 0');
      const step3: number = subject.apply();
      logInfo(`step3 apply(): step3=${step3}`);
      expect(step3).assertClose(1.7777777777777777, PRECISION);
      const step4: string = subject.select(76);
      logInfo(`step4 select(76): step4=${step4}`);
      expect(step4).assertEqual('16:9');
      const step5: number = subject.apply();
      logInfo(`step5 apply(): step5=${step5}`);
      expect(step5).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(76);
      logInfo(`select>onSizeChange>apply>select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>onSizeChange>apply>select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>onSizeChange>apply>select>apply final: subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual('1728');
      logInfo(`select>onSizeChange>apply>select>apply final: subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual('0');
      logInfo(`select>onSizeChange>apply>select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(2);
      logInfo(`${BUNDLE}RatioPageStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0044
     * @tc.name      WindowRatio_RatioPageStateFlow_0044
     * @tc.desc      RatioPageState call flow select > select > apply > apply > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0044 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(98.51);
      logInfo(`step1 select(98.51): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(70);
      logInfo(`step2 select(70): step2=${step2}`);
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
      logInfo(`select>select>apply>apply>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(70);
      logInfo(`select>select>apply>apply>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>apply>apply>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>select>apply>apply>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(3);
      logInfo(`${BUNDLE}RatioPageStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0045
     * @tc.name      WindowRatio_RatioPageStateFlow_0045
     * @tc.desc      RatioPageState call flow select > apply keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0045 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(49.7);
      logInfo(`step1 select(49.7): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: number = subject.apply();
      logInfo(`step2 apply(): step2=${step2}`);
      expect(step2).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertClose(49.7, PRECISION);
      logInfo(`select>apply final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>apply final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`select>apply final: subject.applied=${subject.applied}`);
      expect(subject.applied).assertEqual(1);
      logInfo(`${BUNDLE}RatioPageStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0046
     * @tc.name      WindowRatio_RatioPageStateFlow_0046
     * @tc.desc      RatioPageState call flow select > select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0046 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(52);
      logInfo(`step1 select(52): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(-99);
      logInfo(`step2 select(-99): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      const step3: string = subject.select(109);
      logInfo(`step3 select(109): step3=${step3}`);
      expect(step3).assertEqual('16:9');
      logInfo(`select>select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(109);
      logInfo(`select>select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_RATIO_PAGE_STATE_FLOW_0047
     * @tc.name      WindowRatio_RatioPageStateFlow_0047
     * @tc.desc      RatioPageState call flow select > select keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RatioPageStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RatioPageStateFlow_0047 begin`);
      const subject: RatioPageState = new RatioPageState();
      const step1: string = subject.select(85.78);
      logInfo(`step1 select(85.78): step1=${step1}`);
      expect(step1).assertEqual('16:9');
      const step2: string = subject.select(175);
      logInfo(`step2 select(175): step2=${step2}`);
      expect(step2).assertEqual('16:9');
      logInfo(`select>select final: subject.numbers=${subject.numbers}`);
      expect(subject.numbers).assertEqual(175);
      logInfo(`select>select final: subject.windowRatio=${subject.windowRatio}`);
      expect(subject.windowRatio).assertClose(1.7777777777777777, PRECISION);
      logInfo(`select>select final: subject.showWindowRatio=${subject.showWindowRatio}`);
      expect(subject.showWindowRatio).assertEqual('16:9');
      logInfo(`${BUNDLE}RatioPageStateFlow_0047 end`);
    });
  });
}
